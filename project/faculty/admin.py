from django.contrib import admin
from .models import debate,debate_reply,community_table,f_studymaterials
# Register your models here.
admin.site.register(debate_reply)
admin.site.register(debate)
admin.site.register(community_table)
admin.site.register(f_studymaterials)
