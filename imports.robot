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
Library     ./0_resources/pythonlibs/api_libs/testing_api.py
Library     ./0_resources/pythonlibs/api_libs/json_utils.py
Library     ./0_resources/pythonlibs/api_libs/string_utils.py

#### ROBOT WEB COMMON ####
Resource    ./1_common/common_api.robot

#### TEST DATAS ####
Resource    ./3_test_datas/API_datas/api_datas.robot