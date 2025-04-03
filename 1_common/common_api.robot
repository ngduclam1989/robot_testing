*** Settings ***
Resource        ../imports.robot

*** Variables ***
${LOGIN_URL}    https://testek.vn/lab/api/v0/prod-man
${LOGIN_PATH}   /login-with-local


*** Keywords ***

#[Common] - Login
#    Create Session    demo_session    ${LOGIN_URL}
#    ${headers}=    Create Dictionary    Content-Type=application/json
#    LOG     ${headers}
#    ${body_request}=    Create Dictionary    username=${username_api}    password=${password_api}
#    ${response_request}=    POST On Session    demo_session    ${LOGIN_PATH}    json=${body_request}    headers=${headers}
#    Should Be Equal As Strings    ${response_request.status_code}    200
#    ${token}=    Get From Dictionary    ${response_request.json()}    access_token
#    ${bearer_token}=    Set Variable    Bearer ${token}   # Thêm "Bearer " vào token
#    [Return]    ${bearer_token}

[Common] - Login And Set Token
    [Documentation]    Thực hiện login và lưu token vào Suite Variable
    ${bearer_token}=    Login
    Set Suite Variable    ${AUTH_TOKEN}    ${bearer_token}

[Common] - Login
    ${results}   Call api login    ${LOGIN_URL}${LOGIN_PATH}     POST
    Log    ${results}
    ${bearer_token}=    Set Variable    Bearer ${results}[access_token]  # Thêm "Bearer " vào token
    [Return]    ${bearer_token}

[Common] - Validate Json Response Data
    [Arguments]    ${data}      ${BaseParam}    ${SubParam}    ${SubParamValue}
    ${datas}  Replace string by char to validate json    ${data}
    ${json}     Load data to json    ${datas}
    ${json_results}    Evaluate    json.dumps(${json})    modules=json
    Validate Json    ${json_results}    ${BaseParam}    ${SubParam}    ${SubParamValue}



