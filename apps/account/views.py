
from django.utils import timezone
from rest_framework_jwt.views import ObtainJSONWebToken


class ShutongObtainJSONWebToken(ObtainJSONWebToken):

    def post(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        if serializer.is_valid():
            userObj = serializer.object.get('user') or request.user
            userObj.last_login = timezone.datetime.now()
            userObj.save()
        return super(ShutongObtainJSONWebToken, self).post(request, *args, **kwargs)
