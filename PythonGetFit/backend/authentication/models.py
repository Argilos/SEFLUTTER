from django.db import models

class User(models.Model):
    unique_id = models.AutoField(primary_key=True)
    first_name = models.CharField(max_length=100)
    last_name = models.CharField(max_length=100)
    email = models.EmailField(unique=True)
    password = models.CharField(max_length=100)
    unique_barcode_id = models.CharField(max_length=100)