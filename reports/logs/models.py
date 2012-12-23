from django.db import models

class Type(models.Model):
	nazwa=models.CharField(max_length=30)
class Event(models.Model):
	czas=models.DateField()
	typ=models.ForeignKey(Type)


# Create your models here.
