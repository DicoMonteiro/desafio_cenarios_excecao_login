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
    