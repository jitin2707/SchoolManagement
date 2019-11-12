from django.shortcuts import render,redirect
from miscellaneous import emailsend,myconstants
from myUser.models import UserSignup
from authorize import authcheck

def teacherhome(request):
    return render(request,"teacher.html")

def teacher(request):
    try:
        authdata = authcheck.authentication(request.session['Authentication'],request.session['roleid'],myconstants.TEACHER)
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

