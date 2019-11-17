# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.17)
# Database: loonflow_demo1
# Generation Time: 2019-11-17 15:00:05 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table account_apptoken
# ------------------------------------------------------------

DROP TABLE IF EXISTS `account_apptoken`;

CREATE TABLE `account_apptoken` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_name` varchar(50) NOT NULL,
  `token` varchar(50) NOT NULL,
  `creator` varchar(50) NOT NULL,
  `gmt_created` datetime(6) NOT NULL,
  `gmt_modified` datetime(6) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `workflow_ids` varchar(2000) NOT NULL,
  `ticket_sn_prefix` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `account_apptoken` WRITE;
/*!40000 ALTER TABLE `account_apptoken` DISABLE KEYS */;

INSERT INTO `account_apptoken` (`id`, `app_name`, `token`, `creator`, `gmt_created`, `gmt_modified`, `is_deleted`, `workflow_ids`, `ticket_sn_prefix`)
VALUES
	(1,'ops','8cd585da-3cc6-11e8-9946-784f437daad6','admin','2018-04-10 21:53:29.879742','2019-11-17 21:45:12.404485',0,'1,2','loonflow');

/*!40000 ALTER TABLE `account_apptoken` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table account_loondept
# ------------------------------------------------------------

DROP TABLE IF EXISTS `account_loondept`;

CREATE TABLE `account_loondept` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `parent_dept_id` int(11) NOT NULL,
  `leader` varchar(50) NOT NULL,
  `approver` varchar(100) NOT NULL,
  `label` varchar(50) NOT NULL,
  `creator` varchar(50) NOT NULL,
  `gmt_created` datetime(6) NOT NULL,
  `gmt_modified` datetime(6) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `account_loondept` WRITE;
/*!40000 ALTER TABLE `account_loondept` DISABLE KEYS */;

INSERT INTO `account_loondept` (`id`, `name`, `parent_dept_id`, `leader`, `approver`, `label`, `creator`, `gmt_created`, `gmt_modified`, `is_deleted`)
VALUES
	(1,'总部',0,'admin','','','admin','2018-04-10 16:41:27.370288','2018-05-09 07:03:50.473161',0),
	(2,'技术部',1,'lilei','','','admin','2018-04-14 23:37:06.988349','2018-05-09 06:45:27.315309',0),
	(3,'运维部',2,'guiji','','','admin','2018-04-14 23:37:23.932202','2018-05-09 07:03:32.427484',0),
	(4,'支付部',2,'zhangsan','zhangsan,lisi','','admin','2018-04-14 23:37:36.703706','2018-05-09 07:04:53.360398',0),
	(5,'人事部',1,'jack','','','admin','2018-05-09 07:22:09.520164','2018-05-09 07:22:09.520195',0);

/*!40000 ALTER TABLE `account_loondept` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table account_loonrole
# ------------------------------------------------------------

DROP TABLE IF EXISTS `account_loonrole`;

CREATE TABLE `account_loonrole` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `creator` varchar(50) NOT NULL,
  `gmt_created` datetime(6) NOT NULL,
  `gmt_modified` datetime(6) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `account_loonrole` WRITE;
/*!40000 ALTER TABLE `account_loonrole` DISABLE KEYS */;

INSERT INTO `account_loonrole` (`id`, `name`, `description`, `label`, `creator`, `gmt_created`, `gmt_modified`, `is_deleted`)
VALUES
	(1,'VPN管理员','处理VPN申请工单的人员','','admin','2018-05-09 07:06:02.739092','2018-05-09 07:06:02.739132',0);

/*!40000 ALTER TABLE `account_loonrole` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table account_loonuser
# ------------------------------------------------------------

DROP TABLE IF EXISTS `account_loonuser`;

CREATE TABLE `account_loonuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `username` varchar(50) NOT NULL,
  `alias` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(13) NOT NULL,
  `dept_id` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  `creator` varchar(50) NOT NULL,
  `gmt_created` datetime(6) NOT NULL,
  `gmt_modified` datetime(6) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `account_loonuser` WRITE;
/*!40000 ALTER TABLE `account_loonuser` DISABLE KEYS */;

INSERT INTO `account_loonuser` (`id`, `password`, `last_login`, `username`, `alias`, `email`, `phone`, `dept_id`, `is_active`, `is_admin`, `creator`, `gmt_created`, `gmt_modified`, `is_deleted`)
VALUES
	(1,'pbkdf2_sha256$100000$BoQZquZL9sE7$OVm0zb1beQeWkas/IJBgxCkx8fqXlu9S0NamjmibSw0=','2019-11-17 22:47:58.561327','admin','超级管理员','blackholll@163.com','13888888888',1,1,1,'admin','2018-04-10 16:24:50.146642','2018-05-09 07:02:42.221182',0),
	(2,'12222222',NULL,'guiji','轨迹','guiji@163.com','13888888888',3,1,0,'admin','2018-04-14 23:38:18.390197','2018-05-09 07:00:34.120672',0),
	(3,'12222222',NULL,'lilei','李磊','lilei@163.com','13888888888',2,1,0,'admin','2018-04-14 23:42:25.708830','2018-05-09 07:00:27.999012',0),
	(4,'12222222',NULL,'zhangsan','张三','zhangsan@163.com','13888888888',4,1,0,'admin','2018-05-05 22:54:48.910667','2018-05-09 07:02:27.252209',0),
	(5,'pbkdf2_sha256$100000$zGXANjruyXdu$SqwI+v31Cfh8/dtc9Ah4vlCwPYqv2OHEUGxSkrC9HME=',NULL,'lisi','李四','lisi@163.com','13888888888',2,1,0,'admin','2018-05-09 06:58:59.733893','2018-05-09 07:02:52.073569',0),
	(6,'pbkdf2_sha256$100000$h2IARMdK6uA8$sn4S1ZVqqbVl4ON5M2ZWngX8uZXsw2N/JYNZstMPL54=',NULL,'wangwu','王五','wangwu@163.com','13888888888',3,1,0,'admin','2018-05-09 07:01:50.403604','2018-05-09 07:03:03.185105',0),
	(7,'pbkdf2_sha256$100000$qbrmZkc8i9x2$/T3sLArvEccA7gGVytuh7qnu0AnhiDWiXI+XXz66auo=',NULL,'jack','杰克','jack@163.com','13888888888',5,1,0,'admin','2018-05-09 07:22:53.491321','2018-05-09 07:22:53.491356',0);

/*!40000 ALTER TABLE `account_loonuser` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table account_loonuserrole
# ------------------------------------------------------------

DROP TABLE IF EXISTS `account_loonuserrole`;

CREATE TABLE `account_loonuserrole` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `creator` varchar(50) NOT NULL,
  `gmt_created` datetime(6) NOT NULL,
  `gmt_modified` datetime(6) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `account_loonuserrole` WRITE;
/*!40000 ALTER TABLE `account_loonuserrole` DISABLE KEYS */;

INSERT INTO `account_loonuserrole` (`id`, `user_id`, `role_id`, `creator`, `gmt_created`, `gmt_modified`, `is_deleted`)
VALUES
	(1,2,1,'admin','2018-05-09 07:05:32.301883','2018-05-09 07:05:32.301929',0);

