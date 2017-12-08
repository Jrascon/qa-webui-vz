*** Settings ***
Documentation  Keywords for interacting with the Vizio TVs and Displays page.

Resource          ${RESOURCES_DIR}/resource_imports.robot

*** Variables ***


*** Keywords ***
Shop tvs and displays on desktop
    [Documentation]     Navigate to the TVs and displays shopping page.
    click element       ${TV_DISPLAY_NAV_ITEM}
    click element       ${SHOP_TVS_DISPLAYS_DESKTOP}

Click Compare tvs and displays button
    [Documentation]     Clicks the 'Compare TVs / Displays' button on the component overview section.
    wait until element is visible   ${COMPARE_TVS}
    click element                   ${COMPARE_TVS}
    wait until element is visible   ${COMPARE_TVS_CHART_DIV}

Select tv by model number  [Arguments]  ${model_number}
    [Documentation]     Clicks the respective TV by model number.
    ${model_number}=    convert to lowercase    ${model_number}
    ${model_number}=    remove string   ${model_number}    -
    ${tv_model}=    set variable    xpath=//a[@href='${URL}/tvs/${model_number}.html' and @title]
    click element   ${tv_model}
