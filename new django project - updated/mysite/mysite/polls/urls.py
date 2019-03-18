from django.urls import path
from . import views

app_name = 'polls'
urlpatterns = [
    path('nc=<int:nc_id>/', views.nc_page, name="NC Page"),
    path('checkout/', views.checkout, name="NC Checkout"),
    path('orderplaced/', views.orderplaced, name="Place Order"),
]