/*!40000 ALTER TABLE `account_loonuserrole` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table auth_group
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table auth_group_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table auth_permission
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`)
VALUES
	(1,'Can add log entry',1,'add_logentry'),
	(2,'Can change log entry',1,'change_logentry'),
	(3,'Can delete log entry',1,'delete_logentry'),
	(4,'Can add group',2,'add_group'),
	(5,'Can change group',2,'change_group'),
	(6,'Can delete group',2,'delete_group'),
	(7,'Can add permission',3,'add_permission'),
	(8,'Can change permission',3,'change_permission'),
	(9,'Can delete permission',3,'delete_permission'),
	(10,'Can add content type',4,'add_contenttype'),
	(11,'Can change content type',4,'change_contenttype'),
	(12,'Can delete content type',4,'delete_contenttype'),
	(13,'Can add session',5,'add_session'),
	(14,'Can change session',5,'change_session'),
	(15,'Can delete session',5,'delete_session'),
	(16,'Can add 用户角色',6,'add_loonuserrole'),
	(17,'Can change 用户角色',6,'change_loonuserrole'),
	(18,'Can delete 用户角色',6,'delete_loonuserrole'),
	(19,'Can add 角色',7,'add_loonrole'),
	(20,'Can change 角色',7,'change_loonrole'),
	(21,'Can delete 角色',7,'delete_loonrole'),
	(22,'Can add 部门',8,'add_loondept'),
	(23,'Can change 部门',8,'change_loondept'),
	(24,'Can delete 部门',8,'delete_loondept'),
	(25,'Can add 用户',9,'add_loonuser'),
	(26,'Can change 用户',9,'change_loonuser'),
	(27,'Can delete 用户',9,'delete_loonuser'),
	(28,'Can add ticket record',10,'add_ticketrecord'),
	(29,'Can change ticket record',10,'change_ticketrecord'),
	(30,'Can delete ticket record',10,'delete_ticketrecord'),
	(31,'Can add ticket state last man',11,'add_ticketstatelastman'),
	(32,'Can change ticket state last man',11,'change_ticketstatelastman'),
	(33,'Can delete ticket state last man',11,'delete_ticketstatelastman'),
	(34,'Can add ticket custom field',12,'add_ticketcustomfield'),
	(35,'Can change ticket custom field',12,'change_ticketcustomfield'),
	(36,'Can delete ticket custom field',12,'delete_ticketcustomfield'),
	(37,'Can add ticket flow log',13,'add_ticketflowlog'),
	(38,'Can change ticket flow log',13,'change_ticketflowlog'),
	(39,'Can delete ticket flow log',13,'delete_ticketflowlog'),
	(40,'Can add custom notice',14,'add_customnotice'),
	(41,'Can change custom notice',14,'change_customnotice'),
	(42,'Can delete custom notice',14,'delete_customnotice'),
	(43,'Can add workflow script',15,'add_workflowscript'),
	(44,'Can change workflow script',15,'change_workflowscript'),
	(45,'Can delete workflow script',15,'delete_workflowscript'),
	(46,'Can add custom field',16,'add_customfield'),
	(47,'Can change custom field',16,'change_customfield'),
	(48,'Can delete custom field',16,'delete_customfield'),
	(49,'Can add state',17,'add_state'),
	(50,'Can change state',17,'change_state'),
	(51,'Can delete state',17,'delete_state'),
	(52,'Can add workflow',18,'add_workflow'),
	(53,'Can change workflow',18,'change_workflow'),
	(54,'Can delete workflow',18,'delete_workflow'),
	(55,'Can add transition',19,'add_transition'),
	(56,'Can change transition',19,'change_transition'),
	(57,'Can delete transition',19,'delete_transition'),
	(58,'Can add 调用token',20,'add_apptoken'),
	(59,'Can change 调用token',20,'change_apptoken'),
	(60,'Can delete 调用token',20,'delete_apptoken');

/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table django_admin_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_account_loonuser_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_account_loonuser_id` FOREIGN KEY (`user_id`) REFERENCES `account_loonuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`)
VALUES
	(1,'2018-04-10 16:41:27.371448','1','LoonDept object (1)',1,'[{\"added\": {}}]',8,1),
	(2,'2018-04-10 16:43:20.412821','1','TicketRecord object (1)',1,'[{\"added\": {}}]',10,1),
	(3,'2018-04-10 16:48:43.820666','2','TicketRecord object (2)',1,'[{\"added\": {}}]',10,1),
	(4,'2018-04-10 17:22:45.041511','1','TicketCustomField object (1)',1,'[{\"added\": {}}]',12,1),
	(5,'2018-04-10 17:39:33.646162','1','TicketFlowLog object (1)',1,'[{\"added\": {}}]',13,1),
	(6,'2018-04-10 21:53:29.880887','1','AppToken object (1)',1,'[{\"added\": {}}]',20,1),
	(7,'2018-04-14 23:37:06.997088','2','LoonDept object (2)',1,'[{\"added\": {}}]',8,1),
	(8,'2018-04-14 23:37:23.932965','3','LoonDept object (3)',1,'[{\"added\": {}}]',8,1),
	(9,'2018-04-14 23:37:36.704502','4','LoonDept object (4)',1,'[{\"added\": {}}]',8,1),
	(10,'2018-04-14 23:38:18.392472','2','guiji',1,'[{\"added\": {}}]',9,1),
	(11,'2018-04-14 23:42:25.710130','3','hah',1,'[{\"added\": {}}]',9,1),
	(12,'2018-04-23 20:49:32.232372','1','Workflow object (1)',1,'[{\"added\": {}}]',18,1),
	(13,'2018-04-23 20:53:33.056648','1','State object (1)',1,'[{\"added\": {}}]',17,1),
	(14,'2018-04-23 20:56:25.945319','1','CustomField object (1)',1,'[{\"added\": {}}]',16,1),
	(15,'2018-04-23 20:56:49.875057','1','State object (1)',2,'[{\"changed\": {\"fields\": [\"state_field_str\"]}}]',17,1),
	(16,'2018-04-24 06:57:24.740151','1','Workflow object (1)',2,'[{\"changed\": {\"fields\": [\"display_form_str\"]}}]',18,1),
	(17,'2018-04-24 06:58:45.040694','1','Workflow object (1)',2,'[{\"changed\": {\"fields\": [\"display_form_str\"]}}]',18,1),
	(18,'2018-04-24 07:09:25.924775','1','Transition object (1)',1,'[{\"added\": {}}]',19,1),
	(19,'2018-04-24 07:15:38.015269','1','State object (1)',2,'[{\"changed\": {\"fields\": [\"state_field_str\"]}}]',17,1),
	(20,'2018-04-24 07:15:54.951782','1','State object (1)',2,'[{\"changed\": {\"fields\": [\"state_field_str\"]}}]',17,1),
	(21,'2018-04-30 15:30:25.653254','2','Transition object (2)',1,'[{\"added\": {}}]',19,1),
	(22,'2018-04-30 15:45:48.978997','2','State object (2)',1,'[{\"added\": {}}]',17,1),
	(23,'2018-04-30 15:46:42.186978','3','State object (3)',1,'[{\"added\": {}}]',17,1),
	(24,'2018-04-30 15:47:58.792301','4','State object (4)',1,'[{\"added\": {}}]',17,1),
	(25,'2018-04-30 15:48:52.379536','2','Transition object (2)',2,'[{\"changed\": {\"fields\": [\"destination_state_id\"]}}]',19,1),
	(26,'2018-04-30 15:48:57.049551','1','Transition object (1)',2,'[{\"changed\": {\"fields\": [\"destination_state_id\"]}}]',19,1),
	(27,'2018-04-30 15:49:23.452938','3','Transition object (3)',1,'[{\"added\": {}}]',19,1),
	(28,'2018-04-30 15:50:00.971444','5','State object (5)',1,'[{\"added\": {}}]',17,1),
	(29,'2018-04-30 15:51:41.264461','6','State object (6)',1,'[{\"added\": {}}]',17,1),
	(30,'2018-04-30 15:52:16.535041','1','TicketFlowLog object (1)',2,'[{\"changed\": {\"fields\": [\"participant\"]}}]',13,1),
	(31,'2018-04-30 15:52:35.306847','1','TicketFlowLog object (1)',2,'[{\"changed\": {\"fields\": [\"suggestion\"]}}]',13,1),
	(32,'2018-04-30 15:53:19.306551','2','TicketFlowLog object (2)',1,'[{\"added\": {}}]',13,1),
	(33,'2018-04-30 15:54:32.070531','4','Transition object (4)',1,'[{\"added\": {}}]',19,1),
	(34,'2018-04-30 15:55:00.074263','5','Transition object (5)',1,'[{\"added\": {}}]',19,1),
	(35,'2018-04-30 15:55:32.417133','3','TicketFlowLog object (3)',1,'[{\"added\": {}}]',13,1),
	(36,'2018-04-30 15:56:02.571406','4','TicketFlowLog object (4)',1,'[{\"added\": {}}]',13,1),
	(37,'2018-04-30 15:57:00.143445','2','TicketFlowLog object (2)',2,'[{\"changed\": {\"fields\": [\"state_id\"]}}]',13,1),
	(38,'2018-04-30 15:57:14.407122','3','TicketFlowLog object (3)',2,'[{\"changed\": {\"fields\": [\"state_id\"]}}]',13,1),
	(39,'2018-04-30 15:57:26.345616','4','TicketFlowLog object (4)',2,'[{\"changed\": {\"fields\": [\"state_id\"]}}]',13,1),
	(40,'2018-04-30 16:20:38.479478','1','State object (1)',2,'[{\"changed\": {\"fields\": [\"is_hidden\"]}}]',17,1),
	(41,'2018-04-30 16:20:55.076990','3','State object (3)',2,'[{\"changed\": {\"fields\": [\"is_hidden\"]}}]',17,1),
	(42,'2018-04-30 16:21:02.336811','4','State object (4)',2,'[{\"changed\": {\"fields\": [\"is_hidden\"]}}]',17,1),
	(43,'2018-04-30 16:21:07.513626','5','State object (5)',2,'[{\"changed\": {\"fields\": [\"is_hidden\"]}}]',17,1),
	(44,'2018-04-30 16:21:13.163688','6','State object (6)',2,'[{\"changed\": {\"fields\": [\"is_hidden\"]}}]',17,1),
	(45,'2018-04-30 20:33:11.317176','1','TicketRecord object (1)',2,'[{\"changed\": {\"fields\": [\"state_id\"]}}]',10,1),
	(46,'2018-05-02 07:14:18.036032','1','TicketRecord object (1)',2,'[{\"changed\": {\"fields\": [\"participant_type_id\"]}}]',10,1),
	(47,'2018-05-02 07:16:34.696279','1','TicketRecord object (1)',2,'[{\"changed\": {\"fields\": [\"state_id\"]}}]',10,1),
	(48,'2018-05-02 07:32:09.915224','1','TicketRecord object (1)',2,'[{\"changed\": {\"fields\": [\"participant_type_id\", \"participant\"]}}]',10,1),
	(49,'2018-05-02 09:57:24.555618','1','TicketRecord object (1)',2,'[{\"changed\": {\"fields\": [\"participant_type_id\", \"participant\"]}}]',10,1),
	(50,'2018-05-05 16:00:25.314396','1','WorkflowScript object (1)',1,'[{\"added\": {}}]',15,1),
	(51,'2018-05-05 16:05:50.756135','2','WorkflowScript object (2)',1,'[{\"added\": {}}]',15,1),
	(52,'2018-05-05 16:29:29.901517','3','WorkflowScript object (3)',1,'[{\"added\": {}}]',15,1),
	(53,'2018-05-05 16:30:43.883607','4','WorkflowScript object (4)',1,'[{\"added\": {}}]',15,1),
	(54,'2018-05-05 16:31:06.336502','4','WorkflowScript object (4)',2,'[{\"changed\": {\"fields\": [\"is_active\"]}}]',15,1),
	(55,'2018-05-05 22:54:48.913998','4','zhangsan',1,'[{\"added\": {}}]',9,1),
	(56,'2018-05-06 12:32:36.701617','2','Workflow object (2)',1,'[{\"added\": {}}]',18,1),
	(57,'2018-05-08 06:50:35.276119','2','Workflow object (2)',2,'[{\"changed\": {\"fields\": [\"name\"]}}]',18,1),
	(58,'2018-05-08 06:50:47.308245','1','Workflow object (1)',2,'[{\"changed\": {\"fields\": [\"name\", \"description\"]}}]',18,1),
	(59,'2018-05-08 06:50:56.521305','2','Workflow object (2)',2,'[{\"changed\": {\"fields\": [\"description\"]}}]',18,1),
	(60,'2018-05-08 21:15:16.433888','1','State object (1)',2,'[{\"changed\": {\"fields\": [\"type_id\"]}}]',17,1),
	(61,'2018-05-08 21:16:18.128035','1','State object (1)',2,'[{\"changed\": {\"fields\": [\"type_id\"]}}]',17,1),
	(62,'2018-05-08 21:16:33.106507','1','State object (1)',2,'[{\"changed\": {\"fields\": [\"type_id\"]}}]',17,1),
	(63,'2018-05-09 06:44:38.400539','3','李磊',2,'[{\"changed\": {\"fields\": [\"username\", \"alias\", \"email\"]}}]',9,1),
	(64,'2018-05-09 06:45:12.998421','2','LoonDept object (2)',2,'[{\"changed\": {\"fields\": [\"leader\"]}}]',8,1),
	(65,'2018-05-09 06:45:27.317759','2','LoonDept object (2)',2,'[{\"changed\": {\"fields\": [\"leader\"]}}]',8,1),
	(66,'2018-05-09 06:45:44.025800','4','LoonDept object (4)',2,'[{\"changed\": {\"fields\": [\"leader\"]}}]',8,1),
	(67,'2018-05-09 06:45:57.695441','1','LoonDept object (1)',2,'[{\"changed\": {\"fields\": [\"leader\"]}}]',8,1),
	(68,'2018-05-09 06:46:21.353123','3','lilei',2,'[{\"changed\": {\"fields\": [\"username\", \"alias\"]}}]',9,1),
	(69,'2018-05-09 06:46:40.026932','1','admin',2,'[{\"changed\": {\"fields\": [\"alias\", \"phone\"]}}]',9,1),
	(70,'2018-05-09 06:57:21.399430','4','zhangsan',2,'[]',9,1),
	(71,'2018-05-09 06:57:31.480613','4','zhangsan',2,'[]',9,1),
	(72,'2018-05-09 06:57:57.104306','4','zhangsan',2,'[]',9,1),
	(73,'2018-05-09 06:58:59.737392','5','aaa',1,'[{\"added\": {}}]',9,1),
	(74,'2018-05-09 06:59:57.018591','5','aaa',2,'[{\"changed\": {\"fields\": [\"phone\"]}}]',9,1),
	(75,'2018-05-09 07:00:08.256294','5','aaa',2,'[{\"changed\": {\"fields\": [\"phone\"]}}]',9,1),
	(76,'2018-05-09 07:00:19.792755','4','zhangsan',2,'[{\"changed\": {\"fields\": [\"phone\"]}}]',9,1),
	(77,'2018-05-09 07:00:28.000474','3','lilei',2,'[{\"changed\": {\"fields\": [\"phone\"]}}]',9,1),
	(78,'2018-05-09 07:00:34.122113','2','guiji',2,'[{\"changed\": {\"fields\": [\"phone\"]}}]',9,1),
	(79,'2018-05-09 07:00:39.717494','1','admin',2,'[{\"changed\": {\"fields\": [\"phone\"]}}]',9,1),
	(80,'2018-05-09 07:01:10.342386','5','lisi',2,'[{\"changed\": {\"fields\": [\"username\", \"alias\", \"email\"]}}]',9,1),
	(81,'2018-05-09 07:01:50.406258','6','wangwu',1,'[{\"added\": {}}]',9,1),
	(82,'2018-05-09 07:01:58.901060','6','wangwu',2,'[{\"changed\": {\"fields\": [\"dept_id\"]}}]',9,1),
	(83,'2018-05-09 07:02:27.253982','4','zhangsan',2,'[{\"changed\": {\"fields\": [\"dept_id\"]}}]',9,1),
	(84,'2018-05-09 07:02:42.222474','1','admin',2,'[{\"changed\": {\"fields\": [\"dept_id\"]}}]',9,1),
	(85,'2018-05-09 07:02:52.076901','5','lisi',2,'[{\"changed\": {\"fields\": [\"dept_id\"]}}]',9,1),
	(86,'2018-05-09 07:03:03.188035','6','wangwu',2,'[{\"changed\": {\"fields\": [\"dept_id\"]}}]',9,1),
	(87,'2018-05-09 07:03:32.428843','3','LoonDept object (3)',2,'[{\"changed\": {\"fields\": [\"leader\"]}}]',8,1),
	(88,'2018-05-09 07:03:50.474873','1','LoonDept object (1)',2,'[{\"changed\": {\"fields\": [\"leader\"]}}]',8,1),
	(89,'2018-05-09 07:04:53.362885','4','LoonDept object (4)',2,'[{\"changed\": {\"fields\": [\"approver\"]}}]',8,1),
	(90,'2018-05-09 07:05:32.302984','1','LoonUserRole object (1)',1,'[{\"added\": {}}]',6,1),
	(91,'2018-05-09 07:06:02.739935','1','LoonRole object (1)',1,'[{\"added\": {}}]',7,1),
	(92,'2018-05-09 07:10:47.328804','3','Workflow object (3)',1,'[{\"added\": {}}]',18,1),
	(93,'2018-05-09 07:17:18.966435','2','Workflow object (2)',2,'[{\"changed\": {\"fields\": [\"flowchart\"]}}]',18,1),
	(94,'2018-05-09 07:17:41.651573','2','Workflow object (2)',2,'[{\"changed\": {\"fields\": [\"display_form_str\"]}}]',18,1),
	(95,'2018-05-09 07:17:49.336722','3','Workflow object (3)',3,'',18,1),
	(96,'2018-05-09 07:21:40.230215','4','State object (4)',2,'[{\"changed\": {\"fields\": [\"name\"]}}]',17,1),
	(97,'2018-05-09 07:22:09.520970','5','LoonDept object (5)',1,'[{\"added\": {}}]',8,1),
	(98,'2018-05-09 07:22:53.494815','7','jack',1,'[{\"added\": {}}]',9,1),
	(99,'2018-05-10 07:34:45.309242','7','State object (7)',1,'[{\"added\": {}}]',17,1),
	(100,'2018-05-10 07:37:57.667512','1','CustomField object (1)',2,'[{\"changed\": {\"fields\": [\"field_key\", \"field_name\"]}}]',16,1),
	(101,'2018-05-10 07:41:03.720632','2','CustomField object (2)',1,'[{\"added\": {}}]',16,1),
	(102,'2018-05-10 07:41:13.238769','1','CustomField object (1)',2,'[{\"changed\": {\"fields\": [\"field_type_id\"]}}]',16,1),
	(103,'2018-05-10 07:41:56.892036','1','CustomField object (1)',2,'[{\"changed\": {\"fields\": [\"order_id\"]}}]',16,1),
	(104,'2018-05-11 06:47:36.390140','8','State object (8)',1,'[{\"added\": {}}]',17,1),
	(105,'2018-05-11 06:48:26.948684','9','State object (9)',1,'[{\"added\": {}}]',17,1),
	(106,'2018-05-11 06:50:09.417112','10','State object (10)',1,'[{\"added\": {}}]',17,1),
	(107,'2018-05-11 06:51:02.915599','11','State object (11)',1,'[{\"added\": {}}]',17,1),
	(108,'2018-05-11 06:52:39.803234','6','State object (6)',2,'[{\"changed\": {\"fields\": [\"participant_type_id\"]}}]',17,1),
	(109,'2018-05-11 06:58:43.399074','6','Transition object (6)',1,'[{\"added\": {}}]',19,1),
	(110,'2018-05-11 07:00:24.371739','4','Transition object (4)',2,'[{\"changed\": {\"fields\": [\"name\", \"source_state_id\", \"destination_state_id\", \"field_require_check\", \"alert_enable\", \"alert_text\"]}}]',19,1),
	(111,'2018-05-11 07:00:52.921792','5','Transition object (5)',2,'[{\"changed\": {\"fields\": [\"name\", \"source_state_id\", \"destination_state_id\"]}}]',19,1),
	(112,'2018-05-11 07:01:52.181201','5','State object (5)',3,'',17,1),
	(113,'2018-05-11 07:03:29.352745','5','Transition object (5)',2,'[{\"changed\": {\"fields\": [\"source_state_id\", \"destination_state_id\"]}}]',19,1),
	(114,'2018-05-11 07:04:14.898117','6','Transition object (6)',2,'[{\"changed\": {\"fields\": [\"name\", \"workflow_id\", \"source_state_id\", \"destination_state_id\", \"field_require_check\"]}}]',19,1),
	(115,'2018-05-11 07:06:22.747270','7','Transition object (7)',1,'[{\"added\": {}}]',19,1),
	(116,'2018-05-11 07:07:33.214528','8','Transition object (8)',1,'[{\"added\": {}}]',19,1),
	(117,'2018-05-11 07:08:33.440502','8','State object (8)',2,'[{\"changed\": {\"fields\": [\"name\"]}}]',17,1),
	(118,'2018-05-11 07:10:25.201782','9','State object (9)',2,'[{\"changed\": {\"fields\": [\"name\", \"participant_type_id\", \"participant\"]}}]',17,1),
	(119,'2018-05-11 07:11:28.673604','10','State object (10)',2,'[{\"changed\": {\"fields\": [\"name\", \"order_id\", \"type_id\", \"participant_type_id\", \"participant\"]}}]',17,1),
	(120,'2018-05-11 07:11:53.077507','12','State object (12)',1,'[{\"added\": {}}]',17,1),
	(121,'2018-05-11 07:12:53.037065','9','Transition object (9)',1,'[{\"added\": {}}]',19,1),
	(122,'2018-05-11 07:13:12.070939','10','Transition object (10)',1,'[{\"added\": {}}]',19,1),
	(123,'2018-05-11 07:13:52.428524','11','Transition object (11)',1,'[{\"added\": {}}]',19,1),
	(124,'2018-05-11 07:16:26.827492','12','Transition object (12)',1,'[{\"added\": {}}]',19,1),
	(125,'2018-05-11 07:16:36.074415','12','Transition object (12)',2,'[{\"changed\": {\"fields\": [\"field_require_check\"]}}]',19,1),
	(126,'2018-05-11 07:27:11.605280','1','CustomField object (1)',2,'[{\"changed\": {\"fields\": [\"field_type_id\", \"field_key\", \"field_name\"]}}]',16,1),
	(127,'2018-05-11 07:27:32.716438','2','CustomField object (2)',2,'[{\"changed\": {\"fields\": [\"field_type_id\", \"field_key\", \"field_name\"]}}]',16,1),
	(128,'2018-05-11 07:28:31.651385','3','CustomField object (3)',1,'[{\"added\": {}}]',16,1),
	(129,'2018-05-11 07:30:01.579803','3','CustomField object (3)',2,'[{\"changed\": {\"fields\": [\"field_type_id\", \"field_key\", \"field_name\", \"description\"]}}]',16,1),
	(130,'2018-05-11 07:31:01.069847','4','CustomField object (4)',1,'[{\"added\": {}}]',16,1),
	(131,'2018-05-11 07:31:11.135481','1','CustomField object (1)',2,'[{\"changed\": {\"fields\": [\"order_id\"]}}]',16,1),
	(132,'2018-05-11 07:31:19.926090','2','CustomField object (2)',2,'[{\"changed\": {\"fields\": [\"order_id\"]}}]',16,1),
	(133,'2018-05-11 07:31:28.837817','3','CustomField object (3)',2,'[{\"changed\": {\"fields\": [\"order_id\"]}}]',16,1),
	(134,'2018-05-11 07:31:35.324557','4','CustomField object (4)',2,'[{\"changed\": {\"fields\": [\"order_id\"]}}]',16,1),
	(135,'2018-05-11 07:34:29.610951','5','CustomField object (5)',1,'[{\"added\": {}}]',16,1),
	(136,'2018-05-11 07:34:36.494826','5','CustomField object (5)',2,'[{\"changed\": {\"fields\": [\"order_id\"]}}]',16,1),
	(137,'2018-05-11 07:36:41.886558','6','CustomField object (6)',1,'[{\"added\": {}}]',16,1),
	(138,'2018-05-12 09:30:21.816878','4','WorkflowScript object (4)',3,'',15,1),
	(139,'2018-05-12 09:30:21.825379','3','WorkflowScript object (3)',3,'',15,1),
	(140,'2018-05-12 09:30:21.828199','2','WorkflowScript object (2)',3,'',15,1),
	(141,'2018-05-12 09:30:21.831010','1','WorkflowScript object (1)',3,'',15,1),
	(142,'2018-05-12 09:32:41.503701','5','WorkflowScript object (5)',2,'[{\"changed\": {\"fields\": [\"is_active\"]}}]',15,1),
	(143,'2018-05-12 09:39:01.044508','6','TicketFlowLog object (6)',3,'',13,1),
	(144,'2018-05-12 09:39:01.048177','5','TicketFlowLog object (5)',3,'',13,1),
	(145,'2018-05-12 09:39:01.051358','4','TicketFlowLog object (4)',3,'',13,1),
	(146,'2018-05-12 09:39:01.054278','3','TicketFlowLog object (3)',3,'',13,1),
	(147,'2018-05-12 09:39:01.057906','2','TicketFlowLog object (2)',3,'',13,1),
	(148,'2018-05-12 09:39:01.059693','1','TicketFlowLog object (1)',3,'',13,1),
	(149,'2018-05-12 09:39:15.345379','1','TicketCustomField object (1)',3,'',12,1),
	(150,'2018-05-12 09:39:40.905715','2','TicketRecord object (2)',3,'',10,1),
	(151,'2018-05-12 09:39:40.909196','1','TicketRecord object (1)',3,'',10,1),
	(152,'2018-05-12 09:40:48.913446','4','Workflow object (4)',1,'[{\"added\": {}}]',18,1),
	(153,'2018-05-12 09:41:56.334411','5','Workflow object (5)',1,'[{\"added\": {}}]',18,1),
	(154,'2018-05-12 09:43:27.851903','13','State object (13)',1,'[{\"added\": {}}]',17,1),
	(155,'2018-05-12 10:02:31.504686','7','CustomField object (7)',1,'[{\"added\": {}}]',16,1),
	(156,'2018-05-12 10:05:06.484413','8','CustomField object (8)',1,'[{\"added\": {}}]',16,1),
	(157,'2018-05-12 10:52:47.141754','9','CustomField object (9)',1,'[{\"added\": {}}]',16,1),
	(158,'2018-05-12 10:53:14.718498','10','CustomField object (10)',1,'[{\"added\": {}}]',16,1),
	(159,'2018-05-13 11:00:50.505075','11','CustomField object (11)',1,'[{\"added\": {}}]',16,1),
	(160,'2018-05-13 11:01:20.651616','12','CustomField object (12)',1,'[{\"added\": {}}]',16,1),
	(161,'2018-05-13 11:05:48.193472','14','State object (14)',1,'[{\"added\": {}}]',17,1),
	(162,'2018-05-13 11:06:03.751286','14','State object (14)',2,'[{\"changed\": {\"fields\": [\"sub_workflow_id\"]}}]',17,1),
	(163,'2018-05-13 11:07:18.514558','15','State object (15)',1,'[{\"added\": {}}]',17,1),
	(164,'2018-05-13 11:07:48.483499','16','State object (16)',1,'[{\"added\": {}}]',17,1),
	(165,'2018-05-13 11:10:36.044615','17','State object (17)',1,'[{\"added\": {}}]',17,1),
	(166,'2018-05-13 11:13:00.583531','18','State object (18)',1,'[{\"added\": {}}]',17,1),
	(167,'2018-05-13 11:13:25.616042','19','State object (19)',1,'[{\"added\": {}}]',17,1),
	(168,'2018-05-13 11:18:07.523093','20','State object (20)',1,'[{\"added\": {}}]',17,1),
	(169,'2018-05-13 11:23:27.199379','21','State object (21)',1,'[{\"added\": {}}]',17,1),
	(170,'2018-05-13 11:24:03.443085','22','State object (22)',1,'[{\"added\": {}}]',17,1),
	(171,'2018-05-13 11:24:26.021075','23','State object (23)',1,'[{\"added\": {}}]',17,1),
	(172,'2018-05-13 11:29:26.863526','24','State object (24)',1,'[{\"added\": {}}]',17,1),
	(173,'2018-05-13 11:29:54.167372','25','State object (25)',1,'[{\"added\": {}}]',17,1),
	(174,'2018-05-13 11:39:31.326527','1','State object (1)',2,'[{\"changed\": {\"fields\": [\"state_field_str\"]}}]',17,1),
	(175,'2018-05-13 11:41:39.486386','2','State object (2)',2,'[{\"changed\": {\"fields\": [\"state_field_str\"]}}]',17,1),
	(176,'2018-05-13 11:42:11.276418','1','State object (1)',2,'[{\"changed\": {\"fields\": [\"state_field_str\"]}}]',17,1),
	(177,'2018-05-13 11:42:18.797194','2','State object (2)',2,'[]',17,1),
	(178,'2018-05-13 11:42:46.037250','3','State object (3)',2,'[{\"changed\": {\"fields\": [\"state_field_str\"]}}]',17,1),
	(179,'2018-05-13 11:42:59.836340','4','State object (4)',2,'[{\"changed\": {\"fields\": [\"state_field_str\"]}}]',17,1),
	(180,'2018-05-13 11:45:22.525271','1','Workflow object (1)',2,'[{\"changed\": {\"fields\": [\"display_form_str\"]}}]',18,1),
	(181,'2018-05-13 21:52:30.445390','12','TicketRecord object (12)',3,'',10,1),
	(182,'2018-05-13 21:52:30.450894','11','TicketRecord object (11)',3,'',10,1),
	(183,'2018-05-13 21:52:30.453813','10','TicketRecord object (10)',3,'',10,1),
	(184,'2018-05-13 21:52:30.457430','9','TicketRecord object (9)',3,'',10,1),
	(185,'2018-05-13 21:52:30.460235','8','TicketRecord object (8)',3,'',10,1),
	(186,'2018-05-13 21:52:30.463067','7','TicketRecord object (7)',3,'',10,1),
	(187,'2018-05-13 21:52:30.465696','6','TicketRecord object (6)',3,'',10,1),
	(188,'2018-05-13 21:52:30.468862','5','TicketRecord object (5)',3,'',10,1),
	(189,'2018-05-13 21:52:30.471665','4','TicketRecord object (4)',3,'',10,1),
	(190,'2018-05-13 21:52:30.475075','3','TicketRecord object (3)',3,'',10,1),
	(191,'2018-05-13 21:52:40.353331','8','TicketFlowLog object (8)',3,'',13,1),
	(192,'2018-05-13 21:52:40.357544','7','TicketFlowLog object (7)',3,'',13,1),
	(193,'2018-05-13 21:52:51.921703','13','TicketCustomField object (13)',3,'',12,1),
	(194,'2018-05-13 21:52:51.925544','12','TicketCustomField object (12)',3,'',12,1),
	(195,'2018-05-13 21:52:51.929737','11','TicketCustomField object (11)',3,'',12,1),
	(196,'2018-05-13 21:52:51.932684','10','TicketCustomField object (10)',3,'',12,1),
	(197,'2018-05-13 21:52:51.937093','9','TicketCustomField object (9)',3,'',12,1),
	(198,'2018-05-13 21:52:51.940781','8','TicketCustomField object (8)',3,'',12,1),
	(199,'2018-05-13 21:52:51.943562','7','TicketCustomField object (7)',3,'',12,1),
	(200,'2018-05-13 21:52:51.946282','6','TicketCustomField object (6)',3,'',12,1),
	(201,'2018-05-13 21:52:51.949748','5','TicketCustomField object (5)',3,'',12,1),
	(202,'2018-05-13 21:52:51.952655','4','TicketCustomField object (4)',3,'',12,1),
	(203,'2018-05-13 21:52:51.955529','3','TicketCustomField object (3)',3,'',12,1),
	(204,'2018-05-13 21:52:51.958281','2','TicketCustomField object (2)',3,'',12,1),
	(205,'2018-05-13 22:15:33.205999','5','CustomField object (5)',2,'[{\"changed\": {\"fields\": [\"field_choice\"]}}]',16,1),
	(206,'2018-05-13 22:20:52.916723','1','Workflow object (1)',2,'[{\"changed\": {\"fields\": [\"view_permission_check\"]}}]',18,1),
	(207,'2018-05-13 22:28:39.393075','13','TicketRecord object (13)',3,'',10,1),
	(208,'2018-05-13 22:34:55.809709','13','Transition object (13)',1,'[{\"added\": {}}]',19,1),
	(209,'2018-05-13 22:35:05.023248','14','Transition object (14)',1,'[{\"added\": {}}]',19,1),
	(210,'2018-05-14 06:33:27.477305','15','TicketRecord object (15)',2,'[{\"changed\": {\"fields\": [\"participant_type_id\", \"participant\"]}}]',10,1),
	(211,'2018-05-14 06:36:35.583915','2','State object (2)',2,'[{\"changed\": {\"fields\": [\"state_field_str\"]}}]',17,1),
	(212,'2018-05-14 06:44:10.386635','2','State object (2)',2,'[{\"changed\": {\"fields\": [\"state_field_str\"]}}]',17,1),
	(213,'2018-05-14 06:44:10.686119','2','State object (2)',2,'[{\"changed\": {\"fields\": [\"state_field_str\"]}}]',17,1),
	(214,'2018-05-14 06:46:38.351021','1','Workflow object (1)',2,'[{\"changed\": {\"fields\": [\"view_permission_check\"]}}]',18,1),
	(215,'2018-05-14 06:46:54.963491','1','Workflow object (1)',2,'[{\"changed\": {\"fields\": [\"view_permission_check\"]}}]',18,1),
	(216,'2018-05-15 07:13:06.602752','6','State object (6)',2,'[{\"changed\": {\"fields\": [\"state_field_str\"]}}]',17,1),
	(217,'2018-05-15 07:19:16.050832','7','State object (7)',2,'[{\"changed\": {\"fields\": [\"state_field_str\"]}}]',17,1),
	(218,'2018-05-15 07:37:12.926590','17','TicketRecord object (17)',2,'[{\"changed\": {\"fields\": [\"relation\"]}}]',10,1),
	(219,'2018-05-16 06:57:11.209321','17','TicketRecord object (17)',2,'[{\"changed\": {\"fields\": [\"state_id\", \"participant_type_id\", \"participant\"]}}]',10,1),
	(220,'2018-05-16 06:58:36.853125','17','TicketRecord object (17)',2,'[{\"changed\": {\"fields\": [\"state_id\", \"participant_type_id\", \"participant\"]}}]',10,1),
	(221,'2018-05-16 07:01:48.836327','17','TicketRecord object (17)',2,'[{\"changed\": {\"fields\": [\"state_id\", \"participant_type_id\", \"participant\"]}}]',10,1),
	(222,'2018-05-16 07:03:21.974005','17','TicketRecord object (17)',2,'[{\"changed\": {\"fields\": [\"state_id\", \"participant\"]}}]',10,1),
	(223,'2018-05-16 07:04:29.225097','17','TicketRecord object (17)',2,'[{\"changed\": {\"fields\": [\"state_id\", \"participant\"]}}]',10,1),
	(224,'2018-05-16 07:31:24.913771','17','TicketRecord object (17)',2,'[{\"changed\": {\"fields\": [\"state_id\", \"participant\"]}}]',10,1),
	(225,'2018-05-16 23:20:55.440488','17','TicketRecord object (17)',2,'[{\"changed\": {\"fields\": [\"state_id\", \"participant\"]}}]',10,1),
	(226,'2018-05-16 23:23:54.673079','17','TicketRecord object (17)',2,'[{\"changed\": {\"fields\": [\"state_id\", \"participant\", \"relation\"]}}]',10,1),
	(227,'2018-05-16 23:24:40.088742','17','TicketRecord object (17)',2,'[{\"changed\": {\"fields\": [\"state_id\", \"participant\", \"relation\"]}}]',10,1),
	(228,'2018-05-16 23:33:22.201139','17','TicketRecord object (17)',2,'[{\"changed\": {\"fields\": [\"state_id\", \"participant\", \"relation\"]}}]',10,1),
	(229,'2018-05-20 23:22:11.031943','17','TicketRecord object (17)',2,'[{\"changed\": {\"fields\": [\"participant_type_id\", \"participant\"]}}]',10,1),
	(230,'2018-05-20 23:22:30.905458','17','TicketRecord object (17)',2,'[{\"changed\": {\"fields\": [\"participant_type_id\"]}}]',10,1),
	(231,'2018-05-20 23:23:00.808836','17','TicketRecord object (17)',2,'[{\"changed\": {\"fields\": [\"participant\"]}}]',10,1),
	(232,'2018-05-21 10:57:04.791725','17','TicketRecord object (17)',2,'[{\"changed\": {\"fields\": [\"participant_type_id\", \"participant\"]}}]',10,1),
	(233,'2018-05-21 10:57:50.019431','10','State object (10)',2,'[{\"changed\": {\"fields\": [\"state_field_str\"]}}]',17,1),
	(234,'2018-05-21 19:27:37.561663','18','TicketRecord object (18)',2,'[{\"changed\": {\"fields\": [\"participant_type_id\", \"participant\"]}}]',10,1),
	(235,'2018-05-22 07:25:13.573757','10','State object (10)',2,'[{\"changed\": {\"fields\": [\"state_field_str\"]}}]',17,1),
	(236,'2018-05-22 07:26:27.931548','10','State object (10)',2,'[{\"changed\": {\"fields\": [\"state_field_str\"]}}]',17,1),
	(237,'2018-05-22 07:26:54.688326','17','TicketRecord object (17)',2,'[{\"changed\": {\"fields\": [\"participant_type_id\", \"participant\"]}}]',10,1),
	(238,'2018-05-22 07:40:16.575221','10','State object (10)',2,'[{\"changed\": {\"fields\": [\"state_field_str\"]}}]',17,1),
	(239,'2018-05-22 22:06:27.493740','10','State object (10)',2,'[{\"changed\": {\"fields\": [\"state_field_str\"]}}]',17,1),
	(240,'2018-05-22 22:06:52.641516','10','State object (10)',2,'[]',17,1),
	(241,'2018-05-22 22:21:51.875014','10','State object (10)',2,'[{\"changed\": {\"fields\": [\"state_field_str\"]}}]',17,1),
	(242,'2018-05-23 22:38:57.333718','5','CustomField object (5)',2,'[{\"changed\": {\"fields\": [\"field_type_id\"]}}]',16,1),
	(243,'2018-05-23 22:43:46.101026','6','WorkflowScript object (6)',1,'[{\"added\": {}}]',15,1),
	(244,'2018-05-23 22:43:59.732931','6','WorkflowScript object (6)',3,'',15,1),
	(245,'2018-05-23 22:54:44.592052','7','WorkflowScript object (7)',1,'[{\"added\": {}}]',15,1),
	(246,'2018-07-14 11:18:48.988543','2','Workflow object (2)',2,'[{\"changed\": {\"fields\": [\"display_form_str\"]}}]',18,1),
	(247,'2018-07-14 11:20:59.664393','8','State object (8)',2,'[{\"changed\": {\"fields\": [\"state_field_str\"]}}]',17,1),
	(248,'2018-07-14 11:21:15.910947','8','State object (8)',2,'[{\"changed\": {\"fields\": [\"state_field_str\"]}}]',17,1),
	(249,'2018-07-14 11:21:35.665414','8','State object (8)',2,'[{\"changed\": {\"fields\": [\"state_field_str\"]}}]',17,1),
	(250,'2018-07-14 11:22:19.869553','8','State object (8)',2,'[{\"changed\": {\"fields\": [\"state_field_str\"]}}]',17,1),
	(251,'2018-07-14 11:22:58.953273','8','State object (8)',2,'[{\"changed\": {\"fields\": [\"state_field_str\"]}}]',17,1),
	(252,'2018-07-14 11:23:11.554199','8','State object (8)',2,'[{\"changed\": {\"fields\": [\"state_field_str\"]}}]',17,1),
	(253,'2018-07-14 11:23:28.868062','8','State object (8)',2,'[{\"changed\": {\"fields\": [\"state_field_str\"]}}]',17,1),
	(254,'2018-08-26 10:31:43.376813','1','CustomNotice object (1)',1,'[{\"added\": {}}]',14,1),
	(255,'2018-08-26 10:35:47.887114','2','CustomNotice object (2)',1,'[{\"added\": {}}]',14,1),
	(256,'2018-10-21 11:06:57.632666','13','State object (13)',2,'[{\"changed\": {\"fields\": [\"state_field_str\"]}}]',17,1),
	(257,'2018-10-21 11:07:27.696611','14','State object (14)',2,'[{\"changed\": {\"fields\": [\"state_field_str\"]}}]',17,1),
	(258,'2018-10-21 11:07:37.599847','15','State object (15)',2,'[{\"changed\": {\"fields\": [\"state_field_str\"]}}]',17,1),
	(259,'2018-10-21 11:07:44.207824','16','State object (16)',2,'[{\"changed\": {\"fields\": [\"state_field_str\"]}}]',17,1),
	(260,'2018-10-21 11:07:51.154185','17','State object (17)',2,'[{\"changed\": {\"fields\": [\"state_field_str\"]}}]',17,1),
	(261,'2018-10-21 11:07:57.144224','18','State object (18)',2,'[{\"changed\": {\"fields\": [\"state_field_str\"]}}]',17,1),
	(262,'2018-10-21 11:08:04.858972','19','State object (19)',2,'[{\"changed\": {\"fields\": [\"state_field_str\"]}}]',17,1),
	(263,'2018-10-21 11:09:00.404020','3','Workflow object (3)',2,'[{\"changed\": {\"fields\": [\"display_form_str\"]}}]',18,1),
	(264,'2018-10-21 11:11:31.706470','15','Transition object (15)',1,'[{\"added\": {}}]',19,1),
	(265,'2018-10-21 11:12:03.734323','16','Transition object (16)',1,'[{\"added\": {}}]',19,1),
	(266,'2018-10-21 11:12:24.520272','17','Transition object (17)',1,'[{\"added\": {}}]',19,1),
	(267,'2018-10-21 11:13:05.940466','18','Transition object (18)',1,'[{\"added\": {}}]',19,1),
	(268,'2018-10-21 11:13:45.169121','19','Transition object (19)',1,'[{\"added\": {}}]',19,1),
	(269,'2018-10-21 11:14:03.426173','20','Transition object (20)',1,'[{\"added\": {}}]',19,1),
	(270,'2018-10-21 20:34:14.264284','21','Transition object (21)',1,'[{\"added\": {}}]',19,1),
	(271,'2018-10-21 20:34:44.151821','22','Transition object (22)',1,'[{\"added\": {}}]',19,1),
	(272,'2018-10-21 20:35:06.483278','23','Transition object (23)',1,'[{\"added\": {}}]',19,1),
	(273,'2018-10-21 20:35:36.766623','24','Transition object (24)',1,'[{\"added\": {}}]',19,1),
	(274,'2018-10-21 20:37:46.197309','25','State object (25)',2,'[{\"changed\": {\"fields\": [\"name\", \"type_id\"]}}]',17,1),
	(275,'2018-10-21 20:38:26.337351','26','State object (26)',1,'[{\"added\": {}}]',17,1),
	(276,'2018-10-21 20:38:52.323989','25','State object (25)',2,'[{\"changed\": {\"fields\": [\"participant_type_id\", \"participant\"]}}]',17,1),
	(277,'2018-10-21 20:39:30.617278','25','Transition object (25)',1,'[{\"added\": {}}]',19,1),
	(278,'2018-10-21 20:39:54.168411','26','Transition object (26)',1,'[{\"added\": {}}]',19,1),
	(279,'2018-10-21 20:45:04.771748','13','CustomField object (13)',1,'[{\"added\": {}}]',16,1),
	(280,'2018-10-21 20:45:59.294356','4','Workflow object (4)',2,'[{\"changed\": {\"fields\": [\"display_form_str\"]}}]',18,1),
	(281,'2018-10-21 20:47:32.722318','20','State object (20)',2,'[{\"changed\": {\"fields\": [\"state_field_str\"]}}]',17,1),
	(282,'2018-10-21 20:47:44.534654','21','State object (21)',2,'[{\"changed\": {\"fields\": [\"state_field_str\"]}}]',17,1),
	(283,'2018-10-21 20:47:50.981963','22','State object (22)',2,'[{\"changed\": {\"fields\": [\"state_field_str\"]}}]',17,1),
	(284,'2018-10-21 20:47:56.590018','23','State object (23)',2,'[{\"changed\": {\"fields\": [\"state_field_str\"]}}]',17,1),
	(285,'2018-10-21 20:48:02.129252','24','State object (24)',2,'[{\"changed\": {\"fields\": [\"state_field_str\"]}}]',17,1),
	(286,'2018-10-21 20:48:07.833032','25','State object (25)',2,'[{\"changed\": {\"fields\": [\"state_field_str\"]}}]',17,1),
	(287,'2018-10-21 20:48:13.986949','26','State object (26)',2,'[{\"changed\": {\"fields\": [\"state_field_str\"]}}]',17,1),
	(288,'2018-10-22 07:10:45.188484','1','AppToken object (1)',2,'[{\"changed\": {\"fields\": [\"ticket_sn_prefix\"]}}]',20,1),
	(289,'2018-10-22 07:12:32.403714','1','AppToken object (1)',2,'[{\"changed\": {\"fields\": [\"ticket_sn_prefix\"]}}]',20,1),
	(290,'2018-10-22 07:38:39.230703','14','State object (14)',2,'[{\"changed\": {\"fields\": [\"sub_workflow_id\"]}}]',17,1),
	(291,'2018-10-22 08:05:15.577141','1','Workflow object (1)',2,'[{\"changed\": {\"fields\": [\"notices\"]}}]',18,1),
	(292,'2018-10-22 15:24:45.126953','4','Workflow object (4)',3,'',18,1),
	(293,'2018-10-22 15:24:45.131527','3','Workflow object (3)',3,'',18,1);

/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table django_content_type
# ------------------------------------------------------------

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;

INSERT INTO `django_content_type` (`id`, `app_label`, `model`)
VALUES
	(20,'account','apptoken'),
	(8,'account','loondept'),
	(7,'account','loonrole'),
	(9,'account','loonuser'),
	(6,'account','loonuserrole'),
	(1,'admin','logentry'),
	(2,'auth','group'),
	(3,'auth','permission'),
	(4,'contenttypes','contenttype'),
	(5,'sessions','session'),
	(12,'ticket','ticketcustomfield'),
	(13,'ticket','ticketflowlog'),
	(10,'ticket','ticketrecord'),
	(11,'ticket','ticketstatelastman'),
	(16,'workflow','customfield'),
	(14,'workflow','customnotice'),
	(17,'workflow','state'),
	(19,'workflow','transition'),
	(18,'workflow','workflow'),
	(15,'workflow','workflowscript');

/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table django_migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`)
VALUES
	(1,'account','0001_initial','2018-04-10 16:23:41.026839'),
	(2,'contenttypes','0001_initial','2018-04-10 16:23:41.088822'),
	(3,'admin','0001_initial','2018-04-10 16:23:41.202720'),
	(4,'admin','0002_logentry_remove_auto_add','2018-04-10 16:23:41.215504'),
	(5,'contenttypes','0002_remove_content_type_name','2018-04-10 16:23:41.316210'),
	(6,'auth','0001_initial','2018-04-10 16:23:41.492653'),
	(7,'auth','0002_alter_permission_name_max_length','2018-04-10 16:23:41.536426'),
	(8,'auth','0003_alter_user_email_max_length','2018-04-10 16:23:41.555765'),
	(9,'auth','0004_alter_user_username_opts','2018-04-10 16:23:41.579352'),
	(10,'auth','0005_alter_user_last_login_null','2018-04-10 16:23:41.616306'),
	(11,'auth','0006_require_contenttypes_0002','2018-04-10 16:23:41.620447'),
	(12,'auth','0007_alter_validators_add_error_messages','2018-04-10 16:23:41.643171'),
	(13,'auth','0008_alter_user_username_max_length','2018-04-10 16:23:41.663023'),
	(14,'auth','0009_alter_user_last_name_max_length','2018-04-10 16:23:41.679754'),
	(15,'sessions','0001_initial','2018-04-10 16:23:41.711283'),
	(16,'ticket','0001_initial','2018-04-10 16:23:41.848590'),
	(17,'workflow','0001_initial','2018-04-10 16:23:41.994564'),
	(18,'ticket','0002_auto_20180410_1749','2018-04-10 17:49:06.562710'),
	(19,'workflow','0002_auto_20180410_1749','2018-04-10 17:49:06.690036'),
	(20,'account','0002_apptoken','2018-04-10 21:53:25.098976'),
	(21,'ticket','0003_ticketrecord_relation','2018-04-15 17:21:55.494957'),
	(22,'ticket','0004_auto_20180417_2348','2018-04-17 23:48:22.378917'),
	(23,'workflow','0003_auto_20180417_2348','2018-04-17 23:48:22.391679'),
	(24,'ticket','0005_auto_20180418_0001','2018-04-18 00:01:52.296081'),
	(25,'workflow','0004_workflow_view_permission_check','2018-04-22 15:58:37.766199'),
	(26,'workflow','0005_auto_20180423_2114','2018-04-23 21:14:51.345960'),
	(27,'workflow','0006_auto_20180423_2116','2018-04-23 21:17:03.970113'),
	(28,'workflow','0007_auto_20180424_0656','2018-04-24 06:56:48.399867'),
	(29,'workflow','0008_auto_20180424_0708','2018-04-24 07:08:53.913939'),
	(30,'workflow','0009_auto_20180430_2129','2018-04-30 21:29:29.307194'),
	(31,'ticket','0006_auto_20180505_1549','2018-05-05 15:49:16.131657'),
	(32,'workflow','0010_auto_20180505_1549','2018-05-05 15:49:16.168741'),
	(33,'workflow','0011_auto_20180509_0709','2018-05-09 07:09:37.847547'),
	(34,'workflow','0012_auto_20180511_0654','2018-05-11 06:54:50.920765'),
	(35,'ticket','0007_auto_20180516_0741','2018-05-16 07:46:02.412425'),
	(36,'ticket','0008_auto_20180516_0743','2018-05-16 07:46:02.417966'),
	(37,'workflow','0013_auto_20180511_1826','2018-05-16 07:46:02.420751'),
	(38,'workflow','0014_auto_20180516_0741','2018-05-16 07:46:02.423199'),
	(39,'ticket','0009_ticketflowlog_intervene_type_id','2018-05-17 06:36:01.493028'),
	(40,'ticket','0010_ticketcustomfield_multi_username_value','2018-05-22 06:46:49.124237'),
	(41,'workflow','0015_auto_20180522_0646','2018-05-22 06:46:49.132266'),
	(42,'workflow','0016_auto_20180620_1709','2018-07-30 07:21:05.079135'),
	(43,'workflow','0017_auto_20180730_0720','2018-07-30 07:21:05.193141'),
	(44,'ticket','0011_ticketrecord_script_run_last_result','2018-08-09 07:32:10.254032'),
	(45,'workflow','0018_auto_20180809_0732','2018-08-09 07:32:10.374771'),
	(46,'ticket','0012_delete_ticketstatelastman','2018-08-12 16:58:07.510558'),
	(47,'workflow','0019_state_remember_last_man_enable','2018-08-12 16:58:07.598511'),
	(48,'account','0003_apptoken_workflow_type_ids','2018-08-12 17:46:44.688698'),
	(49,'account','0004_auto_20180812_1802','2018-08-12 18:02:21.165206'),
	(50,'workflow','0020_workflow_limit_expression','2018-08-24 07:39:19.095010'),
	(51,'workflow','0021_customnotice','2018-08-26 10:30:18.818854'),
	(52,'ticket','0013_ticketrecord_is_end','2018-09-26 06:53:40.535144'),
	(53,'workflow','0022_auto_20180926_0653','2018-09-26 06:53:40.625847'),
	(54,'workflow','0023_auto_20181001_1012','2018-10-01 10:12:52.255104'),
	(55,'account','0005_apptoken_ticket_sn_prefix','2018-10-03 17:08:44.632310'),
	(56,'ticket','0014_auto_20181003_1708','2018-10-03 17:08:44.788212'),
	(57,'workflow','0024_auto_20181003_1708','2018-10-03 17:08:44.885439'),
	(58,'workflow','0025_transition_condition_expression','2018-10-06 17:03:26.434330');

/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table django_session
# ------------------------------------------------------------

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`)
VALUES
	('2p4bd3iu2iz6cakbxn9hamdvqp3fvx7y','MWUzZjFjNThjNmM1MmRlMWIzYjY0NDFiODNlODE3MDIzMjQ2NGQwYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjQ2MTUwYzAwNmQyNGM0Y2QyNzQ5Zjc2NGE4N2MzZDNlNjY0ZDA5NzgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-05-06 15:24:30.402451'),
	('3bvgp1uqozyloos8gugskjbhhebbmz0g','M2EwMmViZmQyZDAxZmU2NmE2Njg4OWYxNzk3ZDVkY2E1NmM0NzNiYjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiYmU5MjA1ZjQ3MTUzOWQyMGI4NGM1NTI0YzI1MDFhOTBhY2UwNGY3MyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2018-11-01 10:12:43.428760'),
	('fp4zkhd8cgfj6tacff6giqm75wwd4p93','NTU1NDRhMGM1MDIyMDczYmFlY2MzZDdkZTMyYWZlYmYyMGRiMzhiNDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYmU5MjA1ZjQ3MTUzOWQyMGI4NGM1NTI0YzI1MDFhOTBhY2UwNGY3MyIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-08-20 07:12:12.680740'),
	('fxdc90snam1vje7bpv3wiafwu9pooeyk','M2EwMmViZmQyZDAxZmU2NmE2Njg4OWYxNzk3ZDVkY2E1NmM0NzNiYjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiYmU5MjA1ZjQ3MTUzOWQyMGI4NGM1NTI0YzI1MDFhOTBhY2UwNGY3MyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2018-07-17 07:04:43.733996'),
	('gi4p54ka4u6vww4kpqogolmdquj52wup','YTQyMzg3NzMzMzRkZDgxNzU1YWM1OTE3YWExZTFjMDdlMWZmNzM5Zjp7Il9hdXRoX3VzZXJfaGFzaCI6IjQ2MTUwYzAwNmQyNGM0Y2QyNzQ5Zjc2NGE4N2MzZDNlNjY0ZDA5NzgiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2018-04-24 21:38:48.844698'),
	('gwwul2nmxqyrdzx1wbej4uj0ahzsdwow','YmI5MjhmNmQ3YzFjMjM3ZjgwYTg4ZmRkMjk1MmU0ZGU5ZjI4Nzg0Mjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiJiZTkyMDVmNDcxNTM5ZDIwYjg0YzU1MjRjMjUwMWE5MGFjZTA0ZjczIn0=','2018-10-28 16:07:27.753614'),
	('ikpnzy0jsc0jiede5r6cxhoyagq2payb','YTQyMzg3NzMzMzRkZDgxNzU1YWM1OTE3YWExZTFjMDdlMWZmNzM5Zjp7Il9hdXRoX3VzZXJfaGFzaCI6IjQ2MTUwYzAwNmQyNGM0Y2QyNzQ5Zjc2NGE4N2MzZDNlNjY0ZDA5NzgiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2018-04-24 21:36:50.610586'),
	('immo7viwmlantgx7ubbwawz7kknhmjgd','M2EwMmViZmQyZDAxZmU2NmE2Njg4OWYxNzk3ZDVkY2E1NmM0NzNiYjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiYmU5MjA1ZjQ3MTUzOWQyMGI4NGM1NTI0YzI1MDFhOTBhY2UwNGY3MyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2019-11-26 17:58:31.816749'),
	('jw2psatj7z4zrur42urk3wluopurpqr1','YmI5MjhmNmQ3YzFjMjM3ZjgwYTg4ZmRkMjk1MmU0ZGU5ZjI4Nzg0Mjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiJiZTkyMDVmNDcxNTM5ZDIwYjg0YzU1MjRjMjUwMWE5MGFjZTA0ZjczIn0=','2018-10-21 19:52:52.775319'),
	('l187tcfmtjwn2yvr407elnm51dqmaa0u','YmI5MjhmNmQ3YzFjMjM3ZjgwYTg4ZmRkMjk1MmU0ZGU5ZjI4Nzg0Mjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiJiZTkyMDVmNDcxNTM5ZDIwYjg0YzU1MjRjMjUwMWE5MGFjZTA0ZjczIn0=','2018-08-13 07:21:42.060139'),
	('lo8legnunej20ohxp0zegm4r6u22b6zw','ZGM2OGMzMDU3NDBkMTFhY2ViMjNlZjRhNWQyNDRhOTUxNGExNjQ4Mzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiZTkyMDVmNDcxNTM5ZDIwYjg0YzU1MjRjMjUwMWE5MGFjZTA0ZjczIn0=','2019-12-01 22:47:58.597505'),
	('qrugroidqpdoepvimz4mtqrsw8elq3px','M2EwMmViZmQyZDAxZmU2NmE2Njg4OWYxNzk3ZDVkY2E1NmM0NzNiYjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiYmU5MjA1ZjQ3MTUzOWQyMGI4NGM1NTI0YzI1MDFhOTBhY2UwNGY3MyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2018-06-06 09:50:27.154850'),
	('rhy3t0ut1v8ev1bqja8sql9htybr95k7','NTU1NDRhMGM1MDIyMDczYmFlY2MzZDdkZTMyYWZlYmYyMGRiMzhiNDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYmU5MjA1ZjQ3MTUzOWQyMGI4NGM1NTI0YzI1MDFhOTBhY2UwNGY3MyIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-09-05 07:18:38.000344'),
	('uc120vlnss4jhy3i8kxow00uqbozf6m4','ZGM2OGMzMDU3NDBkMTFhY2ViMjNlZjRhNWQyNDRhOTUxNGExNjQ4Mzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiZTkyMDVmNDcxNTM5ZDIwYjg0YzU1MjRjMjUwMWE5MGFjZTA0ZjczIn0=','2018-05-23 06:56:36.173728'),
	('xg0q3efrgh60a8svbz3qbomctp6eexmq','M2EwMmViZmQyZDAxZmU2NmE2Njg4OWYxNzk3ZDVkY2E1NmM0NzNiYjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiYmU5MjA1ZjQ3MTUzOWQyMGI4NGM1NTI0YzI1MDFhOTBhY2UwNGY3MyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2019-11-28 14:11:13.565280'),
	('yqo3dtnk8pasr19u3qwkgz4bvpv0yg08','NTU1NDRhMGM1MDIyMDczYmFlY2MzZDdkZTMyYWZlYmYyMGRiMzhiNDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYmU5MjA1ZjQ3MTUzOWQyMGI4NGM1NTI0YzI1MDFhOTBhY2UwNGY3MyIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-05-28 10:04:09.557125');

/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ticket_ticketcustomfield
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ticket_ticketcustomfield`;

CREATE TABLE `ticket_ticketcustomfield` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `field_key` varchar(50) NOT NULL DEFAULT '',
  `field_type_id` int(11) NOT NULL,
  `char_value` varchar(1000) NOT NULL,
  `int_value` int(11) NOT NULL,
  `float_value` double NOT NULL,
  `bool_value` tinyint(1) NOT NULL,
  `date_value` date NOT NULL,
  `datetime_value` datetime(6) NOT NULL,
  `time_value` time(6) NOT NULL,
  `radio_value` varchar(50) NOT NULL,
  `checkbox_value` varchar(50) NOT NULL,
  `select_value` varchar(50) NOT NULL,
  `multi_select_value` varchar(50) NOT NULL,
  `text_value` longtext NOT NULL,
  `username_value` varchar(50) NOT NULL,
  `creator` varchar(50) NOT NULL,
  `gmt_created` datetime(6) NOT NULL,
  `gmt_modified` datetime(6) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `multi_username_value` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `ticket_ticketcustomfield` WRITE;
/*!40000 ALTER TABLE `ticket_ticketcustomfield` DISABLE KEYS */;

