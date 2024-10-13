# # class debate(models.Model):
# #     facultyname=models.CharField(max_length=100,blank=False)
# #     topic=models.TextField(blank=False)
# #     department=models.CharField(max_length=50,blank=False)
# #     d_date=models.DateTimeField(auto_now_add=True,blank=False)

# # class debate_reply(models.Model):
# #     debate=models.ForeignKey(debate,on_delete=models.CASCADE,blank=False)
# #     user=models.ForeignKey(userprofile,on_delete=models.CASCADE,blank=False) 
# #     faculty=models.ForeignKey(facultyprofile,on_delete=models.CASCADE,blank=False)    
# #     reply=models.TextField(blank=False)
# #     date=models.DateTimeField(auto_now_add=True)

# # class stydymaterials(models.Model):
# #     faculty=models.ForeignKey(facultyprofile,on_delete=models.CASCADE,blank=False)
# #     file=models.FileField(upload_to='studymaterials/',blank=False)
# #     date=models.DateTimeField(auto_now_add=True,blank=False)
# #     department=models.CharField(max_length=50,blank=False)

# # faculty models

# class debate(models.Model):
#     facultyname=models.CharField(max_length=100,blank=False)
#     topic=models.TextField(blank=False)
#     department=models.CharField(max_length=50,blank=False)
#     d_date=models.DateTimeField(auto_now_add=True,blank=False)

# class debate_reply(models.Model):
#     debate=models.ForeignKey(debate,on_delete=models.CASCADE,blank=False)
#     user=models.ForeignKey(userprofile,on_delete=models.CASCADE,blank=False) 
#     faculty=models.ForeignKey(facultyprofile,on_delete=models.CASCADE,blank=False)    
#     reply=models.TextField(blank=False)
#     date=models.DateTimeField(auto_now_add=True)

# # class stydymaterials(models.Model):
# #     faculty=models.ForeignKey(facultyprofile,on_delete=models.CASCADE,blank=False)
# #     file=models.FileField(upload_to='studymaterials/',blank=False)
# #     date=models.DateTimeField(auto_now_add=True,blank=False)
# #     department=models.CharField(max_length=50,blank=False)