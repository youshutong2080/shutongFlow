
## 介绍
该系统为[loonflow](https://github.com/blackholll/loonflow)第三方调用程序，可以理解为OA、运维系统、客服系统、请假申请系统。     
本系统使用Vue.js + Django开发，前端展示由loonflow配置决定，可以说前端是全动态，只需要配置好loonflow即可。如果您有使用上的问题可以加入我们：QQ(558788490)。

## 展示
> 新建工单页
> ![create-ticket](https://github.com/youshutong2080/shutongFlow/blob/master/docs/images/create-ticket.png)

> 代办列表页
> ![todo-list](https://github.com/youshutong2080/shutongFlow/blob/master/docs/images/todo-list.png)

> 详情页
> ![detail-ticket](https://github.com/youshutong2080/shutongFlow/blob/master/docs/images/detail-ticket.png)


## 部署
shutongflow当前定位还是作为loonflow调用方的demo(只实现了调用方简单功能)，所以暂时只给出开发环境启动方式。如果你基于shutongflow做了二次开发。
相信你已经知道如何生成环境部署shutongflow

### shutongFlow
```bash
# 按照loonflow的文档启动loonflow

## 这里使用conda作为虚拟环境，如果你使用virtualenv只是激活命令不一样；
Webb@MacBookPro ~/Developer/Python/loonflow/loonflow$ source activate loonflow
(loonflow) Webb@MacBookPro ~/Developer/Python/loonflow/loonflow$ pip install -r apps/requirements.txt

# 初始化数据库
Webb@MacBookPro ~/Developer$ mysql -uroot
> create database shutongflow default charset utf8;
> grant all privileges on shutongflow.* to shutongflow@127.0.0.1 identified by '123456';

(shutongflow) Webb@MacBookPro ~/Developer/Python/loonflow/shutongFlow/apps$ python manage.py makemigrations
(shutongflow) Webb@MacBookPro ~/Developer/Python/loonflow/shutongFlow/apps$ python manage.py migrate

## 导入shutongflow的初始数据
(shutongflow) Webb@MacBookPro ~/Developer/Python/loonflow/shutongFlow$ mysql -uroot shutongflow < shutongflow.sql

## 修改shutongflow中的配置
Webb@MacBookPro ~/Developer/Python/loonflow/loonflow/apps/apps/$ vim settings.py
修改loonflow的信息
WORKFLOWBACKENDURL = "http://127.0.0.1:6060"  # loonflow的启动地址及端口
WORKFLOWTOKEN = "8cd585da-3cc6-11e8-9946-784f437daad6"  # loonflow管理后台中"用户及权限"-"调用权限"中记录的token
WORKFLOWAPP="ops" # loonflow管理后台中"用户及权限"-"调用权限"中记录的应用名

## 启动shutongFlow
(loonflow) Webb@MacBookPro ~/Developer/Python/loonflow/loonflow$ python manage.py runserver 0.0.0.0:6060 # 启动loonflow
(shutongflow) Webb@MacBookPro ~/Developer/Python/loonflow/shutongFlow/apps$ python manage.py runserver 0.0.0.0:6062 # 启动shutongflow

## 启动vue
(shutongflow) Webb@MacBookPro ~/Developer/Python/loonflow/shutongFlow/fronted$ npm install .
(shutongflow) Webb@MacBookPro ~/Developer/Python/loonflow/shutongFlow/fronted$ npm run dev

# 如果提示npm包有安全提示可以使用以下命令进行修复
(shutongflow) Webb@MacBookPro ~/Developer/Python/loonflow/shutongFlow/fronted$ npm audit fix
(shutongflow) Webb@MacBookPro ~/Developer/Python/loonflow/shutongFlow/fronted$ npm audit fix --force
```

## 登陆

shutongFlow中所有普通用户

- 'webb': `asdasd`，    
- 'ops': `asdasd`，   
- 'hr': `asdasd`，   
- 'scm': `asdasd`，   
- 'webb': `asdasd`，   
- 'lilian': `asdasd`，   
- 'david': `asdasd`   

管理员为    
'admin': `yxuqtr`

## 注意
使用shutongflow中用户创建工单前先检查改用户是否在loonflow中存在。以下情况会有问题:
1. 所选的工作流工单创建后的状态的处理人类型是创建人tl，而创建人在loonflow中不存在。因为loonflow在创建或处理
工单会在loonflow的用户记录找到这个用户，然后找到这个用户的所在部门，再找到这个部门的审批人或者leader

