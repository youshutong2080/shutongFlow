## 进度

#### 第三方调用展示基本完成 2018-05-31 00：37：00

## 部署
### shutongFlow
```bash
## 这里使用conda作为虚拟环境，如果你使用virtualenv只是激活命令不一样；
Webb@MacBookPro ~/Developer/Python/loonflow$ source activate loonflow
(loonflow) Webb@MacBookPro ~/Developer/Python/loonflow$ pip install -r apps/requirements.txt
(loonflow) Webb@MacBookPro ~/Developer/Python/loonflow$ mysql -uroot 
> create database shutong default charset utf8;

(loonflow) Webb@MacBookPro ~/Developer/Python/loonflow$ python manage.py makemigrations
(loonflow) Webb@MacBookPro ~/Developer/Python/loonflow$ python manage.py migrate

## 导入第三方数据（这里主要是用户数据）
(loonflow) Webb@MacBookPro ~/Developer/Python/loonflow$ mysqldump -uroot shutong < third-shutong.sql
## 导入loonflow数据（配置数据及用户数据）
(loonflow) Webb@MacBookPro ~/Developer/Python/loonflow$ mysqldump -uroot loonflownew < loonflownew.sql

## 启动shutongFlow和loonflow
(loonflow) Webb@MacBookPro ~/Developer/Python/loonflow/apps$ python manage.py runserver 0.0.0.0:6062
(loonflow) Webb@MacBookPro ~/Developer/Python/loonflow/loonflow$  python manage.py runserver 0.0.0.0:6060

## 启动vue
(loonflow) Webb@MacBookPro ~/Developer/Python/loonflow/fronted$ npm install .
(loonflow) Webb@MacBookPro ~/Developer/Python/loonflow/fronted$ npm run dev
```

## 登陆

shutongFlow中所有普通用户密码为`asdasd`，管理员为`yxuqtr`