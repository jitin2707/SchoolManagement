from django import forms
from students.models import Student


class StudentForm(forms.ModelForm):
    class Meta():
        model =Student
        exclude =["name","email","parent_name","parent_email","gender","admission_year","admission_class","class_id",
                  "dob","admission_id","password","address","mobile","status","image","last_login_time",
                  "last_login_date","last_logout","role","section_id"]
