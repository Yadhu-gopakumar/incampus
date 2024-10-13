from django.urls import path
from . import views

urlpatterns=[
    path('',views.home,name='homepage'),
    path('profile/<str:user>/',views.studentprofile,name='studentprofile'),
    path('studentedit/',views.studentedit,name='studentedit'),
    path('addpost', views.addpost,name='addpost'),
    path('deletepost/<int:post_id>/', views.deletepost,name='deletepost'),
    path('pdeletepost/<int:post_id>/', views.pdeletepost,name='pdeletepost'),
    path('like/<int:id>/', views.like,name='like'),
    path('comment/<int:id>/',views.comment,name='comment'),
    path('deletecomment/<int:id>/',views.deletecomment,name='deletecomment'),
    path('profile/<int:id>/follow/',views.follow,name='follow'),
    path('search/',views.search,name='search'),
    path('profilelike/<int:user>/like<int:id>/',views.profilelike,name='profilelike'),
]