*** Settings ***
Documentation           Auth actions



*** Variable ***
${INPUT_EMAIL}      id=email
${INPUT_PASS}       id=password

*** Keywords ***
Go To Login Page
    Go To       ${BASE_URL}

    Wait For Elements State         css=.login-form      visible     5

Fill Credentials
    [Arguments]     ${user}

    Fill Text       ${INPUT_EMAIL}     ${user}[email]
    Fill Text       ${INPUT_PASS}      ${user}[password]


Submit Login
    Click       css=.submit-button >> text=Entrar

 
User Should See Your Name
    [Arguments]     ${user}

    ${fullName}     Set Variable        ${user}[name] ${user}[lastname]

    # ${element}      Set Variable        id=user 

    ${element}      Set Variable        css=a[href="/profile"]

    Wait For Elements State         ${element}      visible     5

    Get Text        ${element}      contains        ${fullName}


Field Should Be Type Email

    Get Property            ${INPUT_EMAIL}        type        equal       email


