from django.db import models


class NC1Filters(models.Model):
    name=models.CharField(max_length=100)

    class Meta(object):
        verbose_name_plural = 'Categories for Block 3 Night Canteen'

    def __str__(self):
        return self.name

class NC1Products(models.Model):

    #item id of each item in the menu will be its primary key
    name = models.CharField(max_length=200)
    price = models.IntegerField()
    filter=models.ForeignKey(NC1Filters ,on_delete=models.CASCADE)
    veg=models.BooleanField(default=True)
    currently_present=models.BooleanField()

    class Meta(object):
        verbose_name_plural = 'Menu items of Block 3 Night Canteen'

    def __str__(self):
        return self.name

class PaidOrdersNC1(models.Model):  # each object of this model represents a successfully created order in NC1
    ph_no = models.BigIntegerField()
    gpay_ph_no = models.BigIntegerField()
    block = models.CharField(max_length=15)
    order_comments = models.TextField(null=True, blank=True)
    item_name = models.TextField()
    price = models.TextField()
    quantity = models.TextField()
    MY_CHOICES = (('a','Pending'),('b','Delivered'),('c','Rejected'))
    filters = models.CharField(choices=MY_CHOICES, default='Delivered', max_length=1)

    class Meta(object):
        verbose_name_plural = 'List of orders created - Block 3 Night Canteen'

    def __str__(self):
        return 'Order number - ' + str(self.pk)

class NC2Filters(models.Model):
    name= models.CharField(max_length=100)

    class Meta(object):
        verbose_name_plural = 'Categories for Block 7 Night Canteen'

    def __str__(self):
        return self.name

class NC2Products(models.Model):

    #item id of each item in the menu will be its primary key
    name = models.CharField(max_length=200)
    price = models.IntegerField()
    filter=models.ForeignKey(NC2Filters ,on_delete=models.CASCADE)
    veg=models.BooleanField(default=True)
    currently_present=models.BooleanField()

    class Meta(object):
        verbose_name_plural = 'Menu items of Block 7 Night Canteen'

    def __str__(self):
        return self.name

class PaidOrdersNC2(models.Model):  # each object of this model represents a successfully created order in NC2
    ph_no = models.BigIntegerField()
    gpay_ph_no = models.BigIntegerField()
    block = models.CharField(max_length=15)
    order_comments = models.TextField(null=True, blank=True)
    item_name = models.TextField()
    price = models.TextField()
    quantity = models.TextField()
    MY_CHOICES = (('a','Pending'),('b','Delivered'),('c','Rejected'))
    filters = models.CharField(choices=MY_CHOICES, default='Delivered', max_length=1)

    class Meta(object):
        verbose_name_plural = 'List of orders created - Block 7 Night Canteen'

    def __str__(self):
        return 'Order number - ' + str(self.pk)

class NC3Filters(models.Model):
    name=models.CharField(max_length=100)

    class Meta(object):
        verbose_name_plural = 'Categories for Girl\'s Block Night Canteen'

    def __str__(self):
        return self.name

class NC3Products(models.Model):
    #item id of each item in the menu will be its primary key
    name = models.CharField(max_length=200)
    price = models.IntegerField()
    filter=models.ForeignKey(NC3Filters ,on_delete=models.CASCADE)
    veg=models.BooleanField(default=True)
    currently_present=models.BooleanField()

    class Meta(object):
        verbose_name_plural = 'Menu items of Girl\'s Block Night Canteen'

    def __str__(self):
        return self.name

class PaidOrdersNC3(models.Model):  # each object of this model represents a successfully created order in NC3
    ph_no = models.BigIntegerField()
    gpay_ph_no = models.BigIntegerField()
    block = models.CharField(max_length=15)
    order_comments = models.TextField(null=True, blank=True)
    item_name = models.TextField()
    price = models.TextField()
    quantity = models.TextField()
    MY_CHOICES = (('a','Pending'),('b','Delivered'),('c','Rejected'))
    filters = models.CharField(choices=MY_CHOICES, default='Delivered', max_length=1)

    class Meta(object):
        verbose_name_plural = 'List of orders created - Girl\'s Block Night Canteen'

    def __str__(self):
        return 'Order number - ' + str(self.pk)
