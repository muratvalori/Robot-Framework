*** Settings ***
Library                 SeleniumLibrary
Resource                ../Locators/OrderHistoryPageLocators.resource

*** Keywords ***

Verify "Order History" page loaded
	Wait Until Page Contains Element        ${ORDER_HISTORY_PAGE_HEADER}

Click "Order Details" Link
	Click Link                              ${ORDER_HISTORY_PAGE_ORDER_NUMBER_11_DETAILS}

