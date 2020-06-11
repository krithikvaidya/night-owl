from django.db import models

class NCProducts(models.Model):

    #item id of each item in the menu will be its primary key
    name = models.CharField(max_length=200)
    price = models.IntegerField()
    veg=models.BooleanField(default=True)
    currently_present=models.BooleanField()
    MY_CHOICES = ((1,'Hot and Cold Beverages'),(2,'Dosa Items'), (3, 'Sandwiches Bar'))
    filters = models.IntegerField(choices=MY_CHOICES)

    class Meta(object):
        verbose_name_plural = 'Menu items of Block 3 Night Canteen'

    def __str__(self):
        return self.name

class PaidOrders(models.Model):  # each object of this model represents a successfully created order in NC1
    ph_no = models.BigIntegerField()
    gpay_ph_no = models.BigIntegerField()
    block = models.CharField(max_length=15)
    order_comments = models.TextField(null=True, blank=True)
    item_name = models.TextField()
    price = models.TextField()
    quantity = models.TextField()
    MY_CHOICES = (('a','Pending'),('b','Delivered'),('c','Rejected'))
    filters = models.CharField(choices=MY_CHOICES, default='a', max_length=10)

    class Meta(object):
        verbose_name_plural = 'List of orders created - Block 3 Night Canteen'

    def __str__(self):
        return 'Order number - ' + str(self.pk)
