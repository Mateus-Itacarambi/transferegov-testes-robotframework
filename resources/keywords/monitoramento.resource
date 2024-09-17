*** Settings ***
Library    Browser
Resource   ../login.resource
Resource   ../variables/monitoramento.robot

*** Keywords ***
Tela principal está aberta
    Transfere Gov está aberto
    Menu Execução foi clicado
    Tela de consultar instrumentos/pré-instrumentos está aberta

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
    Click    //a[@href='/voluntarias/ConsultarProposta/ResultadoDaConsultaDeConvenioSelecionarConvenio.do?idConvenio=681504&destino=']
    
Clicar em Plano de Trabalho
    Click    (//span[contains(.,'Plano de Trabalho')])[2]

Clicar em Anexos
    Click    (//span[contains(.,'Anexos')])[2]

Clicar em Listar Anexos Execução
    Click    //input[contains(@name,'listarAnexosGenericosAnexosExibirAnexosExecucaoForm')]

Tela com listagem de anexos está aberta
    Wait For Elements State    //h3[contains(.,'Listagem de Anexos')]