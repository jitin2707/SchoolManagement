import smtplib,random,string
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
import

def sendemail(sub,receiver,message):
    msg=MIMEMultipart()
    msg['From']='managementschool36@gmail.com'
    msg['To']=receiver
    msg['Subject']=sub
    msg.attach(MIMEText(message,"Plain"))
    server = smtplib.SMTP('smtp.gmail.com', 587)
    try :
        server.starttls()
        server.login('managementschool36@gmail.com', 'sms#####')
        text = msg.as_string()
        server.sendmail('managementschool36@gmail.com',receiver,text)
        print("Email sent successfully")
        return True
    except smtplib.SMTPResponseException:
       print("Invalid Email")
       return False
    finally:
        server.quit()

sub = 'testing'
receiver = 'truepbx247@gnmail.com'
message = 'Hello'
sendemail(sub,receiver,message)

