*** Settings ***
Resource            ../imports.robot



#Run script
#robot -d results 4_test_cases/robotdemo.robot
Suite Setup       [Common] - Open Chrome Browser with mode    about:blank   ${BROWSER}
Test Setup          Go To    ${url}
Test Teardown     Clear Browser Cache
Suite Teardown    Close Browser

*** Keywords ***
Clear Browser Cache
    Execute JavaScript    window.localStorage.clear();
    Execute JavaScript    window.sessionStorage.clear();
    Execute JavaScript    caches.keys().then(keys => { keys.forEach(key => caches.delete(key)); });


*** Test Cases ***

Should be able to add new customer
    [Documentation]         1006 Should be able to add new customer
    [Tags]                  Customer   1006    Smoke
    [Login] - Login success
    [AddCustomer] - Input correct Customer Info

Should be able to log out
    [Documentation]         1004 Should be able to log out
    [Tags]                  Login   1004    Smoke
    [Login] - Login success
    [Login] - Sign out success

Should be able to cancel adding new customer
    [Documentation]         1007 Should be able to cancel adding new customer
    [Tags]                  Customer   1007    Smoke

    [Login] - Login success
    [AddCustomer] - Click Cancel button in add customer page

Login should succeed with valid credentials
    [Documentation]         1002 Login should succeed with valid credentials
    [Tags]                  Login   1002    Smoke
    [Login] - Login success

Customers page should display multiple customers
    [Documentation]         1005 Customers page should display multiple customers
    [Tags]                  Login   1005    Smoke
    [Login] - Login success
    [Login] - Count row data


