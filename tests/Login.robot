*** Settings ***
Documentation           Authorization test suite

Resource            ${EXECDIR}/resources/Base.robot


Test Setup          Start Session
Test Teardown       End Session


*** Test Case ***
User success
    [Tags]      login_success

    ${user_login}       Factory User        user_login

    Go To Login Page
    Fill Credentials                ${user_login}
    Submit Login
    User Should See Your Name       ${user_login}


User Not Found
    [Tags]          attempt_login       user_404

    ${user}         Create Dictionary       email=adriano_almeida@404.com.br      password=Teste@1234

    Go To Login Page
    Fill Credentials                ${user}
    Submit Login
    Modal Content Should Be         Usuário e/ou senha inválidos.


Password Invalid
    [Tags]          attempt_login       i_pass

    ${user}         Create Dictionary       email=adriano@teste.com.br      password=teste123

    Go To Login Page
    Fill Credentials                ${user}
    Submit Login
    Modal Content Should Be         Usuário e/ou senha inválidos.


Incorret Email
    [Tags]          attempt_login       i_email

    ${user}         Create Dictionary       email=adriano&hotmail.com.br      password=teste123

    Go To Login Page
    Fill Credentials                    ${user}
    Submit Login
    Field Should Be Type Email


## DESAFIO 1 DO MÓDULO PRO

Empty Password
    [Tags]          attempt_login       challenge       login_without_password

    ${user}         Create Dictionary       email=adriano@teste.com.br      password=${EMPTY}

    Go To Login Page
    Fill Credentials                    ${user}
    Submit Login
    Alert Span Should Be                Senha obrigatória


Empty Email
    [Tags]          attempt_login       challenge       login_without_email

    ${user}         Create Dictionary       email=${EMPTY}     password=teste123

    Go To Login Page
    Fill Credentials                    ${user}
    Submit Login
    Alert Span Should Be                E-mail obrigatório


Login Required Fields
    [Tags]      attempt_login       challenge       reqf

    @{expected_alerts}          Create List
    ...                         E-mail obrigatório
    ...                         Senha obrigatória

    Go To Login Page
    Submit Login
    Alert Spans Should Be       ${expected_alerts}


Incomplete Email
    [Tags]          attempt_login       challenge       email_incomplete

    ${user}         Create Dictionary       email=adriano@teste      password=teste123

    Go To Login Page
    Fill Credentials                    ${user}
    Submit Login
    Alert Span Should Be                email must be a valid email

