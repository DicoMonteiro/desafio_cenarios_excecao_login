*** Settings ***
Documentation           BeGeek test suite

Resource            ${EXECDIR}/resources/Base.robot


Test Setup          Start Session
Test Teardown       End Session


*** Test Case ***
Be a Geek

    ${user_geek}      Factory User      be_geek

    Do Login          ${user_geek}

    Go To Geek Form
    Fill Geek Form      ${user_geek}[geek_profile]
    Submit Geek Form
    Geek Form Should Be Success


# Short Description
#     [Tags]      attempt_geek

#     ${user_short_desc}      Factory User      short_desc

#     Do Login          ${user_short_desc}

#     Go To Geek Form
#     Fill Geek Form      ${user_short_desc}[geek_profile]
#     Submit Geek Form
#     Alert Span Should Be        A descrição deve ter no minimo 80 caracteres


# Long Description
#     [Tags]      attempt_geek
    
#     ${user_long_desc}      Factory User      long_desc

#     Do Login          ${user_long_desc}

#     Go To Geek Form
#     Fill Geek Form      ${user_long_desc}[geek_profile]
#     Submit Geek Form
#     Alert Span Should Be        A descrição deve ter no máximo 255 caracteres


# COMPLEMENTO DO DESAFIO DO MÓDULO PRO
# Printer Repair is required
#     [Tags]      attempt_geek        printer_repair
    
#     ${user_printer_repair}      Factory User      without_printer_repair

#     Do Login            ${user_printer_repair}

#     Go To Geek Form
#     Fill Geek Form      ${user_printer_repair}[geek_profile]
#     Submit Geek Form
#     Alert Span Should Be        Por favor, informe se você é um Geek Supremo


# Work is required
#     [Tags]      attempt_geek        work
    
#     ${user_work}      Factory User      without_work

#     Do Login            ${user_work}

#     Go To Geek Form
#     Fill Geek Form      ${user_work}[geek_profile]
#     Submit Geek Form
#     Alert Span Should Be        Por favor, selecione o modelo de trabalho