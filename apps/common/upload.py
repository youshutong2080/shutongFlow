
import uuid
import time
import os
from PIL import Image
from django.conf import settings

def uploadfile(fileObj ,file_type='pic'):
    """ 一个公用的上传文件的处理 """
    resp = ''
    if fileObj:
        filename = fileObj.name.decode('utf-8', 'ignore')
        fileExt = filename.split('.')[1]
        file_name = str(uuid.uuid1())
        subfolder = time.strftime("%Y%m")
        if not os.path.exists(settings.MEDIA_ROOT[0] + subfolder):
            os.makedirs(settings.MEDIA_ROOT[0] + subfolder)
        path = str(subfolder + '/' + file_name + '.' + fileExt)

        if fileExt.lower() in ('jpg', 'jpeg', 'bmp', 'gif', 'png', "rar", "doc", "docx", "zip", "pdf", "txt", "swf", "wmv"):

            phisypath = settings.MEDIA_ROOT[0] + path
            destination = open(phisypath, 'wb+')
            for chunk in fileObj.chunks():
                destination.write(chunk)
            destination.close()

            if file_type == 'pic':
                if fileExt.lower() in ('jpg', 'jpeg', 'bmp', 'gif', 'png'):
                    im = Image.open(phisypath)
                    im.thumbnail((720, 720))
                    im.save(phisypath)

            real_url = '/static/upload/' + subfolder + '/' + file_name + '.' + fileExt
            resp = "{'original':'%s','url':'%s','title':'%s','state':'%s'}" % (
            filename, real_url, 'source_file_tile', 'SUCCESS')
    return resp