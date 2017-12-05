*** Settings ***
Documentation     An example test case.

Resource    ${RESOURCES_DIR}/lib_imports.robot

*** Variables ***
${URL}    https://qa.viziostaging.com/

*** Test Cases ***
Test Mobile Size
    Open homepage to mobile viewport size     ${URL}
    sleep   2
    Scroll to vertical coordinate       1200
    sleep   3
    close browser

Test Tablet Size
    Open homepage to tablet viewport size     ${URL}
    sleep   2
    Scroll to vertical coordinate       1200
    sleep   3
    close browser

Test Laptop Size
    Open homepage to laptop viewport size     ${URL}
    sleep   2
    Scroll to vertical coordinate       1200
    sleep   3
    close browser

Test Full Screen Size
    Open homepage to fullscreen viewport size     ${URL}
    sleep   2
    Scroll to vertical coordinate       1200
    sleep   3
    close browser