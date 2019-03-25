from django.shortcuts import render
from django.http import HttpResponse, HttpResponseRedirect
from django.urls import reverse
from django.conf import settings
from django.contrib import messages
import datetime

from polls.models import NC1Products, NC2Products, NC3Products, PaidOrdersNC1, PaidOrdersNC2, PaidOrdersNC3
from .forms import CheckoutForm

def home(request):
    return render(request, "polls/index.html")

def nc_page(request, nc_id):
    cart = request.session.get('cart',{})

    if(nc_id==1):
        dishes=NC1Products.objects.all()

    elif(nc_id==2):
        dishes=NC2Products.objects.all()

    else:
        dishes=NC3Products.objects.all()

    if request.method == "POST":  # will be true when the user tries to add/remove an item from the cart
        item_id = request.POST.get("item_id")
        qty = request.POST.get("qty")
        add = request.POST.get("add")

        if(nc_id==1):
            product = NC1Products.objects.get(pk=item_id)
        elif(nc_id==2):
            product = NC2Products.objects.get(pk=item_id)
        else:
            product = NC3Products.objects.get(pk=item_id)

        itemID = str(item_id)

        if (itemID not in cart) and (add == "True"):
            cart[itemID] = {
                            'NC_ID': nc_id,
                            'name': product.name,
                            'price': product.price,
                            'quantity': 1,
                           }

        elif (itemID not in cart) and (add == "False"):
            messages.error(request, 'This item does not exist in your cart.')

        elif (itemID in cart) and (add == "True"):
            cart[itemID]['quantity'] += 1

        elif  (itemID in cart) and (add == "False"):
            if cart[itemID]['quantity'] == 1:
                cart.pop(itemID)
            else:
                cart[itemID]['quantity'] -= 1

        request.session['cart'] = cart

        context = { 'nc_id': nc_id,
                    'cart': cart ,
                    'dishes':dishes
                  }

        return render(request, 'polls/cart-table.html', context)

    context = {
                'nc_id': nc_id,
                'cart': cart ,
                'dishes':dishes
              }
                
    return render(request, 'polls/nc-page.html', context)

def checkout(request):
    if request.method == "POST":
        cart = request.session.get('cart', {})
        cart_items = {}

        if 'Submit' not in request.POST:  # if the checkout page has been called from the nc page, not by submitting the form
            nc_id = int(request.POST.get('nc_id'))

            total = 0

            for item, temp in cart.items():  # loops through all the key-value pairs in the session dictionary
                if isinstance(temp, dict):  # checks if the value is a dictionary  
                                            # if it is, then the value is the dictonary containing the cart items

                    if temp['NC_ID'] == nc_id:  # checks if each cart item was created from the current NC, not another NC
                        total += cart[item]['price'] * cart[item]['quantity']
                        cart_items[item] = cart[item]

            cart['nc_id'] = nc_id
            cart['total'] = total

            request.session['cart'] = cart
            form = CheckoutForm()

            context = { 'cart': cart,
                        'form': form,
                        'cart_items': cart_items }
            return render(request, 'polls/checkout.html', context)

        else:
            form = CheckoutForm(request.POST)
            if form.is_valid():
                nc_id = int(cart['nc_id'])
                total = int(cart['total'])
                phno = form.cleaned_data['ph_no']
                gpay_phno = form.cleaned_data['gpay_ph_no']
                block = form.cleaned_data['block']
                order_comments = form.cleaned_data['order_comments']

                if (len(str(phno)) != 10) or (len(str(gpay_phno)) != 10):
                    messages.error(request, "Please enter valid 10-digit phone numbers!")

                    for item, temp in cart.items():
                        if isinstance(temp, dict):
                            if temp['NC_ID'] == nc_id:
                                cart_items[item] = cart[item]

                    context = { 'cart': cart,
                        'form': form,
                        'cart_items': cart_items }

                    return render(request, 'polls/checkout.html', context)

                # if all the details entered by the user in the form are valid, the following will execute:
                
                order_details = ""

                for item in cart:
                    if not isinstance(cart[item], dict):
                        continue
                    if cart[item]['NC_ID'] == nc_id:
                        order_details += cart[item]['name'] + ' - ' + str(cart[item]['quantity']) + ' - Rs. ' + str(cart[item]['price'] * cart[item]['quantity']) + '\n'


                if nc_id == 1:
                    PaidOrdersNC1.objects.create(order_details=order_details, ph_no=phno, block=block, gpay_ph_no=gpay_phno, order_comments=order_comments)
                elif nc_id == 2:
                    PaidOrdersNC2.objects.create(order_details=order_details, ph_no=phno, block=block, gpay_ph_no=gpay_phno, order_comments=order_comments)
                elif nc_id == 3:
                    PaidOrdersNC3.objects.create(order_details=order_details, ph_no=phno, block=block, gpay_ph_no=gpay_phno, order_comments=order_comments)

                request.session.flush()  # clears the cart after order has been placed.
                return render(request, 'polls/success.html', {'time': datetime.datetime.now()})
 