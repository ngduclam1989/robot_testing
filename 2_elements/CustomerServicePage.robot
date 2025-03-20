*** Variables ***
#Customer Service Page
${btn_addCustomer}              //a[@id="new-customer"]
${btn_SignOut}                  //a[@href="sign-out.html"]
#Add new Customer page
${txt_addNewEmail}              //input[@id="EmailAddress"]
${txt_addNewFirstName}          //input[@id="FirstName"]
${txt_addNewLastName}           //input[@id="LastName"]
${txt_addNewCity}               //input[@id="City"]
${drpList_Filter_State}         //select[@id="StateOrRegion"]
${drpList_WI_State}             //option[@value="WI"]
${rab_Male}                     //input[@value="male"]
${rab_Promo}                    //input[@name="promos-name"]
${btn_addNewCustomer_submit}        //button[@type="submit"]
${btn_addNewCustomer_cancel}            //a[text()="Cancel"]