*** Settings ***
Documentation       Simple test case to that verifies the navigation links are
...                 visible on Vizios homepage.

Resource    ${RESOURCES_DIR}/resource_imports.robot
Resource    ${RESOURCES_DIR}/lib_imports.robot

*** Variables ***
${URL}    https://qa.viziostaging.com

*** Test Cases ***
P-Series Navigation Links Visible On Desktop
    [Tags]  pseries     navigation     vs-smoke
    Open homepage to default viewport size     ${URL}
    Verify navigation links are visible
    [Teardown]  close browser

*** Keywords ***
Verify navigation links are visible
    element should be visible   ${TV_DISPLAY_NAV_ITEM}
    element should be visible   ${SOUND_BARS_NAV_ITEM}
    element should be visible   ${WIRELESS_SPEAKERS_NAV_ITEM}
    element should be visible   ${SMARTCAST_NAV_ITEM}
    element should be visible   ${SUPPORT_NAV_ITEM}
    element should be visible   ${SHOP_NAV_ITEM}
