
from django.contrib import admin
from django.urls import path,include

import credentials.urls
import student.urls
import faculty.urls
import admin_module.urls

from django.conf.urls.static import static
from django.conf import settings

urlpatterns = [
    path('admin/', admin.site.urls),
    path('credentials/',include(credentials.urls)),
    path('',include(student.urls)),
    path('adminmodule/',include(admin_module.urls)),
    path('faculty',include(faculty.urls)),
    # path('home',include(admin_module.urls)),

]
if settings.DEBUG:
    urlpatterns+=static(settings.STATIC_URL,document_root=settings.STATIC_ROOT)
    urlpatterns+=static(settings.MEDIA_URL,document_root=settings.MEDIA_ROOT)

from django.contrib.staticfiles.urls import staticfiles_urlpatterns
urlpatterns += staticfiles_urlpatterns()