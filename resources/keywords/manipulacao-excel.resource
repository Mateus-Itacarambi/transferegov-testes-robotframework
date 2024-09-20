*** Settings ***
Resource    ../common.resource

*** Variables ***
${doc_excel}    ../docs/monitorar_andamento_de_convenio.xlsx

*** Keywords ***
Inserir quantidade de itens - início
    [Arguments]    ${row}    ${value}
    Write Excel Cell    ${row}    3    ${value}
    Save Excel Document    ${doc_excel}

Inserir quantidade de itens - atual
    [Arguments]    ${row}    ${value}
    Write Excel Cell    ${row}    4    ${value}
    Save Excel Document    ${doc_excel}

Inserir situação - início
    [Arguments]    ${row}    ${value}
    Write Excel Cell    ${row}    6    ${value}
    Save Excel Document    ${doc_excel}

Inserir situação - atual
    [Arguments]    ${row}    ${value}
    Write Excel Cell    ${row}    7    ${value}
    Save Excel Document    ${doc_excel}

Inserir Data da Atualização
    [Arguments]    ${row}
    ${date}=    Get Current Date
    ${date}=    Convert Date    ${date}    result_format=%d/%m/%Y
    Write Excel Cell    ${row}    2    ${date}
    Save Excel Document    ${doc_excel}