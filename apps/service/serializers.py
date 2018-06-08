from rest_framework import serializers


class LoonFlowAttachmentSerializer(serializers.Serializer):
    attachment = serializers.FileField(allow_null=True, use_url=True)