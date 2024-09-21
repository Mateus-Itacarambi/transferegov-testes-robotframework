*** Settings ***
Library     Browser
Library     String
Library     Collections
Library     DateTime
Library     ExcelLibrary

Variables    credentials.py

*** Keywords ***
Tela principal está aberta
    Transfere Gov está aberto

Transfere Gov está aberto
    New Page    https://idp.transferegov.sistema.gov.br/    load
    Set Browser Timeout    5 minutes
    Login
    
Login
    Type Text    input#username    ${USERNAME}
    Type Text    input#password    ${PASSWORD}
    Click    button#form_submit_login
