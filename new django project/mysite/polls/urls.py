from django.urls import path
from . import views

app_name = 'polls'
urlpatterns = [
    path('<int:nc_id>/', views.nc_page, name="NC Page"),
    path('addtocart/<int:ncid>/<int:item_id>', views.add, name="Add to Cart"),
    path('removefromcart/<int:ncid>/<int:item_id>', views.remove, name="Remove from Cart"),
    path('checkout/<int:nc_id>', views.checkout, name="NC Checkout"),
    path('orderplaced/<int:nc_id>/<int:total>', views.orderplaced, name="orderplaced"),

]
