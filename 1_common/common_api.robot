*** Settings ***
Resource        ../imports.robot

*** Keywords ***

[Common] - Validate API Status Code
    [Arguments]    ${responsecode}    ${expectedAPIStatusCode}
    Should Be Equal As Strings    ${responsecode}     ${expectedAPIStatusCode}    Current HTTP Code: ${responsecode}

[Common] - Validate Json Response Data
    [Arguments]    ${data}      ${BaseParam}    ${SubParam}    ${SubParamValue}
    ${datas}  Replace string by char to validate json    ${data}
    ${json}     Load data to json    ${datas}
    ${json_results}    Evaluate    json.dumps(${json})    modules=json
    Validate Json    ${json_results}    ${BaseParam}    ${SubParam}    ${SubParamValue}

[Common] - Extract Json Value from Response
    [Arguments]    ${response}     ${extractJsonValue}
    ${variables}    Set Variable    ${response.json()}[${extractJsonValue}]
    RETURN    ${variables}
