*** Settings ***
Documentation
Resource    ${RESOURCES_DIR}/resource_imports.robot
Resource    ${RESOURCES_DIR}/lib_imports.robot

Suite Setup  Some Setup Keyword

*** Variables ***
${VAR}

*** Test Cases ***
Test Case Name
    [Tags]

*** Keywords ***
Some Setup Keyword