*** Settings ***
Documentation         Users route


*** Keywords ***
POST User
    [Arguments]     ${payload} 
    
    ${response}     POST
    ...             ${URI_USERS}/users
    ...             json=${payload}     
    ...             expected_status=any

    [return]        ${response}

DELETE user
    [Arguments]         ${token}

    ${headers}      Create Dictionary       Authorization=Bearer ${token}

    # Log To Console      ${headers}

    ${response}     DELETE
    ...             ${URI_USERS}/users
    ...             headers=${headers}
    ...             expected_status=any

    [return]        ${response}


GET User
    [Arguments]         ${token}

    ${headers}      Create Dictionary       Authorization=Bearer ${token}

    ${response}     GET
    ...             ${URI_USERS}/users
    ...             headers=${headers}
    ...             expected_status=any

    [return]        ${response}


PUT User
    [Arguments]         ${token}        ${payload}

    ${headers}      Create Dictionary       Authorization=Bearer ${token}

    ${response}     PUT
    ...             ${URI_USERS}/users
    ...             json=${payload}
    ...             headers=${headers}
    ...             expected_status=any

    [return]        ${response}
