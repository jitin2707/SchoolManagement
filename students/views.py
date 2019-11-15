from django.shortcuts import render,redirect,HttpResponse
from miscellaneous import emailsend,myconstants
from authorize import authcheck
from django.core.files.storage import FileSystemStorage
from django.contrib.auth.hashers import make_password,check_password
from students.forms import StudentForm
from myUser.forms import UserSignupForm
from parents.forms import ParentForm
from students.models import Student,Student_class
import datetime as dt


def createStudent(request):
    if request.method == "POST":
        form=StudentForm(request.POST)
        f=form.save(commit=False)
        simage = None
        try:
            if request.FILES["simage"]:
                my_file = request.FILES["simage"]
                fs = FileSystemStorage()
                file_name = fs.save(my_file.name, my_file)
                simage = fs.url(file_name)
                simage= my_file.name
        except:
            pass
        f.name = request.POST["sname"]
        f.email = request.POST["semail"]
        f.gender = request.POST["sgender"]
        f.admission_year = request.POST["sadmission_year"]
        f.admission_class = request.POST["sadmission_class"]
        f.password = request.POST["spassword"]
        f.dob = request.POST["sdob"]
        f.address = request.POST["saddress"]
        f.mobile = request.POST["smobile"]
        f.image = simage
        f.role_id = 5
        f.status = True
        f.class_id_id = request.POST["sclass_id"]
        f.section_id_id =request.POST["ssection_id"]
        f.parent_email =request.POST["sparent_email"]
        f.parent_name =request.POST["sparent_name"]
        otp ,y = emailsend.OtpSend()
        email = request.POST["semail"]
        token = email[0:5] + request.POST['smobile'][4:9] + otp
        token = make_password(token)
        token = token.replace("+", "")
        confirmationlink = "http://127.0.0.1/verifyuser/?email=" + email + "&token=" + token
        f.save()

        #to update in parent table
        pemail = request.POST["sparent_email"]
        data =Student.objects.get(parent_email=pemail)
        form3 = ParentForm(request.POST)
        f = form3.save(commit=False)
        f.name = request.POST["sparent_name"]
        f.email = pemail
        f.password = request.POST["spassword"]
        f.address = request.POST["saddress"]
        f.mobile = request.POST["smobile"]
        f.student_id_id = data.admission_id
        f.is_active = True

        f.role_id = 6
        f.save()

        # to update student in common signup database
        form1 = UserSignupForm(request.POST)
        f = form1.save(commit=False)
        f.userFullName = request.POST["sname"]
        f.userEmail = request.POST["semail"]
        f.userPassword = make_password(request.POST["spassword"])
        f.userMobile = request.POST["smobile"]
        f.userState = request.POST["saddress"]
        f.userOTP = otp
        f.otpTime = y
        f.userToken = token
        f.isVerified = False
        f.confirmationLink = confirmationlink
        f.isActive = True
        f.roleId_id = 5
        f.save()
        emailsend.sendemail("Confirmation Link", email, confirmationlink)

        # to update parent in common signup database
        form2 = UserSignupForm(request.POST)
        f = form2.save(commit=False)
        f.userFullName = request.POST["sparent_name"]
        parente = request.POST["sparent_email"]
        f.userEmail = parente
        f.userPassword = make_password(request.POST["spassword"])
        f.userMobile = request.POST["smobile"]
        f.userState = request.POST["saddress"]
        f.userOTP = otp
        f.otpTime = y
        f.userToken = token
        f.isVerified = False
        f.confirmationLink = confirmationlink
        f.isActive = True
        f.roleId_id = 6
        f.save()
        emailsend.sendemail("Confirmation Link", parente, confirmationlink)
        return render(request, "createstudentparent.html", {'success': True})
    return render(request,"createstudentparent.html")


def viewstudent(request):
    data = Student.objects.all()
    return render(request, "viewstudent.html", {'d': data})


def updatestudent(request):
    email = request.GET["id"]
    data = Student.objects.get(email=email)
    if request.method == "POST":
        simage = request.FILES["simage"]
        form = StudentForm(request.POST)
        img = simage
        try:
            if request.FILES["simage"]:
                my_file = request.FILES["simage"]
                fs = FileSystemStorage()
                file_name = fs.save(my_file.name, my_file)
                img = fs.url(file_name)
                img = my_file
        except:
            pass
        name = request.POST["sname"]
        email = email
        gender = request.POST["sgender"]
        admission_year = request.POST["sadmission_year"]
        admission_class = request.POST["sadmission_class"]
        password = make_password(request.POST["spassword"])
        dob = request.POST["sdob"]
        section_id_id = request.POST["ssection_id"]
        address = request.POST["saddress"]
        mobile = request.POST["smobile"]
        image = img
        updatedata = Student(email=email, name=name, gender=gender, admission_class=admission_class,admission_year=admission_year,
                           password=password, dob=dob, section_id_id=section_id_id,address=address, mbile=mobile,
                           image=image)
        updatedata.save(
            update_fields=["name", "gender", "admission_class", "password", "dob", "admission_year", "dol", "address", "mobile",
                           "section_id_id","image"])
        return redirect('/students/viestudent')
    return render(request, "updatestudent.html", {'d': data})


