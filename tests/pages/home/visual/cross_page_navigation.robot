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
    [Setup]     Open homepage to default viewport size  ${PAGE_1}
    sleep   2
    Hover over navigation item      ${TV_DISPLAY_NAV_ITEM}
    sleep   5
    [Teardown]  close browser

Verify Accessibility Tab Focus
    [Tags]  accessibility   fn-smoke  run
    [Setup]     Open homepage to default viewport size  ${PAGE_1}
    Wait for navigation bar to load
    # press key   ${UTILITY_NAV}  \\09
    # element should be focused
    sleep  2
    press tab key without locator
    ${active}=  execute javascript  return document.activeElement.className
    log     ${active}
    # press key   ${UTILITY_NAV}  \\09
    sleep  2
    press tab key without locator
    ${active}=  execute javascript  return document.activeElement.className
    log     ${active}
    [Teardown]  close browser

*** Keywords ***
