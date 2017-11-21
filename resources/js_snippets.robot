*** Settings ***
Documentation   Resource file that declares small snippets of static Javascript.
...             The snippets will be arguments passed into the 'execute javascript' keyword.
...             For more complex javascript code, .js files may be created and stored,
...             then referenced by file path.

*** Variables ***
# EXAMPLE USAGE:
#     ${hi}=      execute javascript  ${SAMPLE_JS_FILE}
${SAMPLE_JS_FILE}           ${CURDIR}${/}js_resources${/}sample_hello.js

### Browser window size
${GET_BODY_SCROLL_HEIGHT}    return document.body.scrollHeight
${GET_WINDOW_INNERHEIGHT}    return window.innerHeight
