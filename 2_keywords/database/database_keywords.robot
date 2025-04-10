*** Settings ***
Resource    ../../imports.robot


*** Keywords ***
Get Value From DB By Condition
    [Arguments]    ${field}    ${table_name}    ${condition}    ${value_condition}
    Connect database
    ${value_db}    databaselibrary.Query
    ...    SELECT ${field} FROM ${table_name}  WHERE ${condition} = '${value_condition}'
    RETURN    ${value_db}

Connect Database
    [Arguments]    ${DATABASE_NAME}    ${USERNAME}    ${PASSWORD}    ${SERVER_HOST}    ${PORT}
    databaselibrary.Connect to database
    ...    pymysql
    ...    ${DATABASE_NAME}
    ...    ${USERNAME}
    ...    ${PASSWORD}
    ...    ${SERVER_HOST}
    ...    ${PORT}

Compare Api Response Existing In Database 
    [Arguments]    ${response_data}    ${api_response_field}    ${field}    ${table_name}    ${condition}    ${value_condition}
    ${api_data}=  Evaluate  json.loads('''${response_data.${api_response_field}()}''')
    ${db_results}    Get Value From DB By Condition    ${field}    ${table_name}    ${condition}    ${value_condition}
    FOR    ${result}    IN    @{db_results}
        Should Contain    ${api_data}    ${db_results}
    END