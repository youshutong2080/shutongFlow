
## 介绍
该系统为[loonflow](https://github.com/blackholll/loonflow)第三方调用程序，可以理解为OA或运维工单系统。     
本系统使用Vue.js + Django开发，前端展示由loonflow配置决定，可以说前端是全动态，只需要配置好loonflow即可。如果您有使用上的问题可以加入我们：QQ(558788490)。

## 展示
> 新建工单页
> ![create-ticket](https://github.com/youshutong2080/shutongFlow/blob/master/docs/images/create-ticket.png)

> 代办列表页
> ![todo-list](https://github.com/youshutong2080/shutongFlow/blob/master/docs/images/todo-list.png)

> 详情页
> ![detail-ticket](https://github.com/youshutong2080/shutongFlow/blob/master/docs/images/detail-ticket.png)


## 进度

#### 完成申请说明富文本编辑器 2018-06-08 23:22:00
- 新增附件和图片上传接口；
- 配置UEditor正常使用；
- 重新优化交互体验；

#### 待办
- 前端展示附件及图片；
- 配置ldap实例同步脚本；

## 提示：
- 建议重新拉取代码，并重新配置数据库及服务；

## 部署
### shutongFlow
```bash
## 这里使用conda作为虚拟环境，如果你使用virtualenv只是激活命令不一样；
Webb@MacBookPro ~/Developer/Python/loonflow/loonflow$ source activate loonflow
(loonflow) Webb@MacBookPro ~/Developer/Python/loonflow/loonflow$ pip install -r apps/requirements.txt

# 初始化数据库
(loonflow) Webb@MacBookPro ~/Developer/Python/loonflow/loonflow$ mysql -uroot
> create database shutongflow default charset utf8;
> create database loonflownew default charset utf8;
> grant all privileges on shutongflow.* to shutongflow@127.0.0.1 identified by '123456';
> grant all privileges on loonflownew.* to loonflownew@127.0.0.1 identified by '123456';

(loonflow) Webb@MacBookPro ~/Developer/Python/loonflow/loonflow$ python manage.py makemigrations
(loonflow) Webb@MacBookPro ~/Developer/Python/loonflow/loonflow$ python manage.py migrate

(shutongflow) Webb@MacBookPro ~/Developer/Python/loonflow/shutongFlow/apps$ python manage.py makemigrations
(shutongflow) Webb@MacBookPro ~/Developer/Python/loonflow/shutongFlow/apps$ python manage.py migrate

## 导入第三方数据（这里主要是用户数据）
(loonflow) Webb@MacBookPro ~/Developer/Python/loonflow/shutongFlow$ mysql -uroot shutongflow < shutongflow.sql
## 导入loonflow数据（配置数据及用户数据）
(loonflow) Webb@MacBookPro ~/Developer/Python/loonflow/shutongFlow$ mysql -uroot loonflownew < loonflownew.sql

## 启动shutongFlow和loonflow
(loonflow) Webb@MacBookPro ~/Developer/Python/loonflow/loonflow$  python manage.py runserver 0.0.0.0:6060 # 启动loonflow
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