INSERT INTO `ticket_ticketcustomfield` (`id`, `name`, `ticket_id`, `field_key`, `field_type_id`, `char_value`, `int_value`, `float_value`, `bool_value`, `date_value`, `datetime_value`, `time_value`, `radio_value`, `checkbox_value`, `select_value`, `multi_select_value`, `text_value`, `username_value`, `creator`, `gmt_created`, `gmt_modified`, `is_deleted`, `multi_username_value`)
VALUES
	(14,'请假类型',13,'leave_type',40,'',0,0,0,'0001-01-01','0001-01-01 00:00:00.000000','00:00:01.000000','','2','','','','','admin','2018-05-13 21:53:15.776693','2018-05-13 21:53:15.776753',0,''),
	(15,'代理人',13,'leave_proxy',60,'',0,0,0,'0001-01-01','0001-01-01 00:00:00.000000','00:00:01.000000','','','','','','zhangsan','admin','2018-05-13 21:53:15.784787','2018-05-13 21:53:15.784839',0,''),
	(16,'请假原因及相关附件',13,'leave_reason',55,'',0,0,0,'0001-01-01','0001-01-01 00:00:00.000000','00:00:01.000000','','','','','去喝喜酒','','admin','2018-05-13 21:53:15.792655','2018-05-13 21:53:15.792711',0,''),
	(17,'开始时间',13,'leave_start',30,'',0,0,0,'0001-01-01','2018-04-10 09:00:00.000000','00:00:01.000000','','','','','','','admin','2018-05-13 21:53:15.800632','2018-05-13 21:53:15.800683',0,''),
	(18,'请假天数(0.5的倍数)',13,'leave_days',5,'3',0,0,0,'0001-01-01','0001-01-01 00:00:00.000000','00:00:01.000000','','','','','','','admin','2018-05-13 21:53:15.809216','2018-05-13 21:53:15.809266',0,''),
	(19,'结束时间',13,'leave_end',30,'',0,0,0,'0001-01-01','2018-04-12 18:00:00.000000','00:00:01.000000','','','','','','','admin','2018-05-13 21:53:15.817437','2018-05-13 21:53:15.817484',0,''),
	(20,'代理人',14,'leave_proxy',60,'',0,0,0,'0001-01-01','0001-01-01 00:00:00.000000','00:00:01.000000','','','','','','zhangsan1','admin','2018-05-13 22:24:41.969926','2018-05-13 22:24:41.969982',0,''),
	(21,'请假天数(0.5的倍数)',14,'leave_days',5,'3',0,0,0,'0001-01-01','0001-01-01 00:00:00.000000','00:00:01.000000','','','','','','','admin','2018-05-13 22:24:41.978508','2018-05-13 22:24:41.978600',0,''),
	(22,'开始时间',14,'leave_start',30,'',0,0,0,'0001-01-01','2018-05-10 09:00:00.000000','00:00:01.000000','','','','','','','admin','2018-05-13 22:24:41.988270','2018-05-13 22:24:41.988346',0,''),
	(23,'请假类型',14,'leave_type',40,'',0,0,0,'0001-01-01','0001-01-01 00:00:00.000000','00:00:01.000000','','1','','','','','admin','2018-05-13 22:24:41.997839','2018-05-13 22:24:41.997891',0,''),
	(24,'结束时间',14,'leave_end',30,'',0,0,0,'0001-01-01','2018-05-13 09:00:00.000000','00:00:01.000000','','','','','','','admin','2018-05-13 22:24:42.008241','2018-05-13 22:24:42.008292',0,''),
	(25,'请假原因及相关附件',14,'leave_reason',55,'',0,0,0,'0001-01-01','0001-01-01 00:00:00.000000','00:00:01.000000','','','','','喝喜酒','','admin','2018-05-13 22:24:42.016808','2018-05-13 22:24:42.016898',0,''),
	(26,'结束时间',15,'leave_end',30,'',0,0,0,'0001-01-01','2018-05-13 09:00:00.000000','00:00:01.000000','','','','','','','admin','2018-05-13 22:28:21.643297','2018-05-13 22:28:21.643346',0,''),
	(27,'请假原因及相关附件',15,'leave_reason',55,'',0,0,0,'0001-01-01','0001-01-01 00:00:00.000000','00:00:01.000000','','','','','喝喜酒','','admin','2018-05-13 22:28:21.650778','2018-05-13 22:28:21.650828',0,''),
	(28,'代理人',15,'leave_proxy',60,'',0,0,0,'0001-01-01','0001-01-01 00:00:00.000000','00:00:01.000000','','','','','','zhangsan1','admin','2018-05-13 22:28:21.659327','2018-05-13 22:28:21.659375',0,''),
	(29,'请假天数(0.5的倍数)',15,'leave_days',5,'3',0,0,0,'0001-01-01','0001-01-01 00:00:00.000000','00:00:01.000000','','','','','','','admin','2018-05-13 22:28:21.667908','2018-05-13 22:28:21.667955',0,''),
	(30,'开始时间',15,'leave_start',30,'',0,0,0,'0001-01-01','2018-05-10 09:00:00.000000','00:00:01.000000','','','','','','','admin','2018-05-13 22:28:21.675754','2018-05-13 22:28:21.675803',0,''),
	(31,'请假类型',15,'leave_type',40,'',0,0,0,'0001-01-01','0001-01-01 00:00:00.000000','00:00:01.000000','','1','','','','','admin','2018-05-13 22:28:21.683366','2018-05-13 22:28:21.683414',0,''),
	(32,'结束时间',16,'leave_end',30,'',0,0,0,'0001-01-01','2018-04-12 18:00:00.000000','00:00:01.000000','','','','','','','admin','2018-05-13 22:34:12.690959','2018-05-13 22:34:12.691033',0,''),
	(33,'请假原因及相关附件',16,'leave_reason',55,'',0,0,0,'0001-01-01','0001-01-01 00:00:00.000000','00:00:01.000000','','','','','去喝喜酒','','admin','2018-05-13 22:34:12.701832','2018-05-13 22:34:12.701889',0,''),
	(34,'代理人',16,'leave_proxy',60,'',0,0,0,'0001-01-01','0001-01-01 00:00:00.000000','00:00:01.000000','','','','','','zhangsan','admin','2018-05-13 22:34:12.711844','2018-05-13 22:34:12.711905',0,''),
	(35,'请假天数(0.5的倍数)',16,'leave_days',5,'3',0,0,0,'0001-01-01','0001-01-01 00:00:00.000000','00:00:01.000000','','','','','','','admin','2018-05-13 22:34:12.721909','2018-05-13 22:34:12.721966',0,''),
	(36,'开始时间',16,'leave_start',30,'',0,0,0,'0001-01-01','2018-04-10 09:00:00.000000','00:00:01.000000','','','','','','','admin','2018-05-13 22:34:12.730191','2018-05-13 22:34:12.730245',0,''),
	(37,'请假类型',16,'leave_type',40,'',0,0,0,'0001-01-01','0001-01-01 00:00:00.000000','00:00:01.000000','','2','','','','','admin','2018-05-13 22:34:12.741366','2018-05-13 22:34:12.741426',0,''),
	(38,'申请原因',17,'vpn_reason',55,'',0,0,0,'0001-01-01','0001-01-01 00:00:00.000000','00:00:01.000000','','','','','在家办公','','admin','2018-05-15 07:16:38.326174','2018-05-15 07:16:38.326274',0,''),
	(39,'申请原因',18,'vpn_reason',55,'',0,0,0,'0001-01-01','0001-01-01 00:00:00.000000','00:00:01.000000','','','','','在家办公','','admin','2018-05-15 07:37:28.008199','2018-05-15 07:37:28.008245',0,''),
	(40,'请假天数(0.5的倍数)',19,'leave_days',5,'2',0,0,0,'0001-01-01','0001-01-01 00:00:00.000000','00:00:01.000000','','','','','','','admin','2018-10-19 00:08:40.397150','2018-10-19 00:08:40.397166',0,''),
	(41,'请假类型',19,'leave_type',35,'',0,0,0,'0001-01-01','0001-01-01 00:00:00.000000','00:00:01.000000','2','','','','','','admin','2018-10-19 00:08:40.402913','2018-10-19 00:08:40.402928',0,''),
	(42,'开始时间',19,'leave_start',30,'',0,0,0,'0001-01-01','2018-10-20 09:00:00.000000','00:00:01.000000','','','','','','','admin','2018-10-19 00:08:40.408762','2018-10-19 00:08:40.408775',0,''),
	(43,'请假原因及相关附件',19,'leave_reason',55,'',0,0,0,'0001-01-01','0001-01-01 00:00:00.000000','00:00:01.000000','','','','','<p>teste</p>','','admin','2018-10-19 00:08:40.413509','2018-10-19 00:08:40.413529',0,''),
	(44,'结束时间',19,'leave_end',30,'',0,0,0,'0001-01-01','2018-10-21 18:00:00.000000','00:00:01.000000','','','','','','','admin','2018-10-19 00:08:40.419809','2018-10-19 00:08:40.419833',0,''),
	(45,'代理人',19,'leave_proxy',60,'',0,0,0,'0001-01-01','0001-01-01 00:00:00.000000','00:00:01.000000','','','','','','admin','admin','2018-10-19 00:08:40.425879','2018-10-19 00:08:40.425895',0,''),
	(46,'结束时间',20,'leave_end',30,'',0,0,0,'0001-01-01','2018-10-20 12:00:00.000000','00:00:01.000000','','','','','','','admin','2018-10-19 00:38:41.367687','2018-10-19 00:38:41.367703',0,''),
	(47,'开始时间',20,'leave_start',30,'',0,0,0,'0001-01-01','2018-10-19 12:00:00.000000','00:00:01.000000','','','','','','','admin','2018-10-19 00:38:41.372330','2018-10-19 00:38:41.372352',0,''),
	(48,'代理人',20,'leave_proxy',60,'',0,0,0,'0001-01-01','0001-01-01 00:00:00.000000','00:00:01.000000','','','','','','admin','admin','2018-10-19 00:38:41.376402','2018-10-19 00:38:41.376417',0,''),
	(49,'请假天数(0.5的倍数)',20,'leave_days',5,'2',0,0,0,'0001-01-01','0001-01-01 00:00:00.000000','00:00:01.000000','','','','','','','admin','2018-10-19 00:38:41.379313','2018-10-19 00:38:41.379327',0,''),
	(50,'请假类型',20,'leave_type',35,'',0,0,0,'0001-01-01','0001-01-01 00:00:00.000000','00:00:01.000000','2','','','','','','admin','2018-10-19 00:38:41.383436','2018-10-19 00:38:41.383450',0,''),
	(51,'请假原因及相关附件',20,'leave_reason',55,'',0,0,0,'0001-01-01','0001-01-01 00:00:00.000000','00:00:01.000000','','','','','<p>dfsf</p>','','admin','2018-10-19 00:38:41.387250','2018-10-19 00:38:41.387266',0,''),
	(52,'项目标识',21,'project_code',5,'prj001',0,0,0,'0001-01-01','0001-01-01 00:00:00.000000','00:00:01.000000','','','','','','','admin','2018-10-21 11:14:37.680365','2018-10-21 11:14:37.680400',0,''),
	(53,'项目开发人员',21,'project_devs',60,'',0,0,0,'0001-01-01','0001-01-01 00:00:00.000000','00:00:01.000000','','','','','','admin','admin','2018-10-21 11:14:37.686541','2018-10-21 11:14:37.686575',0,''),
	(54,'项目测试人员',21,'project_qas',60,'',0,0,0,'0001-01-01','0001-01-01 00:00:00.000000','00:00:01.000000','','','','','','admin','admin','2018-10-21 11:14:37.692349','2018-10-21 11:14:37.692382',0,''),
	(55,'请假原因及相关附件',22,'leave_reason',55,'',0,0,0,'0001-01-01','0001-01-01 00:00:00.000000','00:00:01.000000','','','','','<p>ddd</p>','','admin','2018-10-22 07:12:16.466886','2018-10-22 07:12:16.466914',0,''),
	(56,'请假天数(0.5的倍数)',22,'leave_days',5,'1',0,0,0,'0001-01-01','0001-01-01 00:00:00.000000','00:00:01.000000','','','','','','','admin','2018-10-22 07:12:16.472163','2018-10-22 07:12:16.472181',0,''),
	(57,'请假类型',22,'leave_type',35,'',0,0,0,'0001-01-01','0001-01-01 00:00:00.000000','00:00:01.000000','3','','','','','','admin','2018-10-22 07:12:16.477751','2018-10-22 07:12:16.477769',0,''),
	(58,'开始时间',22,'leave_start',30,'',0,0,0,'0001-01-01','2018-10-22 12:00:00.000000','00:00:01.000000','','','','','','','admin','2018-10-22 07:12:16.481785','2018-10-22 07:12:16.481810',0,''),
	(59,'代理人',22,'leave_proxy',60,'',0,0,0,'0001-01-01','0001-01-01 00:00:00.000000','00:00:01.000000','','','','','','admin','admin','2018-10-22 07:12:16.485136','2018-10-22 07:12:16.485153',0,''),
	(60,'结束时间',22,'leave_end',30,'',0,0,0,'0001-01-01','2018-10-23 12:00:00.000000','00:00:01.000000','','','','','','','admin','2018-10-22 07:12:16.489084','2018-10-22 07:12:16.489109',0,''),
	(61,'请假原因及相关附件',23,'leave_reason',55,'',0,0,0,'0001-01-01','0001-01-01 00:00:00.000000','00:00:01.000000','','','','','<p>te</p>','','admin','2018-10-22 08:05:37.200981','2018-10-22 08:05:37.201000',0,''),
	(62,'请假天数(0.5的倍数)',23,'leave_days',5,'2',0,0,0,'0001-01-01','0001-01-01 00:00:00.000000','00:00:01.000000','','','','','','','admin','2018-10-22 08:05:37.204565','2018-10-22 08:05:37.204582',0,''),
	(63,'请假类型',23,'leave_type',35,'',0,0,0,'0001-01-01','0001-01-01 00:00:00.000000','00:00:01.000000','3','','','','','','admin','2018-10-22 08:05:37.207974','2018-10-22 08:05:37.207991',0,''),
	(64,'开始时间',23,'leave_start',30,'',0,0,0,'0001-01-01','2018-10-22 12:00:00.000000','00:00:01.000000','','','','','','','admin','2018-10-22 08:05:37.212592','2018-10-22 08:05:37.212654',0,''),
	(65,'代理人',23,'leave_proxy',60,'',0,0,0,'0001-01-01','0001-01-01 00:00:00.000000','00:00:01.000000','','','','','','admin','admin','2018-10-22 08:05:37.217232','2018-10-22 08:05:37.217251',0,''),
	(66,'结束时间',23,'leave_end',30,'',0,0,0,'0001-01-01','2018-10-24 12:00:00.000000','00:00:01.000000','','','','','','','admin','2018-10-22 08:05:37.221150','2018-10-22 08:05:37.221170',0,'');

