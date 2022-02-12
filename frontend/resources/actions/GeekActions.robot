*** Settings ***
Documentation           Geek actions




*** Keywords ***
Go To Geek Form

    Click       css=a[href="/be-geek"] >> text=Seja um Geek

    Wait For Elements State     css=.be-geek-form      visible     5

    ${element}      Set Variable        css=strong

    Wait For Elements State         ${element}      visible     5

    Get Text        ${element}      contains        Trabalhe com suporte técnico quando e onde quiser

Go To Geeks
    
    Click       css=a[href="/geeks"] >> text=Geeks

    Wait For Elements State     css=.title strong >> text=Estes são os Geeks disponíveis.
    ...                         visible     5

Fill Geek Form
    [Arguments]         ${geek_profile}

    Reset Geek Form


    Fill Text       id=whatsapp     ${geek_profile}[whatsapp]
    Fill Text       id=desc         ${geek_profile}[desc]

    IF      '${geek_profile}[printer_repair]'
        Select Options By       id=printer_repair       text       ${geek_profile}[printer_repair]
    END

    IF      '${geek_profile}[work]'
        Select Options By       id=work                 text       ${geek_profile}[work]
    END

    # Outra maneira de usar o IF
    # IF      '${geek_profile}[printer_repair]' != '${EMPTY}'
    #     Select Options By       id=printer_repair       text       ${geek_profile}[printer_repair]
    # END

    # IF      '${geek_profile}[work]' != '${EMPTY}'
    #     Select Options By       id=work                 text       ${geek_profile}[work]
    # END

    Fill Text       id=cost         ${geek_profile}[cost]

Fill Search Form
    [Arguments]         ${target_option}       ${target_text}

    IF      '${target_option}'
        Select Options By       id=printer_repair       value        ${target_option}
    END

    IF      '${target_text}'
        Fill Text               id=desc                 ${target_text}
    END



Submit Geek Form

    Click       css=button >> text=Quero ser um Geek

Submit Search Form

    Click       css=button[type="submit"] >> text=Buscar

Geek Form Should Be Success
    Wait For Elements State     css=h1 >> text=Parabéns!        visible     5

    ${expected_message}     Set Variable        Seu cadastro está na nossa lista de geeks. Agora é só ficar de olho no seu WhatsApp.

    Wait For Elements State     css=p >> text=${expected_message}       visible     5


Back To Home GetGeeks
    Click       css=a >> text=Voltar


Reset Geek Form
    # Limpar o formulário antes de uma nova interação
    Execute Javascript          document.getElementsByClassName("be-geek-form")[0].reset();

Geek Should Be Found
    [Arguments]     ${geek}

    ${fullName}          Set Variable        ${geek}[name] ${geek}[lastname]

    ${target_geek}       Get Element         xpath=//strong[contains(text(), "${fullName}")]/../../..

    ${work}              Convert To Lower Case           ${geek}[geek_profile][work]

    Get Text        ${target_geek}       contains        Atendimento ${work}
    Get Text        ${target_geek}       contains        ${geek}[geek_profile][desc]
    Get Text        ${target_geek}       contains        ${geek}[geek_profile][cost]

    Set Suite Variable        ${target_geek}


Alien Icon Should Be Visible
    Get Text        ${target_geek}       contains        👽

Search Alert Should Be
    [Arguments]         ${expect_alert}

    ${element}      Set Variable        css=.search-not-found p

    Wait For Elements State         ${element}      visible     5

    Get Text        ${element}      contains        ${expect_alert}
