*** Settings ***
Documentation         Session route


*** Keywords ***
POST session
    [Arguments]     ${payload} 
    
    ${response}     POST
    ...             ${BASE_URI}/sessions
    ...             json=${payload}     
    ...             expected_status=any

    [return]        ${response}