/*!40000 ALTER TABLE `ticket_ticketcustomfield` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ticket_ticketflowlog
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ticket_ticketflowlog`;

CREATE TABLE `ticket_ticketflowlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ticket_id` int(11) NOT NULL,
  `transition_id` int(11) NOT NULL,
  `suggestion` varchar(1000) NOT NULL,
  `participant_type_id` int(11) NOT NULL,
  `participant` varchar(50) NOT NULL,
  `state_id` int(11) NOT NULL,
  `ticket_data` varchar(10000) NOT NULL,
  `creator` varchar(50) NOT NULL,
  `gmt_created` datetime(6) NOT NULL,
  `gmt_modified` datetime(6) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `intervene_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `ticket_ticketflowlog` WRITE;
/*!40000 ALTER TABLE `ticket_ticketflowlog` DISABLE KEYS */;

INSERT INTO `ticket_ticketflowlog` (`id`, `ticket_id`, `transition_id`, `suggestion`, `participant_type_id`, `participant`, `state_id`, `ticket_data`, `creator`, `gmt_created`, `gmt_modified`, `is_deleted`, `intervene_type_id`)
VALUES
	(9,13,1,'',1,'lilei',1,'','admin','2018-05-13 21:53:15.820550','2018-05-13 21:53:15.820610',0,0),
	(10,14,2,'',1,'lilei',1,'','admin','2018-05-13 22:24:42.021711','2018-05-13 22:24:42.021792',0,0),
	(11,15,2,'',1,'lilei',1,'','admin','2018-05-13 22:28:21.686709','2018-05-13 22:28:21.686769',0,0),
	(12,16,1,'',1,'lilei',1,'','admin','2018-05-13 22:34:12.744844','2018-05-13 22:34:12.744912',0,0),
	(13,14,14,'保存草稿',1,'lilei',2,'','lilei','2018-05-13 22:59:06.743524','2018-05-13 22:59:06.743634',0,0),
	(14,14,14,'保存草稿',1,'lilei',2,'','lilei','2018-05-13 23:00:44.421329','2018-05-13 23:00:44.421396',0,0),
	(15,14,14,'保存草稿',1,'lilei',2,'','lilei','2018-05-13 23:04:40.758014','2018-05-13 23:04:40.758125',0,0),
	(16,14,14,'保存草稿',1,'lilei',2,'','lilei','2018-05-13 23:07:21.279315','2018-05-13 23:07:21.280068',0,0),
	(17,14,14,'保存草稿',1,'lilei',2,'','lilei','2018-05-13 23:10:19.742789','2018-05-13 23:10:19.742861',0,0),
	(18,14,14,'保存草稿',1,'lilei',2,'','lilei','2018-05-13 23:52:21.760281','2018-05-13 23:52:21.760339',0,0),
	(19,14,14,'保存草稿',1,'lilei',2,'','lilei','2018-05-14 00:01:54.824910','2018-05-14 00:01:54.824974',0,0),
	(20,14,14,'保存草稿',1,'lilei',2,'','lilei','2018-05-14 00:02:45.942264','2018-05-14 00:02:45.942325',0,0),
	(21,14,14,'保存草稿',1,'lilei',2,'','lilei','2018-05-14 00:12:18.293208','2018-05-14 00:12:18.293269',0,0),
	(22,14,14,'保存草稿',1,'lilei',2,'','lilei','2018-05-14 00:15:43.074352','2018-05-14 00:15:43.074635',0,0),
	(23,14,14,'保存草稿',1,'lilei',2,'','lilei','2018-05-14 00:21:56.019252','2018-05-14 00:21:56.019666',0,0),
	(24,14,14,'保存草稿',1,'lilei',2,'','lilei','2018-05-14 00:24:11.381536','2018-05-14 00:24:11.381609',0,0),
	(25,14,14,'保存草稿',1,'lilei',2,'','lilei','2018-05-14 06:55:24.437483','2018-05-14 06:55:24.437546',0,0),
	(26,15,0,'转交工单',1,'lilei',2,'','lilei','2018-05-14 06:56:26.664730','2018-05-14 06:56:26.664802',0,0),
	(27,15,0,'转交工单',1,'zhangsan',2,'','zhangsan','2018-05-14 06:56:52.101637','2018-05-14 06:56:52.101705',0,0),
	(28,15,14,'保存草稿',1,'lilei',2,'','lilei','2018-05-14 06:59:33.505946','2018-05-14 06:59:33.506019',0,0),
	(29,15,13,'保存草稿',1,'lilei',2,'','lilei','2018-05-14 07:00:03.655105','2018-05-14 07:00:03.655196',0,0),
	(30,15,0,'强制修改工单状态',1,'lilei',3,'','admin','2018-05-14 07:07:39.586383','2018-05-14 07:07:39.586456',0,0),
	(31,14,0,'加签工单',1,'lilei',2,'','lilei','2018-05-15 06:46:11.225083','2018-05-15 06:46:11.225146',0,0),
	(32,17,7,'',1,'lilei',6,'','admin','2018-05-15 07:16:38.332521','2018-05-15 07:16:38.332680',0,0),
	(33,17,8,'同意申请',1,'lilei',7,'','lilei','2018-05-15 07:20:40.816765','2018-05-15 07:20:40.816925',0,0),
	(34,18,7,'',1,'lilei',6,'','admin','2018-05-15 07:37:28.012487','2018-05-15 07:37:28.012548',0,0),
	(35,18,8,'同意申请',1,'lilei',7,'','lilei','2018-05-15 07:37:37.111956','2018-05-15 07:37:37.112027',0,0),
	(36,17,0,'接单处理',1,'guiji',8,'','guiji','2018-05-16 06:42:00.998562','2018-05-16 06:42:00.998625',0,0),
	(37,17,9,'同意',1,'guiji',8,'','guiji','2018-05-16 06:49:55.948811','2018-05-16 06:49:55.948905',0,0),
	(38,17,0,'接单处理',1,'guiji',8,'','guiji','2018-05-16 06:57:31.802266','2018-05-16 06:57:31.802360',0,0),
	(39,17,9,'同意',1,'guiji',8,'','guiji','2018-05-16 06:57:36.347563','2018-05-16 06:57:36.347634',0,0),
	(40,17,9,'同意',1,'guiji',8,'','guiji','2018-05-16 06:58:41.660593','2018-05-16 06:58:41.660701',0,0),
	(41,17,9,'同意',1,'guiji',8,'','guiji','2018-05-16 07:01:53.888622','2018-05-16 07:01:53.888689',0,0),
	(42,17,10,'False\n',6,'demo_script.py',9,'','loonrobot','2018-05-16 07:01:54.040851','2018-05-16 07:01:54.041150',0,0),
	(43,17,9,'同意',1,'guiji',8,'','guiji','2018-05-16 07:03:34.673960','2018-05-16 07:03:34.674037',0,0),
	(44,17,10,'False\n',6,'demo_script.py',9,'','loonrobot','2018-05-16 07:03:34.846610','2018-05-16 07:03:34.847216',0,0),
	(45,17,9,'同意',1,'guiji',8,'','guiji','2018-05-16 07:04:45.745455','2018-05-16 07:04:45.745521',0,0),
	(46,17,10,'False\n',6,'demo_script.py',9,'','loonrobot','2018-05-16 07:04:45.955902','2018-05-16 07:04:45.956166',0,0),
	(47,17,9,'同意',1,'guiji',8,'','guiji','2018-05-16 07:31:29.378033','2018-05-16 07:31:29.378090',0,0),
	(48,17,10,'lilei\n',6,'demo_script.py',9,'','loonrobot','2018-05-16 07:31:29.552179','2018-05-16 07:31:29.552446',0,0),
	(49,17,9,'同意',1,'guiji',8,'','guiji','2018-05-16 23:21:00.251306','2018-05-16 23:21:00.251363',0,0),
	(50,17,10,'lilei\n',6,'demo_script.py',9,'','loonrobot','2018-05-16 23:21:00.578354','2018-05-16 23:21:00.578555',0,0),
	(51,17,9,'同意',1,'guiji',8,'','guiji','2018-05-16 23:24:03.606092','2018-05-16 23:24:03.606156',0,0),
	(52,17,10,'lilei\n',6,'demo_script.py',9,'','loonrobot','2018-05-16 23:24:03.779136','2018-05-16 23:24:03.779504',0,0),
	(53,17,9,'同意',1,'guiji',8,'','guiji','2018-05-16 23:24:44.286319','2018-05-16 23:24:44.286429',0,0),
	(54,17,10,'lilei\n',6,'demo_script.py',9,'','loonrobot','2018-05-16 23:24:44.338829','2018-05-16 23:24:44.339101',0,0),
	(55,17,9,'同意',1,'guiji',8,'','guiji','2018-05-16 23:33:26.619543','2018-05-16 23:33:26.619613',0,0),
	(56,17,10,'lilei\n',6,'demo_script.py',9,'','loonrobot','2018-05-16 23:33:26.803850','2018-05-16 23:33:26.804073',0,0),
	(57,17,0,'请处理',1,'lilei',10,'','lilei','2018-05-17 06:45:58.830078','2018-05-17 06:45:58.830167',0,1),
	(58,17,0,'请协助处理',1,'zhangsan',10,'','zhangsan','2018-05-17 06:47:46.380983','2018-05-17 06:47:46.381055',0,2),
	(59,19,1,'',1,'admin',1,'{\"leave_days\": \"2\", \"leave_proxy\": \"admin\", \"title\": \"testt\", \"in_add_node\": false, \"is_deleted\": false, \"gmt_modified\": \"2018-10-19 00:08:40.380672\", \"add_node_man\": \"\", \"sn\": \"loonflow_201810190001\", \"leave_type\": \"2\", \"gmt_created\": \"2018-10-19 00:08:40.371908\", \"parent_ticket_id\": 0, \"leave_reason\": \"<p>teste</p>\", \"leave_start\": \"2018-10-20 09:00:00\", \"participant_type_id\": 1, \"state_id\": 3, \"workflow_id\": 1, \"parent_ticket_state_id\": 0, \"relation\": \"admin\", \"participant\": \"admin\", \"leave_end\": \"2018-10-21 18:00:00\", \"creator\": \"admin\"}','admin','2018-10-19 00:08:40.466104','2018-10-19 00:08:40.466128',0,0),
	(60,20,1,'',1,'admin',1,'{\"leave_reason\": \"<p>dfsf</p>\", \"sn\": \"loonflow_201810190002\", \"add_node_man\": \"\", \"leave_days\": \"2\", \"participant\": \"admin\", \"title\": \"teste\", \"gmt_modified\": \"2018-10-19 00:38:41.359283\", \"workflow_id\": 1, \"creator\": \"admin\", \"leave_start\": \"2018-10-19 12:00:00\", \"is_deleted\": false, \"parent_ticket_id\": 0, \"relation\": \"admin\", \"leave_type\": \"2\", \"leave_end\": \"2018-10-20 12:00:00\", \"state_id\": 3, \"in_add_node\": false, \"leave_proxy\": \"admin\", \"participant_type_id\": 1, \"gmt_created\": \"2018-10-19 00:38:41.354008\", \"parent_ticket_state_id\": 0}','admin','2018-10-19 00:38:41.428448','2018-10-19 00:38:41.428473',0,0),
	(61,20,3,'fdsfsf',1,'admin',3,'{\"leave_reason\": \"<p>dfsf</p>\", \"sn\": \"loonflow_201810190002\", \"add_node_man\": \"\", \"leave_days\": \"2\", \"participant\": \"jack\", \"title\": \"teste\", \"gmt_modified\": \"2018-10-19 00:38:53.872124\", \"workflow_id\": 1, \"creator\": \"admin\", \"leave_start\": \"2018-10-19 12:00:00\", \"is_deleted\": false, \"parent_ticket_id\": 0, \"relation\": \"jack,admin\", \"leave_type\": \"2\", \"leave_end\": \"2018-10-20 12:00:00\", \"state_id\": 4, \"in_add_node\": false, \"leave_proxy\": \"admin\", \"participant_type_id\": 1, \"gmt_created\": \"2018-10-19 00:38:41.354008\", \"parent_ticket_state_id\": 0}','admin','2018-10-19 00:38:53.942394','2018-10-19 00:38:53.942431',0,0),
	(62,21,15,'',1,'admin',13,'{\"gmt_modified\": \"2018-10-21 11:14:37.663604\", \"gmt_created\": \"2018-10-21 11:14:37.656067\", \"creator\": \"admin\", \"parent_ticket_state_id\": 0, \"participant\": \"loonrobot\", \"workflow_id\": 3, \"parent_ticket_id\": 0, \"in_add_node\": false, \"project_qas\": \"admin\", \"participant_type_id\": 1, \"relation\": \"loonrobot,admin\", \"project_devs\": \"admin\", \"state_id\": 14, \"is_deleted\": false, \"sn\": \"loonflow_201810210001\", \"add_node_man\": \"\", \"title\": \"\", \"project_code\": \"prj001\"}','admin','2018-10-21 11:14:37.775029','2018-10-21 11:14:37.775227',0,0),
	(63,19,5,'111',1,'jack',4,'{\"leave_end\": \"2018-10-21 18:00:00\", \"parent_ticket_state_id\": 0, \"participant_type_id\": 0, \"title\": \"testt\", \"sn\": \"loonflow_201810190001\", \"leave_reason\": \"<p>teste</p>\", \"gmt_modified\": \"2018-10-21 20:06:57.527067\", \"participant\": \"\", \"parent_ticket_id\": 0, \"workflow_id\": 1, \"relation\": \"jack,admin\", \"is_deleted\": false, \"creator\": \"admin\", \"leave_type\": \"2\", \"add_node_man\": \"\", \"leave_start\": \"2018-10-20 09:00:00\", \"in_add_node\": false, \"state_id\": 5, \"leave_proxy\": \"admin\", \"leave_days\": \"2\", \"gmt_created\": \"2018-10-19 00:08:40.371908\"}','jack','2018-10-21 20:06:57.579230','2018-10-21 20:06:57.579267',0,0),
	(64,22,1,'',1,'jack',1,'{\"is_deleted\": false, \"parent_ticket_state_id\": 0, \"leave_proxy\": \"admin\", \"leave_end\": \"2018-10-23 12:00:00\", \"leave_start\": \"2018-10-22 12:00:00\", \"creator\": \"jack\", \"participant_type_id\": 1, \"in_add_node\": false, \"parent_ticket_id\": 0, \"relation\": \"jack\", \"title\": \"tttttt\", \"leave_days\": \"1\", \"sn\": \"loonflowhhh_201810220001\", \"participant\": \"jack\", \"leave_type\": \"3\", \"add_node_man\": \"\", \"gmt_modified\": \"2018-10-22 07:12:16.455740\", \"leave_reason\": \"<p>ddd</p>\", \"state_id\": 3, \"workflow_id\": 1, \"gmt_created\": \"2018-10-22 07:12:16.451086\"}','admin','2018-10-22 07:12:16.542137','2018-10-22 07:12:16.542163',0,0),
	(65,23,1,'',1,'jack',1,'{\"is_deleted\": false, \"parent_ticket_state_id\": 0, \"leave_proxy\": \"admin\", \"leave_end\": \"2018-10-24 12:00:00\", \"leave_start\": \"2018-10-22 12:00:00\", \"creator\": \"jack\", \"participant_type_id\": 1, \"in_add_node\": false, \"parent_ticket_id\": 0, \"relation\": \"jack\", \"title\": \"ttttest\", \"leave_days\": \"2\", \"sn\": \"loonflow_201810220002\", \"participant\": \"jack\", \"leave_type\": \"3\", \"add_node_man\": \"\", \"gmt_modified\": \"2018-10-22 08:05:37.192994\", \"leave_reason\": \"<p>te</p>\", \"state_id\": 3, \"workflow_id\": 1, \"gmt_created\": \"2018-10-22 08:05:37.187794\"}','admin','2018-10-22 08:05:37.270333','2018-10-22 08:05:37.270359',0,0);

