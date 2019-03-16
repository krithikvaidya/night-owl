from django.urls import path
from . import views

app_name = 'polls'
urlpatterns = [
    path('<int:nc_id>/', views.nc_page, name="NC Page"),
    path('addtocart/', views.add, name="Add to Cart"),
    path('checkout/', views.checkout, name="NC Checkout"),
    path('orderplaced/', views.orderplaced, name="orderplaced"),
    
]