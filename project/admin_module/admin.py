from django.contrib import admin
from .models import feedbacktable
# Register your models here.
class feedbacktable_admin(admin.ModelAdmin):
    list_display=['f_user','firstname','lastname','email','feedback','feedbackdate','admin_reply']   
admin.site.register(feedbacktable,feedbacktable_admin)