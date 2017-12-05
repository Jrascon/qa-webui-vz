*** Settings ***
Documentation     An example test case.
Library     String
Resource    ${RESOURCES_DIR}/lib_imports.robot
Suite Setup     Try This
*** Variables ***
${URL}    https://qa.viziostaging.com

*** Test Cases ***
# Sandbox Test
#     [Tags]  run
#     Open homepage to mobile viewport size     ${URL}
#     sleep   2
#     Capture full page screen shot   test
#     [Teardown]  close browser

# Fail Message Test
#     [Tags]
#     log     Testing fail message
#     ${img_path}=    set variable    ${CURDIR}${/}..${/}interface${/}projects${/}${RESJS_PROJECT}${/}app${/}output${/}images${/}diff_images${/}diff_bingo.png
#     Fail    *HTML*<b>Test failed</b><img width='80%'' src='${img_path}'>
Random Number
    ${rando}=   generate random string  3   [NUMBERS]abcdefg
    log     ${rando}
    :FOR    ${ELEMENT}    IN    @{ITEMS}
    \    Log    ${ELEMENT}

*** Keywords ***
Try This
    @{list}=  Create List    Star Trek    Star Wars    Perry Rhodan
    set suite variable  @{ITEMS}   @{list}