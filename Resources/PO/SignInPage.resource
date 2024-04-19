*** Settings ***
Library             SeleniumLibrary
Library             ImageCompare
Resource            ../Variables/TestCasesVariables.resource
Resource            ../Locators/SignInPageLocators.resource
Resource    OrderDetailsPage.resource

*** Keywords ***

Verify Sign In Page Loaded
    Wait Until Page Contains Element                ${SIGN_IN_PAGE_HEADER}
    Page Should Contain Element                     ${SIGN_IN_PAGE_HEADER}

Enter email
    [Arguments]     ${email}
    Input Text      ${SIGN_IN_PAGE_EMAIL_BOX}       ${email}

Enter password
    [Arguments]     ${password}
    Input Text      ${SIGN_IN_PAGE_PASSWORD_BOX}    ${password}

Enter invalid email
    [Arguments]     ${email}
    Input Text      ${SIGN_IN_PAGE_EMAIL_BOX}       ${email}

Enter unknown email
    [Arguments]     ${email}
    Input Text      ${SIGN_IN_PAGE_EMAIL_BOX}       ${email}

Enter Email From List
	[Arguments]     ${username}
	Input Text      ${SIGN_IN_PAGE_EMAIL_BOX}       ${username}

Enter Password From List
	[Arguments]     ${password}
    Input Text      ${SIGN_IN_PAGE_PASSWORD_BOX}    ${password}

Capture Page Screenshot after entering invalid email
    Sleep                                           2s                                                         
    Capture Page Screenshot                         ${SCREENSHOT_INVALID_EMAIL_SIGN_IN}

Enter invalid password
    [Arguments]     ${password}
    Input Text      ${SIGN_IN_PAGE_PASSWORD_BOX}    ${password}

Capture Page Screenshot after entering invalid email and password
    Sleep                                           2s
    Capture Page Screenshot                         ${SCREENSHOT_INVALID_EMAIL_AND_PASSWORD_SIGN_IN}

click sign in
    Click Button                                    ${SIGN_IN_BUTTON}

Verify authentication failed message displayed
    Wait Until Page Contains                        ${SIGN_IN_PAGE_AUTHENTICATION_ERROR}
    Page Should Contain                             ${SIGN_IN_PAGE_AUTHENTICATION_ERROR}

Verify if still on sign in page after entering invalid email and/or password
    Wait Until Page Contains Element                ${SIGN_IN_PAGE_HEADER}
    Page Should Contain Element                     ${SIGN_IN_PAGE_HEADER}

Compare screenshot after entering invalid email
   Compare Images                                  ${SCREENSHOT_INVALID_EMAIL_SIGN_IN_REFERENCE}       ${SCREENSHOT_INVALID_EMAIL_SIGN_IN}

Click create an account link
    Click Link                                      ${SIGN_IN_PAGE_CREATE_ACCOUNT_LINK}

    