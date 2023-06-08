from django.urls import path
from . import views

urlpatterns = [
    path('check-membership/', views.check_membership, name='check_membership'),
    path('extend-membership/', views.extend_membership, name='extend_membership'),
    path('users/', views.get_users, name='users')
]