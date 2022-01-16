*** Settings ***
Documentation           Geek Required Test Suite

Resource                ${EXECDIR}/resources/Base.robot


Suite Setup          Login Session
Test Template        Geek Without Fill Form

*** Test Case ***
Short Description
    [Template]        Geek Without Fill Form
    short_desc        A descrição deve ter no minimo 80 caracteres

Long Description
    [Template]        Geek Without Fill Form
    long_desc         A descrição deve ter no máximo 255 caracteres

## DESAFIO FINAL DO MÓDULO PRO
Printer Repair is required
    [Template]        Geek Without Fill Form
    without_printer_repair          Por favor, informe se você é um Geek Supremo

Work is required
    [Template]        Geek Without Fill Form
    without_work      Por favor, selecione o modelo de trabalho 

WhatsApp is required
    [Template]        Geek Without Fill Form
    without_whatsapp      O Whatsapp deve ter 11 digitos contando com o DDD 

WhatsApp Only DDD
    [Template]        Geek Without Fill Form
    only_ddd_whatsapp      O Whatsapp deve ter 11 digitos contando com o DDD 

WhatsApp With 10 digits
    [Template]        Geek Without Fill Form
    with_10_digits_whatsapp      O Whatsapp deve ter 11 digitos contando com o DDD 

Description is required
    [Template]        Geek Without Fill Form
    without_desc      Informe a descrição do seu trabalho

Cost is required
    [Template]        Geek Without Fill Form
    without_cost      Valor hora deve ser numérico

Cost contains number and text
    [Template]        Geek Without Fill Form
    with_number_text_cost      Valor hora deve ser numérico

Cost contains text
    [Template]        Geek Without Fill Form
    with_only_text_cost      Valor hora deve ser numérico

Cost contains special characters
    [Template]        Geek Without Fill Form
    with_special_characters_cost      Valor hora deve ser numérico


*** Keywords ***
Login Session

    ${user_geek}        Factory User        be_geek

    Start Session
    Do Login                    ${user_geek}
    Go To Geek Form

Geek Without Fill Form
    [Arguments]       ${type_user}       ${message}

    ${user}           Factory User       ${type_user}

    Fill Geek Form              ${user}[geek_profile]
    Submit Geek Form
    Alert Span Should Be        ${message}

    After Test