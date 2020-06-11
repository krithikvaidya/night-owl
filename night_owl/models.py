
from django.contrib.auth.models import (
    AbstractBaseUser, BaseUserManager, PermissionsMixin
)
from django.db import models
from django.utils import timezone
from django.utils.translation import gettext_lazy as _


class UserManager(BaseUserManager):
    def create_user(
            self, username, first_name, last_name, ph_no, gpay_ph_no, password=None,
            commit=True):
        """
        Creates and saves a User with the given username, first name, last name
        and password.
        """
        if not username:
            raise ValueError(_('Users must have a username'))
        if not first_name:
            raise ValueError(_('Users must have a first name'))
        if not last_name:
            raise ValueError(_('Users must have a last name'))
        if not ph_no:
            raise ValueError(_('Users must have a last name'))
        if not gpay_ph_no:
            raise ValueError(_('Users must have a last name'))

        user = self.model(
            username=username,
            first_name=first_name,
            last_name=last_name,
            ph_no=ph_no,
            gpay_ph_no=gpay_ph_no,
        )

        user.set_password(password)
        if commit:
            user.save(using=self._db)
        return user

    def create_superuser(self, username, first_name, last_name, ph_no, gpay_ph_no, password):
        """
        Creates and saves a superuser with the given username, first name,
        last name and password.
        """
        user = self.create_user(
            username,
            password=password,
            first_name=first_name,
            last_name=last_name,
            ph_no=ph_no,
            gpay_ph_no=gpay_ph_no,
            commit=False,
        )
        user.is_staff = True
        user.is_superuser = True
        user.save(using=self._db)
        return user


class User(AbstractBaseUser, PermissionsMixin):

    username = models.CharField(_('username'), max_length=50, unique=True)
    # password field supplied by AbstractBaseUser
    # last_login field supplied by AbstractBaseUser
    first_name = models.CharField(_('first name'), max_length=30, blank=True)
    last_name = models.CharField(_('last name'), max_length=150, blank=True)

    ph_no = models.BigIntegerField()
    gpay_ph_no = models.BigIntegerField()

    is_active = models.BooleanField(
        _('active'),
        default=True,
        help_text=_(
            'Designates whether this user should be treated as active. '
            'Unselect this instead of deleting accounts.'
        ),
    )
    is_staff = models.BooleanField(
        _('staff status'),
        default=False,
        help_text=_(
            'Designates whether the user can log into this admin site.'
        ),
    )
    # is_superuser field provided by PermissionsMixin
    # groups field provided by PermissionsMixin
    # user_permissions field provided by PermissionsMixin

    date_joined = models.DateTimeField(
        _('date joined'), default=timezone.now
    )

    objects = UserManager()

    USERNAME_FIELD = 'username'
    REQUIRED_FIELDS = ['first_name', 'last_name', 'ph_no', 'gpay_ph_no']

    def get_full_name(self):
        """
        Return the first_name plus the last_name, with a space in between.
        """
        full_name = '%s %s' % (self.first_name, self.last_name)
        return full_name.strip()

    def __str__(self):
        return '{} <{}>'.format(self.get_full_name(), self.username)

    def has_perm(self, perm, obj=None):
        "Does the user have a specific permission?"
        # Simplest possible answer: Yes, always
        return True

    def has_module_perms(self, app_label):
        "Does the user have permissions to view the app `app_label`?"
        # Simplest possible answer: Yes, always
        return True

    
class NC1Products(models.Model):

    #item id of each item in the menu will be its primary key
    name = models.CharField(max_length=200)
    price = models.IntegerField()
    veg=models.BooleanField(default=True)
    currently_present=models.BooleanField()
    MY_CHOICES = ((1,'Hot and Cold Beverages'),(2,'Dosa Items'), (3, 'Sandwiches Bar'))
    filter = models.IntegerField(choices=MY_CHOICES)

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
    filters = models.CharField(choices=MY_CHOICES, default='a', max_length=10)

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
    MY_CHOICES = ((1,'Hot and Cold Beverages'),(2,'Dosa Items'), (3, 'Sandwiches Bar'))
    filter = models.IntegerField(choices=MY_CHOICES)
    

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
    filters = models.CharField(choices=MY_CHOICES, default='a', max_length=10)

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
    MY_CHOICES = ((1,'Noodle Items'),(2,'Rice Items'))
    filter = models.IntegerField(choices=MY_CHOICES)

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
    filters = models.CharField(choices=MY_CHOICES, default='a', max_length=10)

    class Meta(object):
        verbose_name_plural = 'List of orders created - Girl\'s Block Night Canteen'

    def __str__(self):
        return 'Order number - ' + str(self.pk)
