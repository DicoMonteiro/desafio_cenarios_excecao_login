*** Settings ***
Documentation           Suite de testes para verificar e validar o cadastro de usuários/clientes

Resource            ${EXECDIR}/resources/Base.robot


Test Setup          Start Session
Test Teardown       After Test


*** Test Case ***
Register New User
    [Tags]      new_user        smoke

    ${user}                     Factory User        faker

    Home Page Validation        ${message_default}

    Go To Signup Form
    Fill Signup Form            ${user}
    Submit Signup Form
    User Should See Congratulations           Parabéns!       Agora você faz parte da Getgeeks. Tenha uma ótima experiência.


Try Register New User With Email Duplicate
    [Tags]      attempt_signup      duplicate

    ${user}                     Factory User        faker

    Home Page Validation        ${message_default}

    Add User From Database      ${user}
    New Register                ${user}
    Modal Content Should Be                Já temos um usuário com o e-mail informado.



Register New User With Email Invalid
    [Tags]      attempt_signup

    ${user}                     Factory User        wrong_email

    Home Page Validation        ${message_default}

    New Register                ${user}
    Alert Span Should Be        O email está estranho


Signup Required Fields
    [Tags]      attempt_signup      reqf

    @{expected_alerts}          Create List
    ...                         Cadê o seu nome?
    ...                         E o sobrenome?
    ...                         O email é importante também!
    ...                         Agora só falta a senha!

    Home Page Validation        ${message_default}

    Go To Signup Form
    Submit Signup Form
    Alert Spans Should Be       ${expected_alerts}
    


Short Password
    [Tags]          attempt_signup      short_password
    [Template]      Signup With Short password 
    1
    12
    123
    1234
    12345
    a
    a2
    ab3
    ab3c
    a23bc
    -1
    acb#1

# Executando os campos obrigatorios preenchendo os outros campos
# Register New User Without Name
#     ${user}             Factory Without Name
#     ${message}          Set Variable       Cadê o seu nome?

#     Trying Signup            ${user}        ${message}


# Register New User Without Lastname
#     ${user}        Factory Without Lastname
#     ${message}     Set Variable       E o sobrenome?

#     Trying Signup            ${user}        ${message}


# Register New User Without Email
#     ${user}        Factory Without Email
#     ${message}     Set Variable       O email é importante também!

#     Trying Signup            ${user}        ${message}


# Register New User Without Password
#     ${user}        Factory Without Password
#     ${message}     Set Variable       Agora só falta a senha!

#     Trying Signup            ${user}        ${message}