/*!40000 ALTER TABLE `ticket_ticketflowlog` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ticket_ticketrecord
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ticket_ticketrecord`;

CREATE TABLE `ticket_ticketrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(500) NOT NULL,
  `workflow_id` int(11) NOT NULL,
  `sn` varchar(25) NOT NULL,
  `state_id` int(11) NOT NULL,
  `parent_ticket_id` int(11) NOT NULL,
  `parent_ticket_state_id` int(11) NOT NULL,
  `participant_type_id` int(11) NOT NULL,
  `participant` varchar(100) NOT NULL,
  `creator` varchar(50) NOT NULL,
  `gmt_created` datetime(6) NOT NULL,
  `gmt_modified` datetime(6) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `relation` varchar(1000) NOT NULL,
  `add_node_man` varchar(50) NOT NULL,
  `in_add_node` tinyint(1) NOT NULL,
  `script_run_last_result` tinyint(1) NOT NULL,
  `is_end` tinyint(1) NOT NULL,
  `is_rejected` tinyint(1) NOT NULL,
  `multi_all_person` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `ticket_ticketrecord` WRITE;
/*!40000 ALTER TABLE `ticket_ticketrecord` DISABLE KEYS */;

INSERT INTO `ticket_ticketrecord` (`id`, `title`, `workflow_id`, `sn`, `state_id`, `parent_ticket_id`, `parent_ticket_state_id`, `participant_type_id`, `participant`, `creator`, `gmt_created`, `gmt_modified`, `is_deleted`, `relation`, `add_node_man`, `in_add_node`, `script_run_last_result`, `is_end`, `is_rejected`, `multi_all_person`)
VALUES
	(14,'12',1,'loonflow_201805130012',2,0,0,1,'zhangsan','lilei','2018-05-13 22:24:41.952132','2018-08-09 07:33:44.762337',0,'lileilileilileilileilileilileilileilileilileilileilileilileilileilileilileilileilileililei','lilei',1,1,0,0,'{}'),
	(15,'请假哈哈22哈',1,'loonflow_201805130013',2,0,0,5,'creator','lilei','2018-05-13 22:28:21.623510','2018-05-14 07:07:39.579607',0,'lileilileililei','',0,1,0,0,'{}'),
	(16,'请假申请3',1,'loonflow_201805130014',3,0,0,1,'lilei','lilei','2018-05-13 22:34:12.668018','2018-05-13 22:34:12.668141',0,'lilei','',0,1,0,0,'{}'),
	(17,'vpn申请2',2,'loonflow_201805150001',10,0,0,3,'1','lilei','2018-05-15 07:16:38.281209','2018-05-22 07:26:54.685116',0,'guiji,wangwu,lilei','zhangsan',1,1,0,0,'{}'),
	(18,'vpn申请11',2,'loonflow_201805150002',8,0,0,2,'guiji,wangwu','lilei','2018-05-15 07:37:27.984815','2018-05-21 19:27:37.550734',0,'lilei,guiji,wangwu','',0,1,0,0,'{}');

