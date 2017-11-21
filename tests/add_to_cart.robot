*** Settings ***
Documentation     An example test case.

Resource    ../library/browser_lib.robot
Resource    ../library/util_lib.robot
Resource    ../library/vz_landing_lib.robot

*** Variables ***
${URL}      https://www.vizio.com
${USER}     jon+fan000@weareenvoy.com
${PASS}     34tesla34

*** Test Cases ***
Add TV to Cart
    set selenium speed  .5  # DEMO ONLY. Remove before production.
    Open browser to default viewport size     ${URL}
    sleep   2
    Shop tvs and displays
    Select tv by model number   E75-E3
    Click buy now button

    [Teardown]  close browser
