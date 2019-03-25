from django.db import models

""" For each of the three NC's, there are two models:

    1. NC{id}Products - Contains the details of each item in the menu of that NC.

       Contains the fields - 'name' of the item
                              its 'price' in rupees
                              whether it's 'veg' or non-veg
                              whether it is 'currently_present' in the menu, and available for ordering
                             'item_type', a tuple of tuples containing all possible categories the item could belong to
                             'filters', the category to which it belongs to (i.e. one of the options present in 'item_type')

    2. PaidOrdersNC{id} - Contains the details of all the successfully placed orders, in that NC.
                          
       Contains the fields - 'ph_no' - the customer's phone number, in case they need to be contacted
                             'gpay_ph_no' - the phone number which the customer used to pay the bill amoun through Google Pay.
                                            The cashier will verify if the bill amount has been paid through this number, and 
                                            accordingly process the order.
                             'block' - The hostel block that the order should be delivered to
                             'order_comments' - any comments/suggestions about the order that the customers wish to pass on to the
                              NC staff.
                             'order_details' contains the order details, i.e., a list of all items ordered, their quantities and
                                                                                                                  total cost.
                             'order_status_values' - A tuples of tuples containing possible current order statuses (Pending, Delivered
                                                                                                             or Rejected)
                             'order_status' - A variable to store the current order status
                             
"""

class NC1Products(models.Model):

    #item id of each item in the menu will be its primary key
    name = models.CharField(max_length=200)
    price = models.IntegerField()
    veg=models.BooleanField(default=True)
    currently_present=models.BooleanField()
    item_type = ((1,'Hot and Cold Beverages'),(2,'Dosa Items'), (3, 'Sandwiches Bar'))
    filter = models.IntegerField(choices=item_type)

    class Meta(object):
        verbose_name_plural = 'Menu items of Block 3 Night Canteen'

    def __str__(self):
        return self.name

class PaidOrdersNC1(models.Model):  # each object of this model represents a successfully created order in NC1
    ph_no = models.BigIntegerField()
    gpay_ph_no = models.BigIntegerField()
    block = models.CharField(max_length=15)
    order_comments = models.TextField(null=True, blank=True)

    order_details = models.TextField()

    order_status_values = (('a','Pending'),('b','Delivered'),('c','Rejected'))
    order_status = models.CharField(choices=order_status_values, default='a', max_length=1)

    class Meta(object):
        verbose_name_plural = 'List of orders created - Block 3 Night Canteen'

    def __str__(self):
        return 'Order number - ' + str(self.pk)

class NC2Products(models.Model):

    #item id of each item in the menu will be its primary key
    name = models.CharField(max_length=200)
    price = models.IntegerField()
    veg=models.BooleanField(default=True)
    currently_present=models.BooleanField()
    item_type = ((1,'Hot and Cold Beverages'),(2,'Dosa Items'), (3, 'Sandwiches Bar'))
    filter = models.IntegerField(choices=item_type)
    

    class Meta(object):
        verbose_name_plural = 'Menu items of Block 7 Night Canteen'

    def __str__(self):
        return self.name

class PaidOrdersNC2(models.Model):  # each object of this model represents a successfully created order in NC2
    ph_no = models.BigIntegerField()
    gpay_ph_no = models.BigIntegerField()
    block = models.CharField(max_length=15)
    order_comments = models.TextField(null=True, blank=True)

    order_details = models.TextField()

    order_status_values = (('a','Pending'),('b','Delivered'),('c','Rejected'))
    order_status = models.CharField(choices=order_status_values, default='a', max_length=1)

    class Meta(object):
        verbose_name_plural = 'List of orders created - Block 7 Night Canteen'

    def __str__(self):
        return 'Order number - ' + str(self.pk)

class NC3Products(models.Model):
    #item id of each item in the menu will be its primary key
    name = models.CharField(max_length=200)
    price = models.IntegerField()
    veg=models.BooleanField(default=True)
    currently_present=models.BooleanField()
    item_type = ((1,'Noodle Items'),(2,'Rice Items'))
    filter = models.IntegerField(choices=item_type)

    class Meta(object):
        verbose_name_plural = 'Menu items of Girl\'s Block Night Canteen'

    def __str__(self):
        return self.name

class PaidOrdersNC3(models.Model):  # each object of this model represents a successfully created order in NC3
    ph_no = models.BigIntegerField()
    gpay_ph_no = models.BigIntegerField()
    block = models.CharField(max_length=15)
    order_comments = models.TextField(null=True, blank=True)

    order_details = models.TextField()

    order_status_values = (('a','Pending'),('b','Delivered'),('c','Rejected'))
    order_status = models.CharField(choices=order_status_values, default='a', max_length=1)

    class Meta(object):
        verbose_name_plural = 'List of orders created - Girl\'s Block Night Canteen'

    def __str__(self):
        return 'Order number - ' + str(self.pk)
