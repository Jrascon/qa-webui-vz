*** Settings ***
Documentation  Sample library file that declares related user keywords.

Resource          ../resources/resource_imports.robot

*** Variables ***


*** Keywords ***
Close email newsletter popup
    [Documentation]  Clicks the email newsletter sign up popop.
    click element       ${NEWSLETTER_CLOSE}