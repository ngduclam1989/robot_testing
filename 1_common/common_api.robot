*** Settings ***
Resource        ../imports.robot

*** Keywords ***


#[Common] - Login
#    ${headers}    Create Dictionary    Content-Type=application/json
#    ${data}        Create Dictionary    username=${USERNAME_API}    password=${PASSWORD_API}
#    ${response}    POST    ${LOGIN_URL}${LOGIN_PATH}    json=${data}    headers=${headers}
#    Should Be Equal As Numbers    ${response.status_code}    200    Login thất bại! HTTP Code: ${response.status_code}
#    ${response_json}=    Evaluate    json.loads('''${response.text}''')    json
#    ${bearer_token}=    Set Variable    Bearer ${response_json['access_token']}
#    Log    Bearer Token: ${bearer_token}
#    [Return]    ${bearer_token}

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



[Common] - Validate Json Response Data
    [Arguments]    ${data}      ${BaseParam}    ${SubParam}    ${SubParamValue}
    ${datas}  Replace string by char to validate json    ${data}
    ${json}     Load data to json    ${datas}
    ${json_results}    Evaluate    json.dumps(${json})    modules=json
    Validate Json    ${json_results}    ${BaseParam}    ${SubParam}    ${SubParamValue}

[Common] - Generate random body data
    [Arguments]        ${data}
    ${data_random}  Random string value
    ${body_data}    Replace string to generate data     ${data}     23459999    ${data_random}
    [Return]    ${body_data}
