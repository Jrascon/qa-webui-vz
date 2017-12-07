*** Settings ***
Documentation
Resource    ${RESOURCES_DIR}/resource_imports.robot
Resource    ${RESOURCES_DIR}/lib_imports.robot

Suite Setup     Open web page in default viewport size  ${TEST_URL}
Suite Teardown  close browser

*** Variables ***
${PRODUCT}          pseries
${TEST_URL}         ${URL}/${PRODUCT}.html
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
Filter product by size feature price and category on desktop viewport
    [Tags]  fn-smoke    desktop-viewport
    :FOR    ${option}   IN  @{SIZE_LIST}
    \   Click filter by screen size option   ${option}
    \   sleep   2
    \   Verify that screen size filter is selected  ${option}
    \   Click filter by screen size option   ${option}
    \   sleep  2

    :FOR    ${option}   IN  @{FEATURE_LIST}
    \   Click filter by features option    ${option}
    \   sleep   2
    \   Verify that feature filter is selected  ${option}
    \   Click filter by features option    ${option}
    \   sleep   2

    :FOR    ${option}   IN  @{PRICE_LIST}
    \   Click filter by price option    ${option}
    \   sleep   2
    \   Verify that price filter is selected    ${option}
    \   Click filter by price option    ${option}
    \   sleep   2

    :FOR    ${option}   IN  @{CATEGORY_LIST}
    \   Click filter by category option     ${option}
    \   sleep   2
    \   Verify that category filter is selected     ${option}
    \   Click filter by category option     ${option}
    \   sleep   2
