# Generated by Django 2.0.6 on 2019-11-13 13:32

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('students', '0005_remove_section_class_id'),
        ('teacher', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='TimeTable',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('table_date', models.CharField(default='', max_length=255)),
                ('table_day', models.CharField(default='', max_length=255)),
                ('time_slot', models.CharField(default='', max_length=255)),
                ('subject', models.CharField(default='', max_length=255)),
                ('classid', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='students.Student_class')),
                ('section', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='students.Section')),
                ('teacher', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='teacher.TeacherDetail')),
            ],
        ),
    ]
