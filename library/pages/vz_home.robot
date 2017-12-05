*** Settings ***
Documentation  Keywords for interacting with the Vizio homepage.

Resource          ${RESOURCES_DIR}/resource_imports.robot

*** Variables ***


*** Keywords ***
### Open browser to homepage
Open homepage to mobile viewport size     [Arguments]     ${url}
    [Documentation]     Opens the browser to a predefined mobile size.
    ...                 Size variables are set in resources/var_declarations.robot.
    open browser        ${url}  ${BROWSER}
    Close email newsletter popup
    set window size     ${MOBILE_WIN_WIDTH}    ${MOBILE_WIN_HEIGHT}

Open homepage to tablet viewport size     [Arguments]     ${url}
    [Documentation]     Opens the browser to a predefined tablet size.
    ...                 Size variables are set in resources/var_declarations.robot.
    open browser        ${url}  ${BROWSER}
    Close email newsletter popup
    set window size     ${TABLET_WIN_WIDTH}    ${TABLET_WIN_HEIGHT}

Open homepage to laptop viewport size     [Arguments]     ${url}
    [Documentation]     Opens the browser to a predefined laptop size.
    ...                 Size variables are set in resources/var_declarations.robot.
    open browser        ${url}  ${BROWSER}
    Close email newsletter popup
    set window size     ${LAPTOP_WIN_WIDTH}    ${LAPTOP_WIN_HEIGHT}

Open homepage to fullscreen viewport size     [Arguments]     ${url}
    [Documentation]     Opens the browser to a predefined tablet size.
    ...                 Size variables are set in resources/var_declarations.robot.
    open browser        ${url}  ${BROWSER}
    maximize browser window
    Close email newsletter popup

Open homepage to default viewport size     [Arguments]     ${url}
    [Documentation]     Opens the browser to a predefined laptop size.
    ...                 Size variables are set in resources/var_declarations.robot.
    open browser        ${url}  ${BROWSER}
    Close email newsletter popup

Close email newsletter popup
    [Documentation]     Clicks the email newsletter sign up popop.
    click element       ${NEWSLETTER_CLOSE}

# Top banner
Click sign in link
    [Documentation]     Clicks the sign in/sign up link on the top banner
    Click link or button and wait for other element to be visible    ${SIGN_IN_LINK}     ${SIGN_IN_SUBMIT}

# Navigation
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


