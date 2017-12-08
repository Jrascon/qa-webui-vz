*** Settings ***
Documentation  Keywords related to the site-wide navigation area.

Resource          ${RESOURCES_DIR}/resource_imports.robot

*** Variables ***


*** Keywords ***
Click tvs/displays navigation item
    [Documentation]     Clicks the TVs/Displays link in the top nav bar.
    click element                   ${TV_DISPLAY_NAV_ITEM}
    wait until element is visible   ${COMPONENT_OVERVIEW_H1}

Click sound bars navigation item
    [Documentation]     Clicks the Sound Bars link in the top nav bar.
    click element                   ${SOUND_BARS_NAV_ITEM}
    wait until element is visible   ${COMPONENT_OVERVIEW_H1}

Click wireless speakers navigation item
    [Documentation]     Clicks the Wireless Speakers link in the top nav bar.
    click element                   ${WIRELESS_SPEAKERS_NAV_ITEM}
    wait until element is visible   ${COMPONENT_OVERVIEW_H1}

Click smartcast navigation item
    [Documentation]     Clicks the SmartCast link in the top nav bar.
    click element                   ${SMARTCAST_NAV_ITEM}
    wait until element is visible

Click support navigation item
    [Documentation]     Clicks the Support link in the top nav bar.
    click element                   ${SUPPORT_NAV_ITEM}
    wait until element is visible

Click shop navigation item
    [Documentation]     Clicks the Shop link in the top nav bar.
    click element                   ${SHOP_NAV_ITEM}
    wait until element is visible

Hover over navigation item  [Arguments]     ${nav_item}
    [Documentation]     Simuilates a mouse over event on the specified ${nav_item}
    mouse over      ${nav_item}

Wait for navigation bar to load
    [Documentation]     Waits for the navigation bar items to load and be visible.
    Wait for locator to be visible on the page      ${TV_DISPLAY_NAV_ITEM}
    Wait for locator to be visible on the page      ${SOUND_BARS_NAV_ITEM}
    Wait for locator to be visible on the page      ${WIRELESS_SPEAKERS_NAV_ITEM}
    Wait for locator to be visible on the page      ${SMARTCAST_NAV_ITEM}
    Wait for locator to be visible on the page      ${SUPPORT_NAV_ITEM}
    Wait for locator to be visible on the page      ${SHOP_NAV_ITEM}
