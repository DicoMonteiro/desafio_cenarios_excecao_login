*** Settings ***
Documentation         Geeks route


*** Keywords ***
POST Geek
    [Arguments]         ${token}        ${payload}

    ${headers}      Create Dictionary       Authorization=Bearer ${token}
    
    ${response}     POST
    ...             ${URI_GEEKS}/geeks
    ...             json=${payload}
    ...             headers=${headers}
    ...             expected_status=any

    [return]        ${response}

GET Geek
    [Arguments]         ${token}

    ${headers}      Create Dictionary       Authorization=Bearer ${token}

    ${response}     GET
    ...             ${URI_GEEKS}/geeks
    ...             headers=${headers}
    ...             expected_status=any

    [return]        ${response}
