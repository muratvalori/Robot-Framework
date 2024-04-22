*** Settings ***
Library         SeleniumLibrary
Library         FakerLibrary
Resource        ../Locators/CreateAccountPageLocators.resource

*** Keywords ***

Generate And Use Valid "Create Account" Mock Data
    [Documentation]     Generate realistic data with the Faker libarary for the Create Account page
    [Tags]              GUMD-001        Functional          Valid Mock Data

    ${first_name}=    First Name
    ${last_name}=     Last Name
    ${email}=         Email
    ${password}=      Password    length=10    special_chars=True    digits=True    upper_case=True    lower_case=True

    Input Text    ${CREATE_ACCOUNT_PAGE_FIRST_NAME_BOX}    ${first_name}
    Input Text    ${CREATE_ACCOUNT_PAGE_LAST_NAME_BOX}     ${last_name}
    Input Text    ${CREATE_ACCOUNT_PAGE_EMAIL_BOX}         ${email}
    Input Text    ${CREATE_ACCOUNT_PAGE_PASSWORD_BOX}      ${password}




