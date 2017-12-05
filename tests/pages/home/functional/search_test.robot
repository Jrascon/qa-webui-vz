*** Settings ***
Documentation   Basic search test with valid search term that expects a non-empty result set
...             and invalid input that should not return any results.
Resource    ${RESOURCES_DIR}/resource_imports.robot
Resource    ${RESOURCES_DIR}/lib_imports.robot

Suite Setup     Open homepage to default viewport size  ${URL}
Suite Teardown  close browser

*** Variables ***
${URL}                  https://qa.viziostaging.com
${VALID_SEARCH_1}       pseries
${VALID_SEARCH_2}       RS120-B3
${INVALID_SEARCH}       !@#%dlkjdf23432

*** Test Cases ***
Valid Search with Results
    [Tags]  fn-smoke
    sleep   2
    Click search icon
    sleep   2
    Input search term in textbox    ${VALID_SEARCH_1}
    sleep   3
    wait until element is visible    ${SEARCH_RESULT_CONTAINER_PRODUCT}  10
    Input search term in textbox    ${VALID_SEARCH_2}
    sleep   3
    wait until element is visible    ${SEARCH_RESULT_CONTAINER_PRODUCT}  10

Invalid Search with No Results
    [Tags]  fn-smoke
    [Setup]     reload page
    sleep   2
    Click search icon
    sleep   2
    Input search term in textbox    ${INVALID_SEARCH}
    sleep   3
    element should not be visible    ${SEARCH_RESULT_CONTAINER_PRODUCT}  10

*** Keywords ***
