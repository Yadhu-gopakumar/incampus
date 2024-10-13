
from django.urls import path,include
from . import views
urlpatterns = [

    path('adminDashboard/',views.adminDashboard,name='adminDashboard'),

]
