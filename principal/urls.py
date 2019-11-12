from principal import views
from django.conf.urls import url
from django.conf.urls.static import static
from django.conf import settings
import clerical.views
app_name = 'principal'
urlpatterns = [
    url(r'^home/$',views.principal),
    url(r'^createclerk/',clerical.views.createclerk),
    url(r'^viewclerk/', clerical.views.viewclerk),
    url(r'^deleteclerk/',clerical.views.deleteclerk),

] + static(settings.MEDIA_URL,document_root=settings.MEDIA_ROOT)