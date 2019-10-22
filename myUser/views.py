from django.shortcuts import render,redirect
from miscellaneous import emailsend,myconstants
from authorize import authcheck
from myUser.forms import UserSignupForm,LoginRecordsForm
from myUser.models import UserSignup
from django.core.files.storage import FileSystemStorage
from django.contrib.auth.hashers import make_password,check_password
from authorize import authcheck
import datetime as dt
import re,uuid,socket

# Create your views here.
def base(request):
    return render(request,"base.html")
def usersignup(request):
    if request.method=="POST":
        form = UserSignupForm(request.POST)
        f = form.save(commit=False)
        f.userEmail=request.POST['t3']
        f.userFullName=request.POST['t1']
        f.userPassword = make_password(request.POST['p1'])
        f.userMobile = request.POST['t2']
        f.userState = request.POST['t4']
        otp, time = emailsend.OtpSend()
        email=request.POST['t3']
        f.userOTP =otp
        f.otpTime =time
        token=email[0:5]+request.POST['t2'][4:9]+otp
        token=make_password(token)
        token=token.replace("+","")
        f.userToken = token
        confirmationlink="http://127.0.0.1/verifyuser/?email="+email+"&token="+token
        f.confirmationLink=confirmationlink
        f.isVerified = False
        f.isActive = True
        f.roleId_id= 1
        f.save()
        emailsend.sendemail("Confirmation Link", email, confirmationlink)

    return render(request, "signup.html")


        # otp,time=emailsend.OtpSend()
        # confirmationlink="http://127.0.0.1:8000/verifyuser/?email="+userEmail+"&link="+otp



def verify(request):
    emailid=request.GET['email']
    link=request.GET['token']
    data = UserSignup.objects.get(userEmail=emailid)
    data2 = data.userToken
    print(data2)
    if link == data2:
        updateD = UserSignup(userEmail=emailid,isVerified=True,confirmationLink="")
        updateD.save(update_fields=["isVerified","confirmationLink"])
        output = "Account is verified"
        return render(request,"verification.html",{'d':output})
    else :
        output = "Account verification failed. Either link is incorrect or account expired"
        return render(request, "verification.html", {'d': output})


def login(request):
    global activeid
    if request.method == "POST" :
        email=request.POST["l1"]
        password = request.POST["l2"]
        try :
            data=UserSignup.objects.get(userEmail=email)
            dbpassword = data.userPassword
            auth = check_password(password,dbpassword)
            if auth == True :
                if data.isVerified == True :
                    request.session['Authentication']=True
                    request.session['emailid']=email
                    request.session['roleid']=data.roleId_id
                    records=LoginRecordsForm(request.POST)
                    activeid=request.GET["id"]
                    r=records.save(commit=False)
                    r.loginTime=dt.datetime.now()
                    r.userEmail=email
                    hostname = socket.gethostname()
                    ip = socket.gethostbyname(hostname)
                    r.ipAddress = ip
                    mac = ':'.join(re.findall('..', '%012x' % uuid.getnode()))
                    r.macAddress = mac
                    r.save()
                    if data.roleId_id == 1:
                        return redirect("/manager/home/")
                    elif data.roleId_id == 2 :
                        return redirect("/principal/home")
                    elif data.roleId_id == 3 :
                        return redirect("/teacher/home")

                else :
                    return render(request,"login.html",{'notverified':True})
            else :
                return render(request,"login.html",{'wrongpw':True})
        except :
            return render(request,"login.html",{'wrongem':True})
    return render(request,"login.html")


def error404(request):
    value = request.GET["value"]
    return render(request,"ERROR404.html",{"d":value})


def logout(request):
    id=request.GET["id"]
    email=request.GET["l1"]
    try :
        request.session.pop("Authentication")
        request.session.pop("emailid")
        request.session.pop("roleid")

        records = LoginRecordsForm(request.POST)
        r = records.save(commit=False)
        r.logoutTime = dt.datetime.now()
        r.save()
        return redirect("/login/")
    except :
        return redirect("/login/")

def index(request):
    return render(request,"index.html")

def loginrecords(request):

    form=LoginRecordsForm(request.POST)
    f=form.save(commit=False)
    f.loginTime=dt.datetime.now()
    f.userEmail=request.GET["l1"]
    f.save()

