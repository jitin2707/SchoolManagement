from clerical import views
from django.conf.urls import url
from django.conf.urls.static import static
from django.conf import settings

app_name = 'clerical'
urlpatterns = [
    url(r'^home/$', views.clerk),
    url(r'^createclerk/$', views.createclerk, name="addclerk"),
    url(r'^viewclerk/$', views.viewclerk, name="viewclerk"),
    url(r'^updateclerk/$', views.updateclerk, name="updateclerk"),
    url(r'^deleteclerk/$', views.deleteclerk, name="deleteclerk")

] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)