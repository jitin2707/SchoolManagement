from django.shortcuts import render,redirect,HttpResponse
from miscellaneous import emailsend,myconstants
from authorize import authcheck
from django.core.files.storage import FileSystemStorage
from django.contrib.auth.hashers import make_password,check_password
from authorize import authcheck
from myUser.models import UserSignup

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
            return render(request,"manager.html")
        else :
            authinfo,message = authdata
            if message == "Invalid_User":
                return redirect("/unauthorisec_access/")
            elif message == "not_login" :
                return redirect("/error404/")
    except:
        return redirect("/error404/")


