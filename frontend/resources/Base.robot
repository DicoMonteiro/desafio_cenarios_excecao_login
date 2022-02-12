*** Settings ***
Documentation           Gerenciador de Libraries e sessões do browser

Library         Browser
Library         Collections
Library         String

Library         factories/massas_dados.py
Library         utils.py

Resource        actions/AuthActions.robot
Resource        actions/SignupActions.robot
Resource        actions/_SharedActions.robot
Resource        actions/GeekActions.robot

Resource        Database.robot
Resource        Helpers.robot
Resource        Services.robot

*** Variable ***
${image_default}            css=img[alt="Getgeeks"]
${message_default}          Conectando quem precisa com quem sabe fazer
${BASE_URL}                 https://getgeeks-adriano.herokuapp.com


*** Keywords ***
Start Session

    # New Browser             chromium    headless=False      slowMo=00:00:00
    New Browser             ${BROWSER}    headless=${HEADLESS}      slowMo=00:00:00
    New Page                ${BASE_URL}
    # Importante alinhar com o PO sobre a resolução média ou minima da tela
    Set Viewport Size       1280    768

After Test
    ${shot_name}            Screenshot Name
    Take Screenshot         fullPage=True       filename=${shot_name}


Home Page Validation
    [Arguments]         ${message_default}

    Get Title       equal       Getgeeks - Encontre um Geek
    
    Wait For Elements State     ${image_default}      visible     5
    Wait For Elements State     
    ...                         xpath=//span[contains(text(), "${message_default}")]
    ...                         visible     5