*** Settings ***
Documentation           Test Helpers


*** Keywords ***
New Register
    [Arguments]         ${user}

    Go To Signup Form
    Fill Signup Form    ${user}
    Submit Signup Form

Add User From Database
    [Arguments]         ${user}

    Connect To Postgres
    Insert User         ${user}
    Disconnect From Database 


Signup With Short Password
    [Arguments]         ${short_password}

    ${user}     Create Dictionary
    ...         name=Adriano                    lastname=Almeida
    ...         email=adriano@teste.com.br      password=${short_password}

    Home Page Validation        ${message_default}

    New Register                ${user}
    Alert Span Should Be        Informe uma senha com pelo menos 6 caracteres


Do Login
    [Arguments]         ${user}

    Go To Login Page
    Fill Credentials                ${user}
    Submit Login
    User Should See Your Name       ${user}



# Trying Signup
#     [Arguments]     ${user}     ${message}

#     Home Page Validation                ${message_default}
#     New Register                        ${user}
#     Alert Span Should Be                ${message}