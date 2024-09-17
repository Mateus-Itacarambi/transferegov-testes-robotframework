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
    Given Tela principal está aberta
    And Menu Execução foi clicado, logo após consultar instrumentos/pré-instruemntos foi clicado
   


