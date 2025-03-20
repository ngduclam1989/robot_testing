*** Settings ***
Resource                    ../imports.robot
Library         DataDriver          file=../5_test_datas/API_datas/test_addAPI.xlsx      encoding=utf-8    dialect=unix
Test Template       Call API demo


*** Test Cases ***
${STT} - ${Name}
        [Tags]    test      api



*** Keywords ***
Call API demo
    [Arguments]     ${Domain}   ${EndPoint}     ${Method}       ${Data}         ${StatusCode}       ${Status}     ${Message}
    ${Results}      Call Api    ${Domain}${EndPoint}   ${Method}     ${Data}
    Should Be Equal As Strings    ${Results}[status_code]    ${StatusCode}
    ${Res}     Load Data To Json    ${Results}[response]
    Should Be Equal As Strings    ${Res}[message]    ${Message}

