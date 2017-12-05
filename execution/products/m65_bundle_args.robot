# Directory that the test suite output will be written to
--outputdir output/m65bundle112817
# Necessary variables for ALL test suites
--variablefile resources/global_vars.py
# Name of the overall test suite
--name M65_Bundle_Product_Page_Updates
# Variable overrides if needed
--variable URL:https://vizbundles-69.viziostaging.com/cybermonday/m65sb4531d5.html
--variable browser:ff
# Path to test(s)
tests/pages/products/m65/visual/m65_bundle_prod_note.robot