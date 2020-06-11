# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.contrib import admin
from django.contrib.auth.admin import UserAdmin as BaseUserAdmin
from night_owl.models import User, NC1Products, NC2Products, NC3Products, PaidOrdersNC1, PaidOrdersNC2, PaidOrdersNC3

class UserAdmin(BaseUserAdmin):

    list_display = ('username', 'first_name', 'last_name', 'ph_no', 'gpay_ph_no')

admin.site.register(User, UserAdmin)

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
