*** Settings ***
Documentation  Resource file to store project specific xpaths for DOM elements.

*** Variables ***
### Site-wide
${STATUS_OVERLAY}       css:div.amshopby-overlay div#search-ajax-loader

### General
${NEWSLETTER_CLOSE}     css:a.modal-close.newsletter-popup
${NEWSLETTER_POPUP}     css:div.newsletter-modal__container

### Sign-in
${SIGN_IN_LINK}         css:span[class='utility-nav__signin-text']
${SIGN_IN_EMAIL}        css:input[id='email']
${SIGN_IN_PASSWORD}     css:input[id='pass']
${SIGN_IN_SUBMIT}       css:button[class*='btn-sign-in']
${CAPTCHA}              css:div[class='recaptcha-checkbox-checkmark']
${LOGGED_IN_LINK}       css:span[class='utility-nav__signin-text']

### Create account
${CREATE_ACCOUNT_LINK}  css:a[id='link-create-account']
${FIRSTNAME_TXTBOX}     css:input[id='firstname']
${LASTNAME_TXTBOX}      css:input[id='lastname']
${EMAIL_TXTBOX}         css:input[id='email_address']
${PASSWORD_TXTBOX}      css:input[id='password']
${CONFIRM_TXTBOX}       css:input[id='confirmation']
${EMAIL_CHECKBOX}       css:input[id='is_subscribed']
${AGREE_CHECKBOX}       css:input[id='agree_terms']
${SUBMIT_CREATE_BTN}    css:button[id='register_submit']
${THANKYOU_MESSAGE}     xpath://span[text()='Thank you for registering with VIZIO.']

### Navigation
${TV_DISPLAY_NAV_ITEM}          css:a[data-nav-item='tvs-displays']
${SOUND_BARS_NAV_ITEM}          css:a[data-nav-item='audio']
${WIRELESS_SPEAKERS_NAV_ITEM}   css:a[data-nav-item='discover']
${SMARTCAST_NAV_ITEM}           css:a[onclick*="'smartcast'"][class*="site-navigation"]
${SUPPORT_NAV_ITEM}             css:a[onclick*="'support'"][class*="site-navigation"]
${SHOP_NAV_ITEM}                css:a[onclick*="'shop'"][class*="site-navigation"]

### Navigation Wait elements
${COMPONENT_OVERVIEW_H1}    css:h1[class*='component-overview-hero__headline']
${TV_DISPLAY_H1}            xpath://h1[contains(text(),'TVs / Displays')]
${SOUND_BARS_H1}            xpath://h1[contains(text(),'Sound Bars.')]
${WIRELESS_SPEAKERS_H1}     xpath://h1[contains(text(),'Wireless Speakers.')]
${SMARTCAST_SPAN}           xpath://span[contains(text(),'VIZIO SmartCast')][contains(@class,'component-subnav-scroll__title')]
${VIZIO_SUPPORT}            xpath://a[contains(text(),'VIZIO Support')]

### Search
${SEARCH_ICON}                          css:div.site-navigation__search-icon
${SEARCH_INPUT}                         css:input#global-search-input
${SEARCH_RESULT_CONTAINER}              css:div#search-products-list div.contents
${SEARCH_RESULT_CONTAINER_PRODUCT}      css:div#search-products-list div.contents div.product

### Filter
# Note: Some filter locators may be defined in library/components/filter_pane.robot
${FILTER_BTN_MOBILE_LAYOUT}             css:span#filterOpen
${FILTER_CLR_BTN_MOBILE_LAYOUT}         css:div.actions[class*='visible'] > a
${FILTER_WRAPPER_ID}                    filter-wrapper

### Shop

### Shopping Cart
${CONT_SHOPPING_LINK}   css:a.continue-shopping
${SHOPPING_CART_DIV}    css:div.shopping-cart
${EMPTY_CART_DIV}       css:section.empty-cart

###### TVs
${SHOP_TVS_DISPLAYS_DESKTOP}        css:div.v-page a[href$='/tvs.html']
${SHOP_TVS_DISPLAYS_MOBILE}         css:ul.mobile-nav__subitem-list a[href$='/tvs.html']
${SHOP_TVS_DISPLAYS_TABLET}         css:div.mobile-nav__tablet-menu a[href$='/tvs.html']

###### Sound Bars
${SHOP_SOUND_BARS_DESKTOP}      css:div.v-page a[onclick*='shop sound bars']
${SHOP_SOUND_BARS_MOBILE}       css:ul.mobile-nav__subitem-list a[onclick*='shop sound bars']
${SHOP_SOUND_BARS_TABLET}       css:div.mobile-nav__tablet-menu a[onclick*='shop sound bars']

###### Wireless Speakers
${SHOP_WIRELESS_SPEAKERS_DESKTOP}      css:div.v-page a[href$='audio/multi-room.html']
${SHOP_WIRELESS_SPEAKERS_MOBILE}       css:ul.mobile-nav__subitem-list a[href$='audio/multi-room.html']
${SHOP_WIRELESS_SPEAKERS_TABLET}       css:div.mobile-nav__tablet-menu a[href$='audio/multi-room.html']
