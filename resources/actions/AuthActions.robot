*** Settings ***
Documentation           Auth actions


*** Keywords ***
Go To Login Page
    Go To       ${BASE_URL}

    Wait For Elements State         css=.login-form      visible     5

Fill Credentials
    [Arguments]     ${user}

    Fill Text       id=email           ${user}[email]
    Fill Text       id=password        ${user}[password]


Submit Login
    Click       css=.submit-button >> text=Entrar

 
User Should See Your Name
    [Arguments]     ${user}

    ${fullName}     Set Variable        ${user}[name] ${user}[lastname]

    # ${element}      Set Variable        id=user 

    ${element}      Set Variable        css=a[href="/profile"]

    Wait For Elements State         ${element}      visible     5

    Get Text        ${element}      contains        ${fullName}


# Field Should Be Type Email
#     [Arguments]     ${alert_message}

#     Wait For Elements State
#     ...                         css=span[class=error] >> text=${alert_message}
#     ...                         visible     5

