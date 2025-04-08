*** Settings ***
Resource        ../../imports.robot

*** Keywords ***


[Common] - Login And Set Token
    [Documentation]    Thực hiện login và lưu token vào Suite Variable
    ${bearer_token}=    [Common] - Login 
    Set Suite Variable    ${AUTH_TOKEN}    ${bearer_token}

[Common] - Login
    ${data}        Create Dictionary    username=${USERNAME_API}    password=${PASSWORD_API}
    ${json_data}       Load dictionary to json    ${data}
    ${login_response}       Call api login    ${LOGIN_URL}${LOGIN_PATH}     POST       ${json_data}
    Log    ${login_response}
    ${bearer_token}=    Set Variable    Bearer ${login_response['response']['access_token']}
    Log    Bearer Token: ${bearer_token}
    [Return]    ${bearer_token}
