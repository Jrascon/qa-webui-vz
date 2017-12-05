*** Settings ***
Documentation  Interface to communicate with image comparison tool(s).

Resource          ../resources/resource_imports.robot

*** Variables ***
# Corresponding project for this interface file.
${RESJS_PROJECT}        img-comp-resemblejs
${RESEMBLEJS_BASE_DIR}  ${CURDIR}${/}projects${/}${RESJS_PROJECT}${/}app${/}output${/}images${/}baseline_images
${RESEMBLEJS_TEST_DIR}  ${CURDIR}${/}projects${/}${RESJS_PROJECT}${/}app${/}output${/}images${/}test_images

*** Keywords ***
Take baseline comparison screenshot for resembleJS    [Arguments]  ${image_name}
    [Documentation]     Captures a baseline screenshot and saves it within the img-comp-resemblejs project.
    ...                 Saves as .png file. ${image_name} does not need to include file type.
    capture page screenshot     ${RESEMBLEJS_BASE_DIR}${/}${image_name}.png

Take test comparison screenshot for resembleJS    [Arguments]  ${image_name}
    [Documentation]     Captures a test screenshot and saves it within the img-comp-resemblejs project.
    ...                 Saves as .png file. ${image_name} does not need to include file type.
    capture page screenshot     ${RESEMBLEJS_TEST_DIR}${/}${image_name}.png

Compare images and return mismatch percentage   [Arguments]     ${img_1}    ${img_2}
    [Documentation]     Compares the 2 specified images and returns a mismatch percentage.
    # Call resembleJS on the 2 images.
    # Return the mismatch percentage.
