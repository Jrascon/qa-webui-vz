*** Settings ***
Documentation  Sample library file that declares related user keywords.

Resource          ../resources/resource_imports.robot

*** Variables ***


*** Keywords ***
Close email newsletter popup
    [Documentation]     Clicks the email newsletter sign up popop.
    click element       ${NEWSLETTER_CLOSE}

Shop tvs and displays
    [Documentation]     Navigate to the TVs and displays shopping page.
    click element       ${TV_DISPLAY_NAV_ITEM}
    click element       ${SHOP_TVS_DISPLAYS}

Select tv by model number  [Arguments]  ${model_number}
    [Documentation]     Clicks the respective TV by model number.
    ${model_number}=    convert to lowercase    ${model_number}
    log     ${model_number}
    ${model_number}=    remove string   ${model_number}    -
    log     ${model_number}
    ${tv_model}=    set variable    xpath=//a[@href='https://www.vizio.com/tvs/${model_number}.html' and @title]
    click element   ${tv_model}

Click buy now button
    [Documentation]     Clicks the Buy Now button on a product landing page.
    ...                 Will add the item in the shopping cart.
    ${buy_now_button}=      set variable    xpath=//a[@id='buyNow']
    wait until page contains element    ${buy_now_button}
    click element   ${buy_now_button}
    wait until page contains    Shopping Cart     10