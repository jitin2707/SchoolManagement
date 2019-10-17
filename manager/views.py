from django.shortcuts import render,redirect,HttpResponse
from miscellaneous import emailsend,myconstants
from authorize import authcheck
from django.core.files.storage import FileSystemStorage
from django.contrib.auth.hashers import make_password,check_password
from authorize import authcheck
from myUser.models import UserSignup
from manager.forms import PrincipleForm
from myUser.forms import UserSignupForm

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
        f.qualification = request.POST["t3"]
        f.password = request.POST["pp"]
        f.dob = request.POST["pd"]
        f.doj = request.POST["t3"]
        f.address = request.POST["t3"]
        f.mobile = request.POST["t3"]
        f.status = request.POST["t3"]
        f.session = request.POST["t3"]
        f.image = request.POST["t3"]
        f.last_login_time = request.POST["t3"]
        f.last_login_date = request.POST["t3"]
        f.last_logout = request.POST["t3"]
        f.otp = request.POST["t3"]
        f.otp_date_time = request.POST["t3"]
        f.verify_link = request.POST["t3"]
        f.role_id = 2
        f.save()
        form1 = UserSignupForm(request.POST)
        f = form1.save(commit=False)
        f.userFullName= request.POST["t3"]
        f.userEmail = request.POST["t3"]
        f.userPassword = request.POST["t3"]
        f.userMobile = request.POST["t3"]
        f.userState = request.POST["t3"]
        f.userOTP = request.POST["t3"]
        f.otpTime = request.POST["t3"]
        f.userToken = request.POST["t3"]
        f.isVerified = request.POST["t3"]
        f.confirmationLink = request.POST["t3"]
        f.isActive = request.POST["t3"]
        f.roleId_id = 1
        return render(request, "signup3.html", {'success': True})
    return render(request, "signup3.html")

