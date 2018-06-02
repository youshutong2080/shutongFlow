from account.models import ShutongUser
from rest_framework import serializers


class FetchAccountUserSerializer(serializers.ModelSerializer):

    class Meta:
        model = ShutongUser
        fields = ['id', 'username', 'alias']