from django.shortcuts import render
from django.http import JsonResponse
from .models import User

def check_membership(request):
    unique_barcode_id = request.GET.get('unique_barcode_id', '')
    try:
        user = User.objects.get(unique_barcode_id=unique_barcode_id)
        if user.membership_length > 0:
            response_data = {'is_member': True}
        else:
            response_data = {'is_member': False}
    except User.DoesNotExist:
        response_data = {'is_member': False}
    
    return JsonResponse(response_data)