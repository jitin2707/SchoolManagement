from django import forms
from parents.models import Parents


class ParentForm(forms.ModelForm):
    class Meta():
        model =Parents
        exclude =["name","email","password","address","mobile","is_active","image","last_login_time",
                  "last_login_date","last_logout","role"]



