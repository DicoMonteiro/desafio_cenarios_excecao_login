*** Settings ***
Documentation           Attempt BeGeek Test Suite

Resource                ${EXECDIR}/resources/Base.robot

Suite Setup          Start Session For Attempt Be Geek
Test Template        Attempt Be a Geek


*** Variable ***
${LONG_DESC}            Seu computador está lento? Talvez seja um vírus, malware ou outras inconsistência no sistema, eu posso resolver, bem como consertar impressoa EPSON e HP. Também instalo, desistalo e configuro aplicativos. Testando o máximo do campo de descrição disponível!!

*** Test Case ***
# Should Not Be a Geek
#     [Template]      Attempt Be a Geek

#     desc                Formato o seu PC        A descrição deve ter no minimo 80 caracteres
#     desc                ${EMPTY}                Informe a descrição do seu trabalho
#     desc                ${LONG_DESC}            A descrição deve ter no máximo 255 caracteres
#     whatsapp            11                      O Whatsapp deve ter 11 digitos contando com o DDD
#     whatsapp            9876555522              O Whatsapp deve ter 11 digitos contando com o DDD
#     whatsapp            ${EMPTY}                O Whatsapp deve ter 11 digitos contando com o DDD
#     printer_repair      ${EMPTY}                Por favor, informe se você é um Geek Supremo
#     work                ${EMPTY}                Por favor, selecione o modelo de trabalho
#     cost                ${EMPTY}                Valor hora deve ser numérico
#     cost                teste113                Valor hora deve ser numérico
#     cost                teste                   Valor hora deve ser numérico
#     cost                123#$%&                 Valor hora deve ser numérico

Short Description                   desc                Formato o seu PC        A descrição deve ter no minimo 80 caracteres
Description is required             desc                ${EMPTY}                Informe a descrição do seu trabalho
Long Description                    desc                ${LONG_DESC}            A descrição deve ter no máximo 255 caracteres
WhatsApp Only DDD                   whatsapp            11                      O Whatsapp deve ter 11 digitos contando com o DDD
WhatsApp With 10 digits             whatsapp            9876555522              O Whatsapp deve ter 11 digitos contando com o DDD
WhatsApp is required                whatsapp            ${EMPTY}                O Whatsapp deve ter 11 digitos contando com o DDD
Printer Repair is required          printer_repair      ${EMPTY}                Por favor, informe se você é um Geek Supremo
Work is required                    work                ${EMPTY}                Por favor, selecione o modelo de trabalho
Cost is required                    cost                ${EMPTY}                Valor hora deve ser numérico
Cost contains number and text       cost                teste113                Valor hora deve ser numérico
Cost contains text                  cost                teste                   Valor hora deve ser numérico
Cost contains special characters    cost                123#$%&                 Valor hora deve ser numérico

*** Keywords ***
Start Session For Attempt Be Geek

    ${user}        Factory User        attempt_be_geek

    Start Session
    Do Login                    ${user}
    Go To Geek Form

Attempt Be a Geek
    [Arguments]     ${key}      ${input_field}      ${out_message}

    ${user}         Factory User        attempt_be_geek

    Set To Dictionary           ${user}[geek_profile]       ${key}      ${input_field}

    Fill Geek Form              ${user}[geek_profile]
    Submit Geek Form
    Alert Span Should Be        ${out_message}

    After Test