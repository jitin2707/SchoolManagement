from django.shortcuts import render,redirect,HttpResponse
from miscellaneous import emailsend,myconstants
from authorize import authcheck
from django.core.files.storage import FileSystemStorage
from django.contrib.auth.hashers import make_password,check_password
from authorize import authcheck
from myUser.models import UserSignup
from principal.models import Principle
from teacher.models import TeacherDetail
from manager.forms import PrincipleForm
from teacher.forms import TeacherForm
from myUser.forms import UserSignupForm
import datetime as dt

def passwordchange(request):
    emailid = request.session['emailid']
    data = UserSignup.objects.get(userEmail=emailid)
    if request.method=="POST":
        oldpassword = request.POST["op"]
        newpassword = request.POST["np"]
        connewpassword = request.POST["cnp"]
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
    return render(request,"passwordchange.html",{'d':data})


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
    pridata = Principle.objects.all()
    if len(pridata) != 0 :
        checkactive = 0
        for i in pridata :
            print(i.status)
            if i.status == 1:
                checkactive = checkactive + 1
        if checkactive != 0 :
            return render(request,"CreatePrinci.html",{'d':True})

    elif request.method == "POST":
        form = PrincipleForm(request.POST)
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
        f.gender = request.POST["pg"]
        f.qualification = request.POST["pq"]
        f.password = make_password(request.POST["pp"])
        f.dob = request.POST["pd"]
        x= str(dt.date.today())
        f.doj = x
        f.address = request.POST["pa"]
        f.mobile = request.POST["pm"]
        # f.status = True
        otp, y = emailsend.OtpSend()
        year =y[0:4]
        nextyr =int(year)+1
        session = str(year) + "-" + str(nextyr)
        f.session = session
        f.image = img1
        # f.last_login_time = request.POST["t3"]
        # f.last_login_date = request.POST["t3"]
        # f.last_logout = request.POST["t3"]
        f.otp = otp
        f.otp_date_time = y
        email = request.POST["pe"]
        token = email[0:5] + request.POST['pm'][4:9] + otp
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
        f.userPassword = make_password(request.POST["pp"])
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
        return render(request, "CreatePrinci.html", {'success': True})
    return render(request, "CreatePrinci.html")

def viewprincipal(request):
    data = Principle.objects.all()
    return render(request,"viewprincipal.html",{'d': data})


def createteacher(request):
    if request.method == "POST":
        form=TeacherForm(request.POST)
        f=form.save(commit=False)
        timage=None
        try:
            if request.FILES["timage"]:
                my_file = request.FILES["timage"]
                fs = FileSystemStorage()
                file_name = fs.save(my_file.name, my_file)
                timage = fs.url(file_name)
                timage= my_file.name
        except:
            pass
        f.name = request.POST["tname"]
        f.email = request.POST["temail"]
        f.gender = request.POST["tgender"]
        f.subject = request.POST["tsubject"]
        f.qualification = request.POST["tqualification"]
        f.password = request.POST["tpassword"]
        f.dob = request.POST["tdob"]
        f.doj = str(dt.date.today())
        f.dol = request.POST["tdol"]
        f.address = request.POST["taddress"]
        f.mobile = request.POST["tmobile"]
        currentYear=dt.date.today()
        s=currentYear.year
        f.session = s
        f.image = timage
        # f.last_login_time =
        # f.last_login_date =
        # f.last_logout =
        f.role_id = 3
        otp ,y = emailsend.OtpSend()
        f.otp=otp
        f.otp_date_time = y
        email = request.POST["temail"]
        token = email[0:5] + request.POST['tmobile'][4:9] + otp
        token = make_password(token)
        token = token.replace("+", "")
        f.userToken = token
        confirmationlink = "http://127.0.0.1/verifyuser/?email=" + email + "&token=" + token
        f.verify_link =confirmationlink
        f.isActive = True
        f.save()
        # to update in common signup database
        form1 = UserSignupForm(request.POST)
        f = form1.save(commit=False)
        f.userFullName = request.POST["tname"]
        f.userEmail = request.POST["temail"]
        f.userPassword = make_password(request.POST["tpassword"])
        f.userMobile = request.POST["tmobile"]
        f.userState = request.POST["taddress"]
        f.userOTP = otp
        f.otpTime = y
        f.userToken = token
        f.isVerified = False
        f.confirmationLink = confirmationlink
        f.isActive = True
        f.roleId_id = 2
        f.save()
        emailsend.sendemail("Confirmation Link", email, confirmationlink)
        return render(request,"createteacher.html",{'success':True})
    return render(request,"createteacher.html")

def viewteacher(request):
    data=TeacherDetail.objects.all()

    return render(request,"viewteacher.html",{'d': data})

def updateteacher(request):
    email=request.GET["id"]
    data = TeacherDetail.objects.get(email=email)
    if request.method == "POST":
        timage=request.FILES["timage"]
        form=TeacherForm(request.POST)
        img=timage
        try:
            if request.FILES["timage"]:
                my_file = request.FILES["timage"]
                fs = FileSystemStorage()
                file_name = fs.save(my_file.name, my_file)
                img = fs.url(file_name)
                img = my_file
        except:
            pass
        name = request.POST["tname"]
        email = email
        gender = request.POST["tgender"]
        qualifiaction = request.POST["tqualification"]
        password = make_password(request.POST["tpassword"])
        dob = request.POST["tdob"]
        doj = request.POST["tdoj"]
        dol = request.POST["tdol"]
        address = request.POST["taddress"]
        mobile = request.POST["taddress"]
        session = request.POST["tsession"]
        image = img
        updatedata = TeacherDetail(email=email,name=name,gender=gender,qualifiaction=qualifiaction,
                             password=password,dob=dob,doj=doj,dol=dol, address=address,mbile=mobile,session=session,image=image)
        updatedata.save(update_fields=["name","gender","qualification","password","dob","doj","dol","address", "mobile","image"])
        return redirect('/manager/viewteacher')
    return render(request,"updateteacher.html",{'d':data})


def deleteteacher(request):
    email=request.GET["id"]
    data=TeacherDetail.objects.get(email=email)
    data.delete()
    return redirect('/manager/viewteacher')





