"""StudentEnrollment URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.2/topics/http/urls/
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
from django.conf import settings
from django.conf.urls.static import static
from django.urls import path

from base.views import(

    dashboard,
    req2,
    req3,
    req4,
    req5,
    req6,
    req7,
    registerPage,
    loginPage,
    logoutUser,
)

urlpatterns = [
    path('register/', registerPage, name="register"),
    path('login/', loginPage, name="login"),
    path('logout/', logoutUser, name="logout"),

    path('admin/', admin.site.urls),
    path('', dashboard, name='home'),
    path('req2/', req2, name='req2'),
    path('req3/', req3, name='req3'),
    path('req4/', req4, name='req4'),
    path('req5/', req5, name='req5'),
    path('req6/', req6, name='req6'),
    path('req7/', req7, name='req7'),
    #path('input/', inputPage, name='input'),
    # path('input/', simple_upload, name='upload')
]

if settings.DEBUG:
    urlpatterns+=static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
    urlpatterns+=static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
    
