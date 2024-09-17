*** Settings ***
Library    Browser
Library    ExcelLibrary.py

*** Keywords ***
Teste
    New Browser    browser=chromium    headless=False
    New Page    https://idp.transferegov.sistema.gov.br/idp/
    Type Text    input#username    07769701198
    Type Text    input#password    @93805624Ya
    Click    button#form_submit_login
    Sleep    5s

*** Test Cases ***
TESTE
    #Teste
    Open Excel Document    docs/monitorar_andamento_de_convenio.xlsx    1
    ${test}    Read Excel Cell    2    1
    Log To Console    ${test}