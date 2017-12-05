*** Settings ***
Documentation     Functional test case that adds a P75-E1 model to a shopping cart.

Resource    ${RESOURCES_DIR}/lib_imports.robot

*** Variables ***
${URL}          https://qa.viziostaging.com
${TV_MODEL}     P75-E1

*** Test Cases ***
Add P-Series 75 to Cart
    [Tags]  pseries     cart    fn-smoke
    Open homepage to default viewport size     ${URL}
    sleep   2
    Shop tvs and displays on desktop
    Select tv by model number   ${TV_MODEL}
    Click Add to cart button

    [Teardown]  close browser
