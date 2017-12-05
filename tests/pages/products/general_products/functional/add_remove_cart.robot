*** Settings ***
Documentation     Functional test case that adds a P75-E1 model to a shopping cart.

Resource    ${RESOURCES_DIR}/resource_imports.robot
Resource    ${RESOURCES_DIR}/lib_imports.robot

*** Variables ***
${URL}          https://qa.viziostaging.com
${TV_MODEL_1}       P75-E1
${TV_MODEL_2}       M75-E1
${SOUNDBAR_MODEL}   SB4551-D5
${SPEAKER_MODEL}    SP30-E0

*** Test Cases ***
Add and Remove Multiple Items to Cart
    [Tags]  pseries     cart    fn-smoke    run
    Open homepage to default viewport size     ${URL}
    sleep   2
    Shop tvs and displays on desktop
    Select tv by model number   ${TV_MODEL_1}
    sleep   1
    Click Add to cart button

    Click continue shopping link
    sleep   2

    Select tv by model number   ${TV_MODEL_2}
    sleep   1
    Click Add to cart button

    @{2_LIST}=  create list     ${TV_MODEL_1}   ${TV_MODEL_2}
    Verify shopping cart contents   ${2_LIST}

    Remove item from shopping cart  ${TV_MODEL_1}
    sleep   2

    @{1_LIST}=  create list     ${TV_MODEL_2}
    Verify shopping cart contents   ${1_LIST}

    Shop sound bars on desktop
    Select sound bar by model number    ${SOUNDBAR_MODEL}
    sleep   1
    Click Add to cart button

    Shop wireless speakers on desktop
    Select wireless speakers by model number    ${SPEAKER_MODEL}
    sleep   1
    Click Add to cart button

    @{3_LIST}=  create list     ${TV_MODEL_2}     ${SOUNDBAR_MODEL}   ${SPEAKER_MODEL}
    Verify shopping cart contents   ${3_LIST}

    Remove item from shopping cart  ${SOUNDBAR_MODEL}
    sleep   2

    @{2_LIST}=  create list     ${TV_MODEL_2}     ${SPEAKER_MODEL}
    Verify shopping cart contents   ${2_LIST}

    Remove item from shopping cart  ${SPEAKER_MODEL}
    sleep   2

    @{1_LIST}=  create list     ${TV_MODEL_2}
    Verify shopping cart contents   ${1_LIST}

    Remove item from shopping cart  ${TV_MODEL_2}
    sleep   2

    Verify empty shopping cart heading

    [Teardown]  close browser

*** Keywords ***
Verify shopping cart contents   [Arguments]     ${items}
    ${number_of_items}=     get length  ${items}
    Verify number of items in shopping cart     ${number_of_items}
    :FOR    ${item}     IN  @{items}
    \   Verify item is in cart on desktop     ${item}
