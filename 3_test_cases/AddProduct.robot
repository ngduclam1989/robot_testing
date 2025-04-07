*** Settings ***
Resource        ../imports.robot   
Library         DataDriver          file=../4_test_datas/API_datas/test_addAPI.xlsx      encoding=utf-8    dialect=unix
Suite Setup          [Common] - Login And Set Token
Test Template       Call API demo


*** Test Cases ***
${STT} - ${Name}
        [Tags]    test      api

*** Keywords ***
Call API demo
    [Arguments]     ${Domain}   ${EndPoint}     ${Method}       ${Data}         ${StatusCode}       ${BaseParam}     ${SubParam}        ${SubParamValue}
    ${header}    Headers With Accept And Access Token     ${AUTH_TOKEN}
    ${body_data}      [Common] - Generate random body data for add product   ${Data}
    ${Results}      Call Api    ${Domain}${EndPoint}    ${header}     ${Method}         ${body_data}
    Log        ${Results}[status_code]
    [Common] - Validate API Status Code   ${Results}[status_code]    ${StatusCode}
    [Common] - Validate Json Response Data  ${Results}[response]    ${BaseParam}    ${SubParam}    ${SubParamValue}


