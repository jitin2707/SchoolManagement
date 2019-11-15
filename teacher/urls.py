from teacher import views
from django.conf.urls import url
from django.conf.urls.static import static
from django.conf import settings


app_name = 'teacher'
urlpatterns = [
   url(r'^home/$', views.teacher, name="teacher"),
   url(r'^chooseclass/$',views.viewtimetable)

] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)