from django.db import models
from myUser.models import UserRole
from students.models import Student_class,Section,Student
# Create your models here.
class TeacherDetail(models.Model):
    name = models.CharField(max_length=255, default="", null=True)
    email = models.EmailField(max_length=255, default="", primary_key=True)
    gender = models.CharField(max_length=255, default="", null=True)
    qualification = models.CharField(max_length=255, default="", null=True)
    subject = models.CharField(max_length=255, default="", null=True)
    password = models.CharField(max_length=255, default="", null=True)
    dob = models.CharField(max_length=255, default="", null=True)
    doj = models.CharField(max_length=255, default="", null=True)
    dol = models.CharField(max_length=255, default="", null=True)
    address = models.CharField(max_length=255, default="", null=True)
    mobile = models.CharField(max_length=255, default="", null=True)
    status = models.NullBooleanField(default=True)
    session = models.CharField(max_length=255, default="", null=True)
    image = models.CharField(max_length=255, default="", null=True)
    last_login_time = models.CharField(max_length=255, default="", null=True)
    last_login_date = models.CharField(max_length=255, default="", null=True)
    last_logout = models.CharField(max_length=255, default="", null=True)
    role = models.ForeignKey(UserRole, on_delete=models.CASCADE)
    class_asn = models.ForeignKey(Student_class, on_delete=models.CASCADE)


class TimeTable(models.Model):
    classid= models.ForeignKey(Student_class, on_delete=models.CASCADE)
    section= models.ForeignKey(Section, on_delete=models.CASCADE)
    table_day=models.CharField(max_length=255,default="")
    time_slot=models.CharField(max_length=255,default="")
    subject=models.CharField(max_length=255,default="")
    teacher=models.ForeignKey(TeacherDetail, on_delete=models.CASCADE)

class Attendance(models.Model):
    index = models.AutoField(primary_key=True)
    classid = models.ForeignKey(Student_class, on_delete=models.CASCADE)
    section = models.ForeignKey(Section, on_delete=models.CASCADE)
    student = models.ForeignKey(Student, on_delete=models.CASCADE)
    date=models.CharField(max_length=255,default="",null=True)
    Attendance=models.CharField(max_length=255,default="",null=True)