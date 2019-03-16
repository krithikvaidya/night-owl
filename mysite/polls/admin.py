from django.contrib import admin

from .models import Cart, PaidOrdersNC1, PaidOrdersNC2, PaidOrdersNC3
# Register your models here.

admin.site.register(Cart)
admin.site.register(PaidOrdersNC1)
admin.site.register(PaidOrdersNC2)
admin.site.register(PaidOrdersNC3)
