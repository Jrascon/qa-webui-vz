*** Settings ***
Documentation  Keywords for interacting with the Vizio Sound Bars page.

Resource    ${RESOURCES_DIR}/resource_imports.robot
Resource    ${RESOURCES_DIR}/lib_imports.robot

*** Variables ***


*** Keywords ***
Shop sound bars on desktop
    [Documentation]     Clicks on the Sound Bars navigation item and then clicks the Shop Shound Bars button.
    Click sound bars navigation item
    click element       ${SHOP_SOUND_BARS_DESKTOP}

Click Compare sound bars button
    [Documentation]     Clicks the 'Compare TVs / Displays' button on the component overview section.
    wait until element is visible   ${COMPARE_TVS}
    click element                   ${COMPARE_TVS}
    wait until element is visible   ${COMPARE_SOUNDBAR_CHART_DIV}   20

Select sound bar by model number  [Arguments]  ${model_number}
    [Documentation]     Clicks the respective Sound Bar by model number.
    ${model_number}=        convert to lowercase    ${model_number}
    ${model_number}=        remove string   ${model_number}    -
    ${soundbar_model}=      set variable    css:h2 a[href$='${model_number}.html']
    click element   ${soundbar_model}
