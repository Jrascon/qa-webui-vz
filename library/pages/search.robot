*** Settings ***
Documentation  General utility keywords for non-browser specific functions.

Resource          ${RESOURCES_DIR}/resource_imports.robot

*** Variables ***


*** Keywords ***
Click search icon
    [Documentation]     Clicks the seach icon to search for a product.
    click element   ${SEARCH_ICON}
    wait until element is visible   ${SEARCH_INPUT}
    sleep   2

Input search term in textbox    [Arguments]     ${search_text}
    [Documentation]     Types ${search_text} into the global search textbox.
    input text  ${SEARCH_INPUT}     ${search_text}
    sleep   2

Verify number of search results label   [Arguments]     ${expected_number}
    [Documentation]     Verifies that the displayed number of search results is ${expected_number}
    wait until element is visible     xpath://span[@id='results-showing-products' and text()='${expected_number}']   30


Verify zero number of search results label   [Arguments]     ${expected_number}
    [Documentation]     Verifies that the displayed number of search results is ${expected_number}
    wait until element is visible     xpath://span[@id='results-showing-products' and text()='${expected_number}']   30