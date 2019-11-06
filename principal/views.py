from django.shortcuts import render,redirect,HttpResponse
from miscellaneous import emailsend,myconstants
from authorize import authcheck
from django.core.files.storage import FileSystemStorage
from django.contrib.auth.hashers import make_password,check_password
from authorize import authcheck
from myUser.models import UserSignup
from principal.models import Principle
from principal.forms import PrincipleForm
from myUser.forms import UserSignupForm
import datetime as dt


def principal(request):
    try:
        authdata = authcheck.authentication(request.session['Authentication'],request.session['roleid'],myconstants.PRINCIPAL)
        if authdata== True :
            emailid = request.session['emailid']
            data = UserSignup.objects.get(userEmail=emailid)
            data2 = Principle.objects.get(email=emailid)

            return render(request,"principal.html",{'d':data,'p':data2})
        else :
            authinfo,message = authdata
            if message == "Invalid_User":
                return redirect("/error404/?value=2")
            elif message == "not_login" :
                return redirect("/error404/?value=3")
    except:
        return redirect("/error404/?value=1")