*** Settings ***
Documentation           Services API

Library             RequestsLibrary


*** Variable ***
${BASE_URI}          https://getgeeks-gateway-adriano.herokuapp.com


*** Keywords ***
Get Token Service
    [Arguments]     ${user}

    ${payload}      Create Dictionary
    ...             email=${user}[email]
    ...             password=${user}[password]

    ${response}     POST            ${BASE_URI}/sessions        json=${payload}

    ${token}        Set Variable        Bearer ${response.json()}[token]

    [return]        ${token}

Be a Geek Service
    [Arguments]     ${token}        ${payload}

    ${headers}      Create Dictionary       Authorization=${token}
    
    ${response}     POST
    ...             ${BASE_URI}/geeks
    ...             json=${payload}
    ...             headers=${headers}
    ...             expected_status=any

    [return]        ${response}