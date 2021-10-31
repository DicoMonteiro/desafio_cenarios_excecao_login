*** Settings ***
Documentation           Authorization test suite

Resource            ${EXECDIR}/resources/Base.robot


Test Setup          Start Session
Test Teardown       End Session


*** Test Case ***
User success
    [Tags]      login_success

    ${user_login}       Factory User Login

    Go To Login Page
    Fill Credentials                ${user_login}
    Submit Login
    User Should See Your Name       ${user_login}


User Not Found
    [Tags]      attempt_login       login_with_user_not_found

    ${user}         Create Dictionary       email=adriano_almeida@teste.com.br      password=Teste@1234

    Go To Login Page
    Fill Credentials                ${user}
    Submit Login
    Modal Content Should Be         Usuário e/ou senha inválidos.


Password Invalid
    [Tags]      attempt_login       login_with_password_invalid

    ${user}         Create Dictionary       email=adriano@teste.com.br      password=teste123

    Go To Login Page
    Fill Credentials                ${user}
    Submit Login
    Modal Content Should Be         Usuário e/ou senha inválidos.


Empty Password
    [Tags]      attempt_login       login_without_password

    ${user}         Create Dictionary       email=adriano@teste.com.br      password=${EMPTY}

    Go To Login Page
    Fill Credentials                    ${user}
    Submit Login
    Alert Span Should Be                Senha obrigatória


Empty Email
    [Tags]      attempt_login       login_without_email

    ${user}         Create Dictionary       email=${EMPTY}     password=teste123

    Go To Login Page
    Fill Credentials                    ${user}
    Submit Login
    Alert Span Should Be                E-mail obrigatório


Login Required Fields
    [Tags]      attempt_login       reqf

    @{expected_alerts}          Create List
    ...                         E-mail obrigatório
    ...                         Senha obrigatória

    Go To Login Page
    Submit Login
    Alert Spans Should Be


# Should Be Type Email
#     [Tags]      attempt_login       login_with_email_invalid

#     ${user}         Create Dictionary       email=adriano&teste.com.br      password=teste123

#     Go To Login Page
#     Fill Credentials                    ${user}
#     Submit Login
#     Field Should Be Type Email          Please include an '@' in the email address