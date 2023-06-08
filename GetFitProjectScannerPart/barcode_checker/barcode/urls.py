from django.urls import path
from . import views

urlpatterns = [
    path('check-membership/', views.check_membership, name='check_membership'),
]