from django import forms
from myUser.models import UserSignup,UserRole

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