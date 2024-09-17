# Testes do Transferegov com RobotFramework

Projeto de testes do SDJ utilizando [RobotFramework](https://idp.transferegov.sistema.gov.br/idp/).

## Procedimento para instalação
1. Pré-requisito
  * Python ^3 (caso necessário, isole o ambiente do projeto com [venv](https://docs.python.org/pt-br/3/library/venv.html))
  * Node.js ^18

2. Instale as dependências

    `pip install -r requirements.txt`

3. Inicialize a biblioteca do Browser:

    `rfbrowser init`

## Configuração da IDE

Recomenda-se utilizar o VS Code e instalar a extensão **Robot Framework Language Server**

## Executando o projeto

Antes de executar os testes é necessário configurar as credencias de acesso ao SDJ. Crie o arquivo `credentials.py` na pasta `resources` definindo estas variáveis. Substitua os valores pelas suas credenciais.
```python
USERNAME='*******'
PASSWORD='*******'
```
>OBS: O arquivo `resources/credentials.py` não deve ser commitado. Ele já está adicionado ao `.gitignore`
