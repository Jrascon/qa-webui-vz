# Directory that the test suite output will be written to
--outputdir output/functional_smoketests
# Necessary variables for ALL test suites
--variablefile resources/global_vars.py
# Name of the overall test suite
--name Functional_Smoke_Tests
# Variable overrides if needed
--variable browser:ff
# Tags to include
--include fn-smoke
--dryrun
# Path to test(s). More paths may need to be added here as new tests get created.
tests/*/*/*/*.robot
tests/*/*/*/*/*.robot
