*** Settings ***
Documentation  Library file for utility and helper keywords for navigating a web page.

Resource          ${RESOURCES_DIR}/resource_imports.robot

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

Click link or button and wait for other element to be visible    [Arguments]     ${click_element}    ${wait_element}
    [Documentation]     Keyword that clicks on a specified html element and waits for another html element to become visible.
    wait until element is visible   ${click_element}     10
    click element                   ${click_element}
    sleep   2
    wait until element is visible   ${wait_element}   10


### Scroll to predefined areas
Scroll an eighth way down the page
    [Documentation]     Executes javascript to scroll the page roughly 1/8 down the page length.
    ${height}=  execute javascript  ${GET_BODY_SCROLL_HEIGHT}
    ${height}=  evaluate    ${height} // ${8}
    execute javascript      window.scrollTo(0,${height})
    sleep   1

Scroll a quarter way down the page
    [Documentation]     Executes javascript to scroll the page roughly 1/4 down the page length.
    ${height}=  execute javascript  ${GET_BODY_SCROLL_HEIGHT}
    ${height}=  evaluate    ${height} // ${4}
    execute javascript      window.scrollTo(0,${height})
    sleep   1

Scroll half way down the page
    [Documentation]     Executes javascript to scroll the page roughly 1/2 down the page length.
    ${height}=  execute javascript  ${GET_BODY_SCROLL_HEIGHT}
    ${height}=  evaluate    ${height} // ${2}
    execute javascript      window.scrollTo(0,${height})
    sleep   1

Scroll three quarters way down the page
    [Documentation]     Executes javascript to scroll the page roughly 3/4 down the page length.
    ${height}=  execute javascript  ${GET_BODY_SCROLL_HEIGHT}
    ${height}=  evaluate    (${height} // ${4}) * ${3}
    execute javascript      window.scrollTo(0,${height})
    sleep   1

Scroll to bottom of page
    [Documentation]     Executes javascript to scroll the page to the bottom.
    ${height}=  execute javascript  ${GET_BODY_SCROLL_HEIGHT}
    execute javascript      window.scrollTo(0,${height})
    sleep   1
