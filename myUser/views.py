from django.shortcuts import render
from miscellaneous import emailsend,myconstants
from authorize import authcheck
# Create your views here.
def usersignup(request):
    if request.method=="POST":
        email=request.POST['emialid']
        otp,time=emailsend.OtpSend()
        confirmationlink=" http://127.0.0.1:8000/verifyuser/?email="+email+"&link="+otp

        emailsend.sendemail("COnfirmation Link",email,confirmationlink)

def verify(request):
    emailid=request.GET['email']
    link=request.GET['link']
