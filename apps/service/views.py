
import os
import time
import requests
import simplejson
from django.conf import settings
from django.http.response import HttpResponse, HttpResponseBadRequest
from django.views.decorators.csrf import csrf_exempt
from rest_framework.views import APIView
from rest_framework.viewsets import ViewSet
from rest_framework.response import Response
from rest_framework.decorators import action
from rest_framework import status
from rest_framework.permissions import IsAuthenticated, AllowAny
from rest_framework.authentication import BasicAuthentication
from rest_framework_jwt.authentication import JSONWebTokenAuthentication
from service.serializers import LoonFlowAttachmentSerializer
from common.upload import uploadfile


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


@csrf_exempt
def ueditor_index(request):
    action = request.GET.get('action', '')
    if action == 'config':
        setting = settings.UEDITER_SETTING
        return HttpResponse(simplejson.dumps(setting), content_type='text/html; charset=utf-8')
    elif action == 'uploadfile':
        return HttpResponse(ueditor_uploadfile(request))
    elif action == 'uploadimage':
        return HttpResponse(ueditor_uploadimage(request))
    else:
        return HttpResponseBadRequest()


def format_file_name(name):
    '''
    去掉名称中的url关键字
    '''
    URL_KEY_WORDS = ['#', '?', '/', '&', '.', '%']
    for key in URL_KEY_WORDS:
        name_list = name.split(key)
        name = ''.join(name_list)
    return name


def upload_file(file_obj, file_type='pic'):
    if file_obj:
        filename = file_obj.name
        # filename = file_obj.name.decode('utf-8', 'ignore')
        filename_list = filename.split('.')
        file_postfix = filename_list[-1]  # 后缀
        # if file_postfix in ['txt', 'sql']:
        filename_list_clean = filename_list[:-1]
        file_name = ''.join(filename_list_clean) + str(int(time.time() * 1000))
        file_name = format_file_name(file_name)
        # else:
        #     file_name = str(uuid.uuid1())
        sub_folder = time.strftime("%Y%m")
        upload_folder = os.path.join(settings.MEDIA_ROOT, 'upload', sub_folder)
        if not os.path.exists(upload_folder):
            os.makedirs(upload_folder)
        absolute_path = os.path.join(upload_folder, file_name) + '.%s' % file_postfix
        if file_postfix.lower() in (
        "sql", "jpg", "jpeg", "bmp", "gif", "png", "xls", "xlsx", "rar", "doc", "docx", "zip", "pdf", "txt", "swf",
        "wmv"):
            destination = open(absolute_path, 'wb+')
            for chunk in file_obj.chunks():
                destination.write(chunk)
            destination.close()

            # if file_type == 'pic':  #暂不剪切图片
            #     if file_postfix.lower() in ('jpg', 'jpeg', 'bmp', 'gif', 'png'):
            #         im = Image.open(absolute_path)
            #         im.thumbnail((720, 720))
            #         im.save(absolute_path)

            real_url = os.path.join('/media/', 'upload', sub_folder, file_name) + '.%s' % file_postfix
            response_dict = {'original': filename, 'url': real_url, 'title': 'source_file_tile', 'state': 'SUCCESS',
                             'msg': ''}
        else:
            response_dict = {'original': filename, 'url': '', 'title': 'source_file_tile', 'state': 'FAIL',
                             'msg': 'invalid file format'}
    else:
        response_dict = {'original': '', 'url': '', 'title': 'source_file_tile', 'state': 'FAIL',
                         'msg': 'invalid file obj'}
    return simplejson.dumps(response_dict)


@csrf_exempt
def ueditor_uploadimage(request):
    """
    上传图片
    :param request:
    :return:
    """
    fileObj = request.FILES.get('upfile', None)
    response = upload_file(fileObj, 'pic')
    return HttpResponse(response)


@csrf_exempt
def ueditor_uploadfile(request):
    """ 上传文件 """
    fileObj = request.FILES.get('upfile', None)
    response = upload_file(fileObj, 'file')
    return HttpResponse(response)
