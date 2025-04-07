*** Settings ***
Resource        ../imports.robot

*** Keywords ***

[Common] - Validate API Status Code
    [Arguments]    ${response}    ${expectedAPIStatusCode}
    Should Be Equal As Numbers    ${response.status_code}     ${expectedAPIStatusCode}    Current HTTP Code: ${response.status_code}

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

# [Common][Pre-Request] - Content-type headers
#     [Arguments]    ${content_type}=application/json    ${output}=headers
#     ${headers}    create dictionary    content-type=${content_type}
#     [common] - Set variable    name=${output}    value=${headers}

# [Common][Pre-Request] - Content-type and Accept headers
#     [Arguments]    ${content_type}=application/json    ${Accept}=application/json    ${output}=headers
#     ${headers}    create dictionary    content-type=${content_type}    Accept=${Accept}
#     [common] - Set variable    name=${output}    value=${headers}

[Common][Pre-Request] - Content-type and Accept headers and Bearer token
    [Arguments]
    ...    ${Bearer_token}
    ...    ${content_type}=application/json
    ...    ${Accept}=*/*
    ...    ${output}=headers
    ${headers}    create dictionary
    ...    content-type=${content_type}
    ...    Accept=${Accept}
    ...    Authorization=${Bearer_token}
    [common] - Set variable    name=${output}    value=${headers}

[common] - Set variable
    [Arguments]    ${name}    ${value}
    ${is_suite_var}    Run Keyword And Return Status    Should Match    ${name}    suite_*
    ${has_test_case}    Run Keyword And Return Status    Variable Should Exist    ${TEST_NAME}
    IF    '${is_suite_var}'=='${True}' or '${has_test_case}'=='${False}'
        set suite variable    \${${name}}    ${value}
    ELSE
        set test variable    \${${name}}    ${value}
    END