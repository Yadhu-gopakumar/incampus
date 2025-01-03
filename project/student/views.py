import json
from django.http import JsonResponse
from django.shortcuts import render,redirect
from credentials.models import userprofile,facultyprofile
from faculty.models import community_table,debate,debate_reply,f_studymaterials
from admin_module.models import feedbacktable
from .models import post_table,comments
from django.contrib.auth.decorators import login_required
from .form import profileform
from django.contrib.auth.models import User
# Create your views here.
@login_required(login_url='studentlogin')
def home(request):
    posts=post_table.objects.all()
    userh=userprofile.objects.get(reg_no=request.user)
    print(userh.profile_pic.url)
    
    return render(request,'feed.html',{'data':userh,'posts':posts,'isfaculty':False})


@login_required(login_url='studentlogin')
def studentprofile(request,user):
        isfaculty=False

        userdata=userprofile.objects.get(reg_no=user)
        comment=comments.objects.all()
        current=request.user
        try:
            currentuser=userprofile.objects.get(reg_no=current)
            isfaculty=False

            if currentuser.following.filter(username=userdata.reg_no).exists():
                isfollowing=True
            else:
                isfollowing=False 
        except:    
            currentuser=facultyprofile.objects.get(email=current)
            isfaculty=True
            isfollowing=False 

        
        posts=post_table.objects.filter(user__username=user).all()
       
        context={
            'profile_data':userdata,
            'userprofile':currentuser,
            'posts':posts,
            'comments':comment,
            'isfollowing':isfollowing,
            'data':currentuser,
            'isfaculty':isfaculty,
        }
        return render(request,'studentprofile.html',context)   


def follow(request,id):
    userdata=userprofile.objects.get(reg_no=id)
    followerid=User.objects.get(username=userdata.reg_no)

    current=request.user.username
    currentuserobject=userprofile.objects.get(reg_no=current)
    
    if currentuserobject.following.filter(username=followerid).exists():
     
        currentuserobject.following.remove(followerid)
        userdata.followers.remove(request.user)
        print("unfollow")
        return JsonResponse("notfollowing",safe=False)
    else:
        print("follow")
        currentuserobject.following.add(followerid)
        userdata.followers.add(request.user)
        return JsonResponse("following",safe=False)


def addpost(request):

    if request.method=="POST":
        picture__input=request.FILES.get("picture__input")
        caption=request.POST["caption"]
        post_profile=userprofile.objects.get(reg_no=request.user.username)

        try:
            newpost = post_table.objects.create(user=request.user,
                                                 post_profile=post_profile,
                                                 caption=caption,
                                                 post=picture__input)
            newpost.save()  # Save the new post object
        except Exception as e:
            # Handle specific exceptions (e.g., validation errors)
                return JsonResponse({'error': str(e)})
        data = {
            'post_id': newpost.id, 
            'caption': caption,
            'user': post_profile.reg_no,
            }

        jdata=json.dumps(data)
        return JsonResponse(jdata, safe=False)  

    else:
            return JsonResponse({'data': 'Invalid request method'})

def deletepost(request,post_id):

    postinstance=post_table.objects.get(id=post_id)
    postinstance.delete()
    
    return redirect('homepage')  

def pdeletepost(request,post_id):
        postinstance=post_table.objects.get(id=post_id)
        postinstance.delete()
    
        userdata=userprofile.objects.get(reg_no=request.user.username)
        comment=comments.objects.all()
        current=request.user
        currentuser=userprofile.objects.get(reg_no=current)
        
        posts=post_table.objects.filter(user__username=request.user.username).all()
        if currentuser.following.filter(username=userdata.reg_no).exists():
            isfollowing=True
        else:
            isfollowing=False    
        context={
            'profile_data':userdata,
            'userprofile':currentuser,
            'posts':posts,
            'comments':comment,
            'isfollowing':isfollowing,
            'data':currentuser,
        }
        return render(request,'studentprofile.html',context)   
   
    
  


def studentedit(request):
    user_profile = userprofile.objects.filter(reg_no=request.user.username).first()
    profiledata=user_profile

    form = profileform(request.POST or None, request.FILES or None, instance=user_profile)
    if request.method == "POST": 
        if form.is_valid():
            form.save()
            print("updated")
                    
    
    return render(request,'studentupdate.html',{'pform':form,'data':profiledata,'date':str(profiledata.dob)})


def like(request,id):
    if request.method=='POST':
        
        currentuser=request.user.username

        postinstance=post_table.objects.get(id=id)
        
        if  postinstance.likes.filter(username=currentuser).exists():
            postinstance.likes.remove(request.user)
            
            postinstance.save()
            print('disliked')
            return JsonResponse({'data':'dsliked'},safe=False)
        else:
            postinstance.likes.add(request.user)
            postinstance.save()
            print('liked')            
            return JsonResponse({'data':'liked'},safe=False)



def profilelike(request,user,id):
    if request.method=='POST':
        
        currentuser=user

        postinstance=post_table.objects.get(id=id)
        
        if  postinstance.likes.filter(username=currentuser).exists():
            postinstance.likes.remove(request.user)
            
            postinstance.save()
            print('disliked')
            return JsonResponse({'data':'dsliked'},safe=False)
        else:
            postinstance.likes.add(request.user)
            postinstance.save()
            print('liked')            
            return JsonResponse({'data':'liked'},safe=False)



