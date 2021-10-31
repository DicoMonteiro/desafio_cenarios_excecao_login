*** Settings ***
Documentation           Sharing actions


*** Keywords ***
Alert Spans Should Be
    [Arguments]     ${expected_alerts}

    @{got_alterts}      Create List

    ${spans}            Get Elements        css=span[class=error]


    FOR  ${span}    IN      @{spans}

        ${text}             Get Text            ${span}
        Append To List      ${got_alterts}      ${text} 

    END

    # Comparando as listas de mensagens que recebe de parametro com o que trouxe dos spans
    Lists Should Be Equal       ${expected_alerts}        ${got_alterts}

    
Modal Content Should Be
    [Arguments]         ${expected_text}

    ${title}        Set Variable          css=.swal2-title

    ${message}      Set Variable          css=.swal2-html-container

    Wait For Elements State     ${title}       visible     5
    Get Text        ${title}        equal       Oops...

    Wait For Elements State     ${message}      visible     5

    Get Text        ${message}      equal       ${expected_text}


# Alert Message Should Be
#     [Arguments]         ${message}

#     Wait For Elements State         xpath=//h2[contains(text(), "Oops..")]      visible     5

#     Wait For Elements State
#     ...                             xpath=//div[contains(text(), "${message}")]
#     ...                             visible     5