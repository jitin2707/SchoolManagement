# Generated by Django 2.0.6 on 2019-11-14 07:30

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('teacher', '0002_timetable'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='timetable',
            name='table_date',
        ),
    ]
