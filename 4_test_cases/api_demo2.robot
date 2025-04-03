*** Settings ***
Resource                    ../imports.robot

*** Variables ***
${Base_URL}         https://testek.vn/lab/api/v0/prod-man
${StudentID}        7784268
${TOKEN}            Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6ImEwMzBjNTgwY2FmNDJiNzUwNGJiM2U3YjUyNWZmMDcxNTJmNjhkMzI4ZTJjNWE1YWMzN2M0MTgzNTIwZGU5ZGNhNmQzMjgwZWQxZDMyMDBkIn0.eyJhdWQiOiIxMDAwMDMiLCJqdGkiOiJhMDMwYzU4MGNhZjQyYjc1MDRiYjNlN2I1MjVmZjA3MTUyZjY4ZDMyOGUyYzVhNWFjMzdjNDE4MzUyMGRlOWRjYTZkMzI4MGVkMWQzMjAwZCIsImlhdCI6MTc0MjgwMzk1OSwibmJmIjoxNzQyODAzOTU5LCJleHAiOjE3NDI4MDc1NTksInN1YiI6IjEyMDUiLCJzdWJfcGhvbmUiOiIwOTM2Mjc2ODgzIiwic3ViX2VtYWlsIjoidGVzdDExQGdtYWlsLmNvbSIsInN1Yl9uYW1lIjoiTmd1eVx1MWVjNW4gVlx1MDEwM24gQSIsInN1Yl9zdGF0dXMiOjIsInN1Yl9hdmF0YXIiOiIiLCJzdWJfdHlwZSI6Mywic3ViX3NlcnZpY2VfaWQiOm51bGwsInN1Yl9pc19ibG9jayI6MCwic3ViX2lzX2FjdGl2ZSI6MSwic3ViX2lzX3ZlcmlmeSI6MSwic3ViX2lwIjpudWxsLCJzY29wZXMiOltdfQ.StKlPV2rrfbf2oJt8GPMUp4aaRkqWk-w-c6vX7MPkqYorpmSW3wyQqDIHJ_BR5zSNLCfL_QYLjVR5Xeuk_-x39QZZXj2Rs-kaRkp5xc4GWwRosRH-Sq96_iJPdqxthGUygbd3zYmIDkOR26YNjF8R35u6D5459SSn-PnIJo9BSm3JjUQ85XxU9t6_vXvFFOjCikspMT4s04zyr3VcrMXG5EGS9qea417b7E0MxDj44sH0h1d6xttF-_heJE7xdrnLlGSfciGh5_R0wY9YKThvAB_bO2V5P-fDzPpdk62h1pXqjwhLiyhreGJ-rAECd6N00ZS0fr3OEUNtzVSx84Y4pDGqFDxyMl3NGbFJdNHehQsBpPjQJm9b_zonku15J4l0DIN1yHKZBYICc9EGKBMBQSe3pA_0Aaapz4dEgv_fK5NGwFx6gGEM0cb3UUJWs5ssM_Si18gVyiwEJxyxabwxyRomBdJ571Vx7aU5udg3yh2MDBenU5se3WJaJlWJrt4mPuKUA4K4lon6RNpehADDrjBZ5UJWa7GEPyVUzIQk2nte08ZoZ33abfqmN2j0NIsxNrV8l_dA_XWkZqQv1YdBpifRvPoK__tXmmyYO82Xv3I-gL23Vyve8z8aeetNknN7R7A79q7-xanDzr9PbidyenQznwqD6a1XpW6RBxj-BU

${body}             {"username": "admin_role","password": "aA12345678@"}





*** Test Cases ***

TC_002_Check bank-transfer verify
    ${headers}=    Create Dictionary     Content-Type=application/json
    Create Session    Post_bank_verify      ${Base_URL}    headers=${headers}
    ${res}    POST On Session    Post_bank_verify    /login-with-local    data=${body}
    Should Be Equal As Numbers    ${res.status_code}       200      #so sanh voi gia tri la so
    ${json_res}     To Json    ${res.content}
    Log to console    ${res.content}



#TC_001_get user info
#    ${headers}=    Create Dictionary    Authorization=${TOKEN}    Content-Type=application/json
#    Create Session    Get_student_detail    ${Base_URL}    headers=${headers}
#    ${res}    GET On Session    Get_student_detail      /user/info
#    Should Be Equal As Numbers    ${res.status_code}       200      #so sanh voi gia tri la so
#    ${json_res}     To Json    ${res.content}
#    Log    ${res.content}
#    Should be equal as integers    ${json_res["status"]}        1
#    Should be equal    ${json_res["message"]}    Success
#    Should Be Equal    ${json_res["data"]["phone"]}    0936276883
#    ${json_StudentId}    Get From Dictionary    ${json_res["data"]}    id
#    Should Be Equal As Numbers   ${json_StudentId}    ${StudentID}