*** Settings ***
Library             SeleniumLibrary
Library             ImageCompare
Resource            ../Variables/TestCasesVariables.resource
Resource            ../Locators/CreateAccountPageLocators.resource

*** Keywords ***

Verify Create Account Page loaded
    Wait Until Page Contains        ${CREATE_ACCOUNT_PAGE_HEADER}
    Page Should Contain             ${CREATE_ACCOUNT_PAGE_HEADER}

Click radio button "Mr."
    Click Element                   ${CREATE_ACCOUNT_PAGE_RADIO_BUTTON_MR}

Click radio button "Mrs."
    Click Element                   ${CREATE_ACCOUNT_PAGE_RADIO_BUTTON_MRS}

Enter First Name
    Input Text                      ${CREATE_ACCOUNT_PAGE_FIRST_NAME_BOX}           ${FIRST_NAME_NEW_ACCOUNT}

Enter Last Name
    Input Text                      ${CREATE_ACCOUNT_PAGE_LAST_NAME_BOX}            ${LAST_NAME_NEW_ACCOUNT}

Enter Valid Email
    Input Text                      ${CREATE_ACCOUNT_PAGE_EMAIL_BOX}                ${EMAIL_NEW_ACCOUNT}

Enter Invalid Email
    Input Text                      ${CREATE_ACCOUNT_PAGE_EMAIL_BOX}                ${INVALID_EMAIL}


Enter Password
    Input Text                      ${CREATE_ACCOUNT_PAGE_PASSWORD_BOX}             ${PASSWORD_NEW_ACCOUNT}

Enter Invalid Password
    Input Text                      ${CREATE_ACCOUNT_PAGE_PASSWORD_BOX}             ${INVALID_PASSWORD}

Enter Wrong Format Password
    Input Text                      ${CREATE_ACCOUNT_PAGE_PASSWORD_BOX}             ${PASSWORD_WRONG_FORMAT}

Enter Date of Birth
    Input Text                      ${CREATE_ACCOUNT_PAGE_BIRTHDAY_BOX}             ${BIRTHDAY_NEW_ACCOUNT}

Click "Receive offers" checkbox
    Click Button                    ${CREATE_ACCOUNT_PAGE_OPTIN_OFFERS_CHECKBOX}

Click "Agree to terms" checkbox
    Click Button                    ${CREATE_ACCOUNT_PAGE_TERMS_CHECKBOX}

Click "Sign up for newsletter" checkbox
    Click Button                    ${CREATE_ACCOUNT_PAGE_NEWSLETTER_CHECKBOX}

Click "Save" new account button
    Click Button                    ${CREATE_ACCOUNT_PAGE_SAVE_BUTTON}

Capture screenshot after entering invalid email
    Sleep                           2s
    Execute Javascript                              window.resizeTo(1280, 1024)
    Capture Page Screenshot         ${SCREENSHOT_INVALID_EMAIL_CREATE_ACCOUNT}

Capture screenshot after entering invalid password
    Sleep                           2s
    Execute Javascript                              window.resizeTo(1280, 1024)
    Capture Page Screenshot         ${SCREENSHOT_INVALID_PASSWORD_CREATE_ACCOUNT}

Verify date format is incorrect message
    Wait Until Page Contains        ${CREATE_ACCOUNT_PAGE_DATE_FORMAT_INCORRECT_MESSAGE}
    Page Should Contain             ${CREATE_ACCOUNT_PAGE_DATE_FORMAT_INCORRECT_MESSAGE}

Verify if still on create account page after entering invalid email
    Wait Until Page Contains        ${CREATE_ACCOUNT_PAGE_HEADER}
    Page Should Contain             ${CREATE_ACCOUNT_PAGE_HEADER}

Verify if still on create account page after entering invalid password
    Wait Until Page Contains        ${CREATE_ACCOUNT_PAGE_HEADER}
    Page Should Contain             ${CREATE_ACCOUNT_PAGE_HEADER}

Verify invalid email message displayed
    Wait Until Page Contains        ${CREATE_ACCOUNT_PAGE_INVALID_EMAIL_MESSAGE}
    Page Should Contain             ${CREATE_ACCOUNT_PAGE_INVALID_EMAIL_MESSAGE}

Verify invalid password message displayed
    Wait Until Page Contains        ${CREATE_ACCOUNT_PAGE_INVALID_PASSWORD_MESSAGE}
    Page Should Contain             ${CREATE_ACCOUNT_PAGE_INVALID_PASSWORD_MESSAGE}

Compare screenshot after entering invalid email
    Sleep                           1s
    Compare Images                  ${SCREENSHOT_INVALID_EMAIL_CREATE_ACCOUNT_REFERENCE}        ${SCREENSHOT_INVALID_EMAIL_CREATE_ACCOUNT}

Compare screenshot after entering invalid password
    Sleep                           1s
    Compare Images                  ${SCREENSHOT_INVALID_PASSWORD_CREATE_ACCOUNT_REFERENCE}     ${SCREENSHOT_INVALID_PASSWORD_CREATE_ACCOUNT}       placeholder_file=C:/ValoriRobotFrameWorkProject/Robot-Framework/Resources/ReferenceImages/BottomMask.json

