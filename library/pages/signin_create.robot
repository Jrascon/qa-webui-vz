*** Settings ***
Documentation  Keywords for interacting with the Vizio Sign In and Create Account pages.

Resource          ${RESOURCES_DIR}/resource_imports.robot

*** Variables ***


*** Keywords ***
Click create fandemonium account link
    [Documentation]     Clicks the create one now link at the bottom of the sign in page.
    Scroll to bottom of page
    Click link or button and wait for other element to be visible    ${CREATE_ACCOUNT_LINK}  ${SUBMIT_CREATE_BTN}

Input create account information    [Arguments]     ${first}    ${last}     ${email}    ${password}
    [Documentation]     Inputs first and last names, email, and password on the create account page. And checks the agree to terms box.
    input text              ${FIRSTNAME_TXTBOX}     ${first}
    input text              ${LASTNAME_TXTBOX}      ${last}
    input text              ${EMAIL_TXTBOX}         ${email}
    input text              ${PASSWORD_TXTBOX}      ${password}
    input text              ${CONFIRM_TXTBOX}       ${password}

Input sign in information    [Arguments]     ${email}    ${password}
    [Documentation]     Inputs first and last names, email, and password on the create account page. And checks the agree to terms box.
    input text              ${SIGN_IN_EMAIL}         ${email}
    input text              ${SIGN_IN_PASSWORD}      ${password}


Check agree to terms checkbox
    [Documentation]     Selects the agree to terms checkbox on the create account page.
    select checkbox         ${AGREE_CHECKBOX}

Click create account button
    [Documentation]     Clicks the create account button.
    Click link or button and wait for other element to be visible    ${SUBMIT_CREATE_BTN}    ${THANKYOU_MESSAGE}

Click sign in button
    [Documentation]     Clicks the sign in button.
    Click link or button and wait for other element to be visible    ${SIGN_IN_SUBMIT}    ${LOGGED_IN_LINK}

# Verification Keywords
Verify logged in link with username exists    [Arguments]     ${name}
    [Documentation]     Verifies that the given user name appears in the 'Hello, Username' link.
    element should be visible   xpath://span[@class='utility-nav__signin-text' and contains(text(),'${name}')]
