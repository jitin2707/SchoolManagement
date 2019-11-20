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
        data=TimeTable.objects.filter(classid_id=classid,section_id=section,table_day= "Monday")
        data2 = TimeTable.objects.filter(classid_id=classid, section_id=section, table_day="Tuesday")
        data3 = TimeTable.objects.filter(classid_id=classid, section_id=section, table_day="Wednesday")
        data4 = TimeTable.objects.filter(classid_id=classid, section_id=section, table_day="Thursday")
        data5 = TimeTable.objects.filter(classid_id=classid, section_id=section, table_day="Friday")
        # data2=TeacherDetail.objects.get(email=data.teacher_id)
        # print(data2.name)
        for i in data :
            print(i.subject)
            print(i.teacher.name)
            # data2=TeacherDetail.objects.get(email=i.teacher_id)
            # print(data2.name)
        return render(request,"viewtable.html",{'d':data,'t':data2,'w':data3,'th':data4,'f':data5})
    return render(request, "chooseclass.html")

