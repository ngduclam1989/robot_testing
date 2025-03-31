*** Settings ***
#### ROBOT LIBRARY ####
Library     SeleniumLibrary    run_on_failure=SeleniumLibrary.CapturePageScreenshot
Library     String
Library     RequestsLibrary
Library     SSHLibrary
Library     Collections
Library     DateTime
Library     OperatingSystem
Library     DatabaseLibrary
Library     JSONLibrary


#### PYTHON3 LIBRARY ####
Library     ./0_resources/pythonlibs/convert_list_to_string.py
Library     ./0_resources/pythonlibs/convert_to_json.py
Library     ./0_resources/pythonlibs/createcsvfile.py
Library     ./0_resources/pythonlibs/csv_util.py
Library     ./0_resources/pythonlibs/encodebase64.py
Library     ./0_resources/pythonlibs/ExcellentLibrary.py
Library     ./0_resources/pythonlibs/filesearch.py
Library     ./0_resources/pythonlibs/get_all_value_of_specific_key.py
Library     ./0_resources/pythonlibs/javaexecutor.py
Library     ./0_resources/pythonlibs/json_generator.py
Library     ./0_resources/pythonlibs/math_util.py
Library     ./0_resources/pythonlibs/readcsvfile.py
Library     ./0_resources/pythonlibs/remove_quote_string_sql.py
Library     ./0_resources/pythonlibs/rest_util.py
Library     ./0_resources/pythonlibs/urlparse_compat.py
Library     ./0_resources/pythonlibs/sql_db.py
Library     ./0_resources/pythonlibs/api_libs/testing_api.py
Library     ./0_resources/pythonlibs/api_libs/json_utils.py

#### ROBOT WEB COMMON ####
Resource    ./1_common/common_keywords.robot
Resource    ./1_common/js_common_keywords.robot
Resource    ./1_common/common_variables.robot

#### ROBOT ELEMENT ####
Resource    ./2_elements/Homepage.robot
Resource    ./2_elements/CustomerServicePage.robot

#### ROBOT KEYWORDS ####
Resource        ./3_keywords/AddCustomer/AddCustomerService_keywords.robot
Resource        ./3_keywords/Login/Login_Keywords.robot
#Resource    ./3_keywords/Homepage/EB_Login_Keywords.robot

#### TEST DATAS ####
Resource    ./5_test_datas/Admin_Valid_Datas.robot

#### VARIABLES    ####
#Resource    ./5_test_datas/config_test.robot

