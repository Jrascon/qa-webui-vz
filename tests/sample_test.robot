*** Settings ***
Documentation     An example test case.

Resource    ../library/browser_lib.robot
Resource    ../library/util_lib.robot
Resource    ../library/vz_landing_lib.robot

*** Variables ***
${URL}    https://www.vizio.com

*** Test Cases ***
Test Mobile Size
    Open browser to mobile viewport size     ${URL}
    sleep   2
    Scroll to vertical coordinate       1200
    sleep   3
    close browser

Test Tablet Size
    Open browser to tablet viewport size     ${URL}
    sleep   2
    Scroll to vertical coordinate       1200
    sleep   3
    close browser

Test Laptop Size
    Open browser to laptop viewport size     ${URL}
    sleep   2
    Scroll to vertical coordinate       1200
    sleep   3
    close browser

Test Full Screen Size
    Open browser to fullscreen viewport size     ${URL}
    sleep   2
    Scroll to vertical coordinate       1200
    sleep   3
    close browser