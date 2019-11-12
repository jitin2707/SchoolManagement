from django import forms
from teacher.models import TeacherDetail


class TeacherForm(forms.ModelForm):
    class Meta():
        model =TeacherDetail
        exclude =["name","email","gender","qualification","subject","password","dob","doj","dol","address","mobile","status","session","image","last_login_time",
                  "last_login_date","last_logout","role","class_asn"]



