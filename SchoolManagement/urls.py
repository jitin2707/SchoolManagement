"""SchoolManagement URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path

from myUser import views
from django.conf.urls import url,include
from django.conf import settings
from django.conf.urls.static import static





urlpatterns = [
    url(r'^$',views.base),
    url(r'^',include('social_django.urls',namespace="social")),
    url(r'^admin/', admin.site.urls),
    url(r'^signup/$',views.usersignup),
    url(r'^verifyuser/$',views.verify),
    url(r'^login/$',views.login),
    url(r'^manager/',include('manager.urls')),
    url(r'^principal/',include('principal.urls')),
    url(r'^teacher/', include('teacher.urls')),
    url(r'^clerical/', include('clerical.urls')),
    url(r'^student/', include('students.urls')),
    url(r'^error404/$',views.error404),
    url(r'^logout/$',views.logout),
] + static(settings.MEDIA_URL,document_root=settings.MEDIA_ROOT)
