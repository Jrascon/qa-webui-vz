*** Settings ***
Documentation   File to organize all basic foundational imports.
...             Test and library files will import this in their respective
...             settings to include all minimum resources.

Library             SeleniumLibrary
Library             String
Library             Screenshot
Resource            ../resources/var_declarations.robot
Resource            ../resources/element_locators.robot
Resource            ../resources/js_snippets.robot