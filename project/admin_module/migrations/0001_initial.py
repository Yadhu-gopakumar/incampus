# Generated by Django 5.1.1 on 2024-10-19 20:06

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='feedbacktable',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('feedbackdate', models.DateTimeField(auto_now_add=True)),
                ('f_user', models.CharField(max_length=100)),
                ('firstname', models.CharField(max_length=100)),
                ('lastname', models.CharField(max_length=100)),
                ('email', models.CharField(max_length=100)),
                ('feedback', models.TextField(max_length=300)),
                ('admin_reply', models.TextField(max_length=300, null=True)),
            ],
        ),
    ]
