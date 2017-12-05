*** Settings ***
Documentation
Resource    ${RESOURCES_DIR}/resource_imports.robot
Resource    ${RESOURCES_DIR}/lib_imports.robot

*** Variables ***
${ARG_1}    some argument/variable
${ARG_2}    another argument/variable

*** Test Cases ***
Filter product page
    [Tags]
    [Template]  Keyword that will be executed for each templated test case
    ${ARG_1}    ${ARG_2}



*** Keywords ***
Keyword that will be executed for each templated test case   [Arguments]     ${some_arg}    ${another_arg}
    log     doing something here
