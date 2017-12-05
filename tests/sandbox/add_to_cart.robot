*** Settings ***
Documentation     An example test case.

Resource    ${RESOURCES_DIR}/lib_imports.robot

*** Variables ***
${URL}      https://qa.viziostaging.com
${USER}     jon+fan000@weareenvoy.com
${PASS}     34tesla34

*** Test Cases ***
Add TV to Cart
    set selenium speed  .5  # DEMO ONLY. Remove before production.
    Open homepage to default viewport size     ${URL}
    sleep   2
    Shop tvs and displays on desktop
    Select tv by model number   E75-E1
    Click Add to cart button

    [Teardown]  close browser
