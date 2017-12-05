*** Settings ***
Documentation  Library file for utility keywords related to opening a browser in different viewport sizes.

Resource          ${RESOURCES_DIR}/resource_imports.robot

*** Variables ***
${SOME_VAR}    Some variable here

*** Keywords ***
# Opening browser to specific product pages
Open web page in mobile viewport size     [Arguments]     ${url}
    [Documentation]     Opens a product page to a predefined mobile size.
    ...                 Size variables are set in resources/var_declarations.robot.
    open browser        ${url}  ${BROWSER}
    set window size     ${MOBILE_WIN_WIDTH}    ${MOBILE_WIN_HEIGHT}

Open web page in tablet viewport size     [Arguments]     ${url}
    [Documentation]     Opens a product page to a predefined tablet size.
    ...                 Size variables are set in resources/var_declarations.robot.
    open browser        ${url}  ${BROWSER}
    set window size     ${TABLET_WIN_WIDTH}    ${TABLET_WIN_HEIGHT}

Open web page in laptop viewport size     [Arguments]     ${url}
    [Documentation]     Opens a product page to a predefined laptop size.
    ...                 Size variables are set in resources/var_declarations.robot.
    open browser        ${url}  ${BROWSER}
    set window size     ${LAPTOP_WIN_WIDTH}    ${LAPTOP_WIN_HEIGHT}

Open web page in fullscreen viewport size     [Arguments]     ${url}
    [Documentation]     Opens a product page to a predefined tablet size.
    ...                 Size variables are set in resources/var_declarations.robot.
    open browser        ${url}  ${BROWSER}
    maximize browser window

Open web page in default viewport size     [Arguments]     ${url}
    [Documentation]     Opens a product page to a predefined laptop size.
    ...                 Size variables are set in resources/var_declarations.robot.
    open browser        ${url}  ${BROWSER}
