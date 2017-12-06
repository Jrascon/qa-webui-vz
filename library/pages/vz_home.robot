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
    wait until element is visible   ${NEWSLETTER_CLOSE}
    click element       ${NEWSLETTER_CLOSE}
    wait until element is not visible   ${NEWSLETTER_CLOSE}
    wait until element is not visible   ${NEWSLETTER_POPUP}

# Top banner
Click sign in link
    [Documentation]     Clicks the sign in/sign up link on the top banner
    Click link or button and wait for other element to be visible    ${SIGN_IN_LINK}     ${SIGN_IN_SUBMIT}
