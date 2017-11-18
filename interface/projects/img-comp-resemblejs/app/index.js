

var resemble = require('node-resemble-js');
var fs = require('fs');
var path = require('path');

// Set image comparison output settings for ResembleJS
resemble.outputSettings({
  errorColor: {
    red: 155,
    green: 100,
    blue: 155
  },
  errorType: 'movement',
  transparency: 0.6
});

//_______________________________ BEGIN VARIABLE DECLARATIONS _______________________________//

// Paths to directories for the source images that will be compared and the output directory for the generated diff images.
// path.sep will use whichever path separator is used on the given OS.

// Base path to a parent directory of all the images.
var OUTPUT_DIR = 'app' + path.sep + 'output';

// Directories for respective images
var BASELINE_IMG_DIR = 'baseline_images';
var TEST_IMG_DIR = 'test_images';
var DIFF_IMG_DIR = 'diff_images';

var BASELINE_IMG_DIR_PATH = OUTPUT_DIR + path.sep + 'images' + path.sep + BASELINE_IMG_DIR;
// Screen shots taken during Robot Framework test suite runs.
var TEST_IMAGE_DIR_PATH = OUTPUT_DIR + path.sep + 'images' + path.sep + TEST_IMG_DIR;
// File path that ResembleJS will write the diff images
var DIFF_IMAGE_DIR_WR = OUTPUT_DIR + path.sep + 'images' + path.sep + DIFF_IMG_DIR;
// Path where html output will get written
var OUTPUT_FILE_PATH = process.cwd() + path.sep + OUTPUT_DIR + path.sep;

// Promise to read the filenames from the baseline_images directory.
// On success, will return an array of filenames.
var readBaseImages = new Promise(function(resolve, reject) {
	//Read all baseline image file names to use for later comparison
	fs.readdir(BASELINE_IMG_DIR_PATH, function(err, dirResults) {
		var pngFiles = filterPNGFileTypes(dirResults);
		if(err) {
			console.log('Boo-urns we have an error. ', err);
			reject(err);
		} else if (pngFiles.length === 0) {
			reject('No .png images found in ' + BASELINE_IMG_DIR_PATH);
		} else {
			console.log('Success! Baseline images read.');
			resolve(pngFiles);
		}
	});
});

// Similar to the above Promise, but will read in the test output filenames, which will get compared against the base images.
// Will also return an array of filenames.
var readTestImages = new Promise(function(resolve, reject) {
	//Read all test image file names to use for later comparison
	fs.readdir(TEST_IMAGE_DIR_PATH, function(err, dirResults) {
		// Compare png files only
		var pngFiles = filterPNGFileTypes(dirResults);
		if(err) {
			console.log('Boo-urns we have an error. ', err);
			reject(err);
		} else if (pngFiles.length === 0) {
			reject('Error: No .png images found in ' + TEST_IMAGE_DIR_PATH);
		} else {
			console.log('Success! Test images read.');
			resolve(pngFiles);
		}
	});
});

// Read any existing images from the diff_images directory so they can be deleted before the new diffs get created.
var readDiffImages = new Promise(function(resolve, reject) {
	//Read all diff image file names so they may be deleted
	fs.readdir(DIFF_IMAGE_DIR_WR, function(err, dirResults) {
		var pngFiles = filterPNGFileTypes(dirResults);
		if(err) {
			console.log('Boo-urns we have an error. ', err);
			reject(err);
		} else if (pngFiles.length === 0) {
			console.log('No existing diff images. Continueing with comparison.');
			resolve(pngFiles);
		} else {
			console.log('Success! Existing diff images read and will be deleted.');
			resolve(pngFiles);
		}
	});
});

//_______________________________ BEGIN FUNCTION EXECUTION _______________________________//

// Call the readDiffImages promise to fetch all the diff image filenames, then delete the files and call the remaining Promises for image comparison. 
readDiffImages.then(result => {
					deleteDiffImages(result, DIFF_IMAGE_DIR_WR);
					// The 'result' of Promise.all, upon success, will be an array of results from the readBaseImages and readTestImages Promises.
					return Promise.all([readBaseImages, readTestImages]);
				}).then(result => {
					compareImages(result);
				}).catch(error => {
					console.log(error);
				});

//_______________________________ BEGIN FUNCTION DEFINITIONS _______________________________//

// Filter function that expects an array of filenames and returns an array with all non .png filenames removed.
function filterPNGFileTypes(filenames) {
	var result = [];
	if (!(filenames instanceof Array)) return result;
	filenames.forEach(function(file) {
		if (file.substr(-4) === '.png') {
			result.push(file);
		}
	});
	return result;
}

// Sync delete the .png files from the diff directory so there will not be any stale output from previous executions.
function deleteDiffImages(images, dirPath) {
	if(images.length === 0) return;
	images.forEach(img => {
		// Using sync call since all other executions in this file cannot proceed until the existing diff files have been deleted.
		fs.unlinkSync(dirPath + path.sep + img);
	});
	console.log('Deleting diff images...');
}

