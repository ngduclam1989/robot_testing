*** Settings ***
Library           Collections
Library           OperatingSystem
Library           JSONLibrary
Resource          ../imports.robot

*** Variables ***
${BASE_PARAM}
${SUB_PARAMS}   code;message;field
${SUB_PARAMS_VALUE}   400;Mismatched input;
${JSON_DATA}    {"code": 400, "message": "Dữ liệu nhập không hợp lệ", "error": "INVALID_INPUT", "errors": [{"field": "", "objectName": "", "message": "Mismatched input", "error": ""}]}



*** Test Cases ***
Validate JSON Parameters
    ${json}     Load data to json    ${JSON_DATA}
    ${json_string}    Evaluate    json.dumps(${json})    modules=json
    Validate Json    ${json_string}    ${BASE_PARAM}    ${SUB_PARAMS}    ${SUB_PARAMS_VALUE}
