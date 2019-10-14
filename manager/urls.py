from manager import views
from django.conf.urls import url

app_name = 'manager'
urlpatterns = [
    url(r'^passwordchange/$',views.passwordchange,name="passch"),
    url(r'^home/$',views.manager),
    url(r'^profile/$',views.managerprofile,name="mprofile"),
]