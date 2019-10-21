from manager import views
from django.conf.urls import url
from django.conf.urls.static import static
from django.conf import settings

app_name = 'manager'
urlpatterns = [
    url(r'^passwordchange/$',views.passwordchange,name="passch"),
    url(r'^home/$',views.manager),
    url(r'^profile/$',views.managerprofile,name="mprofile"),
    url(r'^addprincipal/$',views.createprincipal,name="addprinci"),
    url(r'^viewprincipal/$', views.viewprincipal, name="viewprincipal"),
    url(r'^createteacher/$',views.createteacher,name="createteacher")
] + static(settings.MEDIA_URL,document_root=settings.MEDIA_ROOT)