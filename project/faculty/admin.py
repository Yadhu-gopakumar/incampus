from django.contrib import admin
from .models import debate,debate_reply,community_table,f_studymaterials
# Register your models here.

class debate_reply_admin(admin.ModelAdmin):
    list_display=['user','debate_id','faculty','reply','date']  
    def debate_id(self, obj):
        return obj.debate.id
    debate_id.short_description = 'debate_id' 
admin.site.register(debate_reply,debate_reply_admin)

   

class debate_admin(admin.ModelAdmin):
    list_display=['facultyname','topic','department','d_date']   
admin.site.register(debate,debate_admin)


class community_table_admin(admin.ModelAdmin):
    list_display=['department','facultyname','title','comm_post','date']   
admin.site.register(community_table,community_table_admin)


class f_studymaterials_admin(admin.ModelAdmin):
    list_display=['faculty','note','file','department','date']   
admin.site.register(f_studymaterials,f_studymaterials_admin)