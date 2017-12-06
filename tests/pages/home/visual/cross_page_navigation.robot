*** Settings ***
Documentation   Test case to verify basic consistency of navigation bar across various web pages.
Resource    ${RESOURCES_DIR}/resource_imports.robot
Resource    ${RESOURCES_DIR}/lib_imports.robot


*** Variables ***
${PAGE_1}                  https://qa.viziostaging.com
${PAGE_2}

*** Test Cases ***
Verify Navigation Hover Elements
    [Tags]  vs-smoke
    Open homepage to default viewport size  ${PAGE_1}
    sleep   2
    Hover over navigation item      ${TV_DISPLAY_NAV_ITEM}
    sleep   5
    [Teardown]  close browser

*** Keywords ***
