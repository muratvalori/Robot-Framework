*** Settings ***
Library             SeleniumLibrary
Library             RequestsLibrary
Resource            ../Resources/Variables/TestCasesVariables.resource



*** Variables ***
${work_screen}                  True

*** Keywords ***
Start web test
    Set Selenium Speed          .00001s
    Set Selenium Timeout        3s
    Log                         Starting the test case!
    Open Browser                about:blank               ${BROWSER}
    Go To                       ${URL}
    Maximize Browser Window

End web test
    Close Browser
    Log                         Ending the test case!

Create an API request session
	@{list}=   Create List          ${VALID_EMAIL}   ${VALID_PASSWORD}
	           Create Session       ValoriWebShop    ${URL}/login?back=my-account            auth=${list}
	           GET On Session       ValoriWebShop    /     expected_status=200

