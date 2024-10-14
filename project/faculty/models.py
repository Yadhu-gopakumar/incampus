from typing import Any
from django.db import models
from credentials.models import facultyprofile,userprofile
# Create your models here.
class community_table(models.Model):
    facultyname=models.TextField(max_length=30,blank=False)
    date=models.DateTimeField(auto_now_add=True)
    title=models.CharField(max_length=200,blank=False)
    comm_post=models.TextField(blank=False)
    department=models.CharField(max_length=50,blank=False)
    
class debate(models.Model):
    facultyname=models.TextField(max_length=30,blank=False)
    topic=models.TextField(blank=False)
    d_date=models.DateTimeField(auto_now_add=True)
    department=models.CharField(max_length=50,blank=False)


class debate_reply(models.Model):
    debate=models.ForeignKey(debate,on_delete=models.CASCADE,blank=False)
    user=models.ForeignKey(userprofile,on_delete=models.CASCADE,blank=False) 
    faculty=models.ForeignKey(facultyprofile,on_delete=models.CASCADE,blank=False)    
    reply=models.TextField(blank=False)
    date=models.DateTimeField(auto_now_add=True)



class f_studymaterials(models.Model):
    faculty=models.ForeignKey(facultyprofile,on_delete=models.CASCADE,blank=False)
    note=models.TextField(blank=False)
    file=models.FileField(upload_to='studymaterials/',blank=False)
    date=models.DateTimeField(auto_now_add=True,blank=False)
    department=models.CharField(max_length=50,blank=False)