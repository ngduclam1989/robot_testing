*** Settings ***
Resource                    ../imports.robot
Library         DataDriver          file=../5_test_datas/API_datas/test_addAPI.xlsx      encoding=utf-8    dialect=unix
Test Template       Call API demo



*** Variables ***
${token}      eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIwNWUzYjcyNy02ZmE2LTRmY2UtYWRkZS00YTZhMDEwNjg3N2IiLCJhdWQiOlsib2F1dGgyLXJlc291cmNlIl0sInVzZXJfbmFtZSI6IjA1ZTNiNzI3LTZmYTYtNGZjZS1hZGRlLTRhNmEwMTA2ODc3YiIsInNjb3BlIjpbInJlYWQiXSwiZXhwIjoxNzQzNjY3NzUyLCJpYXQiOjE3NDM2NjQxNTIsImp0aSI6IjQ1MDk4NTUzLTMzY2YtNDZkNy04OTNhLWM3OTE2OGM4NjRlNCIsImNsaWVudF9pZCI6ImYxMzU0OTg2LWU2OTgtNDcxMi1iYTk0LWU5NGIxMGJmMWI1OCJ9.Z1McEYZ1PbQUCLbqrBCEpwyi5ifLdiGV8gQrFVyy-v8m00KWhZ7ypZYE77iyHzrCH7cb0Ju09o-Vz7ZId-G2VB8QnCTOJX8yN-MCUjZdYV1NLvyaa9fyn8kcA3ilAU72sFqJyDr25fk5escaW_FGnTRi4goqDdQc_jujL4NtdSg5pyM-wzAoP_JhomS4T-dmGyUkCcnK-Gjz0oCI-YRHNLyR9_fpy26ZE-KIw9oACBGKyPy5DqVFlIMeVDjv5ud6yBuN6QwKE03FDoGcszY1BnzTH9lWG_Lc-yD4XJzzdjn-oqyV7zKlqigLQW3wlKi6ZZjGVa0j4FPeubcpb16nXg




*** Test Cases ***
${STT} - ${Name}
        [Tags]    test      api



*** Keywords ***
Call API demo
    [Arguments]     ${Domain}   ${EndPoint}     ${Method}       ${Data}         ${StatusCode}       ${BaseParam}     ${SubParam}        ${SubParamValue}
    ${Results}      Call Api    ${Domain}${EndPoint}   ${Method}     ${Data}
    Should Be Equal As Strings    ${Results}[status_code]    ${StatusCode}
#    ${Res}     Load Data To Json    ${Results}[response]
#    Validate Json    ${Res}    ${BaseParam}    ${SubParam}    ${SubParamValue}


