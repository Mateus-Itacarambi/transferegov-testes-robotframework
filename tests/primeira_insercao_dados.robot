*** Settings ***
Resource       ../resources/keywords/menu-execucao.resource
Resource       ../resources/keywords/menu-acomp_fiscalizacao.resource
Resource       ../resources/keywords/manipulacao-excel.resource

#SE QUISER VISUALIZAR O NAVEGADOR - ALTERAR O HEADLESS PARA False
Suite Setup         New Browser    browser=chromium    headless=True
Suite Teardown      Close Browser
Test Setup          New Context    viewport={'width': 1600, 'height': 900}
Test Teardown       Close Context

*** Test Cases ***
#PRIMEIRA INSERÇÃO DE DADOS
Monitoramento Andamento de Convênio
    Open Excel Document    ${doc_excel}    1
    Tela principal está aberta
    ${counter}=    Set Variable    2
    @{value}=    Read Excel Column    1
    FOR    ${element}    IN   @{value}
        Exit For Loop If    '${element}' == 'None'
        Continue For Loop If    '${element}' == 'Convênio'
        Menu Execução foi clicado
        Clicar em consultar instrumentos/pré-instrumentos
        Informar número instrumento    ${element}
        Clicar em Consultar
        Clicar sobre o número do instrumento    ${element}
        Clicar em Plano de Trabalho
        Clicar em Anexos
        Clicar em Listar Anexos Execução
        Tela com listagem de anexos está aberta
        ${qtd_anexos}=    Capturar quantidade de itens
        Inserir quantidade de itens - início    ${counter}    ${qtd_anexos}
        Inserir quantidade de itens - atual    ${counter}    ${qtd_anexos}
        Menu Acomp. e Fiscalização foi clicado
        Clicar em esclarecimentos
        ${situacao}=    Capturar situação
        Inserir situação - início    ${counter}    ${situacao}
        Inserir situação - atual    ${counter}    ${situacao}
        Inserir Data da Atualização    ${counter}
        ${counter}=    Evaluate    ${counter} + 1
    END
    Close Current Excel Document
