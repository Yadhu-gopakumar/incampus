from django.shortcuts import render,redirect
from django.contrib.auth.models import User,auth
from django.contrib import messages
from .models import userprofile,facultyprofile
from django.contrib.auth.decorators import login_required

# Create your views here.

#student credentials

def studentreg(request):
    if request.method=="POST":
        reg=request.POST['regno']
        fname=request.POST['fname']
        lname=request.POST['lname']
        phone=request.POST['phone']
        department=request.POST['department']
        dob=request.POST['dob']
        gender=request.POST['gender']
        email=request.POST['email']
        password=request.POST['cpswd']
        cpassword=request.POST['cpswd']
        if cpassword==password:
          
            if userprofile.objects.filter(reg_no=reg).exists():
                if User.objects.filter(username=reg).exists():
                    
                    messages.info(request,"Already registered!")
                    return redirect('studentreg')
                else:    
                    try:
                        new_User=User.objects.create_user(username=reg,password=password,first_name=fname,last_name=lname)
                        userprofile.objects.filter(reg_no=reg).update(firstname=fname,lastname=lname,email=email,gender=gender,department=department,Phone=phone,dob=dob)
                        new_User.save()
                        return redirect('studentlogin')
                    except:
                        messages.info(request,"Error while saving!")
                        return redirect('studentreg')

            else:
                messages.info(request,"Invalid Register number!")
                return redirect('studentreg')
        else:
            messages.info(request,"Password didn't matching!")
            return redirect('studentreg')
        


    return render(request,'studentreg.html')


def studentlogin(request):
    if request.method=='POST':
        reg_no=request.POST["regno"]
        password=request.POST["pswd"]
        s_obj=userprofile.objects.filter(reg_no=reg_no).exists()
        if s_obj:
            user=auth.authenticate(username=reg_no,password=password)
        
            if user is not None:
                auth.login(request,user)
                return redirect('homepage')

            else:

                messages.info(request,"invalid credentials")
                return redirect('studentlogin')
        else:

            messages.info(request,"invalid credentials")
            return redirect('studentlogin')
    return render(request,'studentlogin.html')

@login_required(login_url='stuentlogin')
def studentlogout(request):
    auth.logout(request)
    return redirect("studentlogin")


def facultyreg(request):
    if request.method=="POST":

        fname=request.POST['fname']
        lname=request.POST['lname']
        phone=request.POST['phone']
        department=request.POST['department']
        email=request.POST['email']
        password=request.POST['pswd']
        cpassword=request.POST['cpswd']
        if cpassword==password:
            
            if facultyprofile.objects.filter(email=email).exists():
                if User.objects.filter(username=email).exists():
                    
                    messages.info(request,"Already registered!")
                    return redirect('facultyreg')
                else:    
                    try:
                        new_User=User.objects.create_user(username=email,password=password,first_name=fname,last_name=lname)
                        facultyprofile.objects.filter(email=email).update(firstname=fname,lastname=lname,department=department,Phone=phone)
                        new_User.save()
                        
                        return redirect('facultylogin')
                    except:
                        messages.info(request,"Error while saving!")
                        return redirect('facultyreg')

            else:
                messages.info(request,"Invalid credentials!")
                return redirect('facultyreg')
        else:
            messages.info(request,"Password didn't matching!")
            return redirect('facultyreg')
        


    return render(request,'facultyregister.html')

def facultylogin(request):
    if request.method=='POST':
        mail=request.POST["email"]
        password=request.POST["pswd"]
        f_obj=facultyprofile.objects.filter(email=mail).exists()
        if f_obj:

            user=auth.authenticate(username=mail,password=password)
            print(user)
            if user is not None:
                auth.login(request,user)
                return redirect('facultyhome')

            else:

                messages.info(request,"invalid credentials")
                return redirect('facultylogin')
        else:

            messages.info(request,"invalid credentials")
            return redirect('facultylogin')
    return render(request,'facultylogin.html')
@login_required(login_url='facultylogin')
def facultylogout(request):
    auth.logout(request)
    return redirect('facultylogin')