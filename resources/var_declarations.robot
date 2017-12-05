*** Settings ***
Documentation  Resource file to store project specific variable values.

*** Variables ***
### Browser
#       By default Firefox is used. This variable can be overridden on test execution.
${BROWSER}              firefox

### Browser window size
${MOBILE_WIN_WIDTH}     375
${MOBILE_WIN_HEIGHT}    700

${TABLET_WIN_WIDTH}     768
${TABLET_WIN_HEIGHT}    843

${LAPTOP_WIN_WIDTH}     1024
${LAPTOP_WIN_HEIGHT}    843
