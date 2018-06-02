
from django.utils import timezone
from rest_framework import status
from rest_framework.decorators import action
from rest_framework.response import Response
from rest_framework.viewsets import ViewSet
from rest_framework.permissions import IsAuthenticated
from rest_framework.authentication import BasicAuthentication
from rest_framework_jwt.authentication import JSONWebTokenAuthentication
from rest_framework_jwt.views import ObtainJSONWebToken

from account.models import ShutongUser
from account.serializers import FetchAccountUserSerializer


class ShutongObtainJSONWebToken(ObtainJSONWebToken):

    def post(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        if serializer.is_valid():
            userObj = serializer.object.get('user') or request.user
            userObj.last_login = timezone.datetime.now()
            userObj.save()
        return super(ShutongObtainJSONWebToken, self).post(request, *args, **kwargs)


class AccountUserViewSet(ViewSet):
    authentication_classes = [BasicAuthentication, JSONWebTokenAuthentication]
    permission_classes = [IsAuthenticated]

    @action(methods=['get'], detail=False, url_path='fetch-users')
    def fetch(self, request, format='json'):
        queryset = ShutongUser.objects.all()
        serializer = FetchAccountUserSerializer(queryset, many=True)
        return Response({'code': 0, 'data': serializer.data, 'msg': ''},
                        status=status.HTTP_200_OK)