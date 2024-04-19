*** Settings ***
Library             SeleniumLibrary
Resource            ../Locators/CheckoutPageLocators.resource

*** Keywords ***

Verify Checkout page "Personal information" loaded
        Wait Until Page Contains Element                 ${CHECKOUT_PAGE_PERSONAL_INFORMATION_HEADER}
        Page Should Contain Element                      ${CHECKOUT_PAGE_PERSONAL_INFORMATION_HEADER}

Choose an address
        Wait Until Element Is Enabled                   ${CHECKOUT_PAGE_MY_ADDRESS_RADIO_BUTTON}
        Click Element                                   ${CHECKOUT_PAGE_MY_ADDRESS_RADIO_BUTTON}


Click "Addresses" "Continue" button
        Click Button                                    ${CHECKOUT_PAGE_ADDRESSES_CONTINUE_BUTTON}


Verify Checkout page "Shipping method" loaded
        Wait Until Page Contains Element                ${CHECKOUT_PAGE_SHIPPING_METHOD_HEADER}
        Page Should Contain Element                     ${CHECKOUT_PAGE_SHIPPING_METHOD_HEADER}

Choose shipping method "My carrier"
        Click Element                                   ${CHECKOUT_PAGE_SHIPPING_METHOD_MY_CARRIER_RADIO_BUTTON}

Click Shipping method "Continue" button
        Click Button                                    ${CHECKOUT_PAGE_SHIPPING_METHOD_CONTINUE_BUTTON}

Verify Checkout page "Payment method" loaded
	    Wait Until Page Contains Element            ${CHECKOUT_PAGE_PAYMENT_HEADER}
        Page Should Contain Element                     ${CHECKOUT_PAGE_PAYMENT_HEADER}

Choose payment method "Pay by check"
        Click Element                                   ${CHECKOUT_PAGE_PAYMENT_BY_CHECK_RADIO_BUTTON}

Check "I agree with the terms of service and will adhere to them unconditionally." Checkbox
        Click Element                                   ${CHECKOUT_PAGE_TERMS_OF_SERVICE_CHECKBOX}

Click payment method "Place order" button
        Click Element                                   ${CHECKOUT_PAGE_PAYMENT_PLACE_ORDER_BUTTON}

