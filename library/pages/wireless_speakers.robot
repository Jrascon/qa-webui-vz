*** Settings ***
Documentation  Keywords for interacting with the Vizio Sound Bars page.

Resource    ${RESOURCES_DIR}/resource_imports.robot
Resource    ${RESOURCES_DIR}/lib_imports.robot

*** Variables ***


*** Keywords ***
Shop wireless speakers on desktop
    [Documentation]     Clicks on the Sound Bars navigation item and then clicks the Shop Wireless Speakers button.
    Click wireless speakers navigation item
    click element       ${SHOP_WIRELESS_SPEAKERS_DESKTOP}

Select wireless speakers by model number  [Arguments]  ${model_number}
    [Documentation]     Clicks the respective Wireless Speaker by model number.
    ${model_number}=        convert to lowercase    ${model_number}
    ${model_number}=        remove string   ${model_number}    -
    ${speaker_model}=       set variable    css:ul.products-grid a[href$='${model_number}.html']
    click element   ${speaker_model}
