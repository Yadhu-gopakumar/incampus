from django.contrib import admin
from .models import post_table,comments
# Register your models here.
admin.site.register(post_table)
admin.site.register(comments)
