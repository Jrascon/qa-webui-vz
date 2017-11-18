*** Settings ***
Documentation   File to organize all basic foundational imports.
...             Test and library files will import this in their respective
...             settings to include all minimum resources.

Library           SeleniumLibrary

Resource          ../resources/var_declarations.robot
Resource          ../resources/xpath_declarations.robot