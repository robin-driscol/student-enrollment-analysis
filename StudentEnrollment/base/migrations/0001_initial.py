# Generated by Django 3.2.8 on 2021-10-29 22:23

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='ClassSize_1',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('school_title', models.CharField(max_length=10)),
                ('course_id', models.CharField(max_length=50)),
                ('offer_with', models.CharField(max_length=150)),
                ('section', models.PositiveIntegerField()),
                ('credit_hour', models.PositiveIntegerField()),
                ('room_capacity', models.PositiveIntegerField()),
                ('enrolled', models.PositiveIntegerField()),
                ('freespace', models.IntegerField()),
                ('room_id', models.CharField(max_length=50)),
                ('blocked', models.BooleanField()),
                ('start_time', models.TimeField()),
                ('end_time', models.TimeField()),
                ('st_mw', models.CharField(max_length=5)),
                ('year', models.CharField(max_length=5)),
                ('semester', models.CharField(max_length=10)),
            ],
        ),
        migrations.CreateModel(
            name='Revenue',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('year', models.CharField(max_length=5)),
                ('semester_num', models.PositiveIntegerField()),
                ('SBE', models.PositiveBigIntegerField(null=True)),
                ('SETS', models.PositiveBigIntegerField(null=True)),
                ('SELS', models.PositiveBigIntegerField(null=True)),
                ('SLASS', models.PositiveBigIntegerField(null=True)),
                ('SPPH', models.PositiveBigIntegerField(null=True)),
                ('total', models.PositiveBigIntegerField(null=True)),
            ],
        ),
    ]
