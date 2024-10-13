from django import forms
from credentials.models import facultyprofile

class facultyprofileform(forms.ModelForm):
    class Meta:
        model=facultyprofile
        fields=['firstname','lastname','profile_pic','Phone']



