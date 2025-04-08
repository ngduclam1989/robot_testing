*** Settings ***
Resource        ../../imports.robot

*** Keywords ***

[Common] - Generate random body data for add product
    [Arguments]        ${data}
    ${data_random}  Random string value
    ${body_data}    Replace string to generate data     ${data}     23459999    ${data_random}
    [Return]    ${body_data}