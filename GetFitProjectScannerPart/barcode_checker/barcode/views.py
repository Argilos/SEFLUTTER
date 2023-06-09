from django.shortcuts import render
from django.http import JsonResponse
from .models import User

def check_membership(request):
    unique_barcode_id = request.GET.get('unique_barcode_id', '')
    response_data = {'is_member': False}

    try:
        user = User.objects.get(unique_barcode_id=unique_barcode_id)
        if user.membership_length > 0:
            response_data['is_member'] = True
    except User.DoesNotExist:
        pass
    
    response = build_response(response_data)
    return response

def extend_membership(request):
    unique_barcode_id = request.GET.get('unique_barcode_id', '')
    response_data = {'message': '', 'error': ''}

    try:
        user = User.objects.get(unique_barcode_id=unique_barcode_id)
        user.membership_length += 30
        user.save()

        response_data['message'] = 'Članarina upješno produžena!'
    except User.DoesNotExist:
        response_data['error'] = 'Član nije pronađen.'

    response = build_response(response_data)
    return response

def get_users(request):
    users = User.objects.all()
    user_list = []
    for user in users:
        user_data = {
            'unique_barcode_id': user.unique_barcode_id,
            'first_name': user.first_name,
            'last_name': user.last_name,
            'email': user.email,
            'membership_length': user.membership_length
        }
        user_list.append(user_data)
    
    response_data = {'users': user_list}
    response = build_response(response_data)
    return response

def build_response(data):
    response = JsonResponse(data)
    response["Access-Control-Allow-Origin"] = "*"
    response["Access-Control-Allow-Methods"] = "GET"
    response["Access-Control-Allow-Headers"] = "Content-Type"
    return response