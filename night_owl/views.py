from django.shortcuts import render
from django.http import HttpResponse, HttpResponseRedirect
from django.urls import reverse
from django.conf import settings
from django.contrib import messages
import datetime
from django.db import connection, transaction

from night_owl.models import NC1Products, NC2Products, NC3Products, PaidOrdersNC1, PaidOrdersNC2, PaidOrdersNC3
from .forms import CheckoutForm

def dictfetchall(cursor):
    "Return all rows from a cursor as a dict"
    columns = [col[0] for col in cursor.description]
    return [
        dict(zip(columns, row))
        for row in cursor.fetchall()
    ]

def home(request):

    return render(request, "night_owl/index.html")

def nc_page(request, nc_id):
    cart = request.session.get('cart',{})

    # MySQL
    with connection.cursor() as cursor:
        cursor.execute("SELECT * FROM night_owl_nc%sproducts", [nc_id])
        dishes = dictfetchall(cursor)


    if request.method == "POST":
        item_id = request.POST.get("item_id")
        qty = request.POST.get("qty")
        add = request.POST.get("add")

        # MySQL
        with connection.cursor() as cursor:
            cursor.execute("SELECT * FROM night_owl_nc%sproducts WHERE id=%s", [nc_id, item_id])
            product = dictfetchall(cursor)[0]

        itemID = str(item_id)

        if (itemID not in cart) and (add == "True"):
            cart[itemID] = {
                            'NC_ID': nc_id,
                            'name': product['name'],
                            'price': product['price'],
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

        # if (cart['nc_id'] and len(cart)<3) or len(cart)<1:
        #     request.session.flush()
        #     cart = request.session.get('cart',{})

        context = {'nc_id': nc_id,
                   'cart': cart ,
                   'dishes':dishes}

        return render(request, 'night_owl/cart-table.html', context)

    context = {'nc_id': nc_id,
               'cart': cart ,
               'dishes':dishes}

    return render(request, 'night_owl/nc-page.html', context)

def checkout(request):
    if request.method == "POST":
        cart = request.session.get('cart', {})
        cart_items = {}

        if 'Submit' not in request.POST:
            nc_id = int(request.POST.get('nc_id'))

            total = 0

            for item, temp in cart.items():
                if not isinstance(temp, dict):
                    continue

                if temp['NC_ID'] == nc_id:
                    total += cart[item]['price'] * cart[item]['quantity']
                    cart_items[item] = cart[item]

            cart['nc_id'] = nc_id
            cart['total'] = total

            request.session['cart'] = cart
            form = CheckoutForm()

            context = { 'cart': cart,
                        'form': form,
                        'cart_items': cart_items }
            return render(request, 'night_owl/checkout.html', context)

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
                        if not isinstance(temp, dict):
                            continue

                        if temp['NC_ID'] == nc_id:
                            cart_items[item] = cart[item]

                    context = { 'cart': cart,
                        'form': form,
                        'cart_items': cart_items }

                    return render(request, 'night_owl/checkout.html', context)

                Item_id = []
                Item_name = []
                Price = []
                Quantity = []

                for item in cart:

                    if not isinstance(cart[item], dict):
                        continue

                    if cart[item]['NC_ID'] == nc_id:
                        
                        Item_id.append(int(item))
                        Item_name.append(cart[item]['name'])
                        Price.append(int(cart[item]['price']))
                        Quantity.append(int(cart[item]['quantity']))

                user_id = request.user.id
                filters = 'a'

                # MySQL
                # Wrapping the transaction in try/catch block to perform action in case 
                # of failure at any point
                try:

                    with transaction.atomic():  # Django's encapsulation of a MySQL transaction.

                        with connection.cursor() as cursor:

                            str_order_details = "Item Name - Quantity - Price Per Item\n\n"

                            for i in range (len(Item_name)):
                                str_order_details += str(Item_name[i]) + '  -  ' + str(Quantity[i]) + '  - Rs.  ' + str(Price[i]) + '\n'
                                

                            cursor.callproc ('CreatePaidOrder', [nc_id, user_id, phno, block, gpay_phno, order_comments, str_order_details, filters])
                            
                            
                            cursor.execute('''

                                SELECT LAST_INSERT_ID();

                                '''
                            )

                            order_id = cursor.fetchone()[0]
                            
                            for i in range (len (Item_name)):

                                cursor.execute('''

                                    INSERT INTO night_owl_nc%sorderdetails (order_id, product_id, quantity, total_price)
                                    VALUES (%s, %s, %s, %s);

                                    ''',  [nc_id, order_id, Item_id[i], Quantity[i], (Quantity[i] * Price[i])]
                                )

                except Exception as e:
                    return render(request, 'night_owl/failure.html', {'e': e})
                    

                request.session.flush()  # clears the cart after order has been placed.
                return render(request, 'night_owl/success.html', {'time': datetime.datetime.now()})


def view_orders (request):

    # Display all the
    if not (request.is_authenticated and request.user.is_staff):
        return HttpResponse("You don't have access to this")

    nc_id = 0

    if request.user.username == 'nc1admin':
        nc_id = 1
    if request.user.username == 'nc2admin':
        nc_id = 2
    if request.user.username == 'nc3admin':
        nc_id = 3

    # if the staff has selected a order status filter to apply
    if request.filters:

        with connection.cursor() as cursor:

            cursor.execute('''

                SELECT * FROM night_owl_paidordersnc%s WHERE filters=%s;

                ''',  [nc_id, request.filters]
            )

            data = dictfetchall(cursor)
    
    # without filters
    else:

        with connection.cursor() as cursor:

            cursor.execute('''

                SELECT * FROM night_owl_paidordersnc%s;

                ''',  [nc_id]
            
            )

            data = dictfetchall(cursor)

    return render(request, 'night_owl/staff_page.html', data)


def view_order_details (request):

    # Display all the
    if not (request.is_authenticated and request.user.is_staff):
        return HttpResponse("You don't have access to this")

    nc_id = 0

    if request.user.username == 'nc1admin':
        nc_id = 1
    if request.user.username == 'nc2admin':
        nc_id = 2
    if request.user.username == 'nc3admin':
        nc_id = 3

    with connection.cursor() as cursor:

        cursor.execute('''

            SELECT * FROM night_owl_nc%sorderdetails WHERE order_id=%s;

            ''',  [nc_id, request.order_id]
        )

        data = dictfetchall(cursor)


    return render(request, 'night_owl/order_details_page.html', data)


def edit_menu (request):

    # Display all the
    if not (request.is_authenticated and request.user.is_staff):
        return HttpResponse("You don't have access to this")

    nc_id = 0

    if request.user.username == 'nc1admin':
        nc_id = 1
    if request.user.username == 'nc2admin':
        nc_id = 2
    if request.user.username == 'nc3admin':
        nc_id = 3

    with connection.cursor() as cursor:

        cursor.execute('''

            SELECT * FROM night_owl_nc%sproducts;

            ''',  [nc_id]
        )

        data = dictfetchall(cursor)

        if request.action == 'delete':
            cursor.execute('''

                DELETE FROM night_owl_nc%sproducts WHERE id=%s;

                ''',  [nc_id, request.item_id]
            )

        elif request.action == 'update':
            cursor.execute('''

                UPDATE night_owl_nc%sproducts 
                SET name=%s, price=%s, veg=%s, currently_present=%s, filter=%s 
                WHERE id=%s;

                ''',  [nc_id, request.name, request.price, request.currently_present, request.filter, request.item_id]
            )


    return render(request, 'night_owl/edit_menu_page.html', data)