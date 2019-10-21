from django.db import models
from myUser.models import UserRole
# Create your models here.
class Teacher(models.Model):
    name = models.CharField(max_length=255, default="", null=True)
    email = models.EmailField(max_length=255, default="", primary_key=True)
    gender = models.CharField(max_length=255, default="", null=True)
    qualification = models.CharField(max_length=255, default="", null=True)
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
    otp = models.CharField(max_length=255, default="", null=True)
    otp_date_time = models.CharField(max_length=255, default="", null=True)
    verify_link = models.CharField(max_length=255, default="", null=True)

