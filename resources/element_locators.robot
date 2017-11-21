*** Settings ***
Documentation  Resource file to store project specific xpaths for DOM elements.

*** Variables ***
### Pop-ups
${NEWSLETTER_CLOSE}     xpath=//a[contains(@class,'newsletter-popup')]

### Sign-in
${SIGN_IN_LINK}         xpath=//span[contains(@class,'utility-nav__signin-text')]

### Shop

### Shop TVs
${TV_DISPLAY_NAV_ITEM}      xpath=//a[@data-nav-item='tvs-displays']
${SHOP_TVS_DISPLAYS}        xpath=//section/.//a[@href='/tvs.html']
