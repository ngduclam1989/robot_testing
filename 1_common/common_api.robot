*** Settings ***
Resource        ../imports.robot

*** Keywords ***

[Common] - Validate API Status Code
    [Arguments]    ${responsecode}    ${expectedAPIStatusCode}
    Should Be Equal As Strings    ${responsecode}     ${expectedAPIStatusCode}    Current HTTP Code: ${responsecode}

[Common] - Validate Json Response Structure
    [Arguments]    ${data}      ${dataStructure}    
    Log    ${data}
    ${json_actual}    Load Dictionary To Json    ${data}
    Log    ${json_actual}
    Validation Json Schema Response    ${json_actual}       ${dataStructure}    

[Common] - Extract Json Value from Response
    [Arguments]    ${response}     ${extractJsonValue}
    ${variables}    Set Variable    ${response.json()}[${extractJsonValue}]
    RETURN    ${variables}


[Common] - Replace data with random string
    [Arguments]        ${data}        ${replace_data}
    ${data_random}  Random string value
    ${new_data}    Replace string to generate data     ${data}     ${replace_data}    ${data_random}
    [Return]    ${new_data}

[Common] - Replace data with old and new value 
    [Arguments]        ${data}        ${oldvalue}        ${newvalue}
    ${new_data}    Replace string to generate data     ${data}     ${oldvalue}    ${newvalue}
    [Return]    ${new_data}


[Common] - Validate Json Response data
    [Arguments]    ${data}      ${compareParam}    ${compareValue} 
    Log    ${data}
    ${json_actual}    Load Dictionary To Json    ${data}
    Log    ${json_actual}  
    Validate Json    ${json_actual}     ${compareParam}        ${compareValue} 