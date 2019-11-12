from django import forms
from principal.models import Principle

class PrincipleForm(forms.ModelForm):
    class Meta():
        model =Principle
        exclude =["name","email","gender","qualification","password",
                  "dob","doj","dol","address","mobile","status","session","image","last_login_time",
                  "last_login_date","last_logout","role","otp","otp_date_time","verify_link"]


