*** Settings ***
Library          RequestsLibrary
Resource         ../Resources/Common.resource
Resource         ../Resources/Variables/TestCasesVariables.resource
Test Setup       Create an API request session

*** Test Cases ***
GET request test
    [Documentation]     Quick GET request test
    [Tags]    TC_WS_API_001    Smoke    GET request
    ${response}=    GET     ${URL}
    Should Be Equal As Strings    ${response.status_code}    200

Authorized POST request test
    [Documentation]     POST request test
    [Tags]    TC_WS_API_002    Smoke    Authorized POST request test
    ${username} =    Set Variable       dantester@jourrapide.com
    ${password} =    Set Variable       1qazxsw2
    ${list_auth}=    Create List        ${username}    ${password}
    Create Session      ValoriWebShop    https://webshop.mobiletestautomation.nl/login?back=my-account   auth=@{list_auth}
    ${resp_valori_webshop}=  POST On Session   ValoriWebShop    /    expected_status=200
    Log To Console      ${resp_valori_webshop.status_code}
    Log To Console      ${resp_valori_webshop.content}


Unauthorized POST Request (Invalid Password)
    [Documentation]    Unauthorized POST request test with invalid password
    [Tags]    TC_WS_API_003    Smoke    Unauthorized POST request test
    ${username} =    Set Variable    dantester@jourrapide.com
    ${invalid_password} =    Set Variable    invalidpassword123
    ${list_unauth}=    Create List    ${username}    ${invalid_password}
    Create Session    ValoriWebShop    https://webshop.mobiletestautomation.nl/login?   auth=@{list_unauth}
    ${resp_valori_webshop}=    POST On Session    ValoriWebShop    /    expected_status=200
    Log To Console    ${resp_valori_webshop.status_code}
    ${response_content}=    Evaluate    bytes.decode($resp_valori_webshop.content, 'utf-8')
    Log To Console    ${response_content}







