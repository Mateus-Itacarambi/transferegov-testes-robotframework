import os
import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
from email.mime.base import MIMEBase
from email import encoders
from openpyxl import load_workbook

# Carregar variáveis de ambiente
EMAIL_SENDER = "transferegovrobot@gmail.com"
EMAIL_PASSWORD = "qsum wntr mlta uegl"

# Verificar se as variáveis de ambiente estão corretamente carregadas
if not EMAIL_SENDER or not EMAIL_PASSWORD:
    raise ValueError("As variáveis de ambiente EMAIL_SENDER e EMAIL_PASSWORD não foram definidas corretamente.")

# Configurações do e-mail
EMAIL_RECEIVER = "letigy78@gmail.com"
SUBJECT = "Excel Table"
BODY = "Please find the attached Excel table."
EXCEL_FILE_PATH = "../docs/monitorar_andamento_de_convenio.xlsx"

# Função para carregar e ler a planilha Excel
def read_excel(file_path):
    workbook = load_workbook(file_path)
    sheet = workbook.active
    # Você pode manipular os dados da planilha aqui
    print(f"Lendo dados da planilha: {sheet.title}")
    workbook.close()

# Função para enviar e-mail com anexo
def send_email_with_attachment():
    msg = MIMEMultipart()
    msg['From'] = EMAIL_SENDER
    msg['To'] = EMAIL_RECEIVER
    msg['Subject'] = SUBJECT
    
    # Corpo do e-mail
    msg.attach(MIMEText(BODY, 'plain'))
    
    # Anexo do Excel
    with open(EXCEL_FILE_PATH, "rb") as attachment:
        part = MIMEBase('application', 'octet-stream')
        part.set_payload(attachment.read())
        encoders.encode_base64(part)
        part.add_header('Content-Disposition', f"attachment; filename={EXCEL_FILE_PATH}")
        msg.attach(part)
    
    # Conexão com o servidor SMTP
    try:
        server = smtplib.SMTP('smtp.gmail.com', 587)
        server.starttls()
        server.login(EMAIL_SENDER, EMAIL_PASSWORD)
        
        # Enviando o e-mail
        text = msg.as_string()
        server.sendmail(EMAIL_SENDER, EMAIL_RECEIVER, text)
        print(f"E-mail enviado para {EMAIL_RECEIVER} com sucesso!")
    
    except Exception as e:
        print(f"Falha ao enviar o e-mail: {e}")
    
    finally:
        server.quit()

if __name__ == "__main__":
    read_excel(EXCEL_FILE_PATH)
    send_email_with_attachment()
