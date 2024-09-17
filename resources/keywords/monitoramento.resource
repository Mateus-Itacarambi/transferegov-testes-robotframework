*** Settings ***
Library    Browser
Resource   ../login.resource
Resource  ../variables/monitoramento.robot

*** Keywords ***

Tela principal está aberta
    Transfere Gov está aberto
    Menu Execução foi clicado, logo após consultar instrumentos/pré-instruemntos foi clicado

Menu Execução foi clicado, logo após consultar instrumentos/pré-instruemntos foi clicado
    Click  //div[@class='button menu'][contains(.,'Execução')]
    Click  ${Instrumentos/pre}


