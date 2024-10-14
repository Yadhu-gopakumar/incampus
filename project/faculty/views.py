from django.http import JsonResponse
from django.shortcuts import render,redirect
from credentials.models import facultyprofile
from .form import facultyprofileform
from student.models import post_table,comments
from .models import community_table,debate,f_studymaterials

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
    
    facultyname=request.user.username
    userh=facultyprofile.objects.get(email=request.user.username)
    comm_post_data=community_table.objects.filter(facultyname=facultyname)

    if request.method=='POST':
        ctitle=request.POST['ctitle']
        comm_post=request.POST['post']


        community=community_table.objects.create(facultyname=facultyname,title=ctitle,department=userh.department,comm_post=comm_post)
        community.save()
        return render(request,'facultycommunity.html',{'data':request.user,'comm_posts':comm_post_data})

    return render(request,'facultycommunity.html',{'data':request.user,'comm_posts':comm_post_data})
        
    




def adddebate(request):
    posts=post_table.objects.all()
    userh=facultyprofile.objects.get(email=request.user.username)
    
    if request.method=='POST':
        debates=request.POST['debate']

        d_table=debate.objects.create(facultyname=request.user.username,topic=debates,department=userh.department)
        d_table.save()
        return redirect('debatespage')

    return render(request,'debatespage.html',{'data':userh,'posts':posts,'isfaculty':True})

def feedbacks(request):
    userh=facultyprofile.objects.get(email=request.user.username)

    return render(request,'feedbacks.html',{'data':userh})

def debatespage(request):
    userh=facultyprofile.objects.get(email=request.user.username)

    d=debate.objects.filter(facultyname=request.user.username).all()
    return render(request,'debatespage.html',{'debates':d,'data':userh})
def debatepage(request):
    userh=facultyprofile.objects.get(email=request.user.username)

    return render(request,"onedebatepage.html",{'data':userh})


def communitypage(request):
    userh=facultyprofile.objects.get(email=request.user.username)

    comm=community_table.objects.filter(department=userh.department).all()
    return render(request,'facultycommunity.html',{'comm':comm,'data':userh})    

def deletecommunity(request,id):
    
    userh=facultyprofile.objects.get(email=request.user.username)
    community_table.objects.get(id=id).delete()

    comm=community_table.objects.filter(department=userh.department).all()
    
    return render(request,'facultycommunity.html',{'comm':comm,'data':userh})   

def deletedebate(request,id):
    debate.objects.get(id=id).delete()

    userh=facultyprofile.objects.get(email=request.user.username)

    d=debate.objects.filter(facultyname=request.user.username).all()
    return render(request,'debatespage.html',{'debates':d,'data':userh})


def studymaterialsview(request):
    userh=facultyprofile.objects.get(email=request.user.username)

    s_all=f_studymaterials.objects.filter(department=userh.department).all()
    if request.method=='POST':
        summary=request.POST['summary']
        note=request.FILES['note']
        s=f_studymaterials.objects.create(faculty=userh,file=note,note=summary,department=userh.department)
        return render(request,'studymaterials.html',{'s_all':s_all})

    return render(request,'studymaterials.html',{'s_all':s_all})

def deletenote(request,id):
    f_studymaterials.objects.get(id=id).delete()

    userh=facultyprofile.objects.get(email=request.user.username)

    s_all=f_studymaterials.objects.filter(department=userh.department).all()

    return render(request,'studymaterials.html',{'s_all':s_all})


def viewdebate(request,id):
    userh=facultyprofile.objects.get(email=request.user.username)
    d=debate.objects.get(id=id)


    return render(request,'onedebatepage.html',{'data':userh,'debates':d})