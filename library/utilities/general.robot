*** Settings ***
Documentation  General utility keywords for non-browser specific functions.

Resource          ${RESOURCES_DIR}/resource_imports.robot

*** Variables ***


*** Keywords ***
Get random number   [Arguments]     ${length}
    [Documentation]     Returns a random number of the given length.
    ...                 Can be used when needing a semi-unique value.
    ${rando}=   generate random string  ${length}   [NUMBERS]
    [Return]     ${rando}

Get random string   [Arguments]     ${length}
    [Documentation]     Returns a random number of the given length.
    ...                 Can be used when needing a semi-unique value.
    ${rando}=   generate random string  ${length}   [LETTERS]
    [Return]     ${rando}

Get element top y coordinate    [Arguments]     ${element_id}
    [Documentation]     Locates a DOM element by ID and returns the top y-coordinate.
    ...                 This can be used to get the coordinate that will scroll to the top of the element.
    ${y-coordinate}=    execute javascript  return document.getElementById('${element_id}').getBoundingClientRect().top
    [Return]    ${y-coordinate}