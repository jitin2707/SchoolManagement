from django import forms
from myUser.models import UserSignup,UserRole,LoginRecords

class UserSignupForm(forms.ModelForm):
    class Meta():
        model = UserSignup
        exclude = ["roleId",
                   "userFullName",
                   "userEmail",
                   "userPassword",
                   "userMobile",
                   "userState",
                   "userOTP",
                   "otpTime",
                   "confirmationLink",
                   "isVerified",
                   "userToken",
                   "isActive"
                   ]

class LoginRecordsForm(forms.ModelForm):
    class Meta():
        model = LoginRecords
        exclude = [
                   "id",
                   "loginTime",
                   "logoutTime",
                   "userEmail",
                   "ipAddress",
                   "macAddress"
                   ]