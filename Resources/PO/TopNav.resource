*** Settings ***
Library             SeleniumLibrary
Resource            ../Variables/TestCasesVariables.resource
Resource            ../Locators/TopNavLocators.resource

*** Keywords ***


Click Sign In Link
    Click Element                       ${TOP_NAV_SIGN_IN_LINK}

Verify user is logged in
    Page Should Contain Element         ${TOP_NAV_LOGGED_IN_USER}

Click Logged in user link
    Wait Until Page Contains Element    ${TOP_NAV_LOGGED_IN_USER}
    Click Element                       ${TOP_NAV_LOGGED_IN_USER}
    
Click "Valori" logo
    Click Element                       ${TOP_NAV_VALORI_LOGO}

Click "Sign out" link
    Click Element                       ${TOP_NAV_SIGN_OUT_LINK}

Click "Clothes" Dropdown
    Click Element                       ${TOP_NAV_CLOTHES_DROPDOWN}

Enter "Hummingbird t-shirt" in Search field
    Input Text                          ${TOP_NAV_SEARCH_FIELD}             ${ITEM_SEARCH}
    Press Keys                          ${TOP_NAV_SEARCH_FIELD}             ENTER


Click "Search" button
	Click Element                       ${TOP_NAV_SEARCH_BUTTON}

Click "Contact us" link
    Click Element                       ${TOP_NAV_CONTACT_US_LINK}



