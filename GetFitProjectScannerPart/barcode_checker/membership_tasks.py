import datetime
from django.core.management.base import BaseCommand
from django.utils import timezone
from barcode.models import User

class Command(BaseCommand):
    help = 'Automatically decrements membership_length of users at 00:00'

    def handle(self, *args, **options):
        now = timezone.now()
        current_date = now.date()

        if now.hour == 0 and now.minute == 0:
            users = User.objects.all()

            # Iterate over users and decrement membership_length
            for user in users:
                user.membership_length -= 1
                user.save()

            print('Membership lengths decremented for all users on', current_date)