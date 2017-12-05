*** Settings ***
Documentation   File to organize all basic foundational imports.
...             Test and library files will import this in their respective
...             settings to include all minimum resources.

Library             SeleniumLibrary
Library             String
Library             Screenshot
Library             Dialogs
Resource            ${RESOURCES_DIR}/var_declarations.robot
Resource            ${RESOURCES_DIR}/element_locators.robot
Resource            ${RESOURCES_DIR}/js_snippets.robot
Resource            ${INTERFACE_DIR}/img_comp_interface.robot