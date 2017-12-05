*** Settings ***
Documentation  Keywords for interacting with the Vizio Sound Bars page.

Resource    ${RESOURCES_DIR}/resource_imports.robot
Resource    ${RESOURCES_DIR}/lib_imports.robot

*** Variables ***


*** Keywords ***
### Cart summary
Click continue shopping link
    [Documentation]     Clicks the continue shopping link in the Cart Summary section.
    click element   ${CONT_SHOPPING_LINK}
    wait until page does not contain element    ${SHOPPING_CART_DIV}

### Remove item
Remove item from shopping cart  [Arguments]     ${model_number}
    [Documentation]     Removes the item specified by ${model_number} from the shopping cart.
    ${remove_link}=     set variable    xpath://div[contains(@class,'cart-row')]/.//span[text()='Model#${model_number}']/.//parent::div/.//a[@title='Remove item']
    click element   ${remove_link}

### Verification keywords
Verify item is in cart on desktop  [Arguments]     ${model_number}
    [Documentation]     Verifies that the product specified my it's ${model_number} is present in the shopping cart.}
    ${product}=     set variable    xpath://div[contains(@class,'cart-row')]/.//span[text()='Model#${model_number}']
    page should contain element     ${product}
    element should be visible       ${product}

Verify number of items in shopping cart     [Arguments]     ${expected_number}
    [Documentation]     Verifies that the ${expected_number} of items are in the shopping cart.
    ${last_cart_item}=  set variable    css:div.shopping-cart div.cart-row:nth-child(${expected_number})
    page should contain element     ${last_cart_item}
    element should be visible       ${last_cart_item}

Verify empty shopping cart heading
    [Documentation]     Verifies that the page shows a heading that the shopping cart is empty.
    page should contain element     ${EMPTY_CART_DIV}
    element should be visible       ${EMPTY_CART_DIV}
