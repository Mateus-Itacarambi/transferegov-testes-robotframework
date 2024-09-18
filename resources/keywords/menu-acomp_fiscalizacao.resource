*** Settings ***
Resource    ../common.resource

*** Keywords ***
Menu Acomp. e Fiscalização foi clicado 
    Click  //div[@class='button menu'][contains(.,'Acomp. e Fiscalização')]

#SUB MENU ESCLARECIMENTOS
Clicar em esclarecimentos
    Click  (//a[contains(.,'Esclarecimentos')])[1]
    
Capturar situação
    ${qtdPages}=    Get Text    //div[@id="esclarecimentos"]/span[1]
    @{words}=    Split String    ${qtdPages}
    ${qtdPages}=    Get From List    ${words}    3
    IF    $qtdPages != "1"
        Sleep    300ms
        Click    //span[@class="pagelinks"][2]/a[contains(text(), "${qtdPages}")]
        Wait For Load State    load
    END
    ${qtdLinhas}=    Get Element Count    //tbody[@id="tbodyrow"]/tr
    ${element}=    Get Table Cell Element    //table[@id="row"]    5    ${qtdLinhas}
    ${situacao}=    Get Text    ${element}
    Return From Keyword    ${situacao}