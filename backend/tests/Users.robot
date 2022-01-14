*** Settings ***
Documentation           Users route test suite

Resource            ${EXECDIR}/resources/Base.robot



*** Test Case ***
Add new user

    ${payload_user}         Factory New User

    Remove user             ${payload_user}

    ${response}             POST User                 ${payload_user}

    Status Should Be        201                       ${response}

    ${user_id}              Set Variable              ${response.json()}[id]

    Should Be True          ${user_id} > 0

Get user data
    [Tags]          get_user

    ${payload_user}         Factory Get User

    POST User               ${payload_user}

    ${token}                Get Token                 ${payload_user}       token

    ${response}             GET User                  ${token}

    Status Should Be        200                       ${response}

    ${user_id}              Set Variable              ${response.json()}[id]

    Should Be True          ${user_id} > 0

    Should Be Equal As Strings         ${payload_user}[name]     ${response.json()}[name]
    Should Be Equal As Strings         ${payload_user}[email]    ${response.json()}[email] 

    Should Be Equal As Strings         None                      ${response.json()}[whatsapp]
    Should Be Equal As Strings         None                      ${response.json()}[avatar]
    Should Be Equal As Strings         False                     ${response.json()}[is_geek]
    Should Be True                    '${response.json()}[is_geek]' == 'False'


Duplicate user

    ${payload_user}           Factory New User

    Remove user               ${payload_user}

    POST User                 ${payload_user}

    ${response}               POST User                 ${payload_user}

    Status Should Be          400                       ${response}

    Should Be Equal           User already exists       ${response.json()}[error]

Remove user
    [Tags]          remove_user

    ${payload_user}         Factory Remove User

    POST User               ${payload_user}

    ${token}                Get Token                 ${payload_user}       token

    ${response}             DELETE User               ${token}

    Status Should Be        204                       ${response}

    ${response}             Get User                  ${token}

    Status Should Be        404                       ${response}


Update a user
    [Tags]          alterar_user

    ${payload_user}         Factory Update User

    Remove user             ${payload_user}[before]

    POST User               ${payload_user}[before]

    ${token}                Get Token                 ${payload_user}[before]      token

    ${response}             GET User                  ${token}

    Should Be Equal As Strings         ${payload_user}[before][name]     ${response.json()}[name]
    Should Be Equal As Strings         ${payload_user}[before][email]    ${response.json()}[email] 
    Should Be Equal As Strings         None                      ${response.json()}[whatsapp]
    Should Be Equal As Strings         None                      ${response.json()}[avatar]
    Should Be Equal As Strings         False                     ${response.json()}[is_geek]
    Should Be True                    '${response.json()}[is_geek]' == 'False'

    ${response}             PUT User                  ${token}     ${payload_user}[after]

    Status Should Be        200                       ${response}

    ${response}             GET User                  ${token}

    Should Be Equal As Strings         ${payload_user}[after][name]             ${response.json()}[name]
    Should Be Equal As Strings         ${payload_user}[after][email]            ${response.json()}[email] 
    Should Be Equal As Strings         ${payload_user}[after][whatsapp]         ${response.json()}[whatsapp]
    Should Be Equal As Strings         ${payload_user}[after][avatar]           ${response.json()}[avatar]
    Should Be Equal As Strings         False                     ${response.json()}[is_geek]
    Should Be True                    '${response.json()}[is_geek]' == 'False'
