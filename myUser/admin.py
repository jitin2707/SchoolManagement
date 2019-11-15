from django.contrib import admin

# Register your models here.
from myUser.models import UserRole,UserSignup
from students.models import Student_class,Section
from teacher.models import TimeTable

admin.site.register(UserRole)
admin.site.register(UserSignup)
admin.site.register(Student_class)
admin.site.register(Section)
admin.site.register(TimeTable)