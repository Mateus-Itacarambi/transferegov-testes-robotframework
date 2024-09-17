*** Settings ***
Library     Browser
Library     String
Library     DateTime
Library     OperatingSystem
Library    ExcelLibrary.py

Resource  ../resources/variables/monitoramento.robot


*** Keywords ***
Transfere Gov está aberto
    New Page    https://idp.transferegov.sistema.gov.br/idp/
    Login
    

Login
    Type Text    input#username    ${USERNAME}
    Type Text    input#password    ${PASSWORD}
    Click    button#form_submit_login
   


