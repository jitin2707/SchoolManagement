import smtplib,random,string
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
import datetime as dt

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

# sub = 'testing'
# receiver = 'truepbx247@gnmail.com'
# message = 'Hello'
# sendemail(sub,receiver,message)


def OtpSend(length=2):
    letter=string.ascii_letters
    a=random.randint(10000,100000)
    otp = str(a).join(random.choice(letter) for i in range(length))
    x = str( dt.datetime.now() )
    return (otp,x)