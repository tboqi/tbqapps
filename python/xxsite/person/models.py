from django.db import models

class Person(models.Model): 
    name = models.CharField(max_length=200)
    pwd = models.CharField(max_length=32)
    email = models.EmailField(max_length=254, default='')

    class Meta:
         db_table = 'person'