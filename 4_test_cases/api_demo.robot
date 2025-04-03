*** Settings ***
Resource        ../imports.robot
Library         DataDriver          file=../5_test_datas/API_datas/test_addAPI.xlsx      encoding=utf-8    dialect=unix
#Test Setup           [Common] - Login And Set Token
Test Template       Call API demo


*** Test Cases ***
${STT} - ${Name}
        [Tags]    test      api

*** Keywords ***
Call API demo
    [Arguments]     ${Domain}   ${EndPoint}     ${Method}       ${Data}         ${StatusCode}       ${BaseParam}     ${SubParam}        ${SubParamValue}
    Log    ${Data}
    ${random_data}    Random string value
    ${new_data}     Replace string to generate data     ${Data}     234569999    ${random_data}
    Log    ${new_data}
    ${Results}      Call Api    ${Domain}${EndPoint}     ${Method}         ${new_data}
    Should Be Equal As Strings    ${Results}[status_code]    ${StatusCode}
    [Common] - Validate Json Response Data  ${Results}[response]    ${BaseParam}    ${SubParam}    ${SubParamValue}



