from django.db import models
from enum import Enum

# Create your models here.
class Blood(models.Model):
	name = models.CharField(max_length=255)
	phone = models.IntegerField()
	blood_group = models.CharField(max_length=20)
	location = models.CharField(max_length=100)
	additional_info = models.CharField(max_length=255, default='')

	def __str__(self):
		return self.name

