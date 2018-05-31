
import simplejson
import requests
from rest_framework.views import APIView
from rest_framework.viewsets import ViewSet
from rest_framework.response import Response
from rest_framework import status
from rest_framework.permissions import IsAuthenticated, AllowAny
from rest_framework.authentication import BasicAuthentication
from rest_framework_jwt.authentication import JSONWebTokenAuthentication


class LoonFlowAPIView(APIView):
    authentication_classes = [JSONWebTokenAuthentication, BasicAuthentication]
    permission_classes = [IsAuthenticated]

    def get(self, request, format='json'):
        resp = requests.get('http://localhost:6060/api/v1.0/workflows').text
        resp = simplejson.loads(resp)
        if resp['code'] == 0:
            status_resp = status.HTTP_200_OK
            return Response({'code': resp['code'], 'data': resp['data'], 'msg': resp['msg']},
                            status=status_resp)
        else:
            status_resp = status.HTTP_400_BAD_REQUEST
            return Response({'code': resp['code'], 'data': None, 'msg': resp['msg']}, status=status_resp)


class LoonFlowInitStateViewSet(ViewSet):
    authentication_classes = [JSONWebTokenAuthentication, BasicAuthentication]
    permission_classes = [IsAuthenticated]

    def retrieve(self, request, pk=None):
        username = request.user.username
        resp = requests.get('http://localhost:6060/api/v1.0/workflows/{}/init_state?username={}'.format(pk, username)).text
        resp = simplejson.loads(resp)
        if resp['code'] == 0:
            status_resp = status.HTTP_200_OK
            return Response({'code': resp['code'], 'data': resp['data'], 'msg': resp['msg']},
                            status=status_resp)
        else:
            status_resp = status.HTTP_400_BAD_REQUEST
            return Response({'code': resp['code'], 'data': None, 'msg': resp['msg']}, status=status_resp)


class LoonFlowCreateTicketViewSet(ViewSet):
    authentication_classes = [JSONWebTokenAuthentication, BasicAuthentication]
    permission_classes = [IsAuthenticated]

    def create(self, request):
        request.data['username'] = request.user.username
        resp = requests.post('http://localhost:6060/api/v1.0/tickets', data=simplejson.dumps(request.data)).text
        resp = simplejson.loads(resp)
        if resp['code'] == 0:
            status_resp = status.HTTP_200_OK
            return Response({'code': resp['code'], 'data': resp['data'], 'msg': resp['msg']},
                            status=status_resp)
        else:
            status_resp = status.HTTP_400_BAD_REQUEST
            return Response({'code': resp['code'], 'data': None, 'msg': resp['msg']}, status=status_resp)

class LoonFlowTicketViewSet(ViewSet):
    authentication_classes = [JSONWebTokenAuthentication, BasicAuthentication]
    permission_classes = [IsAuthenticated]

    def list(self, request, format='json'):
        username = request.user.username
        category = request.query_params.get('category', None)

        url = 'http://localhost:6060/api/v1.0/tickets?username={}'.format(username)

        if category:
            url += '&category={}'.format(category)

        resp = requests.get(url).text
        resp = simplejson.loads(resp)
        if resp['code'] == 0:
            status_resp = status.HTTP_200_OK
            return Response({'code': resp['code'], 'data': resp['data'], 'msg': resp['msg']},
                            status=status_resp)
        else:
            status_resp = status.HTTP_400_BAD_REQUEST
            return Response({'code': resp['code'], 'data': None, 'msg': resp['msg']}, status=status_resp)

    def retrieve(self, request, pk=None):
        username = request.user.username
        resp = requests.get('http://localhost:6060/api/v1.0/tickets/{}?username={}'.format(pk, username)).text
        resp = simplejson.loads(resp)
        if resp['code'] == 0:
            status_resp = status.HTTP_200_OK
            return Response({'code': resp['code'], 'data': resp['data'], 'msg': resp['msg']},
                            status=status_resp)
        else:
            status_resp = status.HTTP_400_BAD_REQUEST
            return Response({'code': resp['code'], 'data': None, 'msg': resp['msg']}, status=status_resp)

    def partial_update(self, request, pk=None):
        request.data['username'] = request.user.username
        resp = requests.patch('http://localhost:6060/api/v1.0/tickets/{}'.format(pk), data=simplejson.dumps(request.data)).text
        print(resp)
        resp = simplejson.loads(resp)
        if resp['code'] == 0:
            status_resp = status.HTTP_200_OK
            return Response({'code': resp['code'], 'data': resp['data'], 'msg': resp['msg']},
                            status=status_resp)
        else:
            status_resp = status.HTTP_400_BAD_REQUEST
            return Response({'code': resp['code'], 'data': None, 'msg': resp['msg']}, status=status_resp)


class LoonFlowStepViewSet(ViewSet):
    authentication_classes = [JSONWebTokenAuthentication, BasicAuthentication]
    permission_classes = [IsAuthenticated]

    def retrieve(self, request, pk=None):
        username = request.user.username
        resp = requests.get('http://localhost:6060/api/v1.0/tickets/{}/flowsteps?username={}'.format(pk, username)).text
        resp = simplejson.loads(resp)
        if resp['code'] == 0:
            status_resp = status.HTTP_200_OK
            return Response({'code': resp['code'], 'data': resp['data'], 'msg': resp['msg']},
                            status=status_resp)
        else:
            status_resp = status.HTTP_400_BAD_REQUEST
            return Response({'code': resp['code'], 'data': None, 'msg': resp['msg']}, status=status_resp)


class LoonFlowTransitionViewSet(ViewSet):
    authentication_classes = [JSONWebTokenAuthentication, BasicAuthentication]
    permission_classes = [IsAuthenticated]

    def retrieve(self, request, pk=None):
        username = request.user.username
        resp = requests.get('http://localhost:6060/api/v1.0/tickets/{}/flowlogs?username={}'.format(pk, username)).text
        resp = simplejson.loads(resp)
        if resp['code'] == 0:
            status_resp = status.HTTP_200_OK
            return Response({'code': resp['code'], 'data': resp['data'], 'msg': resp['msg']},
                            status=status_resp)
        else:
            status_resp = status.HTTP_400_BAD_REQUEST
            return Response({'code': resp['code'], 'data': None, 'msg': resp['msg']}, status=status_resp)


class LoonFlowTranActionViewSet(ViewSet):
    authentication_classes = [JSONWebTokenAuthentication, BasicAuthentication]
    permission_classes = [IsAuthenticated]

    def retrieve(self, request, pk=None):
        username = request.user.username
        resp = requests.get('http://localhost:6060/api/v1.0/tickets/{}/transitions?username={}'.format(pk, username)).text
        resp = simplejson.loads(resp)
        if resp['code'] == 0:
            status_resp = status.HTTP_200_OK
            return Response({'code': resp['code'], 'data': resp['data'], 'msg': resp['msg']},
                            status=status_resp)
        else:
            status_resp = status.HTTP_400_BAD_REQUEST
            return Response({'code': resp['code'], 'data': None, 'msg': resp['msg']}, status=status_resp)
