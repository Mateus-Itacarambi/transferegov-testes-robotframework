*** Settings ***
Resource       ../resources/keywords/monitoramento.resource

Suite Setup         New Browser    browser=${BROWSER}    headless=${HEADLESS}
Suite Teardown      Close Browser
Test Setup          New Context    viewport={'width': 1600, 'height': 900}
Test Teardown       Close Context

*** Test Cases ***
Consultar Instrumentos/Pré-Instrumentos
    Open Excel Document    docs/monitorar_andamento_de_convenio.xlsx    1
    Given Tela principal está aberta
    ${counter}=    Set Variable    2
    @{value}=    Read Excel Column    1
    FOR    ${element}    IN   @{value}
        Continue For Loop If    '${element}' == 'Convênio'
        When Menu Execução foi clicado
        And Tela de consultar instrumentos/pré-instrumentos está aberta
        And Informar número instrumento    ${element}
        And Clicar em Consultar
        And Clicar sobre o número do instrumento    ${element}
        And Clicar em Plano de Trabalho
        And Clicar em Anexos
        And Clicar em Listar Anexos Execução
        And Tela com listagem de anexos está aberta
        ${qtd_anexos}=    Capturar quantidade de itens
        Inserir quantidade de itens - início    ${counter}    3    ${qtd_anexos}
        ${counter}=    Evaluate    ${counter} + 1
        Log To Console    ${counter}    
        Exit For Loop
    END