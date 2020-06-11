# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from mysite.admin import custom_admin_site
from django.contrib.auth.admin import UserAdmin as BaseUserAdmin
from night_owl.models import User, NC1Products, NC2Products, NC3Products, PaidOrdersNC1, PaidOrdersNC2, PaidOrdersNC3


# Register your models here.
@custom_admin_site.register(NC1Products)
class NC1ProductsAdmin(custom_admin_site.ModelAdmin):
    list_display = ['name', 'price', 'currently_present']
    list_filter = ['currently_present','filter']
    search_fields = ['name']

@custom_admin_site.register(NC2Products)
class NC2ProductsAdmin(custom_admin_site.ModelAdmin):
    list_display = ['name', 'price', 'currently_present']
    list_filter = ['currently_present','filter']
    search_fields = ['name']

@custom_admin_site.register(NC3Products)
class NC3ProductsAdmin(custom_admin_site.ModelAdmin):
    list_display = ['name', 'price', 'currently_present']
    list_filter = ['currently_present','filter']
    search_fields = ['name']

@custom_admin_site.register(PaidOrdersNC1)
class PaidOrdersNC1Admin(custom_admin_site.ModelAdmin):
    list_display = ['order_number', 'ph_no', 'gpay_ph_no', 'block']
    list_filter = ['filters']

    def order_number(self, obj):
        return 'Order number - ' + str(obj.pk)


@custom_admin_site.register(PaidOrdersNC2)
class PaidOrdersNC2Admin(custom_admin_site.ModelAdmin):
    list_display = ['order_number', 'ph_no', 'gpay_ph_no', 'block']
    list_filter = ['filters']

    def order_number(self, obj):
        return 'Order number - ' + str(obj.pk)

@custom_admin_site.register(PaidOrdersNC3)
class PaidOrdersNC3Admin(custom_admin_site.ModelAdmin):
    list_display = ['order_number', 'ph_no', 'gpay_ph_no', 'block']
    list_filter = ['filters']

    def order_number(self, obj):
        return 'Order number - ' + str(obj.pk)
