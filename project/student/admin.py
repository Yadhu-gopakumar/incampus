from django.contrib import admin
from .models import post_table,comments
# Register your models here.

class post_table_admin(admin.ModelAdmin):
    list_display = ['user', 'post', 'upload_date', 'likes_count']

    def likes_count(self, obj):
        return obj.likes.count()
    likes_count.short_description = 'Likes'
admin.site.register(post_table,post_table_admin)



class comments_admin(admin.ModelAdmin):
    list_display=['post_id','user','comment','date'] 
    def post_id(self, obj):
        return obj.id
    post_id.short_description = 'post_id'  
admin.site.register(comments,comments_admin)