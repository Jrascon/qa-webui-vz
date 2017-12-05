import os

'''
NOTE About ROOT_DIR:
This var should specify the projects root directory.
When executing Robot Framework, os.getcwd() is respective of the starting
directory indicated by the path of the .robot file being executed.
For example:
If running,
	> robot tests/somesubdir/somerobotfile.robot
os.getcwd() = parent folder of the 'tests' directory.

Alternatively, if you run the command from a subdirectory that a test file is stored in,
	> cd tests/somesubdir/
	> robot somerobotfile.robot
os.getcwd() = tests/somesubdir/ (the parent directory of somerobotfile.robot)
'''
ROOT_DIR = os.getcwd()
RESOURCES_DIR = os.path.join(ROOT_DIR,"resources")
JS_RESOURCES_DIR = os.path.join(ROOT_DIR,"resources","js_resources")
LIBRARY_DIR = os.path.join(ROOT_DIR,"library")
LIBRARY_UTIL_DIR = os.path.join(LIBRARY_DIR,"utilities")
LIBRARY_PAGES_DIR = os.path.join(LIBRARY_DIR,"pages")
LIBRARY_COMPS_DIR = os.path.join(LIBRARY_DIR,"components")
INTERFACE_DIR = os.path.join(ROOT_DIR,"interface")
TESTS_ROOT_DIR = os.path.join(ROOT_DIR,"tests")