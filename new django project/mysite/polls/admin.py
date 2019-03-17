from django.contrib import admin
from polls.models import NC1Products, NC2Products, NC3Products, PaidOrdersNC1, PaidOrdersNC2, PaidOrdersNC3, NC1Filters, NC2Filters, NC3Filters

# Register your models here.
@admin.register(NC1Products)
class NC1ProductsAdmin(admin.ModelAdmin):
    list_display = ['name', 'price', 'currently_present']
    list_filter = ['currently_present','filter']
    search_fields = ['name']

@admin.register(NC2Products)
class NC2ProductsAdmin(admin.ModelAdmin):
    list_display = ['name', 'price', 'currently_present']
    list_filter = ['currently_present','filter']
    search_fields = ['name']

@admin.register(NC3Products)
class NC3ProductsAdmin(admin.ModelAdmin):
    list_display = ['name', 'price', 'currently_present']
    list_filter = ['currently_present','filter']
    search_fields = ['name']

admin.site.register(PaidOrdersNC1)
admin.site.register(PaidOrdersNC2)
admin.site.register(PaidOrdersNC3)
admin.site.register(NC1Filters)
admin.site.register(NC2Filters)
admin.site.register(NC3Filters)
