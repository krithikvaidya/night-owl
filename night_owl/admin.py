from django.contrib import admin
from night_owl.models import NC1Products, NC2Products, NC3Products, PaidOrdersNC1, PaidOrdersNC2, PaidOrdersNC3

# Register your models here.
@admin.register(NC1Products)
class NC1ProductsAdmin(admin.ModelAdmin):
    list_display = ['name', 'price', 'currently_present']
    list_filter = ['currently_present','filter']
    search_fields = ['name']

    def changelist_view(self, request, extra_context=None):
        extra_context = extra_context or {}
        extra_context['some_var'] = 'This is what I want to show'
        return super(NC1ProductsAdmin, self).changelist_view(request, extra_context=extra_context)

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

@admin.register(PaidOrdersNC1)
class PaidOrdersNC1Admin(admin.ModelAdmin):
    list_display = ['order_number', 'ph_no', 'gpay_ph_no', 'block']
    list_filter = ['filters']

    def order_number(self, obj):
        return 'Order number - ' + str(obj.pk)


@admin.register(PaidOrdersNC2)
class PaidOrdersNC2Admin(admin.ModelAdmin):
    list_display = ['order_number', 'ph_no', 'gpay_ph_no', 'block']
    list_filter = ['filters']

    def order_number(self, obj):
        return 'Order number - ' + str(obj.pk)

@admin.register(PaidOrdersNC3)
class PaidOrdersNC3Admin(admin.ModelAdmin):
    list_display = ['order_number', 'ph_no', 'gpay_ph_no', 'block']
    list_filter = ['filters']

    def order_number(self, obj):
        return 'Order number - ' + str(obj.pk)
