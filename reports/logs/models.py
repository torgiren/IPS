from django.db import models

#class Type(models.Model):
#	nazwa=models.CharField(max_length=30,unique=True)
class Event(models.Model):
	czas=models.DateTimeField()
	typ=models.CharField(max_length=30)
	src=models.CharField(max_length=16)
	dst=models.CharField(max_length=16)
	sport=models.CharField(max_length=6)
	dport=models.CharField(max_length=6)
	proto=models.CharField(max_length=10)
	log=models.CharField(max_length=500)


# Create your models here.
