*** Settings ***
Resource                    ../imports.robot

*** Variables ***
${Base_URL}         http://thetestingworldapi.com/
${StudentID}        10523026

*** Test Cases ***
TC_001_get
    Create Session    Get_student_detail    ${Base_URL}
    ${res}=  Get Request    Get_student_detail    api/studentsDetails/${StudentID}
    Should Be Equal As Numbers    ${res.status_code}       200      #so sanh voi gia tri la so
    ${json_res}     To Json    ${res.content}
    Should Be Equal    ${json_res["status"]}    true
    ${json_StudentId}    Get From Dictionary    ${json_res["data"]}    id
    Should Be Equal As Numbers   ${json_StudentId}    ${StudentID}
