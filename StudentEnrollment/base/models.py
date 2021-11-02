from django.db import models

# Create your models here.

class ClassSize_1(models.Model):
    school_title = models.CharField(max_length=10)
    course_id = models.CharField(max_length=50)
    offer_with = models.CharField(max_length=150)
    section = models.PositiveIntegerField()
    credit_hour = models.PositiveIntegerField()
    room_capacity = models.PositiveIntegerField()
    enrolled = models.PositiveIntegerField()
    freespace = models.IntegerField()
    room_id = models.CharField(max_length=50)
    blocked = models.BooleanField()
    start_time = models.TimeField()
    end_time = models.TimeField()
    st_mw = models.CharField(max_length=5)
    year = models.CharField(max_length=5)
    semester = models.CharField(max_length=10)
    
class Revenue(models.Model):
    year = models.CharField(max_length=5)
    semester_num = models.PositiveIntegerField()
    SBE = models.PositiveBigIntegerField(null=True)
    SETS = models.PositiveBigIntegerField(null=True)
    SELS = models.PositiveBigIntegerField(null=True)
    SLASS = models.PositiveBigIntegerField(null=True)
    SPPH = models.PositiveBigIntegerField(null=True)
    total = models.PositiveBigIntegerField(null=True)
    
    #change_percent = models.

class Example(models.Model):
    product = models.CharField(max_length=50)
    quantity = models.IntegerField(null=True)

    def __str__(self):
        return f'{self.product} - {self.quantity}'
