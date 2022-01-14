*** Settings ***
Documentation           Session route test suite

Resource            ${EXECDIR}/resources/Base.robot


*** Variable ***
&{inv_pass}               email=adriano.almeida@teste.com        password=pwd123
&{inv_email}              email=adriano.almeida&teste.com        password=Teste@1234
&{user_not_found}         email=adriano.almeida@teste0101.com    password=Teste@1234
&{required_email}         email=${EMPTY}                         password=pwd123
&{required_pass}          email=adriano.almeida@teste.com        password=${EMPTY}
&{without_email}          password=pwd123
&{without_pass}           email=adriano.almeida@teste.com


*** Test Case ***
User session
    # Criar um usuário
    # ${payload_user}         Create Dictionary       email=adriano.almeida@teste.com     name=Adriano Almeida    password=Teste@1234
    ${payload_user}           Factory User Session    signup
    POST User    ${payload_user}

    # ${payload_session}      Create Dictionary       email=adriano.almeida@teste.com     password=Teste@1234
    # ${headers}      Create Dictionary       Content-Type=application/json
    ${payload_session}        Factory User Session    login

    ${response}     POST session        ${payload_session}

    Status Should Be        200                 ${response}

    ${size}                 Get Length          ${response.json()}[token]
    ${expected_size}        Convert To Integer      140

    Should Be Equal         ${expected_size}    ${size}
    Should Be Equal         10d                 ${response.json()}[expires_in]

    # Log To Console      ${response.json()}[token]
    # Log To Console      ${size}

Should Not Get Token
    [Template]      Attempt POST session

    ${inv_pass}         401     Unauthorized
    ${inv_email}        400     Incorrect email
    ${user_not_found}   401     Unauthorized
    ${required_email}   400     Required email
    ${required_pass}    400     Required pass
    ${without_email}    400     Required email
    ${without_pass}     400     Required pass

*** Keywords ***
Attempt POST session
    [Arguments]     ${payload}      ${status_code}      ${error_message}

    ${response}     POST session        ${payload}

    Status Should Be        ${status_code}                 ${response}

    Should Be Equal         ${error_message}               ${response.json()}[error]