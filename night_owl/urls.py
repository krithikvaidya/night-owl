from django.urls import path
from . import views

app_name = 'night_owl'
urlpatterns = [
    path('', views.home, name="Home"),
    path('nc=<int:nc_id>/', views.nc_page, name="NC Page"),
    path('checkout/', views.checkout, name="NC Checkout"),
]
