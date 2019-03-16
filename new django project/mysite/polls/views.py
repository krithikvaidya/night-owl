from django.shortcuts import render
from django.http import HttpResponse, HttpResponseRedirect
from django.urls import reverse
from django.conf import settings
from django.contrib import messages

from polls.models import NC1Products, NC2Products, NC3Products, PaidOrdersNC1, PaidOrdersNC2
from polls.models import PaidOrdersNC3,NC1Filters,NC2Filters, NC3Filters

def nc_page(request, nc_id):
    cart = request.session.get('cart',{})
    request.session['cart'] = cart
    if(nc_id==1):
        dishes=NC1Products.objects.all()
        filters=NC1Filters.objects.all()
    elif(nc_id==2):
        dishes=NC2Products.objects.all()
        filters=NC2Filters.objects.all()
    else:
        dishes=NC3Products.objects.all()
        filters=NC3Filters.objects.all()

    context = {'nc_id': nc_id,
               'cart': cart ,
               'dishes':dishes,
               'filters':filters}
    return render(request, 'polls/nc-page.html', context)

def add(request, ncid, item_id):
    """
    Add new product to cart, or update quantity of item already in cart.
    """
    if ncid == 1:
        product = NC1Products.objects.get(pk=item_id)
    elif ncid == 2:
        product = NC2Products.objects.get(pk=item_id)
    elif ncid == 3:
        product = NC3Products.objects.get(pk=item_id)

    if request.method=="POST":
        cart = request.session.get('cart', {})
        itemID = str(item_id)

        if itemID not in cart:
            cart[itemID] = {
                            'NC_ID': ncid,
                            'name': product.name,
                            'price': product.price,
                            'quantity': 0,
                           }

        cart[itemID]['quantity'] += 1

    request.session['cart'] = cart
    context = { 'nc_id': ncid,
                'cart': cart }
    return render(request, 'polls/nc-page.html', context)

def remove(request, ncid, item_id):
    """
    Add new product to cart, or update quantity of item already in cart.
    """
    if ncid == 1:
        product = NC1Products.objects.get(pk=item_id)
    elif ncid == 2:
        product = NC2Products.objects.get(pk=item_id)
    elif ncid == 3:
        product = NC3Products.objects.get(pk=item_id)

    if request.method=="POST":
        cart = request.session.get('cart', {})
        itemID = str(item_id)

        if itemID not in cart:
            messages.error(request, 'This item does not exist in your cart')

        elif itemID in cart and cart[itemID]['quantity'] == 1:
            del cart[itemID]  # deletes the item from cart

        else:
            cart[itemID]['quantity'] -= 1

    request.session['cart'] = cart
    context = {'nc_id': ncid,
               'cart': cart }
    return render(request, 'polls/nc-page.html', context)

def checkout(request, nc_id):
    cart = request.session.get('cart', {})
    total = 0

    for item, hmm in cart.items():
        if hmm['NC_ID'] == nc_id:
            total += cart[item]['price'] * cart[item]['quantity']

    request.session['cart'] = cart

    context = { 'nc_id': nc_id,
                'cart': cart,
                'total': total }

    return render(request, 'polls/checkout.html', context)

def orderplaced(request, nc_id, total):
    if request.method=="POST":
        phno = request.POST.get('ph_no')
        block = request.POST.get('block')
        gpayph = request.POST.get('gpay_ph_no')

        cart = request.session.get('cart', {})

        Item_name = []
        Price = []
        Quantity = []

        for item in cart:
            if cart[item]['NC_ID'] == nc_id:
                Item_name.append(cart[item]['name'])
                Price.append(str(cart[item]['price']))
                Quantity.append(str(cart[item]['quantity']))

        str_item_name = '\n'
        str_price = '\n'
        str_quantity = '\n'

        str_item_name = str_item_name.join(Item_name)
        str_price = str_price.join(Price)
        str_quantity = str_quantity.join(Quantity)

        if nc_id == 1:
            PaidOrdersNC1.objects.create(item_name=str_item_name, price=str_price, quantity=str_quantity, ph_no=phno, block=block, gpay_ph_no=gpayph)
        elif nc_id == 2:
            PaidOrdersNC2.objects.create(item_name=str_item_name, price=str_price, quantity=str_quantity, ph_no=phno, block=block, gpay_ph_no=gpayph)
        elif nc_id == 3:
            PaidOrdersNC3.objects.create(item_name=str_item_name, price=str_price, quantity=str_quantity, ph_no=phno, block=block, gpay_ph_no=gpayph)

        request.session.flush()  # clears the cart after order has been placed.
        return render(request, 'polls/success.html')
