*** Settings ***
Documentation   This file imports all library files.
...             It can be declared as a Resource in all test files to include dependent library files.

Resource    ${LIBRARY_PAGES_DIR}/vz_home.robot
Resource    ${LIBRARY_PAGES_DIR}/signin_create.robot
Resource    ${LIBRARY_PAGES_DIR}/product_info.robot
Resource    ${LIBRARY_PAGES_DIR}/search.robot
Resource    ${LIBRARY_PAGES_DIR}/sound_bars.robot
Resource    ${LIBRARY_PAGES_DIR}/tvs_displays.robot
Resource    ${LIBRARY_PAGES_DIR}/wireless_speakers.robot
Resource    ${LIBRARY_PAGES_DIR}/shop_cart.robot
Resource    ${LIBRARY_COMPS_DIR}/filter_pane.robot
Resource    ${LIBRARY_COMPS_DIR}/navigation_bar.robot
Resource    ${LIBRARY_UTIL_DIR}/open_browser.robot
Resource    ${LIBRARY_UTIL_DIR}/page_navigation.robot
Resource    ${LIBRARY_UTIL_DIR}/screencapture.robot
Resource    ${LIBRARY_UTIL_DIR}/general.robot