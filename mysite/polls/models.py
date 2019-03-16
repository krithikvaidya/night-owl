from django.db import models

# Create your models here.

class Products(models.Model):

    #item id of each item in the menu will be its primary key

    name = models.CharField(max_length=200)
    price = models.IntegerField()

    def __str__(self):
        return self.name

class PaidOrdersNC1(models.Model):
    car
    ph_no = models.BigIntegerField()
    gpay_ph_no = models.BigIntegerField()
    block = models.CharField(max_length=15)

class PaidOrdersNC2(models.Model):
    cart = models.OneToOneField(Cart, on_delete=models.CASCADE)
    UPI = models.BigIntegerField()

    def __nonzero__(self): # return an object of this class only if UPI is non-empty
        return bool(UPI)

class PaidOrdersNC3(models.Model):
    cart = models.OneToOneField(Cart, on_delete=models.CASCADE)
    UPI = models.BigIntegerField()

    def __nonzero__(self): # return an object of this class only if UPI is non-empty
        return bool(UPI)

