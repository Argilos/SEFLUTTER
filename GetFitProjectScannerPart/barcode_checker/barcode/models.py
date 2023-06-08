import random
from django.db import models

class User(models.Model):
    unique_barcode_id = models.PositiveIntegerField(primary_key=True)
    first_name = models.CharField(max_length=100)
    last_name = models.CharField(max_length=100)
    email = models.EmailField(unique=True)
    password = models.CharField(max_length=100)
    membership_length = models.PositiveIntegerField()

    def save(self, *args, **kwargs):
        if not self.unique_barcode_id:
            self.unique_barcode_id = self.generate_unique_barcode_id()
        super().save(*args, **kwargs)

    def generate_unique_barcode_id(self):
        while True:
            barcode_id = random.randint(1000000000, 9999999999)  # Generate a random 10-digit number
            if not User.objects.filter(unique_barcode_id=barcode_id).exists():
                return barcode_id

    def __str__(self):
        return str(self.unique_barcode_id)
