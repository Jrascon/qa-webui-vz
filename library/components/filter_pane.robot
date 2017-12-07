*** Settings ***
Documentation  Keywords to interact with the filter pane on product listing pages.

Resource          ${RESOURCES_DIR}/resource_imports.robot

*** Variables ***


*** Keywords ***
Click filter button on mobile layout
    [Documentation]     Clicks the filter button to expand the filter options on mobile layout.
    click element   ${FILTER_BTN_MOBILE_LAYOUT}
    Wait on the status overlay

Click clear all filter button on mobile layout
    [Documentation]     Clicks the clear all button on the mobile layout.
    click element   ${FILTER_CLR_BTN_MOBILE_LAYOUT}
    Wait on the status overlay

Click filter by screen size option       [Arguments]    ${filter_option}
    [Documentation]     Selects the specified filter option for screen size.
    ...                 ${filter_option} should be the text as it appears in the UI.
    click element   css:div.filter-container li[rel='${filter_option}'] a
    Wait on the status overlay

Verify that screen size filter is selected       [Arguments]    ${filter_option}
    [Documentation]     Verifies that the specified feature ${filter_option} has the active-filter css class applied.
    element should be visible   css:div.filter-container li.active-filter[rel='${filter_option}']   10

Click filter by features option       [Arguments]    ${filter_option}
    [Documentation]     Selects the specified filter option under the features section.
    ...                 ${filter_option} should be the text as it appears in the UI.
    click element   css:div.filter-container li[rel^='${filter_option}'] a
    Wait on the status overlay

Verify that feature filter is selected       [Arguments]    ${filter_option}
    [Documentation]     Verifies that the specified feature ${filter_option} has the active-filter css class applied.
    element should be visible   css:div.filter-container li.active-filter[rel^='${filter_option}']  10

Click filter by price option       [Arguments]    ${filter_option}
    [Documentation]     Clicks a filter option for price specified by the order in which the option appears in the Price filter section of the UI.
    ...                 ${filter_option_number} should be an integer value starting from 1 - n.
    ...                  EXAMPLE Price filter options are:
    ...                     -200
    ...                     200-400
    ...                     400-600
    ...                     600-800
    ...                     800-1000
    ...                     1000-
    click element   css:div[data-filter='price'] li.bottom ol > li a[onclick*='Price:${filter_option}']
    Wait on the status overlay

Verify that price filter is selected       [Arguments]    ${filter_option}
    [Documentation]     Verifies that the specified ${filter_option} has the active-filter css class applied.
    element should be visible   css:div[data-filter='price'] li.bottom ol > li.active-filter a[onclick*='Price:${filter_option}']   10

Click filter by category option       [Arguments]    ${filter_option}
    [Documentation]     Selects the specified filter option under the features section.
    ...                 ${filter_option} should be the text as it appears in the UI.
    click element   css:div.filter-section.categories a[onclick*="${filter_option}"]
    Wait on the status overlay

Verify that category filter is selected       [Arguments]    ${filter_option}
    [Documentation]     Verifies that the specified ${filter_option} has the active-filter css class applied.
    page should contain element   css:div.filter-section.categories li.active-filter a[onclick*="${filter_option}"]   10

Verify filter category is displayed in page heading      [Arguments]     ${filter_category}
    [Documentation]     Verifies that the specified category is displayed in the filter heading.
    element should be visible   xpath://div[contains(@class,'filter-container')]/.//div[contains(@class,'heading-section')]/.//h2[text()='${filter_category}']

### Utility keywords
Wait on the status overlay
    [Documentation]     Waits for the status dialog that appears after clicking a filter option to render and then disappear.
    run keyword and ignore error    wait until page contains element            ${STATUS_OVERLAY}
    wait until page does not contain element    ${STATUS_OVERLAY}   30
