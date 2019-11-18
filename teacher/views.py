from django.shortcuts import render,redirect
from miscellaneous import emailsend,myconstants
from myUser.models import UserSignup
from authorize import authcheck
from teacher.models import TeacherDetail,TimeTable
import datetime as dt

def teacherhome(request):
    return render(request,"teacher.html")

def teacher(request):
    try:
        authdata = authcheck.authentication(request.session['Authentication'],request.session['roleid'],myconstants.TEACHER)
        if authdata== True :
            emailid = request.session['emailid']
            data = UserSignup.objects.get(userEmail=emailid)
            data2 = TeacherDetail.objects.get(email=emailid)
            print(data2)
            return render(request,"teacher.html",{'d':data,'p':data2,'t':'Teacher'})
        else :
            authinfo,message = authdata
            if message == "Invalid_User":
                return redirect("/error404/?value=2")
            elif message == "not_login" :
                return redirect("/error404/?value=3")
    except:
        return redirect("/error404/?value=1")




def viewtimetable(request):
    if request.method=="POST":
        classid = request.POST["id_class"]
        section = request.POST["id_section"]
        print("class is " + classid)
        print("section is " + section)
        data=TimeTable.objects.get(classid_id=classid,section_id=section,time_slot="9:00 - 9:45",table_day= "Monday")
        data2=TeacherDetail.objects.get(email=data.teacher_id)
        print(data2.name)
    return render(request, "chooseclass.html")

def viewtimetable(request):
    return render(request,"viewtable.html")