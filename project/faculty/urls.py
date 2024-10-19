from django.urls import path
from . import views

urlpatterns=[
    path('',views.facultyhome,name='facultyhome'),
    path('fcomment/<int:id>/',views.fcomment,name='fcomment'),
    path('facultyedit/',views.facultyedit,name='facultyedit'),
    path('addcommunity', views.addcommunity,name='addcommunity'),
    path('adddebate/',views.adddebate,name='adddebate'),
    path('feedbacks/',views.feedbacks,name="feedbacks"),
    path('debatespage/',views.debatespage,name="debatespage"),
    path('communitypage/',views.communitypage,name="communitypage"),
    path('studymaterials/',views.studymaterialsview,name='studymaterials'),
    path('deletenote/<int:id>/', views.deletenote,name='deletenote'),
    path('viewdebate/<int:id>/', views.viewdebate,name='viewdebate'),
    # path('comment/<int:id>/',views.comment,name='comment'),
    path('deletecommunity/<int:id>/',views.deletecommunity,name='deletecommunity'),
    path('deletedebate/<int:id>/',views.deletedebate,name='deletedebate'),
    path('deletedebatereply/<int:id>/',views.deletedebatereply,name='deletedebatereply'),

    # path('profilelike/<int:user>/like<int:id>/',views.profilelike,name='profilelike'),
]