/*!40000 ALTER TABLE `ticket_ticketrecord` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table workflow_customfield
# ------------------------------------------------------------

DROP TABLE IF EXISTS `workflow_customfield`;

CREATE TABLE `workflow_customfield` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `workflow_id` int(11) NOT NULL,
  `field_type_id` int(11) NOT NULL,
  `field_key` varchar(50) NOT NULL,
  `field_name` varchar(50) NOT NULL,
  `order_id` int(11) NOT NULL,
  `default_value` varchar(100) DEFAULT NULL,
  `description` varchar(100) NOT NULL,
  `field_template` longtext NOT NULL,
  `boolean_field_display` varchar(100) NOT NULL,
  `creator` varchar(50) NOT NULL,
  `gmt_created` datetime(6) NOT NULL,
  `gmt_modified` datetime(6) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `field_choice` varchar(1000) NOT NULL,
  `label` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `workflow_customfield` WRITE;
/*!40000 ALTER TABLE `workflow_customfield` DISABLE KEYS */;

INSERT INTO `workflow_customfield` (`id`, `workflow_id`, `field_type_id`, `field_key`, `field_name`, `order_id`, `default_value`, `description`, `field_template`, `boolean_field_display`, `creator`, `gmt_created`, `gmt_modified`, `is_deleted`, `field_choice`, `label`)
VALUES
	(1,1,30,'leave_start','开始时间',20,NULL,'','','{}','admin','2018-04-23 20:56:25.940486','2018-05-11 07:31:11.133782',0,'{}',''),
	(2,1,30,'leave_end','结束时间',25,NULL,'','','{}','admin','2018-05-10 07:41:03.717540','2018-05-11 07:31:19.923554',0,'{}',''),
	(3,1,5,'leave_days','请假天数(0.5的倍数)',30,NULL,'前端根据起止时间自动计算','','{}','admin','2018-05-11 07:28:31.649506','2018-05-11 07:31:28.835612',0,'{}',''),
	(4,1,60,'leave_proxy','代理人',35,NULL,'请假期间的代理人','','{}','admin','2018-05-11 07:31:01.068850','2018-05-11 07:31:35.323117',0,'{}',''),
	(5,1,35,'leave_type','请假类型',40,NULL,'','','{}','admin','2018-05-11 07:34:29.608579','2018-05-23 22:38:57.324916',0,'{\"1\": \"年假\", \"2\": \"调休\", \"3\": \"病假\", \"4\": \"婚假\"}',''),
	(6,1,55,'leave_reason','请假原因及相关附件',45,NULL,'','病假请提供证明拍照附件， 婚假请提供结婚证拍照附件','{}','admin','2018-05-11 07:36:41.882377','2018-05-11 07:36:41.882413',0,'{}',''),
	(7,2,55,'vpn_reason','申请原因',110,'请填写申请vpn的理由','vpn申请原因','','{}','admin','2018-05-12 10:02:31.501142','2018-05-12 10:02:31.501189',0,'{}','');

