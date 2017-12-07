# IMPORTANT: This script must be executed from the project root.
# Run> python resources/gen-docs.py

import os
from subprocess import call

currDir = os.getcwd();
libSourceDir = os.path.join(currDir,'library')
testSourceDir = os.path.join(currDir,'tests')
interSourceDir = os.path.join(currDir, 'interface')
resourcesSourceDir = os.path.join(currDir, 'resources')

libOutputDir = os.path.join(currDir,'documentation','library')
testOutputDir = os.path.join(currDir,'documentation','tests')
interOutputDir = os.path.join(currDir,'documentation','interface')
resourcesOutputDir = os.path.join(currDir,'documentation','resources')


def generateRobotFrameworkDocumentation(sourceDir, outputDir, rfModule):
  for root, dirs, files in os.walk(sourceDir):
    robotFiles = filterRobotFiles(files)
    if robotFiles:
      callDocGenerationModule(root, robotFiles, outputDir, rfModule)


def filterRobotFiles(files):
    robotOnly = list(filter(lambda x: x.endswith('.robot'), files))
    return robotOnly


def callDocGenerationModule(dir, files, outputDir, rfModule):
  for file in files:
    testDocName = file[:-5] + 'html'
    sourcePath = os.path.join(dir,file)
    outputPath = os.path.join(outputDir ,testDocName)
    call(['python', '-m', rfModule, sourcePath, outputPath])


def main():
  generateRobotFrameworkDocumentation(libSourceDir, libOutputDir, 'robot.libdoc')
  generateRobotFrameworkDocumentation(testSourceDir, testOutputDir, 'robot.testdoc')
  generateRobotFrameworkDocumentation(interSourceDir, interOutputDir, 'robot.libdoc')
  generateRobotFrameworkDocumentation(resourcesSourceDir, resourcesOutputDir, 'robot.libdoc')


if __name__ == '__main__':
  main()
