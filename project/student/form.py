from django import forms
from credentials.models import userprofile

class profileform(forms.ModelForm):
    class Meta:
        model=userprofile
        fields=['firstname','lastname','email','profile_pic','gender','Phone','bio']



