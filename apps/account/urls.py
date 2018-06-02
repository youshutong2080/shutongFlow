from django.urls import path
from rest_framework.routers import DefaultRouter
from account.views import AccountUserViewSet
from account.views import ShutongObtainJSONWebToken

router = DefaultRouter()
router.register('users', AccountUserViewSet, 'users')

urlpatterns = [
    path('obtain_token/', ShutongObtainJSONWebToken.as_view())
]

urlpatterns += router.urls