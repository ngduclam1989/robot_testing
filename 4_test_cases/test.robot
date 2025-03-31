*** Settings ***
Resource                    ../imports.robot


#Run script
#robot -d results 4_test_cases/robotdemo.robot


*** Test Cases ***
Login guru99
    [Documentation]         demo test login
    [Tags]                  Login   guru
    Log                     Start testing...
#    Set Selenium Speed      .5s
#    Set Selenium Timeout    10s

    Open Browser            https://demo.guru99.com/V1/index.php        chrome
    Maximize Browser Window
    Sleep    3s
    Input Text              //input[@type="text"and@name="uid"]    mngr610281
    Input Text              //input[@type="password"and@name="password"]    zEvAbYj
    Click Button            //input[@type="submit"and@name="btnLogin"]
    Sleep    3s
    Page Should Contain         New Customer
    Click Element           //a[text()="New Customer"]
    Sleep    3s

    Input Text              //input[@name="name"]    text
    Execute JavaScript      var el = document.evaluate("//input[@type='radio' and @name='rad1' and @checked]/following-sibling::input", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue; if (el) el.click();
    Input Text              //input[@id="dob"]    12121999
    Input Text              //textarea[@name="addr"]    text
    Input Text              //input[@name="city"]    text
    Input Text              //input[@name="state"]    text
    Input Text              //input[@name="pinno"]    123456
    Input Text              //input[@name="telephoneno"]    0936276883
    Input Text              //input[@name="emailid"]    text@gmail.com
    Click Button            //input[@type="submit"]
    Sleep    3s
    Close Browser