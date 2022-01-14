*** Settings ***
Documentation       Helpers

*** Keywords ***
Get Token
    [Arguments]         ${payload}      ${option}

    ${user_login}           Create Dictionary
    ...                     email=${payload}[email]
    ...                     password=${payload}[password]

    ${response}             POST session            ${user_login}

    ${result}               Set Variable            ${EMPTY}

    # Log To Console          ${response.json()}

    IF      "200" in "${response}"
        ${result}          Set Variable            ${response.json()}[${option}]
    END

    [return]        ${result}

Remove User
    [Arguments]         ${user}

    ${token}            Get Token       ${user}     token
    
    IF      "${token}"
        DELETE user         ${token}
    END
    # ${expected_code}        Convert To Integer      401

    # IF      '${result.status_code}' != ${expected_code}
    #     ${token}                Set Variable            Bearer ${result.json()}[token]
    #     # Log To Console        ${token}
    #     DELETE user             ${token}
    # END

    # IF      "200" in "${result}"
    #     ${token}                Set Variable            Bearer ${result.json()}[token]
    #     DELETE user             ${token}
    # END
    # ${response_delete}      DELETE user             ${user_login}
    # Log To Console          ${response_delete.status_code}
    