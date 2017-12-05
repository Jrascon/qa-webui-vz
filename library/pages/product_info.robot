*** Settings ***
Documentation  Keywords for interacting with a product information page.

Resource          ${RESOURCES_DIR}/resource_imports.robot

*** Variables ***


*** Keywords ***
Click Add to cart button
    [Documentation]     Clicks the Buy Now button on a product landing page.
    ...                 Will add the item in the shopping cart.
    ${buy_now_button}=      set variable    xpath=//a[@id='buyNow']
    wait until page contains element    ${buy_now_button}
    click element   ${buy_now_button}
    wait until page contains    Shopping Cart     10