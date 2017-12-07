# This option will rerun the failed tests found in the specified output.xml file.
--rerunfailed output/sandbox/output.xml
# Directory that the test suite output will be written to.
--outputdir output/sandboxrerun
# Necessary variables for ALL test suites. MUST BE INCLUDED.
--variablefile resources/global_vars.py
# Name of the overall test suite
--name Sandbox_Tests
# Variable overrides if needed
--variable URL:https://qa.viziostaging.com
--variable browser:ff
# Tags to include
--include run
# Path to test(s)
tests/*/*.robot

# After running this argument file, running the below command will:
#    Merge the results of the 2 output.xml files specified in the paths following the --merge option.
#    And write the merged results in the output directory specified after the -d option.
#       > rebot -d output/sandboxrerunresult --merge output/sandbox/output.xml output/sandboxrerun/output.xml
