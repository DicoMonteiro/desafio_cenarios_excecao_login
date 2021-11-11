*** Settings ***
Documentation           Geek Required Test Suite

Resource            ${EXECDIR}/resources/Base.robot


Suite Setup          Geek Without Fill Form
Test Teardown        End Session


*** Variable ***
${WHATSAPP}     id=whatsapp
${DESC}         id=desc
${COST}         id=cost

*** Test Case ***
## DESAFIO FINAL DO MÓDULO PRO
WhatsApp Is Required
    [Tags]      geek_required
    Clear Text      ${WHATSAPP}
    Submit Geek Form
    Alert Span Should Be        O Whatsapp deve ter 11 digitos contando com o DDD

WhatsApp Only DDD
    [Tags]      geek_required
    Fill Text       ${WHATSAPP}     11
    Submit Geek Form
    Alert Span Should Be        O Whatsapp deve ter 11 digitos contando com o DDD

WhatsApp With 10 digits
    [Tags]      geek_required
    Fill Text       ${WHATSAPP}     1188888888
    Submit Geek Form
    Alert Span Should Be        O Whatsapp deve ter 11 digitos contando com o DDD

Description is required
    [Tags]      geek_required
    Fill Text       ${WHATSAPP}     11888888889
    Clear Text      ${DESC}
    Submit Geek Form
    Alert Span Should Be        Informe a descrição do seu trabalho

Cost is required
    [Tags]      geek_required
    Fill Text       ${DESC}     Seu computador está lento? Talvez seja um vírus, malware ou outras inconsistência no sistema, eu posso resolver, bem como consertar impressoa EPSON e HP. Também instalo, desistalo e configuro aplicativos.
    Clear Text      ${COST}
    Submit Geek Form
    Alert Span Should Be        Valor hora deve ser numérico

Cost contains number and text
    [Tags]      geek_required
    Fill Text       ${COST}       teste12
    Submit Geek Form
    Alert Span Should Be        Valor hora deve ser numérico

Cost contains text
    [Tags]      geek_required
    Fill Text       ${COST}       teste
    Submit Geek Form
    Alert Span Should Be        Valor hora deve ser numérico

Cost contains special characters
    [Tags]      geek_required
    Fill Text       ${COST}       12#$%%&!
    Submit Geek Form
    Alert Span Should Be        Valor hora deve ser numérico


*** Keywords ***
Geek Without Fill Form

    ${user_geek}      Factory User      be_geek

    Start Session
    Do Login            ${user_geek}
    Go To Geek Form
    Fill Geek Form      ${user_geek}[geek_profile]