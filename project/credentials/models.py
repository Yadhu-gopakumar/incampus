from django.db import models
from django.contrib.auth.models import User
# Create your models here.
class userprofile(models.Model):
    reg_no=models.CharField(max_length=8,blank=False)
    firstname=models.CharField(blank=True,max_length=200)
    lastname=models.CharField(blank=True,max_length=200)
    email=models.EmailField(blank=True)
    profile_pic=models.ImageField(upload_to='profiles',default='profiles/img.jpg')
    followers=models.ManyToManyField(User,blank=True,related_name='followers')        
    following=models.ManyToManyField(User,blank=True,related_name='following')
    gender=models.CharField(max_length=10,blank=True)
    department=models.CharField(max_length=10,blank=True)
    Phone=models.CharField(max_length=15,blank=True)
    dob=models.DateField(blank=True,null=True)
    bio=models.CharField(max_length=200,blank=True)

    def __str__(self) -> str:
        return self.reg_no
    
class facultyprofile(models.Model):
  
    firstname=models.CharField(blank=True,max_length=200)
    lastname=models.CharField(blank=True,max_length=200)
    email=models.EmailField(blank=True)
    profile_pic=models.ImageField(upload_to='profiles',default='profiles/img.jpg')
    department=models.CharField(max_length=10,blank=True)
    Phone=models.CharField(max_length=15,blank=True)

    def __str__(self) -> str:
        return self.email    