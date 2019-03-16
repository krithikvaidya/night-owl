from django.contrib import admin
from polls.models import NC1Products, NC2Products, NC3Products, PaidOrdersNC1, PaidOrdersNC2, PaidOrdersNC3, NC1Filters, NC2Filters, NC3Filters

# Register your models here.

admin.site.register(NC1Products)
admin.site.register(NC2Products)
admin.site.register(NC3Products)
admin.site.register(PaidOrdersNC1)
admin.site.register(PaidOrdersNC2)
admin.site.register(PaidOrdersNC3)
