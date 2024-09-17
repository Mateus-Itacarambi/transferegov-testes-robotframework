*** Settings ***
Library    Browser
Library    ExcelLibrary.py

Resource       ../resources/keywords/monitoramento.resource


Suite Setup         New Browser    browser=${BROWSER}    headless=${HEADLESS}
Suite Teardown      Close Browser
Test Setup          New Context    viewport={'width': 1600, 'height': 900}
Test Teardown       Close Context

*** Test Cases ***
Consultar Instrumentos/Pré-Instrumentos
    Open Excel Document    docs/monitorar_andamento_de_convenio.xlsx    1    
   @{value}=    Read Excel Column    1
      Log To Console   Valores lidos da coluna: ${value}
    FOR    ${element}    IN   @{value}
        Continue For Loop If    '${element}' == 'Convênio' 
        Given Tela principal está aberta
        When Menu Execução foi clicado
        And Tela de consultar instrumentos/pré-instrumentos está aberta
        And Informar número instrumento    ${element}
        And Clicar em Consultar
        And Clicar sobre o número do instrumento
        And Clicar em Plano de Trabalho
        And Clicar em Anexos
        And Clicar em Listar Anexos Execução
        Then Tela com listagem de anexos está aberta
        Close Browser    
    END
#Resolver o por que do loop nao estar funcionando