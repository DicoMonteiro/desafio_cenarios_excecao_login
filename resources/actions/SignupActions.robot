*** Settings ***
Documentation           Signup actions


*** Keywords ***
Go To Signup Form

    # Click       css=a[href$=signup]
    Go To       ${BASE_URL}/signup

    Signup Page Validation


Signup Page Validation

    Wait For Elements State     css=.signup-form      visible     5

    Wait For Elements State
    ...                         xpath=//h1[contains(text(), "Cadastro")]
    ...                         visible     5

    Wait For Elements State     
    ...                         xpath=//span[contains(text(), "Preencha os dados abaixo para começar")]
    ...                         visible     5


Fill Signup Form
    [Arguments]     ${user}

    Fill Text       id=name            ${user}[name]
    Fill Text       id=lastname        ${user}[lastname]
    Fill Text       id=email           ${user}[email]
    Fill Text       id=password        ${user}[password]


Submit Signup Form

    Click       css=.submit-button >> text=Cadastrar

 
User Should See Congratulations
    [Arguments]     ${message_congratulations}      ${message_complement}
    

    Wait For Elements State
    ...                         xpath=//h1[contains(text(), "${message_congratulations}")]
    ...                         visible     5

    Wait For Elements State
    ...                         css=p >> text=${message_complement}
    ...                         visible     5


Alert Span Should Be
    [Arguments]     ${alert_message}

    Wait For Elements State
    ...                         css=span[class=error] >> text=${alert_message}
    ...                         visible     5



# Tela após cadastrar cliente
# botão voltar     xpath=//a[contains(text(), "Voltar")]