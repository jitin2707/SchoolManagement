# Generated by Django 2.0.6 on 2019-10-07 04:27

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('myUser', '0004_auto_20191004_0935'),
    ]

    operations = [
        migrations.RenameField(
            model_name='usersignup',
            old_name='userAddress',
            new_name='userState',
        ),
        migrations.AddField(
            model_name='usersignup',
            name='userToken',
            field=models.CharField(default='', max_length=2000),
        ),
        migrations.AlterField(
            model_name='usersignup',
            name='confirmationLink',
            field=models.CharField(default='', max_length=2000),
        ),
    ]
