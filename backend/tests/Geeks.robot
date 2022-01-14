*** Settings ***
Documentation           Geeks route test suite

Resource            ${EXECDIR}/resources/Base.robot



*** Test Case ***
Be a geek
    [Tags]          be_geek

    ${payload_user}         Factory User Geek

    Remove user             ${payload_user}[login]

    POST User               ${payload_user}[signup]

    ${token}                Get Token                 ${payload_user}[login]       token

    ${response}             POST Geek                 ${token}      ${payload_user}[geek]

    Status Should Be        201                       ${response}

    ${response}             GET User                  ${token}

    ${user_id}              Set Variable              ${response.json()}[id]

    Should Be True          ${user_id} > 0

    ${expected_cost}        Convert To Number         ${payload_user}[geek][cost]
    ${resp_cost}            Convert To Number         ${response.json()}[cost]

    Should Be Equal As Strings         ${payload_user}[geek][whatsapp]          ${response.json()}[whatsapp]
    Should Be Equal As Strings         ${payload_user}[geek][desc]              ${response.json()}[desc]
    Should Be Equal As Strings         ${payload_user}[geek][printer_repair]    ${response.json()}[printer_repair]
    Should Be Equal As Strings         ${payload_user}[geek][work]              ${response.json()}[work]
    Should Be Equal                    ${expected_cost}                         ${resp_cost}
    Should Be Equal As Strings         True                                     ${response.json()}[is_geek]
    Should Be True                    '${response.json()}[is_geek]' == 'True'


Get Geeks List
    [Tags]          get_geek

    # ${payload_user}         Factory Get Geek

    # Remove user             ${payload_user}[login]

    # POST User               ${payload_user}[signup]

    # ${token}                Get Token                 ${payload_user}[login]       token

    # POST Geek               ${token}                  ${payload_user}[geek]

    # ${response}             GET Geek                  ${token}

    # Status Should Be        200                       ${response}

    # Log                     ${response.json()}[Geeks]

    # ${total}                Get Length          ${response.json()}[Geeks]

    # Log                     ${total}

    # Should Be True          ${total} > 0

    ${data}     Factory Search For Geeks

    FOR   ${geek}   IN    @{data}[geeks]
        POST User   ${geek}
        ${token}    Get Token       ${geek}     token
        POST Geek  ${token}   ${geek}[geek_profile]
    END
      
    POST User   ${data}[user]

    ${token}    Get Token    ${data}[user]      token

    ${response}             GET Geek    ${token}
    Status Should Be        200         ${response}

    ${total}            Get Length      ${response.json()}[Geeks]
    Should Be True      ${total} > 0
