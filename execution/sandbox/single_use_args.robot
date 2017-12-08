# Directory that the test suite output will be written to
--outputdir output/cross_page_nav
# Necessary variables for ALL test suites. MUST BE INCLUDED.
--variablefile resources/global_vars.py
# Name of the overall test suite
--name NavigationSmoke
# Variable overrides if needed
--variable URL:https://qa.viziostaging.com
--variable browser:ff
# Tags to include
--include run
# Path to test(s)
tests/*/*/*/*.robot
