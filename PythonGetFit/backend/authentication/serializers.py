from rest_framework import serializers
from .models import User

class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ['unique_id', 'first_name', 'last_name', 'email', 'password', 'unique_barcode_id']