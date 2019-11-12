from django.shortcuts import render
# Create your views here.
from django.shortcuts import render, redirect
from miscellaneous import emailsend, myconstants
from myUser.models import UserSignup
from myUser.forms import UserSignupForm
from django.core.files.storage import FileSystemStorage
from django.contrib.auth.hashers import make_password, check_password
from authorize import authcheck
from clerical.models import Clerk
from clerical.forms import ClerkForm
import datetime as dt


# Create your views here.
def clerk(request):
    return render(request, "clerk.html")


def clerk(request):
    try:
        authdata = authcheck.authentication(request.session['Authentication'], request.session['roleid'],
                                            myconstants.CLERK)
        if authdata == True:
            emailid = request.session['emailid']
            data = UserSignup.objects.get(userEmail=emailid)
            return render(request, "teacher.html", {'d': data})
        else:
            authinfo, message = authdata
            if message == "Invalid_User":
                return redirect("/error404/?value=2")
            elif message == "not_login":
                return redirect("/error404/?value=3")
    except:
        return redirect("/error404/?value=1")


def createclerk(request):
    if request.method == "POST":
        form = ClerkForm(request.POST)
        f = form.save(commit=False)
        cimage = None
        try:
            if request.FILES["cimage"]:
                my_file = request.FILES["cimage"]
                fs = FileSystemStorage()
                file_name = fs.save(my_file.name, my_file)
                cimage = fs.url(file_name)
                cimage = my_file.name
        except:
            pass
        f.name = request.POST["cname"]
        f.email = request.POST["cemail"]
        f.gender = request.POST["cgender"]
        f.subject = request.POST["csubject"]
        f.qualification = request.POST["cqualification"]
        f.password = request.POST["cpassword"]
        f.dob = request.POST["cdob"]
        f.doj = str(dt.date.today())
        f.address = request.POST["caddress"]
        f.mobile = request.POST["cmobile"]
        currentYear = dt.date.today()
        s = currentYear.year
        f.session = s
        f.image = cimage
        # f.last_login_time =
        # f.last_login_date =
        # f.last_logout =
        f.role_id = 4
        otp, y = emailsend.OtpSend()
        f.otp = otp
        f.otp_date_time = y
        email = request.POST["cemail"]
        token = email[0:5] + request.POST['cmobile'][4:9] + otp
        token = make_password(token)
        token = token.replace("+", "")
        f.userToken = token
        confirmationlink = "http://127.0.0.1/verifyuser/?email=" + email + "&token=" + token
        f.verify_link = confirmationlink
        f.isActive = True
        f.save()
        # to update in common signup database
        form1 = UserSignupForm(request.POST)
        f = form1.save(commit=False)
        f.userFullName = request.POST["cname"]
        f.userEmail = request.POST["cemail"]
        f.userPassword = make_password(request.POST["cpassword"])
        f.userMobile = request.POST["cmobile"]
        f.userState = request.POST["caddress"]
        f.userOTP = otp
        f.otpTime = y
        f.userToken = token
        f.isVerified = False
        f.confirmationLink = confirmationlink
        f.isActive = True
        f.roleId_id = 4
        f.save()
        emailsend.sendemail("Confirmation Link", email, confirmationlink)
        return render(request, "createclerk.html", {'success': True})
    return render(request, "createclerk.html")


def viewclerk(request):
    data = Clerk.objects.all()
    return render(request, "viewclerk.html", {'d': data})

def updateclerk(request):
    email=request.GET["id"]
    data = Clerk.objects.get(email=email)
    if request.method == "POST":
        cimage=request.FILES["cimage"]
        form=ClerkForm(request.POST)
        img=cimage
        try:
            if request.FILES["cimage"]:
                my_file = request.FILES["cimage"]
                fs = FileSystemStorage()
                file_name = fs.save(my_file.name, my_file)
                img = fs.url(file_name)
                img = my_file
        except:
            pass
        name = request.POST["cname"]
        email = email
        gender = request.POST["cgender"]
        qualifiaction = request.POST["cqualification"]
        password = make_password(request.POST["cpassword"])
        dob = request.POST["cdob"]
        doj = request.POST["cdoj"]
        dol = request.POST["cdol"]
        address = request.POST["caddress"]
        mobile = request.POST["caddress"]
        session = request.POST["csession"]
        image = img
        updatedata = Clerk(email=email,name=name,gender=gender,qualifiaction=qualifiaction,
                             password=password,dob=dob,doj=doj,dol=dol, address=address,mbile=mobile,session=session,image=image)
        updatedata.save(update_fields=["name","gender","qualification","password","dob","doj","dol","address", "mobile","image"])
        return redirect('/manager/viewclerk')
    return render(request,"updateclerk.html",{'d':data})


def deleteclerk(request):
    email=request.GET["id"]
    data=Clerk.objects.get(email=email)
    data.delete()
    return redirect('/manager/viewclerk')





