from django.contrib import admin

# Register your models here.
from myUser.models import UserRole,UserSignup

admin.site.register(UserRole)
admin.site.register(UserSignup)