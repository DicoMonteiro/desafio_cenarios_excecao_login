*** Settings ***
Documentation           Search for Geeks test suite

Resource            ${EXECDIR}/resources/Base.robot


Test Setup          Start Session
Test Teardown       After Test


*** Test Case ***
Search for Alien Geek

    # Criando um Geek
    ${alien}         Factory User        search_alien
    Create Geek Profile Service          ${alien}

    # Logando na aplicação
    ${searcher}         Factory User         searcher
    Do Login            ${searcher}

    # Pesquisando um Geek
    Go To Geeks
    Fill Search Form        Sim         Matricial a fita colorida
    Submit Search Form

    Geek Should Be Found        ${alien}
    Alien Icon Should Be Visible

Search for Common Geek

    # Criando um Geek
    ${common}         Factory User        search_common
    Create Geek Profile Service          ${common}

    # Logando na aplicação
    ${searcher}         Factory User         searcher
    Do Login            ${searcher}

    # Pesquisando um Geek
    Go To Geeks
    Fill Search Form        Não         win 95 ou 97
    Submit Search Form

    Geek Should Be Found        ${common}

Search not found

    ${searcher}         Factory User         searcher
    Do Login            ${searcher}

    Go To Geeks
    Fill Search Form        ${EMPTY}         Tester de Software
    Submit Search Form

    Search Alert Should Be          Não encontramos Geeks com o(s) termo(s) informado na busca!