/*!40000 ALTER TABLE `workflow_customfield` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table workflow_customnotice
# ------------------------------------------------------------

DROP TABLE IF EXISTS `workflow_customnotice`;

CREATE TABLE `workflow_customnotice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `script` varchar(100) DEFAULT NULL,
  `title_template` varchar(50) DEFAULT NULL,
  `content_template` varchar(1000) DEFAULT NULL,
  `creator` varchar(50) NOT NULL,
  `gmt_created` datetime(6) NOT NULL,
  `gmt_modified` datetime(6) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table workflow_state
# ------------------------------------------------------------

DROP TABLE IF EXISTS `workflow_state`;

CREATE TABLE `workflow_state` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `workflow_id` int(11) NOT NULL,
  `sub_workflow_id` int(11) NOT NULL,
  `is_hidden` tinyint(1) NOT NULL,
  `order_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `participant_type_id` int(11) NOT NULL,
  `participant` varchar(100) NOT NULL,
  `distribute_type_id` int(11) NOT NULL,
  `state_field_str` longtext NOT NULL,
  `label` varchar(1000) NOT NULL,
  `creator` varchar(50) NOT NULL,
  `gmt_created` datetime(6) NOT NULL,
  `gmt_modified` datetime(6) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `remember_last_man_enable` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `workflow_state` WRITE;
/*!40000 ALTER TABLE `workflow_state` DISABLE KEYS */;

