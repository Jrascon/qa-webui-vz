*** Settings ***
Documentation  Sample library file that declares related user keywords.

Resource          ../resources/resource_imports.robot

*** Variables ***
${SOME_VAR}    Some variable here

*** Keywords ***
Open browser to mobile viewport size     [Arguments]     ${url}
    [Documentation]     Opens the browser to a predefined mobile size.
    ...                 Size variables are set in resources/var_declarations.robot.
    open browser        ${url}
    Close email newsletter popup
    set window size     ${MOBILE_WIN_WIDTH}    ${MOBILE_WIN_HEIGHT}

Open browser to tablet viewport size     [Arguments]     ${url}
    [Documentation]     Opens the browser to a predefined tablet size.
    ...                 Size variables are set in resources/var_declarations.robot.
    open browser        ${url}
    Close email newsletter popup
    set window size     ${TABLET_WIN_WIDTH}    ${TABLET_WIN_HEIGHT}

Open browser to laptop viewport size     [Arguments]     ${url}
    [Documentation]     Opens the browser to a predefined laptop size.
    ...                 Size variables are set in resources/var_declarations.robot.
    open browser        ${url}
    Close email newsletter popup
    set window size     ${LAPTOP_WIN_WIDTH}    ${LAPTOP_WIN_HEIGHT}

Open browser to fullscreen viewport size     [Arguments]     ${url}
    [Documentation]     Opens the browser to a predefined tablet size.
    ...                 Size variables are set in resources/var_declarations.robot.
    open browser        ${url}
    maximize browser window
    Close email newsletter popup

Open browser to default viewport size     [Arguments]     ${url}
    [Documentation]     Opens the browser to a predefined laptop size.
    ...                 Size variables are set in resources/var_declarations.robot.
    open browser        ${url}
    Close email newsletter popup
