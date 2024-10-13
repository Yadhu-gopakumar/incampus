from django.urls import path
from . import views

urlpatterns=[
    path('',views.facultyhome,name='facultyhome'),
    path('fcomment/<int:id>/',views.fcomment,name='fcomment'),
    path('facultyedit/',views.facultyedit,name='facultyedit'),
    path('addcommunity', views.addcommunity,name='addcommunity'),
    path('adddebate/',views.adddebate,name='adddebate'),


    # path('profile/<str:user>/',views.studentprofile,name='studentprofile'),
    # path('deletepost/<int:post_id>/', views.deletepost,name='deletepost'),
    # path('pdeletepost/<int:post_id>/', views.pdeletepost,name='pdeletepost'),
    # path('like/<int:id>/', views.like,name='like'),
    # path('comment/<int:id>/',views.comment,name='comment'),
    # path('deletecomment/<int:id>/',views.deletecomment,name='deletecomment'),
    # path('profile/<int:id>/follow/',views.follow,name='follow'),
    # path('profilelike/<int:user>/like<int:id>/',views.profilelike,name='profilelike'),
]