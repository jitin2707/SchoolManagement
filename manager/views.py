from django.shortcuts import render,redirect,HttpResponse
from miscellaneous import emailsend,myconstants
from authorize import authcheck
from django.core.files.storage import FileSystemStorage
from django.contrib.auth.hashers import make_password,check_password
from authorize import authcheck
from myUser.models import UserSignup
from manager.forms import PrincipleForm
from myUser.forms import UserSignupForm
import datetime as dt

def passwordchange(request):
    if request.method=="POST":
        oldpassword = request.POST["op"]
        newpassword = request.POST["np"]
        connewpassword = request.POST["cnp"]
        emailid = request.session['emailid']
        data = UserSignup.objects.get(userEmail=emailid)

        auth = check_password(oldpassword, data.userPassword)
        if auth == True :
            if newpassword == connewpassword :
                password = make_password(newpassword)
                updateD = UserSignup(userEmail=emailid, userPassword = password)
                updateD.save(update_fields=["userPassword"])
                return HttpResponse("<h1>Password Change Successful.</h1>")
            else:
                return HttpResponse("<h1>New password and confirm password doesn't match</h1>")
        else :
            return HttpResponse("<h1>Please enter correct old password</h1>")
    return render(request,"passwordchange.html")


def manager(request):
    try:
        authdata = authcheck.authentication(request.session['Authentication'],request.session['roleid'],myconstants.MANAGER)
        if authdata== True :
            emailid = request.session['emailid']
            data = UserSignup.objects.get(userEmail=emailid)
            return render(request,"index.html",{'d':data})
        else :
            authinfo,message = authdata
            if message == "Invalid_User":
                return redirect("/error404/?value=2")
            elif message == "not_login" :
                return redirect("/error404/?value=3")
    except:
        return redirect("/error404/?value=1")

def managerprofile(request):
    emailid = request.session['emailid']
    data = UserSignup.objects.get(userEmail = emailid)
    return render(request,"profile.html",{'d':data})


def createprincipal(request):
    if request.method == "POST":
        form =PrincipleForm(request.POST)
        f = form.save(commit=False)
        try:
            if request.FILES["img1"]:
                my_file = request.FILES["img1"]
                fs = FileSystemStorage()
                file_name = fs.save(my_file.name, my_file)
                img1 = fs.url(file_name)
                img1 = my_file.name
        except:
            pass

        f.name = request.POST["pn"]
        f.email = request.POST["pe"]
        f.gender = make_password(request.POST["pg"])
        f.qualification = request.POST["pq"]
        f.password = make_password(request.POST["pp"])
        f.dob = request.POST["pd"]
        x= str(dt.date.today())
        f.doj = x
        f.address = request.POST["pa"]
        f.mobile = request.POST["pm"]
        # f.status = True

        f.session = request.POST["t3"]
        f.image = img1
        # f.last_login_time = request.POST["t3"]
        # f.last_login_date = request.POST["t3"]
        # f.last_logout = request.POST["t3"]
        otp,y = emailsend.OtpSend()
        f.otp = otp
        f.otp_date_time = y
        email = request.POST["pe"]
        token = email[0:5] + request.POST['t2'][4:9] + otp
        token = make_password(token)
        token = token.replace("+", "")
        f.userToken = token
        confirmationlink = "http://127.0.0.1/verifyuser/?email=" + email + "&token=" + token
        f.verify_link = confirmationlink
        f.role_id = 2
        f.save()
     #to update in common signup database
        form1 = UserSignupForm(request.POST)
        f = form1.save(commit=False)
        f.userFullName= request.POST["pn"]
        f.userEmail = request.POST["pe"]
        f.userPassword = request.POST["pp"]
        f.userMobile = request.POST["pm"]
        f.userState = request.POST["pa"]
        f.userOTP = otp
        f.otpTime = y
        f.userToken = token
        f.isVerified = False
        f.confirmationLink = confirmationlink
        f.isActive = True
        f.roleId_id = 2
        f.save()
        emailsend.sendemail("Confirmation Link", email, confirmationlink)
        return render(request, "signup3.html", {'success': True})
    return render(request, "signup3.html")

