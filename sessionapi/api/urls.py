from django.urls import path
from .views import *

urlpatterns = [
    path('bysession/', Hello.as_view()),
    path('logout/', Logout.as_view()),
    path('logininfo/', ExampleView.as_view()),
    path('say/', Say.as_view()),
]