*** Settings ***
Documentation           BeGeek test suite

Resource            ${EXECDIR}/resources/Base.robot


Test Setup          Start Session
Test Teardown       After Test


*** Test Case ***
Be a Geek
    [Tags]      be_geek     smoke
    
    ${user_geek}      Factory User      be_geek

    Do Login          ${user_geek}

    Go To Geek Form
    Fill Geek Form      ${user_geek}[geek_profile]
    Submit Geek Form
    Geek Form Should Be Success
