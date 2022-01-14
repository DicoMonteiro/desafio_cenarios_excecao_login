*** Settings ***
Documentation         Gerenciador de Libraries e sessões das requisições


Library               RequestsLibrary
Library               factories/massa_dados.py
Resource              Helpers.robot
Resource              routes/SessionsRoute.robot
Resource              routes/UsersRoute.robot
Resource              routes/GeeksRoute.robot

*** Variable ***
${BASE_URI}          https://getgeeks-gateway-adriano.herokuapp.com
${URI_USERS}         https://getgeeks-users-adriano.herokuapp.com
${URI_GEEKS}         https://getgeeks-geeks-adriano.herokuapp.com
