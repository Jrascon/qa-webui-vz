*** Settings ***
Documentation  Library file for utility and helper keywords.

Resource          ../resources/resource_imports.robot

*** Variables ***

*** Keywords ***
Scroll to vertical coordinate       [Arguments]    ${y}

    [Documentation]     Executes javascript to scroll the page to the specified y-coordinate.
    execute javascript      window.scrollTo(0,${y})

Scroll to horizontal coordinate       [Arguments]     ${x}
    [Documentation]     Executes javascript to scroll the page to the specified x-coordinate.
    execute javascript      window.scrollTo(${x},0)

Scroll to x and y coordinates       [Arguments]     ${x}    ${y}
    [Documentation]     Executes javascript to scroll the page to the specified x and y coordinates.
    execute javascript      window.scrollTo(${x},${y})

Capture full page screen shot       [Arguments]     ${screenshot_filename_prefix}
    [Documentation]     Continuously scrolls and captures screenshots.
    ...                 The keyword will end execution once the bottom of the page is reached.
    ...                 The captured screenshots will be named based off of ${screenshot_filename_prefix}
    ...                 in numerically increasing order.
    # Vars following 'execute javascript' are found in library/js_snippets.robot
    ${total_height}=    execute javascript  ${GET_BODY_SCROLL_HEIGHT}
    ${window_height}=    execute javascript  ${GET_WINDOW_INNERHEIGHT}
    ${buffer}=  set variable    ${200}
    log     ${total_height}
    log     ${window_height}
    # Take test comparison screenshot for resembleJS
    # Define a counter to append to screenshot filenames
    ${loops}=    evaluate   ${total_height} / ${window_height}
    log     ${loops}
    ${counter}=     set variable     ${1}
    log     ${counter}
    ${counter}=     evaluate    ${counter} + ${1}
    log     ${counter}
    sleep   2
    Scroll to vertical coordinate   ${window_height}
    sleep   2
    ${window_height}=     evaluate    ${window_height} + ${window_height} - ${buffer}
    Scroll to vertical coordinate   ${window_height}
    sleep   2
    # Figure out how many page lengths to scroll
    # Loop and take screenshot

