# Generated by Django 2.0.6 on 2019-11-12 05:33

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('students', '0003_auto_20191112_1038'),
    ]

    operations = [
        migrations.AddField(
            model_name='student',
            name='section_id',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, to='students.Section'),
            preserve_default=False,
        ),
    ]
