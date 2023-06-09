from django.shortcuts import render
from rest_framework.views import APIView
from rest_framework.response import Response
from .models import User
from .serializers import UserSerializer
from django.shortcuts import get_object_or_404
from rest_framework.decorators import api_view
from rest_framework.response import Response
from .models import User

class RegisterView(APIView):
    def post(self, request):
        serializer = UserSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=201)
        return Response(serializer.errors, status=400)

class LoginView(APIView):
    def post(self, request):
        email = request.data.get('email')
        password = request.data.get('password')
        try:
            user = User.objects.get(email=email, password=password)
            serializer = UserSerializer(user)
            return Response(serializer.data)
        except User.DoesNotExist:
            return Response({'error': 'Invalid credentials'}, status=400)
        
@api_view(['POST'])
def signup(request):
    name = request.data['name']
    lastname = request.data['lastname']
    email = request.data['email']
    password = request.data['password']
    unique_id = request.data['unique_id']
    membership_countdown = request.data['membership_countdown']

    user = User.objects.create(
        name=name,
        lastname = lastname, 
        email=email,
        password=password,
        unique_id=unique_id,
        membership_countdown=membership_countdown
    )

    return Response({'message': 'User created successfully'})

@api_view(['POST'])
def login(request):
    email = request.data['email']
    password = request.data['password']

    user = get_object_or_404(User, email=email, password=password)

    return Response({'message': 'User logged in successfully'})
