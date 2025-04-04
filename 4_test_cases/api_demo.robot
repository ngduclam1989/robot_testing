*** Settings ***
Resource        ../imports.robot
Library         DataDriver          file=../5_test_datas/API_datas/test_addAPI.xlsx      encoding=utf-8    dialect=unix
Suite Setup          [Common] - Login And Set Token
Test Template       Call API demo


*** Test Cases ***
${STT} - ${Name}
        [Tags]    test      api

*** Keywords ***
Call API demo
    [Arguments]     ${Domain}   ${EndPoint}     ${Method}       ${Data}         ${StatusCode}       ${BaseParam}     ${SubParam}        ${SubParamValue}
    ${Results}      Call Api    ${Domain}${EndPoint}    ${AUTH_TOKEN}     ${Method}         ${Data}
    Should Be Equal As Strings    ${Results}[status_code]    ${StatusCode}
    [Common] - Validate Json Response Data  ${Results}[response]    ${BaseParam}    ${SubParam}    ${SubParamValue}



