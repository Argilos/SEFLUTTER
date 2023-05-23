from django.http import JsonResponse
from barcode_app.models import MyModel
from django.views.decorators.csrf import csrf_exempt

@csrf_exempt
def check_unique_barcode_id(request, unique_barcode_id):
    try:
        mymodel = MyModel.objects.get(unique_barcode_id=unique_barcode_id)
        return JsonResponse({'result': True})
    except MyModel.DoesNotExist:
        return JsonResponse({'result': False})
