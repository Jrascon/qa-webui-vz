# Directory that the test suite output will be written to
--outputdir output/functional_smoketests
# Necessary variables for ALL test suites. MUST BE INCLUDED.
--variablefile resources/global_vars.py
# Name of the overall test suite
--name Functional_Smoke_Tests
# Variable overrides if needed
--variable URL:https://qa.viziostaging.com
--variable browser:ff
# Tags to include
--include fn-smoke
# Path to test(s)
tests/*/*/*/*.robot
tests/*/*/*/*/*.robot
