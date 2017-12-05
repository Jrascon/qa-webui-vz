*** Settings ***
Documentation
Resource    ${RESOURCES_DIR}/resource_imports.robot
Resource    ${RESOURCES_DIR}/lib_imports.robot

Suite Setup     Open web page in tablet viewport size  ${URL}
Suite Teardown  close browser

*** Variables ***
${PRODUCT}          pseries
${URL}              https://qa.viziostaging.com/${PRODUCT}.html
${FILTER_SIZE_1}    50" - 59"
${FILTER_SIZE_2}    60" - 69"
${FILTER_SIZE_3}    70" - 79"
${FILTER_FEAT_1}    VIZIO SmartCast
${FILTER_FEAT_2}    High Dynamic Range
${FILTER_PRICE_1}   -200
${FILTER_PRICE_2}   200-400
${FILTER_PRICE_3}   400-600
${FILTER_PRICE_4}   600-800
${FILTER_PRICE_5}   800-1000
${FILTER_PRICE_6}   1000-
${FILTER_CAT_1}     D-Series TVs
${FILTER_CAT_2}     E-Series TVs & Displays
${FILTER_CAT_3}     M-Series TVs & Displays
${FILTER_CAT_4}     P-Series Displays
${FILTER_CAT_5}     Reference Series TVs
${FILTER_CAT_6}     All TVs & Displays

@{SIZE_LIST}=    ${FILTER_SIZE_1}    ${FILTER_SIZE_2}    ${FILTER_SIZE_3}
@{FEATURE_LIST}=    ${FILTER_FEAT_1}    ${FILTER_FEAT_2}
@{PRICE_LIST}=    ${FILTER_PRICE_1}   ${FILTER_PRICE_2}   ${FILTER_PRICE_3}   ${FILTER_PRICE_4}   ${FILTER_PRICE_5}   ${FILTER_PRICE_6}
@{CATEGORY_LIST}=    ${FILTER_CAT_1}     ${FILTER_CAT_2}     ${FILTER_CAT_3}     ${FILTER_CAT_4}     ${FILTER_CAT_5}     ${FILTER_CAT_6}

*** Test Cases ***
Filter product by size on tablet viewport
    [Tags]  fn-smoke    tablet-viewport
    :FOR    ${option}   IN  @{SIZE_LIST}
    \   sleep   1
    \   Click filter button on mobile layout
    \   sleep   1
    \   Click filter by screen size option   ${option}
    \   sleep   2
    \   Click clear all filter button on mobile layout
    \   sleep   2

Filter product by feature on tablet viewport
    [Tags]  fn-smoke    tablet-viewport
    :FOR    ${option}   IN  @{FEATURE_LIST}
    \   sleep   1
    \   Click filter button on mobile layout
    \   sleep   1
    \   Click filter by features option    ${option}
    \   sleep   2
    \   Click clear all filter button on mobile layout
    \   sleep   2

Filter product by price on tablet viewport
    [Tags]  fn-smoke    tablet-viewport
    :FOR    ${option}   IN  @{PRICE_LIST}
    \   sleep   1
    \   Click filter button on mobile layout
    \   sleep   1
    \   Click filter by price option    ${option}
    \   sleep   2
    \   Click clear all filter button on mobile layout
    \   sleep   2

Filter product by category on tablet viewport
    [Tags]  fn-smoke    tablet-viewport
    :FOR    ${option}   IN  @{CATEGORY_LIST}
    \   sleep   1
    \   Click filter button on mobile layout
    \   sleep   1
    \   Click filter by category option     ${option}
    \   sleep   2
    \   Verify filter category is displayed in page heading     ${option}

