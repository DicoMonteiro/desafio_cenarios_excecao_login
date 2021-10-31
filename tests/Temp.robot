*** Settings ***
Documentation       Temp

Library         Collections


*** Test Case ***
Trabalhando com Listas

    @{avengers}         Create List         Tony Stark      Kamalakhan      Steve Rogers


    Append To List      ${avengers}         Hulk
    Append To List      ${avengers}         Scott Lang


    # Log To Console      ${avengers}[0]
    # Log To Console      ${avengers}[1]
    # Log To Console      ${avengers}[2]
    # Log To Console      ${avengers}[3]

    FOR     ${a}    IN      @{avengers}

        Log To Console      ${a}

    END

    @{avengers2}        Create List         Tony Stark      Miss Marvel     Steve Rogers    Bruce Banner    Scott Lang


    Lists Should Be Equal       ${avengers}     ${avengers2}