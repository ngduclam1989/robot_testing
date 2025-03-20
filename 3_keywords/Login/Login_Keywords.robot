*** Settings ***
Resource     ../../imports.robot


*** Keywords ***
[Login] - Login success
    [Common] - Verify Page Contains Element Text        Customers Are Priority One
    [Common] - Click Button               ${btn_SignIn}
    [Common] - Verify Page Contains Element Text        Login
    [Common] - Input Text                  ${txt_Email}    ${Admin_email}
    [Common] - Input Text                  ${txt_Password}    ${Admin_password}
    [Common] - Click Button                ${btn_Submit}
    [Common] - Verify Page Contains Element Text         Our Happy Customers


[Login] - Sign out success
    [Common] - Click Button               ${btn_SignOut}
    [Common] - Verify Page Contains Element Text         Signed Out

[Login] - Count row data
    ${count} =    Get Element Count    //tbody/tr
    Should Be True    0 < ${count}