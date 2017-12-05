*** Settings ***
Documentation     Functional test that creates a new Vizio account.
Resource    ${RESOURCES_DIR}/resource_imports.robot
Resource    ${RESOURCES_DIR}/lib_imports.robot

Suite Setup  Set Unique Email Suite Variable

*** Variables ***
${URL}      https://qa.viziostaging.com
${FIRST}    Monty
${LAST}     Burns
${EMAIL_START}    vzfando+fan
${EMAIL_END}      @gmail.com
${PASS}           34tesla34

*** Test Cases ***
Create New User Account
    [Tags]  fn-smoke
    Open homepage to default viewport size     ${URL}
    sleep   1
    Click sign in link
    sleep   2
    Click create fandemonium account link
    Input create account information    ${FIRST}    ${LAST}     ${EMAIL}    ${PASS}
    sleep   2
    Scroll to bottom of page
    sleep   2
    Check agree to terms checkbox
    Click create account button
    [Teardown]  close browser

Login With User account
    [Tags]  fn-smoke
    Open homepage to default viewport size     ${URL}
    sleep   1
    Click sign in link
    sleep   2
    Input sign in information   ${EMAIL}    ${PASS}
    sleep   2
    execute manual step  Do reCaptcha
    Click sign in button
    Verify logged in link with username exists  ${FIRST}
    [Teardown]  close browser

*** Keywords ***
Set Unique Email Suite Variable
    ${rand}=    Get random number   3
    set suite variable  ${EMAIL}    ${EMAIL_START}${rand}${EMAIL_END}