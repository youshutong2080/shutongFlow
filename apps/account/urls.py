from django.urls import path
from account.views import ShutongObtainJSONWebToken

urlpatterns = [
    path('obtain_token/', ShutongObtainJSONWebToken.as_view())
]