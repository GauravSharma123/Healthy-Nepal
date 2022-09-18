from django.urls import path

from .views import BloodView, SingleBloodView


app_name = "bloods"

# app_name will help us do a reverse look-up latter.
urlpatterns = [
    path('bloods/', BloodView.as_view()),
    path('bloods/<int:pk>', SingleBloodView.as_view()),
]
