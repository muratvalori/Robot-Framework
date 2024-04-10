*** Settings ***
Library          SeleniumLibrary

*** Variables ***
${BROWSER}                     Chrome
${BASE_URL}                    https://webshop.mobiletestautomation.nl/
${VALID_EMAIL}                 dantester@jourrapide.com
${VALID_PASSWORD}              1qazxsw2
${INVALID_EMAIL}               InvalidEmail
${INVALID_PASSWORD}            InvalidPassword
${VALORI_TITLE}                SmartQA Test Automation
${HUMMINGBIRD_TSHIRT}          xpath=//*[@id="content"]/section/div/div[1]/article/div/div[1]/h3/a
${HUMMINGBIRD_PICTURE}         css=#content > div.images-container > div.product-cover > img
${TOP_NAV_SIGN_IN_LINK}        xpath=//div[@id='_desktop_user_info']/div/a/i
${SIGN_IN_PAGE_HEADER}         xpath=//*[@id="main"]/header/h1
${SIGN_IN_PAGE_EMAIL_BOX}      name=email
${SIGN_IN_PAGE_PASSWORD_BOX}   name=password
${SIGN_IN_BUTTON} =            id=submit-login
${ACCOUNT_PAGE_HEADER} =       xpath=//*[@id="main"]/header/h1

*** Test Cases ***
Should be able to open Valori Webshop and look at Hummingbird Printed Sweater in detail
    Open Browser    ${BASE_URL}    ${BROWSER}
    Maximize Browser Window
    Title Should Be    ${VALORI_TITLE}
    Click Element    ${HUMMINGBIRD_TSHIRT}
    Wait Until Element Is Visible    ${HUMMINGBIRD_PICTURE}
    Element Should Be Visible    ${HUMMINGBIRD_PICTURE}
    Close Browser

Should be able to open Valori Webshop and look at Hummingbird Printed T-Shirt in detail using keywords
    Open Webshop
    Click on Humminbird Printed Sweater thumbnail
    Verify Humminbird Printed Sweater details loaded

Should be able to open Valori Webshop and login with valid credentials
    Open Webshop
    Sign in to Valori Webshop    ${VALID_EMAIL}      ${VALID_PASSWORD}

Should NOT be able to login with invalid credentials
    Open Webshop
    Sign in to Valori Webshop    ${INVALID_EMAIL}    ${INVALID_PASSWORD}    


*** Keywords ***
Open Webshop
    Open Browser      ${BASE_URL}    ${BROWSER}
    Maximize Browser Window
    Title Should Be   ${VALORI_TITLE}

Click on Humminbird Printed Sweater thumbnail
    Click Element    ${HUMMINGBIRD_TSHIRT}

Verify Humminbird Printed Sweater details loaded
    Wait Until Element Is Visible    ${HUMMINGBIRD_PICTURE}

Sign in to Valori Webshop
    [Arguments]     ${email}    ${password}
    Click Element                                   ${TOP_NAV_SIGN_IN_LINK}
    Wait Until Page Contains Element                ${SIGN_IN_PAGE_HEADER}
    Page Should Contain Element                     ${SIGN_IN_PAGE_HEADER}
    Input Text      ${SIGN_IN_PAGE_EMAIL_BOX}       ${email}
    Input Text      ${SIGN_IN_PAGE_PASSWORD_BOX}    ${password}
    Click Button                                    ${SIGN_IN_BUTTON}
    Wait Until Page Contains Element                ${ACCOUNT_PAGE_HEADER}
    Page Should Contain Element                     ${ACCOUNT_PAGE_HEADER}
    
