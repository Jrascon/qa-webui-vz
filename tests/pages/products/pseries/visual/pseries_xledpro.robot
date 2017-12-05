*** Settings ***
Documentation     An example test case.

Resource    ${RESOURCES_DIR}/lib_imports.robot

*** Variables ***
${URL}    https://qa.viziostaging.com

*** Test Cases ***
P-Series XLED Pro
    [Tags]  pseries  content
    log     This should not run
    # Open homepage to default viewport size     ${URL}
    # sleep   2
    # Capture full page screen shot   test
    # [Teardown]  close browser
