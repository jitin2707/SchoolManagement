from manager import views
from django.conf.urls import url
from django.conf.urls.static import static
from django.conf import settings

app_name = 'manager'
urlpatterns = [
    url(r'^passwordchange/$',views.passwordchange,name="passch"),
    url(r'^home/$',views.manager),
    url(r'^profile/$',views.managerprofile,name="mprofile"),
] + static(settings.MEDIA_URL,document_root=settings.MEDIA_ROOT)