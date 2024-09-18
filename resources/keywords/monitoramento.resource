*** Settings ***
Library    Browser
Library    Collections
Resource   ../login.resource
Resource   ../variables/monitoramento.robot

*** Keywords ***
Tela principal está aberta
    Transfere Gov está aberto

Menu Execução foi clicado 
    Click  //div[@class='button menu'][contains(.,'Execução')]

Tela de consultar instrumentos/pré-instrumentos está aberta
    Click  ${Instrumentos/pre}

Informar número instrumento
    [Arguments]    ${convenio}
    Fill Text    id=consultarNumeroConvenio    ${convenio}

Clicar em Consultar
    Click   (//input[@value='Consultar'])[1]

Clicar sobre o número do instrumento
    [Arguments]    ${n_covenio}
    Click    //div[@id="instrumentoId"]/a[contains(text(), "${n_covenio}")]
    
Clicar em Plano de Trabalho
    Click    (//span[contains(.,'Plano de Trabalho')])[2]

Clicar em Anexos
    Click    (//span[contains(.,'Anexos')])[2]

Clicar em Listar Anexos Execução
    Click    //input[contains(@name,'listarAnexosGenericosAnexosExibirAnexosExecucaoForm')]

Tela com listagem de anexos está aberta
    Wait For Elements State    //h3[contains(.,'Listagem de Anexos')]

Capturar quantidade de itens
    ${qtd_anexos}=    Get Text    //div[@id="listaAnexos"]/span[1]
    @{words}=    Split String    ${qtd_anexos}
    ${qtd_anexos}=    Get From List    ${words}    4
    ${qtd_anexos}=    Replace String    ${qtd_anexos}    (    ${EMPTY}
    Return From Keyword    ${qtd_anexos}

Inserir quantidade de itens - início
    [Arguments]    ${row}    ${col}    ${value}
    Write Excel Cell    ${row}    ${col}    ${value}
    Save Excel Document    docs/monitorar_andamento_de_convenio.xlsx