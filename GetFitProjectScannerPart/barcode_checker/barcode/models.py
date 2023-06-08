from django.db import models

class User(models.Model):
    unique_barcode_id = models.CharField(max_length=50, unique=True)
    membership_length = models.IntegerField(default=0)

    def __str__(self):
        return self.unique_barcode_id