*** Settings ***
Library             SeleniumLibrary
Resource            ../Variables/TestCasesVariables.resource
Resource            ../Locators/SingleProductPageLocators.resource

*** Keywords ***

Verify "Hummingbird Printed T-shirt" Product Page Loaded
    Wait Until Page Contains Element        ${SINGLE_PRODUCT_PAGE_HUMMINGBIRD_TSHIRT_HEADER}
    Page Should Contain Element             ${SINGLE_PRODUCT_PAGE_HUMMINGBIRD_TSHIRT_HEADER}

Select "Size S" dropdown
    Select From List By Label               ${SINGLE_PRODUCT_PAGE_SIZE_DROPDOWN}            ${SINGLE_PRODUCT_PAGE_SIZE_DROPDOWN_OPTION_SMALL}

Select "Size M" dropdown
    Select From List By Label               ${SINGLE_PRODUCT_PAGE_SIZE_DROPDOWN}            ${SINGLE_PRODUCT_PAGE_SIZE_DROPDOWN_OPTION_MEDIUM}

Select "Size L" dropdown
    Select From List By Label               ${SINGLE_PRODUCT_PAGE_SIZE_DROPDOWN}            ${SINGLE_PRODUCT_PAGE_SIZE_DROPDOWN_OPTION_LARGE}

Select "Size XL" dropdown
    Select From List By Label               ${SINGLE_PRODUCT_PAGE_SIZE_DROPDOWN}            ${SINGLE_PRODUCT_PAGE_SIZE_DROPDOWN_OPTION_XLARGE}

Select "Dimensions" "40 x 60cm"
    Select From List By Label               ${SINGLE_PRODUCT_PAGE_DIMENSIONS_DROPDOWN}      ${SINGLE_PRODUCT_PAGE_DIMENSIONS_DROPDOWN_OPTION_40x60}

Select "Dimensions" "60 x 90cm"
    Select From List By Label               ${SINGLE_PRODUCT_PAGE_DIMENSIONS_DROPDOWN}      ${SINGLE_PRODUCT_PAGE_DIMENSIONS_DROPDOWN_OPTION_60x90}

Select "Dimensions" "80 x 120cm"
    Select From List By Label               ${SINGLE_PRODUCT_PAGE_DIMENSIONS_DROPDOWN}      ${SINGLE_PRODUCT_PAGE_DIMENSIONS_DROPDOWN_OPTION_80x120}

Click "Add to cart" button
    Wait Until Page Contains Element        ${SINGLE_PRODUCT_PAGE_ADD_TO_CART_BUTTON}
    Mouse Down                              ${SINGLE_PRODUCT_PAGE_ADD_TO_CART_BUTTON}
    Click Button                            ${SINGLE_PRODUCT_PAGE_ADD_TO_CART_BUTTON}

Click "Home" Link
    Click Element                           ${SINGLE_PRODUCT_PAGE_HOME_LINK}

Click "Color" Black Radio Buttton
    Click Element                           ${SINGLE_PRODUCT_PAGE_COLOR_BLACK_RADIO_BUTTON}

Select "Quantity" "2" from Dropdown
	Input Text                              ${SINGLE_PRODUCT_PAGE_QUANTITY_FIELD}         ${PRODUCT_QUANTITY_OPTION_2}




