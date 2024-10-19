from django.contrib import admin
from .models import userprofile,facultyprofile


class userprofile_admin(admin.ModelAdmin):
    list_display=['reg_no','firstname','lastname','email','department','Phone']   
admin.site.register(userprofile,userprofile_admin)

class facultyprofile_admin(admin.ModelAdmin):
    list_display=['email','firstname','lastname','department','Phone']   
admin.site.register(facultyprofile,facultyprofile_admin)
