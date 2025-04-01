*** Settings ***
Library           Collections
Library           OperatingSystem
Library           JSONLibrary
Resource                    ../imports.robot

*** Variables ***
${BASE_PARAM}   inquiryFullCustomerInfo
${SUB_PARAMS}   respCode;respDesc
${SUB_PARAMS_VALUE}   MBM0002;""
${JSON_DATA}    {"inquiryFullCustomerInfo": {"respMessage": {"respArr": "*SOKI|10.0.2.101|00005|009600||0213|000643|0200|*DSP|MBSD|*LINX|BBMBSCFINQ|00|.MBM0002|52889075328|00|STDATDSPV5DSPV5001IQ|BBMBSCFINQFNC||6565252305191554264449||0000|0010|0010|||15104|N|||AB||1|00000|*END|000|BTS||DSPO7002Q||27|00000||||15104|I|R|10|N|F|MBM0002|Invalid User ID|||||||||000000000|0000000|0000000000000000000||0000000000000000000||0700255123|", "respCode": "MBM0002", "respDesc": "Invalid User ID"}}}

*** Test Cases ***
Validate JSON Parameters
    Validate Json    ${JSON_DATA}    ${BASE_PARAM}    ${SUB_PARAMS}    ${SUB_PARAMS_VALUE}
