*** Settings ***
Documentation     An example test case.

Resource    ../library/browser_lib.robot
Resource    ../library/vz_landing_lib.robot
Resource    ../resources/js_snippets.robot

*** Variables ***
${URL}    https://www.vizio.com

*** Test Cases ***
Sandbox Test
    Open browser to mobile viewport size     ${URL}
    Capture full page screen shot   test
    #[Teardown]  close browser
    # ${hi}=      execute javascript  ${SAMPLE_JS_FILE}
    # log     ${hi}