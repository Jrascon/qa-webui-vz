*** Settings ***
Documentation       This is an untracked test file.
...                 It can be used to test out code snippets for experimentation.

Resource    ${RESOURCES_DIR}/lib_imports.robot

*** Variables ***


*** Test Cases ***
Test Global Variable Instantiation
    [Tags]  run
    log     Testing ${ROOT_DIR}
    log     Testing ${RESOURCES_DIR}
    log     Testing ${JS_RESOURCES_DIR}
    log     Testing ${LIBRARY_DIR}
    log     Testing ${LIBRARY_UTIL_DIR}
    log     Testing ${INTERFACE_DIR}
    log     Testing ${TESTS_ROOT_DIR
