
from django.urls import path
from . import views
urlpatterns = [

    path('studentlogin/',views.studentlogin,name='studentlogin'),
    path('studentreg/',views.studentreg,name='studentreg'),
    path('studentlogout/',views.studentlogout,name='studentlogout'),

    path('facultylogin/',views.facultylogin,name='facultylogin'),
    path('facultyreg/',views.facultyreg,name='facultyreg'),
    path('facultylogout/',views.facultylogout,name='facultylogout'),


]