// This function takes as a parameter, an array of 2 arrays.
// The first being the base image filenames. The second the test image filenames
function compareImages(imageFilesArray) {
	if (imageFilesArray instanceof Array && imageFilesArray.length === 2) {
		var baselineImages = imageFilesArray[0];
		var testImages = imageFilesArray[1];
		var compareToPromises = [];
		baselineImages.forEach(function(imageFile) {
			// Check if base image has corresponding test image AND igmore hidden files
		    if (testImageExists(imageFile, testImages) && imageFile.substr(0, 1) !== '.') {
		    	// Create a Promise that calls resemble.compareTo and push to an array, which will then get passed to Promise.all()
		    	var p = getResembleCompareToPromise(imageFile);
		    	compareToPromises.push(p);
		    }
		});
		// Execute all promises that call resemble.compareTo.
		// Upon resolution, take all the generated diff image file names so they may be referenced in an html document.
		Promise.all(compareToPromises).then(result => {
			buildHtml(result);
		}).catch(error => {
			console.log('Error in output of resemble.compareTo diff images', error);
		});
	} else {
		// Invalid input
		console.log('Expected an array of 2 arrays of filenames, but received: ', imageFilesArray);
	}
}

// Checks that a test image with the corresponding base image name exists.
// If a corresponding test image does not exist, that test may have failed before a screen capture was taken.
function testImageExists(imgFileName, arrayOfFileNames) {
	return arrayOfFileNames.find(function(item) {
		// Returns the image name or undefined
		return item == imgFileName;
	});
}

// Return a Promise that calls the ResembleJS compareTo function for the given images.
// Compares the image in the BASELINE_IMG_DIR_PATH directory to the test output image in the TEST_IMAGE_DIR_PATH.
// Generates a diff image and writes it to the DIFF_IMAGE_DIR_WR.
function getResembleCompareToPromise(image) {
	return new Promise(function(resolve, reject) {
		resemble(BASELINE_IMG_DIR_PATH + path.sep + image).compareTo(TEST_IMAGE_DIR_PATH + path.sep + image)
	  	.onComplete(function(data) {
	  		var result = {};
	  		var diffImageName = 'diff_' + image;
	  		result[diffImageName] = data;
	    	data.getDiffImage().pack().pipe(fs.createWriteStream(DIFF_IMAGE_DIR_WR + path.sep + diffImageName));
	    	resolve(result);
	  	});
	});
}

// Build an html file that can be opened locally
function buildHtml(images) {
	// Return if the input is not an array or is empty.
	if ( !(images instanceof Array) || (images.length <= 0) ) {
		console.log('Function buildHtml() Expected an array of diff image results and received: ', images);
		return;
	}
	var openingHTML = `	<!doctype html>
						<html>
						<head>
							<meta charset="utf-8">
							<link rel="stylesheet" type="text/css" href="style.css">
							<title>ResembleJS Generated Diff Images</title>
						</head>
						<body>
							<div class="result-img-container">
							<!-- BEGIN Diff image results -->`;
	var endingHTML = `  	<!-- END Diff image results -->
							</div>
						</body>
						</html>`;

	// Create diff image, test image, and baseline image html pages for output
	var diffBlock = '';
	var testBlock = '';
	var baselineBlock = '';
	images.forEach(function(imageData) {
		// Get the image filename and diff image data.
		// Note: See getResembleCompareToPromise() function above within the onComplete callback.
		var diffFilename = (Object.keys(imageData)[0]) ? Object.keys(imageData)[0] : 'No diff image found';
		var diffData = imageData[diffFilename];
		var filename = (diffFilename !== 'No diff image found') ? diffFilename.split('diff_')[1] : 'Image not found';
		diffBlock += '<div class="img-name">' + 'Diff image: ' + diffFilename + '</div><br>' + '<div>' + 'Mismatch Percentage: ' + diffData.misMatchPercentage + '</div><br>' + '<div>' + 'Dimension Difference:  Width ' + diffData.dimensionDifference.width + ' Height ' + diffData.dimensionDifference.height + '</div><br>' + '<img src="images/' + DIFF_IMG_DIR + '/' + diffFilename + '">';
		testBlock += '<div class="img-name">' + 'Test image: ' + filename + '</div><br>' + '<div>' + 'Mismatch Percentage: ' + diffData.misMatchPercentage + '</div><br>' + '<div>' + 'Dimension Difference:  Width ' + diffData.dimensionDifference.width + ' Height ' + diffData.dimensionDifference.height + '</div><br>' + '<img src="images/' + TEST_IMG_DIR + '/' + filename + '">';
		baselineBlock += '<div class="img-name">' + 'Baseline image: ' + filename + '</div><br>' + '<div>' + 'Mismatch Percentage: ' + diffData.misMatchPercentage + '</div><br>' + '<div>' + 'Dimension Difference:  Width ' + diffData.dimensionDifference.width + ' Height ' + diffData.dimensionDifference.height + '</div><br>' + '<img src="images/' + BASELINE_IMG_DIR + '/' + filename + '">';
	});

	// Write the output files
	var diffHTMLPage = openingHTML + diffBlock + endingHTML;
	fs.writeFile(OUTPUT_FILE_PATH + 'diff_img_output.html', diffHTMLPage, function(error) {
		if (error) {
			console.log('Error', error);
		} else {
			console.log('Diff image HTML output written to ' + OUTPUT_FILE_PATH);
		}
	});

	var testHTMLPage = openingHTML + testBlock + endingHTML;
	fs.writeFile(OUTPUT_FILE_PATH + 'test_img_output.html', testHTMLPage, function(error) {
		if (error) {
			console.log('Error', error);
		} else {
			console.log('Test image HTML output written to ' + OUTPUT_FILE_PATH);
		}
	});

	var baselineHTMLPage = openingHTML + baselineBlock + endingHTML;
	fs.writeFile(OUTPUT_FILE_PATH + 'baseline_img_output.html', baselineHTMLPage, function(error) {
		if (error) {
			console.log('Error', error);
		} else {
			console.log('Baseline image HTML output written to ' + OUTPUT_FILE_PATH);
		}
	});
}
