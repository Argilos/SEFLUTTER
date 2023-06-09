from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
import json
from django.contrib.auth.models import User
from django.contrib.auth import authenticate, login
from rest_framework import generics
from .serializers import UserSerializer

class RegisterView(generics.CreateAPIView):
    queryset = User.objects.all()
    serializer_class = UserSerializer

@csrf_exempt
def signup(request):
    if request.method == 'POST':
        data = json.loads(request.body)
        name = data.get('name')
        lastname = data.get('lastname')
        email = data.get('email')
        password = data.get('password')
        unique_id = data.get('uniqueId')
        membership_countdown = data.get('membershipCountdown')

        # Create the user object
        user = User(
            username=email,  # Using the email as the username
            email=email,
            first_name=name,
            last_name=lastname,
        )
        user.set_password(password)
        user.save()

        return JsonResponse({'message': 'User created successfully.'})
    else:
        return JsonResponse({'message': 'Invalid request method.'})

@csrf_exempt
def login(request):
    if request.method == 'POST':
        data = json.loads(request.body)
        email = data.get('email')
        password = data.get('password')

        user = authenticate(request, username=email, password=password)
        if user is not None:
            login(request, user)
            # Login successful
            return JsonResponse({'message': 'Login successful.'})
        else:
            # Login failed
            return JsonResponse({'message': 'Invalid email or password.'})
    else:
        return JsonResponse({'message': 'Invalid request method.'})
