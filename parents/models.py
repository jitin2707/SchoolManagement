from django.db import models
from myUser.models import UserRole
# Create your models here.


class Parents(models.Model):
    name = models.CharField(max_length=255, default="", null=True)
    email = models.EmailField(max_length=255,default="",primary_key=True)
    password = models.CharField(max_length=255, default="", null=True)
    address = models.CharField(max_length=255, default="", null=True)
    mobile = models.CharField(max_length=255, default="", null=True)
    is_active = models.NullBooleanField(default=True)
    image = models.CharField(max_length=255, default="", null=True)
    last_login_time = models.CharField(max_length=255, default="", null=True)
    last_login_date = models.CharField(max_length=255, default="", null=True)
    last_logout = models.CharField(max_length=255, default="", null=True)
    role = models.ForeignKey(UserRole, on_delete=models.CASCADE)

