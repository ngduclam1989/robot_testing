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
Library     DateTime

#### PYTHON3 LIBRARY ####
Library     ${CURDIR}/0_resources/pythonlibs/api_libs/testing_api.py
Library     ${CURDIR}/0_resources/pythonlibs/api_libs/json_utils.py
Library     ${CURDIR}/0_resources/pythonlibs/api_libs/string_utils.py

#### ROBOT COMMON ####
Resource    ${CURDIR}/1_common/common_api.robot

#### KEYWORDS ####
Resource    ${CURDIR}/2_keywords/Login/Login_keywords.robot
Resource    ${CURDIR}/2_keywords/Products/AddProduct_keywords.robot



#### TESTCASES ####
Resource    ${CURDIR}/3_test_cases/AddProduct.robot


#### TEST DATAS ####
Resource    ${CURDIR}/4_test_datas/API_datas/api_datas.robot