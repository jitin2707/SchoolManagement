from django.db import models

# Create your models here.
class UserRole(models.Model):
    roleId=models.AutoField(primary_key=True)
    roleName=models.CharField(max_length=200,default="")
    isActive=models.BooleanField(default=True)