def comment(request,id):
    
    post=post_table.objects.get(id=id)
    currentuser=userprofile.objects.get(reg_no=request.user.username)
         
    postcomments=comments.objects.filter(post=post)
    print(currentuser)
    context={
            'comments':postcomments,
            'userprofile':currentuser,
            'posts':post,
    }

    if request.method=='POST':
            comment=request.POST['comment']
            commentinstance=comments.objects.create(post=post,user=currentuser,comment=comment)
            commentinstance.save()
           
            date=comments.objects.get(id=commentinstance.id).date
            profile=currentuser.profile_pic.url
            data={
                'date':date,
                'comment':comment,
                'profile':profile,
                'user':currentuser.reg_no,
                'id':commentinstance.id,
                'userid':currentuser.id,
                'firstname':currentuser.firstname,
                'lastname':currentuser.lastname
                }
            return JsonResponse(data, safe=False)
    

    return render(request,'comments.html',context) 

def deletecomment(request,id):
    commentinstance=comments.objects.get(id=id)
    currentuser=userprofile.objects.get(reg_no=request.user)
    postcomments=comments.objects.filter(post=commentinstance.post)
    post=commentinstance.post

    commentinstance.delete()
    context={
            'comments':postcomments,
            'userprofile':currentuser,
            'posts':post,
    }
    url="/comment/"+str(post.id)+"/"
    return redirect(url)
def search(request):

    currentuser=userprofile.objects.get(reg_no=request.user)
    context={
                'userprofile':currentuser,
                'data':'',
                    }
    if 'query' in request.GET:
        q=request.GET['query']
        # uname=User.objects.filter(username__icontains=q)

        res=userprofile.objects.filter(firstname__icontains=q) | userprofile.objects.filter(lastname__icontains=q) 
   
        if res is not None:
            context={
                'userprofile':currentuser,
                'data':res,
                # 'uname':uname
                    }

        else:
            context={
            'userprofile':currentuser,
            'data':res,
                }  
        return render(request,'search.html',context)
                    
    return render(request,'search.html',context)



def scommunitypage(request):
    userh=userprofile.objects.get(reg_no=request.user.username)

    comm=community_table.objects.filter(department=userh.department).all()
    return render(request,'facultycommunity.html',{'comm':comm,'data':userh,'isfaculty':False})   




def sfeedbacks(request):
    userh=userprofile.objects.get(reg_no=request.user.username)
    feedbacklist=feedbacktable.objects.filter(f_user=request.user.username).all()
 
    if request.method=="POST":
        fname=request.POST['fname']
        lname=request.POST['lname']
        email=request.POST['email']
        feedback=request.POST['feedback']

        f_inst=feedbacktable.objects.create(
            f_user=request.user.username,
            firstname=fname,
            lastname=lname,
            email=email,
            feedback=feedback,
          
            )
        f_inst.save()
        feedbacklist=feedbacktable.objects.filter(f_user=request.user.username).all()
        print('haaaaai')
   
        return render(request,'feedbacks.html',{'data':userh,'feedbacklist':feedbacklist})

    return render(request,'feedbacks.html',{'data':userh,'feedbacklist':feedbacklist})


def sdebatespage(request):
    isfaculty=False
    userh=userprofile.objects.get(reg_no=request.user.username)

    d=debate.objects.filter(department=userh.department).all()
    return render(request,'debatespage.html',{'debates':d,'data':userh,'isfaculty':isfaculty})


def sstudymaterialsview(request):
    userh=userprofile.objects.get(reg_no=request.user.username)
    isfaculty=False
    s_all=f_studymaterials.objects.filter(department=userh.department).all()
    
    return render(request,'studymaterials.html',{'s_all':s_all,'isfaculty':isfaculty,'data':userh})



def sviewdebate(request,id):
    isfaculty=False
    userh=userprofile.objects.get(reg_no=request.user.username)
    d=debate.objects.get(id=id)

    replies=debate_reply.objects.filter(debate__id=id).all()
    

    return render(request,'onedebatepage.html',{'data':userh,'debates':d,'replies':replies,'isfaculty':isfaculty})


def add_sdebatereply(request,id):
    userh=userprofile.objects.get(reg_no=request.user.username)
    d=debate.objects.get(id=id)
    faculty=facultyprofile.objects.get(email=d.facultyname)
    replies=debate_reply.objects.filter(debate__id=id).all()
    if request.method=="POST":
        reply=request.POST['d_reply']
        debate_reply.objects.create(debate=d,user=userh,faculty=faculty,reply=reply).save()
        replies=debate_reply.objects.filter(debate__id=id).all()

        return render(request,'onedebatepage.html',{'data':userh,'debates':d,'replies':replies,'isfaculty':False})


    return render(request,'onedebatepage.html',{'data':userh,'debates':d,'replies':replies,'isfaculty':False})


def sdeletedebatereply(request,id,debate_id):
    userh=userprofile.objects.get(reg_no=request.user.username)
    d=debate.objects.get(id=debate_id)
    replies=debate_reply.objects.filter(debate=d).all()
    debate_reply.objects.get(id=id).delete()
    # return redirect('')
    return render(request,'onedebatepage.html',{'data':userh,'debates':d,'replies':replies,'isfaculty':False})
