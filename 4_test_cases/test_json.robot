*** Settings ***
Library           Collections
Library           OperatingSystem
Library           JSONLibrary
Resource            ${CURDIR}/../../../imports.robot

*** Variables ***
${BASE_PARAM}   ddMasterInquiry
#@{SUB_PARAMS}   respCode    respDesc    info
${JSON_DATA}    {"ddMasterInquiry": {"respMessage": {"respArr": "*SOKI|10.0.2.101|00002|009400||0213|001863|0200|*DSP|MBSD|*LINX|BBMBSDDINQ|00|/0000000|09733801450|00|STDATDSPV5DSPV9400IQ|BBMBSDDINQFNC||6565252305191554264448||0000|0010|0010|DD110001|JUPITER|26161|N|||AA|DD110001|1|00000|*END|000|BTS||DSPO7002Q|JUPITER|27|00000||||26161|I|R|1|Y|F|||||||||||000000000|0000000|0000000000000000000||0000000000000000000||3031017000209|D|NGUYEN THI THU LE|0000000000000215542|0000000000000215542|0000000000000215542|0000000000000215542|HA NOI|215542|30|VND|R-TK THAU CHI STK DB|130718|||Dormant  Has ODP  Verify signature|.00|.00|.00|.00|.00||.00|.00|.00|.00|.00|.00|.00|.00|.00|.00|.00|.00|.00|.00|.00|.00|.00|.00|.00|.00|.00|.00|.00|.00|.00|.000000000|.000000000|.00|0|.00000|.00000||9|Dormant|1|1|1|Y||I|R|.00000|.00|.00|.00000|.00000||T|Y|1|||.00|000000000000000|0000000|0000000|000000000000000|0000000|0000000||Y|N|0000000|0000000|140521|0000000|0000000|0000000|||||N|N|Y|N|00000000000|0000000|0000000||||0000000000000000000||.00|.000000000|+|.000000000|.000000000|0000000|00000||N|NGUYEN THI THU LE||001172000252|IP|Y|C|", "respCode": "0", "respDesc": "System Ok"}, "respDomain": {"accountNo": "3031017000209", "accountType": "D", "cifNo": "215542", "accountName": "NGUYEN THI THU LE", "address1": "0000000000000215542", "address2": "0000000000000215542", "address3": "0000000000000215542", "address4": "0000000000000215542", "address5": "HA NOI", "brachCode": "30", "ccyCode": "VND", "productCode": "R-TK THAU CHI STK DB", "openDate": "130718", "availableBal": ".00", "ledgerBal": ".00", "odAuthLimit": ".00", "odDrawLimit": ".00", "earMarkAmount": ".00", "lastInterestPaid": ".00", "withOldingTax": "0", "newRenewalProd": null, "status": "9", "statusDesc": "Dormant", "salesOfficer": null, "autoMaintNPLStatus": "Y", "nPLStatus": "N", "lastDateActive": "0000000", "dateOfExcess": "0000000", "dateOfStatus": "140521", "dateOfDormantStatus": "0000000", "renewalProdEff": "0000000", "dateOfLastReminder": "0000000", "dateOfLastDeposit": "0000000", "retentionAccount": "0000000000000000000", "retentionAccountType": null}}}


*** Test Cases ***
Check JSON Parameters
    ${result}    Run Keyword And Return Status    validate_json    ${JSON_DATA}    ${BASE_PARAM}    @{SUB_PARAMS}

