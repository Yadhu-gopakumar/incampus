from django.db import models

# Create your models here.
class feedbacktable(models.Model):
    feedbackdate=models.DateTimeField(auto_now_add=True)
    f_user=models.CharField(max_length=100,blank=False)
    firstname=models.CharField(max_length=100,blank=False)
    lastname=models.CharField(max_length=100,blank=False)
    email=models.CharField(max_length=100,blank=False)
    feedback=models.TextField(max_length=300,blank=False)
    admin_reply=models.TextField(max_length=300,null=True)
  

