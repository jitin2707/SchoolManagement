from students import views
from django.conf.urls import url
from django.conf.urls.static import static
from django.conf import settings

app_name = 'students'
urlpatterns = [
#     url(r'^home/$', views.student),
    url(r'^createstudentparent/$', views.createStudent, name="addstudentparent"),
    url(r'^viewstudent/$', views.viewstudent, name="viewstudent"),
    url(r'^updatestudent/$', views.updatestudent, name="updatestudent"),


] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)