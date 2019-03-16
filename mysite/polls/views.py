from django.shortcuts import render, get_object_or_404
from django.http import HttpResponse, HttpResponseRedirect
from django.urls import reverse
from django.conf import settings

from polls.models import Products, PaidOrdersNC1, PaidOrdersNC2, PaidOrdersNC3


"""def __init__(self, session):
    
        Initialize shopping cart.
        
        self.session = session
        cart = self.session.get(settings.CART_SESSION_ID)
        if not cart:
            cart = self.session[settings.CART_SESSION_ID] = {}
        self.cart = cart """

def nc_page(request, nc_id):
    cart = request.session.get('cart',{})
    context = {'nc_id': nc_id,
               'cart': cart }
    return render(request, 'polls/nc-page.html', context)

def add(request, quantity, item_id, nc_id):
    """
    Add new product to cart, or update quantity of item already in cart.
    """
    product = Products.objects.get(pk=item_id)

    if request.method=="POST":
        cart = request.session.get('cart', {})
        itemID = str(itemID)

        if itemID not in cart:
            cart[itemID] = {'quantity': 0,
                                  'price': product.price,
                                  'name': product.name,
                           }
        cart[itemID]['quantity'] += quantity

    return HttpResponseRedirect(reverse('nc_page', args=nc_id))

def checkout(request, nc_id):
    cart = request.session.get('cart', {})
    total = 0

    for item in cart:
        total += item.price * item.quantity
    
    context = { 'nc_id': nc_id, 
                'cart': cart,
                'total': total }

    return render(request, 'polls/checkout.html', context)

def orderplaced(request, nc_id):
    cart = request.session.get('cart', {})
    if nc_id == 1:
        PaidOrdersNC1.objects.create(cart=cart, )
    elif nc_id == 2:
        final_order = get_object_or_404(PaidOrdersNC2, pk=request.POST['id'])
    elif nc_id == 3:
        final_order = get_object_or_404(PaidOrdersNC3, pk=request.POST['id'])
    
    final_order.save()
    return HttpResponseRedirect(reverse('order_place_success', args=(request.POST['id'])))

def order_place_success(request, order_id, Cart):
    context = {'id': order_id}
    Cart.delete()
    return render(request, 'polls/success.html', context)