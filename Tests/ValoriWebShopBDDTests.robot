*** Settings ***
Library             SeleniumLibrary
Resource            ../Resources/Common.resource
Resource            ../Resources/ValoriWebShop.resource
Test Setup          Start web test
Test Teardown       Close all browsers

*** Test Cases ***

Feature: Login to the webshop
    [Documentation]         Scenario: Login to the webshop
    [Tags]  TC_WS_BDD_001      Smoke            Login      BDD
    Given ValoriWebShop.I am on the webshop homepage
    When ValoriWebShop.I login with valid credentials   ${VALID_EMAIL}    ${VALID_PASSWORD}
    Then ValoriWebShop.I should see my account page

Feature: Fail to login to the webshop
    [Documentation]         Scenario: Fail to login to the webshop with invalid password
    [Tags]  TC_WS_BDD_002      Smoke            Login      BDD
    Given ValoriWebShop.I am on the webshop homepage
    When ValoriWebShop.I login with invalid password     ${INVALID_EMAIL}    ${INVALID_PASSWORD}  
    Then ValoriWebShop.I should see an error message

Feature: Search for a product
    [Documentation]         Scenario: Search for a product
    [Tags]  TC_WS_BDD_003      Functional      Search      BDD
    Given ValoriWebShop.I am on the webshop homepage
    When ValoriWebShop.I search for "Hummingbird t-shirt"
    Then ValoriWebShop.I should see search results for "Hummingbird t-shirt"





