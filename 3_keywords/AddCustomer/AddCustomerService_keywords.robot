*** Settings ***
Resource     ../../imports.robot


*** Keywords ***
[AddCustomer] - Input correct Customer Info
    [Common] - Click Button               ${btn_addCustomer}
    [Common] - Verify Page Contains Element Text         Add Customer
    [Common] - Input Text                  ${txt_addNewEmail}     ${AddNew_email}
    [Common] - Input Text                  ${txt_addNewFirstName}    ${AddNew_FirstName}
    [Common] - Input Text                  ${txt_addNewLastName}     ${AddNew_LastName}
    [Common] - Input Text                  ${txt_addNewCity}    Dallas
    [Common] - Click Element               ${drpList_Filter_State}
    [Common] - Click Element Contains Text              Iowa
    [Common] - Click Element               ${rab_Male}
    [Common] - Click Element               ${rab_Promo}
    [Common] - Click Button              ${btn_addNewCustomer_submit}
    Convert List To String Without Quote    ${rab_Male}
    [Common] - Verify Page Contains Element Text        Success! New customer added.


[AddCustomer] - Click Cancel button in add customer page
    [Common] - Click Button               ${btn_addCustomer}
    [Common] - Verify Page Contains Element Text         Add Customer
    [Common] - Click Button       ${btn_addNewCustomer_cancel}


