import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
def sendemail(sender,receiver,message):
    msg=MIMEMultipart()
    msg['From']=sender
    msg['To']=receiver
    msg['Subject']='Test mail'
    msg.attach(MIMEText(message,"Plain"))
    server = smtplib.SMTP('smtp.gmail.com', 587)
    server.starttls()
    try :
        server.login('managementschool36@gmail.com', 'sms#####')
        text = msg.as_string()
        server.sendmail('managementschool36@gmail.com','050ankita@gmail.com',text)
        print("Email sent successfully")
        server.quit()
        return True
    except smtplib.SMTPException:
       print("Invalid Email")
       return False
sender = 'managementschool36@gmail.com'
receiver = '050ankita@gmail.com'
message = 'Hello'
sendemail(sender,receiver,message)