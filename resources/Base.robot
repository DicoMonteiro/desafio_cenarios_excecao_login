*** Settings ***
Documentation           Gerenciador de Libraries e sessões do browser

Library         Browser
Library         Collections
Library         factories/massas_dados.py

Resource        actions/AuthActions.robot
Resource        actions/SignupActions.robot
Resource        actions/_SharedActions.robot
Resource        actions/GeekActions.robot
Resource        Database.robot
Resource        Helpers.robot

*** Variable ***
${image_default}            css=img[alt="Getgeeks"]
${message_default}          Conectando quem precisa com quem sabe fazer
${BASE_URL}                 https://getgeeks-adriano.herokuapp.com


*** Keywords ***
Start Session

    New Browser     chromium    headless=False      slowMo=00:00:00
    New Page        ${BASE_URL}
    

End Session

    Take Screenshot         fullPage=True


Home Page Validation
    [Arguments]         ${message_default}

    Get Title       equal       Getgeeks - Encontre um Geek
    
    Wait For Elements State     ${image_default}      visible     5
    Wait For Elements State     
    ...                         xpath=//span[contains(text(), "${message_default}")]
    ...                         visible     5