INSERT INTO `workflow_state` (`id`, `name`, `workflow_id`, `sub_workflow_id`, `is_hidden`, `order_id`, `type_id`, `participant_type_id`, `participant`, `distribute_type_id`, `state_field_str`, `label`, `creator`, `gmt_created`, `gmt_modified`, `is_deleted`, `remember_last_man_enable`)
VALUES
	(1,'新建中',1,0,0,0,1,1,'wangfei',1,'{\"title\":2, \"leave_start\": 2,  \"leave_end\":2,  \"leave_days\":2,  \"leave_proxy\":2,  \"leave_type\":2, \"leave_reason\":2}','{}','admin','2018-04-23 20:53:33.052134','2018-05-13 11:42:11.273695',0,0),
	(2,'发起人-编辑中',1,0,1,2,0,5,'creator',1,'{\"sn\":1,  \"title\":2, \"leave_start\": 2,  \"leave_end\":2,  \"leave_days\":2,  \"leave_proxy\":2,  \"leave_type\":2, \"creator\":1, \"gmt_created\":1,  \"leave_reason\":2, \"state.state_name\":1}','{}','admin','2018-04-30 15:45:48.976712','2018-05-14 06:44:10.661777',0,0),
	(3,'TL审批中',1,0,0,3,0,5,'creator_tl',1,'{\"sn\":1,  \"title\":1, \"leave_start\": 1,  \"leave_end\":1,  \"leave_days\":1,  \"leave_proxy\":1,  \"leave_type\":1, \"creator\":1, \"gmt_created\":1,  \"leave_reason\":1}','{}','admin','2018-04-30 15:46:42.184252','2018-05-13 11:42:46.035705',0,0),
	(4,'人事部门-处理中',1,0,0,4,0,1,'jack',1,'{\"sn\":1,  \"title\":1, \"leave_start\": 1,  \"leave_end\":1,  \"leave_days\":1,  \"leave_proxy\":1,  \"leave_type\":1, \"creator\":1, \"gmt_created\":1,  \"leave_reason\":1}','{}','admin','2018-04-30 15:47:58.790510','2018-05-13 11:42:59.834440',0,0),
	(5,'结束',1,0,0,6,2,0,'',1,'{}','{}','admin','2018-04-30 15:51:41.260309','2018-05-11 06:52:39.799922',0,0),
	(6,'发起人-新建中',2,0,0,1,1,5,'creator',1,'{\"vpn_reason\":2, \"title\":2}','{}','admin','2018-05-10 07:34:45.302697','2018-05-15 07:13:06.599270',0,0),
	(7,'发起人tl-审批中',2,0,0,2,0,5,'creator_tl',2,'{\"sn\":1,  \"title\":1, \"creator\":1, \"gmt_created\":1,  \"vpn_reason\":1}','{}','admin','2018-05-11 06:47:36.381658','2018-05-15 07:19:16.038155',0,0),
	(8,'运维人员-审批中',2,0,0,3,0,3,'3',1,'{\"sn\":1,  \"title\":1, \"creator\":1, \"gmt_created\":1,  \"vpn_reason\":1,\"participant_info.participant_alias\":1,\"participant_info.participant_name\":1}','{}','admin','2018-05-11 06:48:26.945117','2018-07-14 11:23:28.865836',0,0),
	(9,'授权脚本-自动执行中',2,0,0,4,0,6,'1',1,'{}','{}','admin','2018-05-11 06:50:09.416344','2018-05-11 07:10:25.197748',0,0),
	(10,'发起人-确认中',2,0,0,6,0,5,'creator',1,'{\"workflow.workflow_name\":1,\"sn\":1,\"state.state_name\":1,\"participant_info.participant_name\":1}','{}','admin','2018-05-11 06:51:02.913212','2018-05-22 22:21:51.867707',0,0),
	(11,'结束',2,0,0,7,2,0,'',1,'{}','{}','admin','2018-05-11 07:11:53.076731','2018-05-11 07:11:53.076766',0,0);

/*!40000 ALTER TABLE `workflow_state` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table workflow_transition
# ------------------------------------------------------------

DROP TABLE IF EXISTS `workflow_transition`;

CREATE TABLE `workflow_transition` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `workflow_id` int(11) NOT NULL,
  `transition_type_id` int(11) NOT NULL,
  `source_state_id` int(11) NOT NULL,
  `destination_state_id` int(11) NOT NULL,
  `alert_enable` tinyint(1) NOT NULL,
  `alert_text` varchar(100) NOT NULL,
  `creator` varchar(50) NOT NULL,
  `gmt_created` datetime(6) NOT NULL,
  `gmt_modified` datetime(6) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `field_require_check` tinyint(1) NOT NULL,
  `timer` int(11) NOT NULL,
  `attribute_type_id` int(11) NOT NULL,
  `condition_expression` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `workflow_transition` WRITE;
/*!40000 ALTER TABLE `workflow_transition` DISABLE KEYS */;

INSERT INTO `workflow_transition` (`id`, `name`, `workflow_id`, `transition_type_id`, `source_state_id`, `destination_state_id`, `alert_enable`, `alert_text`, `creator`, `gmt_created`, `gmt_modified`, `is_deleted`, `field_require_check`, `timer`, `attribute_type_id`, `condition_expression`)
VALUES
	(1,'提交',1,1,1,3,0,'','admin','2018-04-24 07:09:25.922814','2018-04-30 15:48:57.047369',0,1,0,1,'[]'),
	(2,'保存',1,1,1,2,0,'','admin','2018-04-30 15:30:25.650813','2018-04-30 15:48:52.372363',0,1,0,1,'[]'),
	(3,'同意',1,1,3,4,0,'','admin','2018-04-30 15:49:23.451582','2018-04-30 15:49:23.451627',0,1,0,1,'[]'),
	(4,'拒绝',1,1,3,2,1,'请确认是否真的拒绝','admin','2018-04-30 15:54:32.069649','2018-05-11 07:00:24.370322',0,0,0,1,'[]'),
	(5,'同意',1,1,4,5,0,'','admin','2018-04-30 15:55:00.072437','2018-05-11 07:03:29.349770',0,1,0,1,'[]'),
	(6,'退回',1,1,4,2,0,'','admin','2018-05-11 06:58:43.395655','2018-05-11 07:04:14.896678',0,0,0,1,'[]'),
	(7,'提交',2,1,6,7,0,'','admin','2018-05-11 07:06:22.745312','2018-05-11 07:06:22.745342',0,1,0,1,'[]'),
	(8,'同意',2,1,7,8,0,'','admin','2018-05-11 07:07:33.213731','2018-05-11 07:07:33.213760',0,1,0,1,'[]'),
	(9,'同意',2,1,8,9,0,'','admin','2018-05-11 07:12:53.036037','2018-05-11 07:12:53.036077',0,1,0,1,'[]'),
	(10,'脚本执行完成',2,1,9,10,0,'','admin','2018-05-11 07:13:12.070223','2018-05-11 07:13:12.070254',0,1,0,1,'[]'),
	(11,'确认完成',2,1,10,11,0,'','admin','2018-05-11 07:13:52.427815','2018-05-11 07:13:52.427844',0,1,0,1,'[]'),
	(12,'未生效',2,1,10,8,1,'是否真的退回？  请查看vpn使用文档保证使用姿势正确，再退回','admin','2018-05-11 07:16:26.826525','2018-05-11 07:16:36.072876',0,0,0,1,'[]'),
	(13,'提交',1,1,2,3,0,'','admin','2018-05-13 22:34:55.808381','2018-05-13 22:34:55.808461',0,1,0,1,'[]'),
	(14,'保存',1,1,2,2,0,'','admin','2018-05-13 22:35:05.020546','2018-05-13 22:35:05.020615',0,1,0,1,'[]');

/*!40000 ALTER TABLE `workflow_transition` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table workflow_workflow
# ------------------------------------------------------------

DROP TABLE IF EXISTS `workflow_workflow`;

CREATE TABLE `workflow_workflow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  `flowchart` varchar(100) NOT NULL,
  `display_form_str` varchar(10000) NOT NULL,
  `creator` varchar(50) NOT NULL,
  `gmt_created` datetime(6) NOT NULL,
  `gmt_modified` datetime(6) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `view_permission_check` tinyint(1) NOT NULL,
  `limit_expression` varchar(1000) NOT NULL,
  `notices` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `workflow_workflow` WRITE;
/*!40000 ALTER TABLE `workflow_workflow` DISABLE KEYS */;

INSERT INTO `workflow_workflow` (`id`, `name`, `description`, `flowchart`, `display_form_str`, `creator`, `gmt_created`, `gmt_modified`, `is_deleted`, `view_permission_check`, `limit_expression`, `notices`)
VALUES
	(1,'请假申请','请假申请','','[\"sn\", \"title\", \"leave_start\", \"leave_end\", \"leave_days\", \"leave_proxy\",  \"leave_type\", \"creator\", \"gmt_created\", \"leave_reason\"]','admin','2018-04-23 20:49:32.229386','2018-10-22 08:05:15.574860',0,0,'{}','2'),
	(2,'vpn申请','vpn权限申请','flowchart/WechatIMG242_YpFQb5K.jpeg','[\"sn\", \"title\", \"model\", \"gmt_created\",\"participant.participant_alias\"]','admin','2018-05-06 12:32:36.690665','2018-07-14 11:18:48.975018',0,1,'{}','');

/*!40000 ALTER TABLE `workflow_workflow` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table workflow_workflowscript
# ------------------------------------------------------------

DROP TABLE IF EXISTS `workflow_workflowscript`;

CREATE TABLE `workflow_workflowscript` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `saved_name` varchar(100) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `creator` varchar(50) NOT NULL,
  `gmt_created` datetime(6) NOT NULL,
  `gmt_modified` datetime(6) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `workflow_workflowscript` WRITE;
/*!40000 ALTER TABLE `workflow_workflowscript` DISABLE KEYS */;

INSERT INTO `workflow_workflowscript` (`id`, `name`, `saved_name`, `description`, `is_active`, `creator`, `gmt_created`, `gmt_modified`, `is_deleted`)
VALUES
	(1,'demo脚本','demo_script.py','示例脚本',1,'admin','2019-11-05 00:00:00.000000','2019-11-05 00:00:00.000000',0);

/*!40000 ALTER TABLE `workflow_workflowscript` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
