*** Settings ***
Resource        ../imports.robot

*** Variables ***
${LOGIN_URL}    https://testek.vn/lab/api/v0/prod-man
${LOGIN_PATH}   /login-with-local
${USERNAME_API}    admin_role
${PASSWORD_API}    aA12345678@

*** Keywords ***


[Common] - Login
    ${headers}    Create Dictionary    Content-Type=application/json
    ${data}        Create Dictionary    username=${USERNAME_API}    password=${PASSWORD_API}
    ${response}    POST    ${LOGIN_URL}${LOGIN_PATH}    json=${data}    headers=${headers}
    Should Be Equal As Numbers    ${response.status_code}    200    Login thất bại! HTTP Code: ${response.status_code}
    ${response_json}=    Evaluate    json.loads('''${response.text}''')    json
    ${bearer_token}=    Set Variable    Bearer ${response_json['access_token']}
    Log    Bearer Token: ${bearer_token}
    [Return]    ${bearer_token}

[Common] - Login And Set Token
    [Documentation]    Thực hiện login và lưu token vào Suite Variable
    ${bearer_token}=    [Common] - Login
    Set Suite Variable    ${AUTH_TOKEN}    ${bearer_token}



[Common] - Validate Json Response Data
    [Arguments]    ${data}      ${BaseParam}    ${SubParam}    ${SubParamValue}
    ${datas}  Replace string by char to validate json    ${data}
    ${json}     Load data to json    ${datas}
    ${json_results}    Evaluate    json.dumps(${json})    modules=json
    Validate Json    ${json_results}    ${BaseParam}    ${SubParam}    ${SubParamValue}



