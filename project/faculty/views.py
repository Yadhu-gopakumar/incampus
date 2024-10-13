from django.http import JsonResponse
from django.shortcuts import render,redirect
from credentials.models import facultyprofile
from .form import facultyprofileform
from student.models import post_table,comments
from .models import community_table,debate

from django.contrib.auth.decorators import login_required
# Create your views here.
@login_required(login_url='facultylogin')
def facultyhome(request):
    posts=post_table.objects.all()
    userh=facultyprofile.objects.get(email=request.user.username)
    
    return render(request,'facultyhome.html',{'data':userh,'posts':posts,'isfaculty':True})

def facultyedit(request):
   
    userh=facultyprofile.objects.get(email=request.user.username)

    form = facultyprofileform(request.POST or None, request.FILES or None, instance=userh)
    if request.method == "POST": 
        if form.is_valid():
            form.save()
            print("updated")
                    
    
    return render(request,'facultyedit.html',{'pform':form,'data':userh})

def fcomment(request,id):
    post=post_table.objects.get(id=id)
    currentuser=facultyprofile.objects.get(email=request.user.username)
    postcomments=comments.objects.filter(post=post)
    print(currentuser)
    context={
            'comments':postcomments,
            'userprofile':currentuser,
            'posts':post,
    }
    

    return render(request,'fcomments.html',context) 


def addcommunity(request):
    pass

def adddebate(request):
    posts=post_table.objects.all()
    userh=facultyprofile.objects.get(email=request.user.username)
    
    if request.method=='POST':
        debates=request.POST['debate']

        facultyname=request.user
        d_table=debate.objects.create(facultyname=request.user.username,debate=debates)
        d_table.save()
        return render(request,'facultyhome.html',{'data':userh,'posts':posts,'isfaculty':True})

    return render(request,'facultyhome.html',{'data':userh,'posts':posts,'isfaculty':True})

