*** Settings ***
Documentation  Library file for utility and helper keywords for navigating a web page.

Resource          ${RESOURCES_DIR}/resource_imports.robot

*** Variables ***

*** Keywords ***
Scroll to vertical coordinate       [Arguments]    ${y}
    [Documentation]     Executes javascript to scroll the page to the specified y-coordinate.
    execute javascript      window.scrollTo(0,${y})

Scroll to bottom of page
    [Documentation]     Executes javascript to scroll the page to the specified y-coordinate.
    ${height}=  execute javascript  ${GET_BODY_SCROLL_HEIGHT}
    execute javascript      window.scrollTo(0,${height})

Scroll to horizontal coordinate       [Arguments]     ${x}
    [Documentation]     Executes javascript to scroll the page to the specified x-coordinate.
    execute javascript      window.scrollTo(${x},0)

Scroll to x and y coordinates       [Arguments]     ${x}    ${y}
    [Documentation]     Executes javascript to scroll the page to the specified x and y coordinates.
    execute javascript      window.scrollTo(${x},${y})

Click link or button and wait for other element to be visible    [Arguments]     ${click_element}    ${wait_element}
    [Documentation]     Keyword that clicks on a specified html element and waits for another html element to become visible.
    wait until element is visible   ${click_element}     10
    click element                   ${click_element}
    sleep   2
    wait until element is visible   ${wait_element}   10
