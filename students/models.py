from django.db import models
from myUser.models import UserRole
# Create your models here.

class Student_class(models.Model):
    class_id = models.AutoField(primary_key=True)
    class_name = models.CharField(max_length=255, default="", null=True)
    is_active = models.BooleanField(default=True)
    def __str__(self):
        return self.class_name

class Section(models.Model):
    section_id = models.AutoField(primary_key=True)
    section_name = models.CharField(max_length=255,default="")
    is_active = models.BooleanField(default=True)

class Student(models.Model):
    name = models.CharField(max_length=255, default="", null=True)
    email = models.EmailField(max_length=255, default="",null=True)
    parent_name = models.CharField(max_length=255, default="", null=True)
    parent_email = models.EmailField(max_length=255, default="",null=True)
    gender = models.CharField(max_length=255, default="", null=True)
    admission_year = models.CharField(max_length=255, default="", null=True)
    admission_class = models.CharField(max_length=255, default="", null=True)
    class_id = models.ForeignKey(Student_class, on_delete=models.CASCADE)
    section_id = models.ForeignKey(Section, on_delete=models.CASCADE)
    admission_id = models.AutoField(primary_key=True)
    password = models.CharField(max_length=255, default="", null=True)
    dob = models.CharField(max_length=255, default="", null=True)
    address = models.CharField(max_length=255, default="", null=True)
    mobile = models.CharField(max_length=255, default="", null=True)
    status = models.NullBooleanField(default=True)
    image = models.CharField(max_length=255, default="", null=True)
    last_login_time = models.CharField(max_length=255, default="", null=True)
    last_login_date = models.CharField(max_length=255, default="", null=True)
    last_logout = models.CharField(max_length=255, default="", null=True)
    role = models.ForeignKey(UserRole, on_delete=models.CASCADE)




