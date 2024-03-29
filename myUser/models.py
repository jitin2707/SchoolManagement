from django.db import models


# Create your models here.
class UserRole(models.Model):
    roleId=models.AutoField(primary_key=True)
    roleName=models.CharField(max_length=200,default="")
    isActive=models.BooleanField(default=True)

    def __str__(self):
        return self.roleName

class UserSignup(models.Model):
    roleId=models.ForeignKey(UserRole,on_delete=models.CASCADE)
    userFullName=models.CharField(max_length=200,default="")
    userEmail=models.CharField(primary_key=True,max_length=200,default="")
    userPassword=models.CharField(max_length=200,default="")
    userMobile=models.BigIntegerField()
    userState=models.CharField(max_length=200,default="")
    userOTP = models.CharField(max_length=200,default="")
    otpTime = models.CharField(max_length=200,default="")
    userToken = models.CharField(max_length=2000,default="")
    confirmationLink = models.CharField(max_length=2000,default="")
    isVerified=models.BooleanField(default=False)
    isActive=models.BooleanField(default=True)





class LoginRecords(models.Model):
    id = models.AutoField(primary_key=True)
    loginTime =models.CharField(max_length=255,default="",null=True)
    logoutTime = models.CharField(max_length=255,default="",null=True)
    userEmail = models.CharField(max_length=255,default="",null=True)
    ipAddress = models.CharField(max_length=255,default="",null=True)
    macAddress = models.CharField(max_length=255,default="",null=True)




