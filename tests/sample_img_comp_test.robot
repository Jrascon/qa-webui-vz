*** Settings ***
Documentation     An example test case.
Test Template   Take screenshot of some layout item
Resource    ../library/browser_lib.robot
Resource    ../library/util_lib.robot
Resource    ../library/vz_landing_lib.robot
Resource    ../interface/img_comp_interface.robot

*** Variables ***
${URL_LIVE}     https://www.vizio.com
${URL_STAGE}    https://2017-mx.viziostaging.com/
${IMG1}         bingo
${Y_COORD}      1200

*** Test Cases ***          URL                     Y_COORDINATE
Capture Base Layout         ${URL_LIVE}             ${Y_COORD}
Capture Test Layout         ${URL_STAGE}            ${Y_COORD}

*** Keywords ***
Take screenshot of some layout item
    [Arguments]     ${url}     ${y_coordinate}
    Open browser to default viewport size     ${url}
    sleep   2
    Scroll to vertical coordinate       ${y_coordinate}
    run keyword if          '${url}' == '${URL_LIVE}'       Take baseline comparison screenshot for resembleJS     ${IMG1}
    ...         ELSE IF     '${url}' == '${URL_STAGE}'      Take test comparison screenshot for resembleJS     ${IMG1}
    close browser
