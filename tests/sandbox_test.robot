*** Settings ***
Documentation     An example test case.

Resource    ../library/browser_lib.robot
Resource    ../library/vz_landing_lib.robot
Resource    ../library/util_lib.robot

*** Variables ***
${URL}    https://www.vizio.com

*** Test Cases ***
Sandbox Test
    Open browser to mobile viewport size     ${URL}
    sleep   2
    Capture full page screen shot   test
    [Teardown]  close browser
