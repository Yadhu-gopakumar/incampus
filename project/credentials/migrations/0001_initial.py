# Generated by Django 5.1.1 on 2024-10-19 19:54

from django.conf import settings
from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='facultyprofile',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('firstname', models.CharField(blank=True, max_length=200)),
                ('lastname', models.CharField(blank=True, max_length=200)),
                ('email', models.EmailField(blank=True, max_length=254)),
                ('profile_pic', models.ImageField(default='profiles/img.jpg', upload_to='profiles')),
                ('department', models.CharField(blank=True, max_length=10)),
                ('Phone', models.CharField(blank=True, max_length=15)),
            ],
        ),
        migrations.CreateModel(
            name='userprofile',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('reg_no', models.CharField(max_length=8)),
                ('firstname', models.CharField(blank=True, max_length=200)),
                ('lastname', models.CharField(blank=True, max_length=200)),
                ('email', models.EmailField(blank=True, max_length=254)),
                ('profile_pic', models.ImageField(default='profiles/img.jpg', upload_to='profiles')),
                ('gender', models.CharField(blank=True, max_length=10)),
                ('department', models.CharField(blank=True, max_length=10)),
                ('Phone', models.CharField(blank=True, max_length=15)),
                ('dob', models.DateField(blank=True, null=True)),
                ('bio', models.CharField(blank=True, max_length=200)),
                ('followers', models.ManyToManyField(blank=True, related_name='followers', to=settings.AUTH_USER_MODEL)),
                ('following', models.ManyToManyField(blank=True, related_name='following', to=settings.AUTH_USER_MODEL)),
            ],
        ),
    ]
