*** Settings ***
Documentation       Verify the product note updates for the M65 Bundle product page.
...                 To run this single test case:
...                 robot -d output --variablefile resources/global_vars.py tests
...                 Alternatively: Add the following to an argument file and run:
...
...                 robot --argumentfile execution/single_use_arguments.robot
...
...                 # Directory that the test suite output will be written to
...                 --outputdir output/m65bundle112817
...                 # Necessary variables for ALL test suites
...                 --variablefile resources/global_vars.py
...                 # Name of the overall test suite
...                 --name M65_Bundle_Product_Page_Updates
...                 # Variable overrides if needed
...                 --variable URL:https://vizbundles-69.viziostaging.com/cybermonday/m65sb4531d5.html
...                 --variable browser:ff
...                 # Path to test(s)
...                 tests/pages/products/visual/m65_bundle_prod_note.robot
Resource    ${RESOURCES_DIR}/lib_imports.robot

*** Variables ***
${URL}                      https://www.vizio.com/m65sb4531d5.html
${REMOVED_TEXT_CSS}         css:h1.product-title span[style*='font-family: Open Sans Bold']
${ADDED_TEXT_CSS}           css:span.free-shipping-notice + div.product-note
${REMOVED_TEXT_XPATH}       xpath://h1[contains(@class,'product-title')]/span[text()='Will ship in 2-3 weeks']
${ADDED_TEXT_XPATH}         xpath://span[@class='free-shipping-notice']/following-sibling::div[text()='Will ship in 2-3 weeks']
${IMG_PREFIX}               M65-Bundle-Update

*** Test Cases ***
View M65 Bundle On Desktop
    [Tags]  desktop  content
    Open web page in default viewport size     ${URL}
    capture page screenshot     ${IMG_PREFIX}-Desktop.png
    Verify shipping text is removed under title
    Verify shipping text is updated under free shipping text
    [Teardown]  close browser

View M65 Bundle On Mobile
    [Tags]  mobile  content
    Open web page in mobile viewport size     ${URL}
    capture page screenshot     ${IMG_PREFIX}-Mobile.png
    Verify shipping text is removed under title
    Verify shipping text is updated under free shipping text
    [Teardown]  close browser

View M65 Bundle On Tablet
    [Tags]  tablet  content
    Open web page in tablet viewport size     ${URL}
    capture page screenshot     ${IMG_PREFIX}-Tablet.png
    Verify shipping text is removed under title
    Verify shipping text is updated under free shipping text
    [Teardown]  close browser

*** Keywords ***
Verify shipping text is removed under title
    page should not contain element     ${REMOVED_TEXT_XPATH}

Verify shipping text is updated under free shipping text
    page should contain element     ${ADDED_TEXT_CSS}
    page should contain element     ${ADDED_TEXT_XPATH}
