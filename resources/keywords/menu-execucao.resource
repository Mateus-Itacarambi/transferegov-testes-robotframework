*** Settings ***
Resource    ../common.resource

*** Keywords ***
Menu Execução foi clicado
    Wait For Elements State    //div[@class='button menu'][contains(.,'Execução')]    visible    1 minutes
    Click  //div[@class='button menu'][contains(.,'Execução')]

#SUB MENU CONSULTAR INSTRUMENTOS/PRÉ-INSTRUMENTOS
Clicar em consultar instrumentos/pré-instrumentos
    Wait For Elements State    (//a[contains(.,'Consultar Instrumentos/Pré-Instrumentos')])[1]    visible    1 minutes
    Click  (//a[contains(.,'Consultar Instrumentos/Pré-Instrumentos')])[1]

Informar número instrumento
    [Arguments]    ${convenio}
    Fill Text    input#consultarNumeroConvenio    ${convenio}
    
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
    Wait For Elements State    //h3[contains(.,'Listagem de Anexos')]    visible    1 minutes
    
Capturar quantidade de itens
    ${retorno}=    Get Text    //div[@id="listaAnexos"]
    IF    $retorno == "Nenhum registro foi encontrado."
        ${qtd_anexos}=    Set Variable    0
    ELSE
        Wait For Elements State    //div[@id="listaAnexos"]/span[1]    visible    1 minutes
        ${qtd_anexos}=    Get Text    //div[@id="listaAnexos"]/span[1]
        @{words}=    Split String    ${qtd_anexos}
        ${qtd_anexos}=    Get From List    ${words}    4
        ${qtd_anexos}=    Replace String    ${qtd_anexos}    (    ${EMPTY}
    END
    ${qtd_anexos}=    Convert To Integer    ${qtd_anexos}
    Return From Keyword    ${qtd_anexos}