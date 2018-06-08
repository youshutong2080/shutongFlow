-- MySQL dump 10.13  Distrib 5.7.22, for osx10.13 (x86_64)
--
-- Host: localhost    Database: loonflownew
-- ------------------------------------------------------
-- Server version	5.7.22

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account_apptoken`
--

DROP TABLE IF EXISTS `account_apptoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_apptoken` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_name` varchar(50) NOT NULL,
  `token` varchar(50) NOT NULL,
  `creator` varchar(50) NOT NULL,
  `gmt_created` datetime(6) NOT NULL,
  `gmt_modified` datetime(6) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_apptoken`
--

LOCK TABLES `account_apptoken` WRITE;
/*!40000 ALTER TABLE `account_apptoken` DISABLE KEYS */;
INSERT INTO `account_apptoken` VALUES (1,'ops','8cd585da-3cc6-11e8-9946-784f437daad6','admin','2018-04-10 21:53:29.879742','2018-04-10 21:53:29.879772',0);
/*!40000 ALTER TABLE `account_apptoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_loondept`
--

DROP TABLE IF EXISTS `account_loondept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_loondept`
--

LOCK TABLES `account_loondept` WRITE;
/*!40000 ALTER TABLE `account_loondept` DISABLE KEYS */;
INSERT INTO `account_loondept` VALUES (6,'集团总部',0,'admin','','','admin','2018-05-28 16:01:42.174369','2018-05-28 16:01:42.174546',0),(7,'运维',0,'ops','','','admin','2018-05-28 16:02:11.432807','2018-05-28 16:02:11.432835',0),(8,'人事',0,'hr','','','admin','2018-05-28 16:02:33.087981','2018-05-28 16:02:33.088012',0),(9,'配置管理',0,'scm','','','admin','2018-05-28 16:02:51.057346','2018-05-28 16:02:51.057454',0);
/*!40000 ALTER TABLE `account_loondept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_loonrole`
--

DROP TABLE IF EXISTS `account_loonrole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_loonrole`
--

LOCK TABLES `account_loonrole` WRITE;
/*!40000 ALTER TABLE `account_loonrole` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_loonrole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_loonuser`
--

DROP TABLE IF EXISTS `account_loonuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_loonuser`
--

LOCK TABLES `account_loonuser` WRITE;
/*!40000 ALTER TABLE `account_loonuser` DISABLE KEYS */;
INSERT INTO `account_loonuser` VALUES (1,'pbkdf2_sha256$100000$BoQZquZL9sE7$OVm0zb1beQeWkas/IJBgxCkx8fqXlu9S0NamjmibSw0=','2018-05-31 19:51:34.856300','admin','超级管理员','admin@youshutong.com','13888888888',6,1,1,'admin','2018-04-10 16:24:50.146642','2018-05-28 16:20:37.981920',0),(8,'pbkdf2_sha256$100000$gJAYdq7DZdXs$U9pP1uBUV4XzA9/5O0bzrFGD0giqeZavyURS2AGUEVo=',NULL,'ops','运维管理','ops@youshutong.com','13888888888',7,1,0,'admin','2018-05-28 16:04:16.542595','2018-05-28 16:04:16.542630',0),(9,'pbkdf2_sha256$100000$ZQUcUfTpvjv6$lHeJYxu2qTcSOpWGuG1fGgzYMwa1bfq+FOixcZi3Tco=',NULL,'hr','人事管理','hr@youshutong.com','13888888888',8,1,0,'admin','2018-05-28 16:05:09.916961','2018-05-28 16:05:09.916987',0),(10,'pbkdf2_sha256$100000$PYbEYOyLGIrO$UAZzXCXlDQJSzKkoJGbVwDBsSq4+HqIke+1ShpW18iI=',NULL,'scm','配置管理','scm@youshutong.com','13888888888',9,1,0,'admin','2018-05-28 16:05:47.179991','2018-05-28 16:05:47.180020',0),(11,'pbkdf2_sha256$100000$6wmrOtoBtChd$zf3A+tTXiE5SRTMluwfwEt8DJShkrsVKekI6HlZ7Nbk=',NULL,'webb','王先生','webb@youshutong.com','13888888888',9,1,0,'admin','2018-05-28 16:06:34.654068','2018-05-28 16:09:54.857028',0),(12,'pbkdf2_sha256$100000$gsFKD19FkiVJ$L23JFxADxjbd+xnrQeg4qMMl+gl0LyRgj28tJIDCgl8=',NULL,'lilian','吴小姐','lilian@youshutong.com','13888888888',8,1,0,'admin','2018-05-28 16:07:59.665928','2018-05-28 16:07:59.665954',0),(13,'pbkdf2_sha256$100000$fa04ngjg1hbG$Q91jJTyITNOp1bKMHZ5UCjIFz0V5MgjT0ye06rAaNBE=',NULL,'david','李先生','david@youshutong.com','13888888888',7,1,0,'admin','2018-05-28 16:09:28.161539','2018-05-28 16:09:28.161595',0);
/*!40000 ALTER TABLE `account_loonuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_loonuserrole`
--

DROP TABLE IF EXISTS `account_loonuserrole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_loonuserrole` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `creator` varchar(50) NOT NULL,
  `gmt_created` datetime(6) NOT NULL,
  `gmt_modified` datetime(6) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_loonuserrole`
--

LOCK TABLES `account_loonuserrole` WRITE;
/*!40000 ALTER TABLE `account_loonuserrole` DISABLE KEYS */;
INSERT INTO `account_loonuserrole` VALUES (1,2,1,'admin','2018-05-09 07:05:32.301883','2018-05-09 07:05:32.301929',0);
/*!40000 ALTER TABLE `account_loonuserrole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add permission',3,'add_permission'),(8,'Can change permission',3,'change_permission'),(9,'Can delete permission',3,'delete_permission'),(10,'Can add content type',4,'add_contenttype'),(11,'Can change content type',4,'change_contenttype'),(12,'Can delete content type',4,'delete_contenttype'),(13,'Can add session',5,'add_session'),(14,'Can change session',5,'change_session'),(15,'Can delete session',5,'delete_session'),(16,'Can add 用户角色',6,'add_loonuserrole'),(17,'Can change 用户角色',6,'change_loonuserrole'),(18,'Can delete 用户角色',6,'delete_loonuserrole'),(19,'Can add 角色',7,'add_loonrole'),(20,'Can change 角色',7,'change_loonrole'),(21,'Can delete 角色',7,'delete_loonrole'),(22,'Can add 部门',8,'add_loondept'),(23,'Can change 部门',8,'change_loondept'),(24,'Can delete 部门',8,'delete_loondept'),(25,'Can add 用户',9,'add_loonuser'),(26,'Can change 用户',9,'change_loonuser'),(27,'Can delete 用户',9,'delete_loonuser'),(28,'Can add ticket record',10,'add_ticketrecord'),(29,'Can change ticket record',10,'change_ticketrecord'),(30,'Can delete ticket record',10,'delete_ticketrecord'),(31,'Can add ticket state last man',11,'add_ticketstatelastman'),(32,'Can change ticket state last man',11,'change_ticketstatelastman'),(33,'Can delete ticket state last man',11,'delete_ticketstatelastman'),(34,'Can add ticket custom field',12,'add_ticketcustomfield'),(35,'Can change ticket custom field',12,'change_ticketcustomfield'),(36,'Can delete ticket custom field',12,'delete_ticketcustomfield'),(37,'Can add ticket flow log',13,'add_ticketflowlog'),(38,'Can change ticket flow log',13,'change_ticketflowlog'),(39,'Can delete ticket flow log',13,'delete_ticketflowlog'),(40,'Can add custom notice',14,'add_customnotice'),(41,'Can change custom notice',14,'change_customnotice'),(42,'Can delete custom notice',14,'delete_customnotice'),(43,'Can add workflow script',15,'add_workflowscript'),(44,'Can change workflow script',15,'change_workflowscript'),(45,'Can delete workflow script',15,'delete_workflowscript'),(46,'Can add custom field',16,'add_customfield'),(47,'Can change custom field',16,'change_customfield'),(48,'Can delete custom field',16,'delete_customfield'),(49,'Can add state',17,'add_state'),(50,'Can change state',17,'change_state'),(51,'Can delete state',17,'delete_state'),(52,'Can add workflow',18,'add_workflow'),(53,'Can change workflow',18,'change_workflow'),(54,'Can delete workflow',18,'delete_workflow'),(55,'Can add transition',19,'add_transition'),(56,'Can change transition',19,'change_transition'),(57,'Can delete transition',19,'delete_transition'),(58,'Can add 调用token',20,'add_apptoken'),(59,'Can change 调用token',20,'change_apptoken'),(60,'Can delete 调用token',20,'delete_apptoken');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=350 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2018-04-10 16:41:27.371448','1','LoonDept object (1)',1,'[{\"added\": {}}]',8,1),(2,'2018-04-10 16:43:20.412821','1','TicketRecord object (1)',1,'[{\"added\": {}}]',10,1),(3,'2018-04-10 16:48:43.820666','2','TicketRecord object (2)',1,'[{\"added\": {}}]',10,1),(4,'2018-04-10 17:22:45.041511','1','TicketCustomField object (1)',1,'[{\"added\": {}}]',12,1),(5,'2018-04-10 17:39:33.646162','1','TicketFlowLog object (1)',1,'[{\"added\": {}}]',13,1),(6,'2018-04-10 21:53:29.880887','1','AppToken object (1)',1,'[{\"added\": {}}]',20,1),(7,'2018-04-14 23:37:06.997088','2','LoonDept object (2)',1,'[{\"added\": {}}]',8,1),(8,'2018-04-14 23:37:23.932965','3','LoonDept object (3)',1,'[{\"added\": {}}]',8,1),(9,'2018-04-14 23:37:36.704502','4','LoonDept object (4)',1,'[{\"added\": {}}]',8,1),(10,'2018-04-14 23:38:18.392472','2','guiji',1,'[{\"added\": {}}]',9,1),(11,'2018-04-14 23:42:25.710130','3','hah',1,'[{\"added\": {}}]',9,1),(12,'2018-04-23 20:49:32.232372','1','Workflow object (1)',1,'[{\"added\": {}}]',18,1),(13,'2018-04-23 20:53:33.056648','1','State object (1)',1,'[{\"added\": {}}]',17,1),(14,'2018-04-23 20:56:25.945319','1','CustomField object (1)',1,'[{\"added\": {}}]',16,1),(15,'2018-04-23 20:56:49.875057','1','State object (1)',2,'[{\"changed\": {\"fields\": [\"state_field_str\"]}}]',17,1),(16,'2018-04-24 06:57:24.740151','1','Workflow object (1)',2,'[{\"changed\": {\"fields\": [\"display_form_str\"]}}]',18,1),(17,'2018-04-24 06:58:45.040694','1','Workflow object (1)',2,'[{\"changed\": {\"fields\": [\"display_form_str\"]}}]',18,1),(18,'2018-04-24 07:09:25.924775','1','Transition object (1)',1,'[{\"added\": {}}]',19,1),(19,'2018-04-24 07:15:38.015269','1','State object (1)',2,'[{\"changed\": {\"fields\": [\"state_field_str\"]}}]',17,1),(20,'2018-04-24 07:15:54.951782','1','State object (1)',2,'[{\"changed\": {\"fields\": [\"state_field_str\"]}}]',17,1),(21,'2018-04-30 15:30:25.653254','2','Transition object (2)',1,'[{\"added\": {}}]',19,1),(22,'2018-04-30 15:45:48.978997','2','State object (2)',1,'[{\"added\": {}}]',17,1),(23,'2018-04-30 15:46:42.186978','3','State object (3)',1,'[{\"added\": {}}]',17,1),(24,'2018-04-30 15:47:58.792301','4','State object (4)',1,'[{\"added\": {}}]',17,1),(25,'2018-04-30 15:48:52.379536','2','Transition object (2)',2,'[{\"changed\": {\"fields\": [\"destination_state_id\"]}}]',19,1),(26,'2018-04-30 15:48:57.049551','1','Transition object (1)',2,'[{\"changed\": {\"fields\": [\"destination_state_id\"]}}]',19,1),(27,'2018-04-30 15:49:23.452938','3','Transition object (3)',1,'[{\"added\": {}}]',19,1),(28,'2018-04-30 15:50:00.971444','5','State object (5)',1,'[{\"added\": {}}]',17,1),(29,'2018-04-30 15:51:41.264461','6','State object (6)',1,'[{\"added\": {}}]',17,1),(30,'2018-04-30 15:52:16.535041','1','TicketFlowLog object (1)',2,'[{\"changed\": {\"fields\": [\"participant\"]}}]',13,1),(31,'2018-04-30 15:52:35.306847','1','TicketFlowLog object (1)',2,'[{\"changed\": {\"fields\": [\"suggestion\"]}}]',13,1),(32,'2018-04-30 15:53:19.306551','2','TicketFlowLog object (2)',1,'[{\"added\": {}}]',13,1),(33,'2018-04-30 15:54:32.070531','4','Transition object (4)',1,'[{\"added\": {}}]',19,1),(34,'2018-04-30 15:55:00.074263','5','Transition object (5)',1,'[{\"added\": {}}]',19,1),(35,'2018-04-30 15:55:32.417133','3','TicketFlowLog object (3)',1,'[{\"added\": {}}]',13,1),(36,'2018-04-30 15:56:02.571406','4','TicketFlowLog object (4)',1,'[{\"added\": {}}]',13,1),(37,'2018-04-30 15:57:00.143445','2','TicketFlowLog object (2)',2,'[{\"changed\": {\"fields\": [\"state_id\"]}}]',13,1),(38,'2018-04-30 15:57:14.407122','3','TicketFlowLog object (3)',2,'[{\"changed\": {\"fields\": [\"state_id\"]}}]',13,1),(39,'2018-04-30 15:57:26.345616','4','TicketFlowLog object (4)',2,'[{\"changed\": {\"fields\": [\"state_id\"]}}]',13,1),(40,'2018-04-30 16:20:38.479478','1','State object (1)',2,'[{\"changed\": {\"fields\": [\"is_hidden\"]}}]',17,1),(41,'2018-04-30 16:20:55.076990','3','State object (3)',2,'[{\"changed\": {\"fields\": [\"is_hidden\"]}}]',17,1),(42,'2018-04-30 16:21:02.336811','4','State object (4)',2,'[{\"changed\": {\"fields\": [\"is_hidden\"]}}]',17,1),(43,'2018-04-30 16:21:07.513626','5','State object (5)',2,'[{\"changed\": {\"fields\": [\"is_hidden\"]}}]',17,1),(44,'2018-04-30 16:21:13.163688','6','State object (6)',2,'[{\"changed\": {\"fields\": [\"is_hidden\"]}}]',17,1),(45,'2018-04-30 20:33:11.317176','1','TicketRecord object (1)',2,'[{\"changed\": {\"fields\": [\"state_id\"]}}]',10,1),(46,'2018-05-02 07:14:18.036032','1','TicketRecord object (1)',2,'[{\"changed\": {\"fields\": [\"participant_type_id\"]}}]',10,1),(47,'2018-05-02 07:16:34.696279','1','TicketRecord object (1)',2,'[{\"changed\": {\"fields\": [\"state_id\"]}}]',10,1),(48,'2018-05-02 07:32:09.915224','1','TicketRecord object (1)',2,'[{\"changed\": {\"fields\": [\"participant_type_id\", \"participant\"]}}]',10,1),(49,'2018-05-02 09:57:24.555618','1','TicketRecord object (1)',2,'[{\"changed\": {\"fields\": [\"participant_type_id\", \"participant\"]}}]',10,1),(50,'2018-05-05 16:00:25.314396','1','WorkflowScript object (1)',1,'[{\"added\": {}}]',15,1),(51,'2018-05-05 16:05:50.756135','2','WorkflowScript object (2)',1,'[{\"added\": {}}]',15,1),(52,'2018-05-05 16:29:29.901517','3','WorkflowScript object (3)',1,'[{\"added\": {}}]',15,1),(53,'2018-05-05 16:30:43.883607','4','WorkflowScript object (4)',1,'[{\"added\": {}}]',15,1),(54,'2018-05-05 16:31:06.336502','4','WorkflowScript object (4)',2,'[{\"changed\": {\"fields\": [\"is_active\"]}}]',15,1),(55,'2018-05-05 22:54:48.913998','4','zhangsan',1,'[{\"added\": {}}]',9,1),(56,'2018-05-06 12:32:36.701617','2','Workflow object (2)',1,'[{\"added\": {}}]',18,1),(57,'2018-05-08 06:50:35.276119','2','Workflow object (2)',2,'[{\"changed\": {\"fields\": [\"name\"]}}]',18,1),(58,'2018-05-08 06:50:47.308245','1','Workflow object (1)',2,'[{\"changed\": {\"fields\": [\"name\", \"description\"]}}]',18,1),(59,'2018-05-08 06:50:56.521305','2','Workflow object (2)',2,'[{\"changed\": {\"fields\": [\"description\"]}}]',18,1),(60,'2018-05-08 21:15:16.433888','1','State object (1)',2,'[{\"changed\": {\"fields\": [\"type_id\"]}}]',17,1),(61,'2018-05-08 21:16:18.128035','1','State object (1)',2,'[{\"changed\": {\"fields\": [\"type_id\"]}}]',17,1),(62,'2018-05-08 21:16:33.106507','1','State object (1)',2,'[{\"changed\": {\"fields\": [\"type_id\"]}}]',17,1),(63,'2018-05-09 06:44:38.400539','3','李磊',2,'[{\"changed\": {\"fields\": [\"username\", \"alias\", \"email\"]}}]',9,1),(64,'2018-05-09 06:45:12.998421','2','LoonDept object (2)',2,'[{\"changed\": {\"fields\": [\"leader\"]}}]',8,1),(65,'2018-05-09 06:45:27.317759','2','LoonDept object (2)',2,'[{\"changed\": {\"fields\": [\"leader\"]}}]',8,1),(66,'2018-05-09 06:45:44.025800','4','LoonDept object (4)',2,'[{\"changed\": {\"fields\": [\"leader\"]}}]',8,1),(67,'2018-05-09 06:45:57.695441','1','LoonDept object (1)',2,'[{\"changed\": {\"fields\": [\"leader\"]}}]',8,1),(68,'2018-05-09 06:46:21.353123','3','lilei',2,'[{\"changed\": {\"fields\": [\"username\", \"alias\"]}}]',9,1),(69,'2018-05-09 06:46:40.026932','1','admin',2,'[{\"changed\": {\"fields\": [\"alias\", \"phone\"]}}]',9,1),(70,'2018-05-09 06:57:21.399430','4','zhangsan',2,'[]',9,1),(71,'2018-05-09 06:57:31.480613','4','zhangsan',2,'[]',9,1),(72,'2018-05-09 06:57:57.104306','4','zhangsan',2,'[]',9,1),(73,'2018-05-09 06:58:59.737392','5','aaa',1,'[{\"added\": {}}]',9,1),(74,'2018-05-09 06:59:57.018591','5','aaa',2,'[{\"changed\": {\"fields\": [\"phone\"]}}]',9,1),(75,'2018-05-09 07:00:08.256294','5','aaa',2,'[{\"changed\": {\"fields\": [\"phone\"]}}]',9,1),(76,'2018-05-09 07:00:19.792755','4','zhangsan',2,'[{\"changed\": {\"fields\": [\"phone\"]}}]',9,1),(77,'2018-05-09 07:00:28.000474','3','lilei',2,'[{\"changed\": {\"fields\": [\"phone\"]}}]',9,1),(78,'2018-05-09 07:00:34.122113','2','guiji',2,'[{\"changed\": {\"fields\": [\"phone\"]}}]',9,1),(79,'2018-05-09 07:00:39.717494','1','admin',2,'[{\"changed\": {\"fields\": [\"phone\"]}}]',9,1),(80,'2018-05-09 07:01:10.342386','5','lisi',2,'[{\"changed\": {\"fields\": [\"username\", \"alias\", \"email\"]}}]',9,1),(81,'2018-05-09 07:01:50.406258','6','wangwu',1,'[{\"added\": {}}]',9,1),(82,'2018-05-09 07:01:58.901060','6','wangwu',2,'[{\"changed\": {\"fields\": [\"dept_id\"]}}]',9,1),(83,'2018-05-09 07:02:27.253982','4','zhangsan',2,'[{\"changed\": {\"fields\": [\"dept_id\"]}}]',9,1),(84,'2018-05-09 07:02:42.222474','1','admin',2,'[{\"changed\": {\"fields\": [\"dept_id\"]}}]',9,1),(85,'2018-05-09 07:02:52.076901','5','lisi',2,'[{\"changed\": {\"fields\": [\"dept_id\"]}}]',9,1),(86,'2018-05-09 07:03:03.188035','6','wangwu',2,'[{\"changed\": {\"fields\": [\"dept_id\"]}}]',9,1),(87,'2018-05-09 07:03:32.428843','3','LoonDept object (3)',2,'[{\"changed\": {\"fields\": [\"leader\"]}}]',8,1),(88,'2018-05-09 07:03:50.474873','1','LoonDept object (1)',2,'[{\"changed\": {\"fields\": [\"leader\"]}}]',8,1),(89,'2018-05-09 07:04:53.362885','4','LoonDept object (4)',2,'[{\"changed\": {\"fields\": [\"approver\"]}}]',8,1),(90,'2018-05-09 07:05:32.302984','1','LoonUserRole object (1)',1,'[{\"added\": {}}]',6,1),(91,'2018-05-09 07:06:02.739935','1','LoonRole object (1)',1,'[{\"added\": {}}]',7,1),(92,'2018-05-09 07:10:47.328804','3','Workflow object (3)',1,'[{\"added\": {}}]',18,1),(93,'2018-05-09 07:17:18.966435','2','Workflow object (2)',2,'[{\"changed\": {\"fields\": [\"flowchart\"]}}]',18,1),(94,'2018-05-09 07:17:41.651573','2','Workflow object (2)',2,'[{\"changed\": {\"fields\": [\"display_form_str\"]}}]',18,1),(95,'2018-05-09 07:17:49.336722','3','Workflow object (3)',3,'',18,1),(96,'2018-05-09 07:21:40.230215','4','State object (4)',2,'[{\"changed\": {\"fields\": [\"name\"]}}]',17,1),(97,'2018-05-09 07:22:09.520970','5','LoonDept object (5)',1,'[{\"added\": {}}]',8,1),(98,'2018-05-09 07:22:53.494815','7','jack',1,'[{\"added\": {}}]',9,1),(99,'2018-05-10 07:34:45.309242','7','State object (7)',1,'[{\"added\": {}}]',17,1),(100,'2018-05-10 07:37:57.667512','1','CustomField object (1)',2,'[{\"changed\": {\"fields\": [\"field_key\", \"field_name\"]}}]',16,1),(101,'2018-05-10 07:41:03.720632','2','CustomField object (2)',1,'[{\"added\": {}}]',16,1),(102,'2018-05-10 07:41:13.238769','1','CustomField object (1)',2,'[{\"changed\": {\"fields\": [\"field_type_id\"]}}]',16,1),(103,'2018-05-10 07:41:56.892036','1','CustomField object (1)',2,'[{\"changed\": {\"fields\": [\"order_id\"]}}]',16,1),(104,'2018-05-11 06:47:36.390140','8','State object (8)',1,'[{\"added\": {}}]',17,1),(105,'2018-05-11 06:48:26.948684','9','State object (9)',1,'[{\"added\": {}}]',17,1),(106,'2018-05-11 06:50:09.417112','10','State object (10)',1,'[{\"added\": {}}]',17,1),(107,'2018-05-11 06:51:02.915599','11','State object (11)',1,'[{\"added\": {}}]',17,1),(108,'2018-05-11 06:52:39.803234','6','State object (6)',2,'[{\"changed\": {\"fields\": [\"participant_type_id\"]}}]',17,1),(109,'2018-05-11 06:58:43.399074','6','Transition object (6)',1,'[{\"added\": {}}]',19,1),(110,'2018-05-11 07:00:24.371739','4','Transition object (4)',2,'[{\"changed\": {\"fields\": [\"name\", \"source_state_id\", \"destination_state_id\", \"field_require_check\", \"alert_enable\", \"alert_text\"]}}]',19,1),(111,'2018-05-11 07:00:52.921792','5','Transition object (5)',2,'[{\"changed\": {\"fields\": [\"name\", \"source_state_id\", \"destination_state_id\"]}}]',19,1),(112,'2018-05-11 07:01:52.181201','5','State object (5)',3,'',17,1),(113,'2018-05-11 07:03:29.352745','5','Transition object (5)',2,'[{\"changed\": {\"fields\": [\"source_state_id\", \"destination_state_id\"]}}]',19,1),(114,'2018-05-11 07:04:14.898117','6','Transition object (6)',2,'[{\"changed\": {\"fields\": [\"name\", \"workflow_id\", \"source_state_id\", \"destination_state_id\", \"field_require_check\"]}}]',19,1),(115,'2018-05-11 07:06:22.747270','7','Transition object (7)',1,'[{\"added\": {}}]',19,1),(116,'2018-05-11 07:07:33.214528','8','Transition object (8)',1,'[{\"added\": {}}]',19,1),(117,'2018-05-11 07:08:33.440502','8','State object (8)',2,'[{\"changed\": {\"fields\": [\"name\"]}}]',17,1),(118,'2018-05-11 07:10:25.201782','9','State object (9)',2,'[{\"changed\": {\"fields\": [\"name\", \"participant_type_id\", \"participant\"]}}]',17,1),(119,'2018-05-11 07:11:28.673604','10','State object (10)',2,'[{\"changed\": {\"fields\": [\"name\", \"order_id\", \"type_id\", \"participant_type_id\", \"participant\"]}}]',17,1),(120,'2018-05-11 07:11:53.077507','12','State object (12)',1,'[{\"added\": {}}]',17,1),(121,'2018-05-11 07:12:53.037065','9','Transition object (9)',1,'[{\"added\": {}}]',19,1),(122,'2018-05-11 07:13:12.070939','10','Transition object (10)',1,'[{\"added\": {}}]',19,1),(123,'2018-05-11 07:13:52.428524','11','Transition object (11)',1,'[{\"added\": {}}]',19,1),(124,'2018-05-11 07:16:26.827492','12','Transition object (12)',1,'[{\"added\": {}}]',19,1),(125,'2018-05-11 07:16:36.074415','12','Transition object (12)',2,'[{\"changed\": {\"fields\": [\"field_require_check\"]}}]',19,1),(126,'2018-05-11 07:27:11.605280','1','CustomField object (1)',2,'[{\"changed\": {\"fields\": [\"field_type_id\", \"field_key\", \"field_name\"]}}]',16,1),(127,'2018-05-11 07:27:32.716438','2','CustomField object (2)',2,'[{\"changed\": {\"fields\": [\"field_type_id\", \"field_key\", \"field_name\"]}}]',16,1),(128,'2018-05-11 07:28:31.651385','3','CustomField object (3)',1,'[{\"added\": {}}]',16,1),(129,'2018-05-11 07:30:01.579803','3','CustomField object (3)',2,'[{\"changed\": {\"fields\": [\"field_type_id\", \"field_key\", \"field_name\", \"description\"]}}]',16,1),(130,'2018-05-11 07:31:01.069847','4','CustomField object (4)',1,'[{\"added\": {}}]',16,1),(131,'2018-05-11 07:31:11.135481','1','CustomField object (1)',2,'[{\"changed\": {\"fields\": [\"order_id\"]}}]',16,1),(132,'2018-05-11 07:31:19.926090','2','CustomField object (2)',2,'[{\"changed\": {\"fields\": [\"order_id\"]}}]',16,1),(133,'2018-05-11 07:31:28.837817','3','CustomField object (3)',2,'[{\"changed\": {\"fields\": [\"order_id\"]}}]',16,1),(134,'2018-05-11 07:31:35.324557','4','CustomField object (4)',2,'[{\"changed\": {\"fields\": [\"order_id\"]}}]',16,1),(135,'2018-05-11 07:34:29.610951','5','CustomField object (5)',1,'[{\"added\": {}}]',16,1),(136,'2018-05-11 07:34:36.494826','5','CustomField object (5)',2,'[{\"changed\": {\"fields\": [\"order_id\"]}}]',16,1),(137,'2018-05-11 07:36:41.886558','6','CustomField object (6)',1,'[{\"added\": {}}]',16,1),(138,'2018-05-12 09:30:21.816878','4','WorkflowScript object (4)',3,'',15,1),(139,'2018-05-12 09:30:21.825379','3','WorkflowScript object (3)',3,'',15,1),(140,'2018-05-12 09:30:21.828199','2','WorkflowScript object (2)',3,'',15,1),(141,'2018-05-12 09:30:21.831010','1','WorkflowScript object (1)',3,'',15,1),(142,'2018-05-12 09:32:41.503701','5','WorkflowScript object (5)',2,'[{\"changed\": {\"fields\": [\"is_active\"]}}]',15,1),(143,'2018-05-12 09:39:01.044508','6','TicketFlowLog object (6)',3,'',13,1),(144,'2018-05-12 09:39:01.048177','5','TicketFlowLog object (5)',3,'',13,1),(145,'2018-05-12 09:39:01.051358','4','TicketFlowLog object (4)',3,'',13,1),(146,'2018-05-12 09:39:01.054278','3','TicketFlowLog object (3)',3,'',13,1),(147,'2018-05-12 09:39:01.057906','2','TicketFlowLog object (2)',3,'',13,1),(148,'2018-05-12 09:39:01.059693','1','TicketFlowLog object (1)',3,'',13,1),(149,'2018-05-12 09:39:15.345379','1','TicketCustomField object (1)',3,'',12,1),(150,'2018-05-12 09:39:40.905715','2','TicketRecord object (2)',3,'',10,1),(151,'2018-05-12 09:39:40.909196','1','TicketRecord object (1)',3,'',10,1),(152,'2018-05-12 09:40:48.913446','4','Workflow object (4)',1,'[{\"added\": {}}]',18,1),(153,'2018-05-12 09:41:56.334411','5','Workflow object (5)',1,'[{\"added\": {}}]',18,1),(154,'2018-05-12 09:43:27.851903','13','State object (13)',1,'[{\"added\": {}}]',17,1),(155,'2018-05-12 10:02:31.504686','7','CustomField object (7)',1,'[{\"added\": {}}]',16,1),(156,'2018-05-12 10:05:06.484413','8','CustomField object (8)',1,'[{\"added\": {}}]',16,1),(157,'2018-05-12 10:52:47.141754','9','CustomField object (9)',1,'[{\"added\": {}}]',16,1),(158,'2018-05-12 10:53:14.718498','10','CustomField object (10)',1,'[{\"added\": {}}]',16,1),(159,'2018-05-13 11:00:50.505075','11','CustomField object (11)',1,'[{\"added\": {}}]',16,1),(160,'2018-05-13 11:01:20.651616','12','CustomField object (12)',1,'[{\"added\": {}}]',16,1),(161,'2018-05-13 11:05:48.193472','14','State object (14)',1,'[{\"added\": {}}]',17,1),(162,'2018-05-13 11:06:03.751286','14','State object (14)',2,'[{\"changed\": {\"fields\": [\"sub_workflow_id\"]}}]',17,1),(163,'2018-05-13 11:07:18.514558','15','State object (15)',1,'[{\"added\": {}}]',17,1),(164,'2018-05-13 11:07:48.483499','16','State object (16)',1,'[{\"added\": {}}]',17,1),(165,'2018-05-13 11:10:36.044615','17','State object (17)',1,'[{\"added\": {}}]',17,1),(166,'2018-05-13 11:13:00.583531','18','State object (18)',1,'[{\"added\": {}}]',17,1),(167,'2018-05-13 11:13:25.616042','19','State object (19)',1,'[{\"added\": {}}]',17,1),(168,'2018-05-13 11:18:07.523093','20','State object (20)',1,'[{\"added\": {}}]',17,1),(169,'2018-05-13 11:23:27.199379','21','State object (21)',1,'[{\"added\": {}}]',17,1),(170,'2018-05-13 11:24:03.443085','22','State object (22)',1,'[{\"added\": {}}]',17,1),(171,'2018-05-13 11:24:26.021075','23','State object (23)',1,'[{\"added\": {}}]',17,1),(172,'2018-05-13 11:29:26.863526','24','State object (24)',1,'[{\"added\": {}}]',17,1),(173,'2018-05-13 11:29:54.167372','25','State object (25)',1,'[{\"added\": {}}]',17,1),(174,'2018-05-13 11:39:31.326527','1','State object (1)',2,'[{\"changed\": {\"fields\": [\"state_field_str\"]}}]',17,1),(175,'2018-05-13 11:41:39.486386','2','State object (2)',2,'[{\"changed\": {\"fields\": [\"state_field_str\"]}}]',17,1),(176,'2018-05-13 11:42:11.276418','1','State object (1)',2,'[{\"changed\": {\"fields\": [\"state_field_str\"]}}]',17,1),(177,'2018-05-13 11:42:18.797194','2','State object (2)',2,'[]',17,1),(178,'2018-05-13 11:42:46.037250','3','State object (3)',2,'[{\"changed\": {\"fields\": [\"state_field_str\"]}}]',17,1),(179,'2018-05-13 11:42:59.836340','4','State object (4)',2,'[{\"changed\": {\"fields\": [\"state_field_str\"]}}]',17,1),(180,'2018-05-13 11:45:22.525271','1','Workflow object (1)',2,'[{\"changed\": {\"fields\": [\"display_form_str\"]}}]',18,1),(181,'2018-05-13 21:52:30.445390','12','TicketRecord object (12)',3,'',10,1),(182,'2018-05-13 21:52:30.450894','11','TicketRecord object (11)',3,'',10,1),(183,'2018-05-13 21:52:30.453813','10','TicketRecord object (10)',3,'',10,1),(184,'2018-05-13 21:52:30.457430','9','TicketRecord object (9)',3,'',10,1),(185,'2018-05-13 21:52:30.460235','8','TicketRecord object (8)',3,'',10,1),(186,'2018-05-13 21:52:30.463067','7','TicketRecord object (7)',3,'',10,1),(187,'2018-05-13 21:52:30.465696','6','TicketRecord object (6)',3,'',10,1),(188,'2018-05-13 21:52:30.468862','5','TicketRecord object (5)',3,'',10,1),(189,'2018-05-13 21:52:30.471665','4','TicketRecord object (4)',3,'',10,1),(190,'2018-05-13 21:52:30.475075','3','TicketRecord object (3)',3,'',10,1),(191,'2018-05-13 21:52:40.353331','8','TicketFlowLog object (8)',3,'',13,1),(192,'2018-05-13 21:52:40.357544','7','TicketFlowLog object (7)',3,'',13,1),(193,'2018-05-13 21:52:51.921703','13','TicketCustomField object (13)',3,'',12,1),(194,'2018-05-13 21:52:51.925544','12','TicketCustomField object (12)',3,'',12,1),(195,'2018-05-13 21:52:51.929737','11','TicketCustomField object (11)',3,'',12,1),(196,'2018-05-13 21:52:51.932684','10','TicketCustomField object (10)',3,'',12,1),(197,'2018-05-13 21:52:51.937093','9','TicketCustomField object (9)',3,'',12,1),(198,'2018-05-13 21:52:51.940781','8','TicketCustomField object (8)',3,'',12,1),(199,'2018-05-13 21:52:51.943562','7','TicketCustomField object (7)',3,'',12,1),(200,'2018-05-13 21:52:51.946282','6','TicketCustomField object (6)',3,'',12,1),(201,'2018-05-13 21:52:51.949748','5','TicketCustomField object (5)',3,'',12,1),(202,'2018-05-13 21:52:51.952655','4','TicketCustomField object (4)',3,'',12,1),(203,'2018-05-13 21:52:51.955529','3','TicketCustomField object (3)',3,'',12,1),(204,'2018-05-13 21:52:51.958281','2','TicketCustomField object (2)',3,'',12,1),(205,'2018-05-13 22:15:33.205999','5','CustomField object (5)',2,'[{\"changed\": {\"fields\": [\"field_choice\"]}}]',16,1),(206,'2018-05-13 22:20:52.916723','1','Workflow object (1)',2,'[{\"changed\": {\"fields\": [\"view_permission_check\"]}}]',18,1),(207,'2018-05-13 22:28:39.393075','13','TicketRecord object (13)',3,'',10,1),(208,'2018-05-13 22:34:55.809709','13','Transition object (13)',1,'[{\"added\": {}}]',19,1),(209,'2018-05-13 22:35:05.023248','14','Transition object (14)',1,'[{\"added\": {}}]',19,1),(210,'2018-05-14 06:33:27.477305','15','TicketRecord object (15)',2,'[{\"changed\": {\"fields\": [\"participant_type_id\", \"participant\"]}}]',10,1),(211,'2018-05-14 06:36:35.583915','2','State object (2)',2,'[{\"changed\": {\"fields\": [\"state_field_str\"]}}]',17,1),(212,'2018-05-14 06:44:10.386635','2','State object (2)',2,'[{\"changed\": {\"fields\": [\"state_field_str\"]}}]',17,1),(213,'2018-05-14 06:44:10.686119','2','State object (2)',2,'[{\"changed\": {\"fields\": [\"state_field_str\"]}}]',17,1),(214,'2018-05-14 06:46:38.351021','1','Workflow object (1)',2,'[{\"changed\": {\"fields\": [\"view_permission_check\"]}}]',18,1),(215,'2018-05-14 06:46:54.963491','1','Workflow object (1)',2,'[{\"changed\": {\"fields\": [\"view_permission_check\"]}}]',18,1),(216,'2018-05-15 07:13:06.602752','6','State object (6)',2,'[{\"changed\": {\"fields\": [\"state_field_str\"]}}]',17,1),(217,'2018-05-15 07:19:16.050832','7','State object (7)',2,'[{\"changed\": {\"fields\": [\"state_field_str\"]}}]',17,1),(218,'2018-05-15 07:37:12.926590','17','TicketRecord object (17)',2,'[{\"changed\": {\"fields\": [\"relation\"]}}]',10,1),(219,'2018-05-16 06:57:11.209321','17','TicketRecord object (17)',2,'[{\"changed\": {\"fields\": [\"state_id\", \"participant_type_id\", \"participant\"]}}]',10,1),(220,'2018-05-16 06:58:36.853125','17','TicketRecord object (17)',2,'[{\"changed\": {\"fields\": [\"state_id\", \"participant_type_id\", \"participant\"]}}]',10,1),(221,'2018-05-16 07:01:48.836327','17','TicketRecord object (17)',2,'[{\"changed\": {\"fields\": [\"state_id\", \"participant_type_id\", \"participant\"]}}]',10,1),(222,'2018-05-16 07:03:21.974005','17','TicketRecord object (17)',2,'[{\"changed\": {\"fields\": [\"state_id\", \"participant\"]}}]',10,1),(223,'2018-05-16 07:04:29.225097','17','TicketRecord object (17)',2,'[{\"changed\": {\"fields\": [\"state_id\", \"participant\"]}}]',10,1),(224,'2018-05-16 07:31:24.913771','17','TicketRecord object (17)',2,'[{\"changed\": {\"fields\": [\"state_id\", \"participant\"]}}]',10,1),(225,'2018-05-16 23:20:55.440488','17','TicketRecord object (17)',2,'[{\"changed\": {\"fields\": [\"state_id\", \"participant\"]}}]',10,1),(226,'2018-05-16 23:23:54.673079','17','TicketRecord object (17)',2,'[{\"changed\": {\"fields\": [\"state_id\", \"participant\", \"relation\"]}}]',10,1),(227,'2018-05-16 23:24:40.088742','17','TicketRecord object (17)',2,'[{\"changed\": {\"fields\": [\"state_id\", \"participant\", \"relation\"]}}]',10,1),(228,'2018-05-16 23:33:22.201139','17','TicketRecord object (17)',2,'[{\"changed\": {\"fields\": [\"state_id\", \"participant\", \"relation\"]}}]',10,1),(229,'2018-05-20 23:22:11.031943','17','TicketRecord object (17)',2,'[{\"changed\": {\"fields\": [\"participant_type_id\", \"participant\"]}}]',10,1),(230,'2018-05-20 23:22:30.905458','17','TicketRecord object (17)',2,'[{\"changed\": {\"fields\": [\"participant_type_id\"]}}]',10,1),(231,'2018-05-20 23:23:00.808836','17','TicketRecord object (17)',2,'[{\"changed\": {\"fields\": [\"participant\"]}}]',10,1),(232,'2018-05-21 10:57:04.791725','17','TicketRecord object (17)',2,'[{\"changed\": {\"fields\": [\"participant_type_id\", \"participant\"]}}]',10,1),(233,'2018-05-21 10:57:50.019431','10','State object (10)',2,'[{\"changed\": {\"fields\": [\"state_field_str\"]}}]',17,1),(234,'2018-05-21 19:27:37.561663','18','TicketRecord object (18)',2,'[{\"changed\": {\"fields\": [\"participant_type_id\", \"participant\"]}}]',10,1),(235,'2018-05-22 07:25:13.573757','10','State object (10)',2,'[{\"changed\": {\"fields\": [\"state_field_str\"]}}]',17,1),(236,'2018-05-22 07:26:27.931548','10','State object (10)',2,'[{\"changed\": {\"fields\": [\"state_field_str\"]}}]',17,1),(237,'2018-05-22 07:26:54.688326','17','TicketRecord object (17)',2,'[{\"changed\": {\"fields\": [\"participant_type_id\", \"participant\"]}}]',10,1),(238,'2018-05-22 07:40:16.575221','10','State object (10)',2,'[{\"changed\": {\"fields\": [\"state_field_str\"]}}]',17,1),(239,'2018-05-22 22:06:27.493740','10','State object (10)',2,'[{\"changed\": {\"fields\": [\"state_field_str\"]}}]',17,1),(240,'2018-05-22 22:06:52.641516','10','State object (10)',2,'[]',17,1),(241,'2018-05-22 22:21:51.875014','10','State object (10)',2,'[{\"changed\": {\"fields\": [\"state_field_str\"]}}]',17,1),(242,'2018-05-23 22:38:57.333718','5','CustomField object (5)',2,'[{\"changed\": {\"fields\": [\"field_type_id\"]}}]',16,1),(243,'2018-05-23 22:43:46.101026','6','WorkflowScript object (6)',1,'[{\"added\": {}}]',15,1),(244,'2018-05-23 22:43:59.732931','6','WorkflowScript object (6)',3,'',15,1),(245,'2018-05-23 22:54:44.592052','7','WorkflowScript object (7)',1,'[{\"added\": {}}]',15,1),(246,'2018-05-28 15:32:58.618378','3','LoonDept object (3)',2,'[{\"changed\": {\"fields\": [\"leader\"]}}]',8,1),(247,'2018-05-28 15:33:08.261518','2','LoonDept object (2)',2,'[{\"changed\": {\"fields\": [\"leader\"]}}]',8,1),(248,'2018-05-28 15:33:21.109511','5','LoonDept object (5)',2,'[{\"changed\": {\"fields\": [\"leader\"]}}]',8,1),(249,'2018-05-28 15:33:29.240855','4','LoonDept object (4)',2,'[{\"changed\": {\"fields\": [\"leader\"]}}]',8,1),(250,'2018-05-28 15:37:00.290164','4','LoonDept object (4)',2,'[{\"changed\": {\"fields\": [\"approver\"]}}]',8,1),(251,'2018-05-28 15:38:17.392603','3','LoonDept object (3)',2,'[{\"changed\": {\"fields\": [\"leader\"]}}]',8,1),(252,'2018-05-28 15:40:16.608691','5','LoonDept object (5)',2,'[{\"changed\": {\"fields\": [\"approver\"]}}]',8,1),(253,'2018-05-28 15:59:45.751846','5','LoonDept object (5)',3,'',8,1),(254,'2018-05-28 15:59:45.755201','4','LoonDept object (4)',3,'',8,1),(255,'2018-05-28 15:59:45.757481','3','LoonDept object (3)',3,'',8,1),(256,'2018-05-28 15:59:45.762553','2','LoonDept object (2)',3,'',8,1),(257,'2018-05-28 15:59:45.765945','1','LoonDept object (1)',3,'',8,1),(258,'2018-05-28 15:59:59.805696','7','jack',3,'',9,1),(259,'2018-05-28 15:59:59.809564','6','wangwu',3,'',9,1),(260,'2018-05-28 15:59:59.811563','5','lisi',3,'',9,1),(261,'2018-05-28 15:59:59.813282','4','zhangsan',3,'',9,1),(262,'2018-05-28 15:59:59.814939','3','lilei',3,'',9,1),(263,'2018-05-28 15:59:59.816636','2','guiji',3,'',9,1),(264,'2018-05-28 16:00:33.041749','1','LoonRole object (1)',3,'',7,1),(265,'2018-05-28 16:01:12.143091','1','admin',2,'[{\"changed\": {\"fields\": [\"email\"]}}]',9,1),(266,'2018-05-28 16:01:42.176458','6','LoonDept object (6)',1,'[{\"added\": {}}]',8,1),(267,'2018-05-28 16:02:11.433523','7','LoonDept object (7)',1,'[{\"added\": {}}]',8,1),(268,'2018-05-28 16:02:33.088765','8','LoonDept object (8)',1,'[{\"added\": {}}]',8,1),(269,'2018-05-28 16:02:51.059479','9','LoonDept object (9)',1,'[{\"added\": {}}]',8,1),(270,'2018-05-28 16:04:16.548576','8','ops',1,'[{\"added\": {}}]',9,1),(271,'2018-05-28 16:05:09.917808','9','hr',1,'[{\"added\": {}}]',9,1),(272,'2018-05-28 16:05:47.181076','10','scm',1,'[{\"added\": {}}]',9,1),(273,'2018-05-28 16:06:34.655218','11','wangjun',1,'[{\"added\": {}}]',9,1),(274,'2018-05-28 16:07:59.666862','12','lilian',1,'[{\"added\": {}}]',9,1),(275,'2018-05-28 16:08:20.445209','11','wangjun',2,'[{\"changed\": {\"fields\": [\"email\"]}}]',9,1),(276,'2018-05-28 16:09:28.162758','13','david',1,'[{\"added\": {}}]',9,1),(277,'2018-05-28 16:09:54.858983','11','webb',2,'[{\"changed\": {\"fields\": [\"username\", \"alias\", \"email\"]}}]',9,1),(278,'2018-05-28 16:11:30.103705','63','TicketFlowLog object (63)',3,'',13,1),(279,'2018-05-28 16:11:30.107401','62','TicketFlowLog object (62)',3,'',13,1),(280,'2018-05-28 16:11:30.115114','61','TicketFlowLog object (61)',3,'',13,1),(281,'2018-05-28 16:11:30.116603','60','TicketFlowLog object (60)',3,'',13,1),(282,'2018-05-28 16:11:30.118006','59','TicketFlowLog object (59)',3,'',13,1),(283,'2018-05-28 16:11:30.119226','58','TicketFlowLog object (58)',3,'',13,1),(284,'2018-05-28 16:11:30.120346','57','TicketFlowLog object (57)',3,'',13,1),(285,'2018-05-28 16:11:30.121794','56','TicketFlowLog object (56)',3,'',13,1),(286,'2018-05-28 16:11:30.123031','55','TicketFlowLog object (55)',3,'',13,1),(287,'2018-05-28 16:11:30.124455','54','TicketFlowLog object (54)',3,'',13,1),(288,'2018-05-28 16:11:30.125618','53','TicketFlowLog object (53)',3,'',13,1),(289,'2018-05-28 16:11:30.127070','52','TicketFlowLog object (52)',3,'',13,1),(290,'2018-05-28 16:11:30.128785','51','TicketFlowLog object (51)',3,'',13,1),(291,'2018-05-28 16:11:30.131081','50','TicketFlowLog object (50)',3,'',13,1),(292,'2018-05-28 16:11:30.132612','49','TicketFlowLog object (49)',3,'',13,1),(293,'2018-05-28 16:11:30.133849','48','TicketFlowLog object (48)',3,'',13,1),(294,'2018-05-28 16:11:30.135622','47','TicketFlowLog object (47)',3,'',13,1),(295,'2018-05-28 16:11:30.137090','46','TicketFlowLog object (46)',3,'',13,1),(296,'2018-05-28 16:11:30.138537','45','TicketFlowLog object (45)',3,'',13,1),(297,'2018-05-28 16:11:30.139861','44','TicketFlowLog object (44)',3,'',13,1),(298,'2018-05-28 16:11:30.143576','43','TicketFlowLog object (43)',3,'',13,1),(299,'2018-05-28 16:11:30.145131','42','TicketFlowLog object (42)',3,'',13,1),(300,'2018-05-28 16:11:30.147952','41','TicketFlowLog object (41)',3,'',13,1),(301,'2018-05-28 16:11:30.149389','40','TicketFlowLog object (40)',3,'',13,1),(302,'2018-05-28 16:11:30.150745','39','TicketFlowLog object (39)',3,'',13,1),(303,'2018-05-28 16:11:30.153525','38','TicketFlowLog object (38)',3,'',13,1),(304,'2018-05-28 16:11:30.154787','37','TicketFlowLog object (37)',3,'',13,1),(305,'2018-05-28 16:11:30.155948','36','TicketFlowLog object (36)',3,'',13,1),(306,'2018-05-28 16:11:30.157081','35','TicketFlowLog object (35)',3,'',13,1),(307,'2018-05-28 16:11:30.158478','34','TicketFlowLog object (34)',3,'',13,1),(308,'2018-05-28 16:11:30.160535','33','TicketFlowLog object (33)',3,'',13,1),(309,'2018-05-28 16:11:30.162491','32','TicketFlowLog object (32)',3,'',13,1),(310,'2018-05-28 16:11:30.166003','31','TicketFlowLog object (31)',3,'',13,1),(311,'2018-05-28 16:11:30.168235','30','TicketFlowLog object (30)',3,'',13,1),(312,'2018-05-28 16:11:30.169824','29','TicketFlowLog object (29)',3,'',13,1),(313,'2018-05-28 16:11:30.171260','28','TicketFlowLog object (28)',3,'',13,1),(314,'2018-05-28 16:11:30.172572','27','TicketFlowLog object (27)',3,'',13,1),(315,'2018-05-28 16:11:30.174125','26','TicketFlowLog object (26)',3,'',13,1),(316,'2018-05-28 16:11:30.176775','25','TicketFlowLog object (25)',3,'',13,1),(317,'2018-05-28 16:11:30.178146','24','TicketFlowLog object (24)',3,'',13,1),(318,'2018-05-28 16:11:30.180969','23','TicketFlowLog object (23)',3,'',13,1),(319,'2018-05-28 16:11:30.182735','22','TicketFlowLog object (22)',3,'',13,1),(320,'2018-05-28 16:11:30.183914','21','TicketFlowLog object (21)',3,'',13,1),(321,'2018-05-28 16:11:30.185382','20','TicketFlowLog object (20)',3,'',13,1),(322,'2018-05-28 16:11:30.188038','19','TicketFlowLog object (19)',3,'',13,1),(323,'2018-05-28 16:11:30.189419','18','TicketFlowLog object (18)',3,'',13,1),(324,'2018-05-28 16:11:30.190870','17','TicketFlowLog object (17)',3,'',13,1),(325,'2018-05-28 16:11:30.192044','16','TicketFlowLog object (16)',3,'',13,1),(326,'2018-05-28 16:11:30.193348','15','TicketFlowLog object (15)',3,'',13,1),(327,'2018-05-28 16:11:30.194679','14','TicketFlowLog object (14)',3,'',13,1),(328,'2018-05-28 16:11:30.197790','13','TicketFlowLog object (13)',3,'',13,1),(329,'2018-05-28 16:11:30.200362','12','TicketFlowLog object (12)',3,'',13,1),(330,'2018-05-28 16:11:30.201766','11','TicketFlowLog object (11)',3,'',13,1),(331,'2018-05-28 16:11:30.203251','10','TicketFlowLog object (10)',3,'',13,1),(332,'2018-05-28 16:11:30.204598','9','TicketFlowLog object (9)',3,'',13,1),(333,'2018-05-28 16:11:52.488315','23','TicketRecord object (23)',3,'',10,1),(334,'2018-05-28 16:11:52.490450','22','TicketRecord object (22)',3,'',10,1),(335,'2018-05-28 16:11:52.492194','21','TicketRecord object (21)',3,'',10,1),(336,'2018-05-28 16:11:52.493813','20','TicketRecord object (20)',3,'',10,1),(337,'2018-05-28 16:11:52.495696','19','TicketRecord object (19)',3,'',10,1),(338,'2018-05-28 16:11:52.497296','18','TicketRecord object (18)',3,'',10,1),(339,'2018-05-28 16:11:52.498837','17','TicketRecord object (17)',3,'',10,1),(340,'2018-05-28 16:11:52.500285','16','TicketRecord object (16)',3,'',10,1),(341,'2018-05-28 16:11:52.501503','15','TicketRecord object (15)',3,'',10,1),(342,'2018-05-28 16:11:52.502698','14','TicketRecord object (14)',3,'',10,1),(343,'2018-05-28 16:20:37.983287','1','admin',2,'[{\"changed\": {\"fields\": [\"dept_id\"]}}]',9,1),(344,'2018-05-28 16:25:46.387230','24','TicketRecord object (24)',3,'',10,1),(345,'2018-05-28 16:25:54.478497','64','TicketFlowLog object (64)',3,'',13,1),(346,'2018-05-31 19:53:59.692812','3','State object (3)',2,'[{\"changed\": {\"fields\": [\"participant\"]}}]',17,1),(347,'2018-05-31 20:07:13.591045','3','State object (3)',2,'[{\"changed\": {\"fields\": [\"participant\"]}}]',17,1),(348,'2018-05-31 20:08:50.201520','3','State object (3)',2,'[{\"changed\": {\"fields\": [\"participant\"]}}]',17,1),(349,'2018-05-31 21:43:06.007970','3','State object (3)',2,'[{\"changed\": {\"fields\": [\"participant_type_id\"]}}]',17,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (20,'account','apptoken'),(8,'account','loondept'),(7,'account','loonrole'),(9,'account','loonuser'),(6,'account','loonuserrole'),(1,'admin','logentry'),(2,'auth','group'),(3,'auth','permission'),(4,'contenttypes','contenttype'),(5,'sessions','session'),(12,'ticket','ticketcustomfield'),(13,'ticket','ticketflowlog'),(10,'ticket','ticketrecord'),(11,'ticket','ticketstatelastman'),(16,'workflow','customfield'),(14,'workflow','customnotice'),(17,'workflow','state'),(19,'workflow','transition'),(18,'workflow','workflow'),(15,'workflow','workflowscript');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'account','0001_initial','2018-04-10 16:23:41.026839'),(2,'contenttypes','0001_initial','2018-04-10 16:23:41.088822'),(3,'admin','0001_initial','2018-04-10 16:23:41.202720'),(4,'admin','0002_logentry_remove_auto_add','2018-04-10 16:23:41.215504'),(5,'contenttypes','0002_remove_content_type_name','2018-04-10 16:23:41.316210'),(6,'auth','0001_initial','2018-04-10 16:23:41.492653'),(7,'auth','0002_alter_permission_name_max_length','2018-04-10 16:23:41.536426'),(8,'auth','0003_alter_user_email_max_length','2018-04-10 16:23:41.555765'),(9,'auth','0004_alter_user_username_opts','2018-04-10 16:23:41.579352'),(10,'auth','0005_alter_user_last_login_null','2018-04-10 16:23:41.616306'),(11,'auth','0006_require_contenttypes_0002','2018-04-10 16:23:41.620447'),(12,'auth','0007_alter_validators_add_error_messages','2018-04-10 16:23:41.643171'),(13,'auth','0008_alter_user_username_max_length','2018-04-10 16:23:41.663023'),(14,'auth','0009_alter_user_last_name_max_length','2018-04-10 16:23:41.679754'),(15,'sessions','0001_initial','2018-04-10 16:23:41.711283'),(16,'ticket','0001_initial','2018-04-10 16:23:41.848590'),(17,'workflow','0001_initial','2018-04-10 16:23:41.994564'),(18,'ticket','0002_auto_20180410_1749','2018-04-10 17:49:06.562710'),(19,'workflow','0002_auto_20180410_1749','2018-04-10 17:49:06.690036'),(20,'account','0002_apptoken','2018-04-10 21:53:25.098976'),(21,'ticket','0003_ticketrecord_relation','2018-04-15 17:21:55.494957'),(22,'ticket','0004_auto_20180417_2348','2018-04-17 23:48:22.378917'),(23,'workflow','0003_auto_20180417_2348','2018-04-17 23:48:22.391679'),(24,'ticket','0005_auto_20180418_0001','2018-04-18 00:01:52.296081'),(25,'workflow','0004_workflow_view_permission_check','2018-04-22 15:58:37.766199'),(26,'workflow','0005_auto_20180423_2114','2018-04-23 21:14:51.345960'),(27,'workflow','0006_auto_20180423_2116','2018-04-23 21:17:03.970113'),(28,'workflow','0007_auto_20180424_0656','2018-04-24 06:56:48.399867'),(29,'workflow','0008_auto_20180424_0708','2018-04-24 07:08:53.913939'),(30,'workflow','0009_auto_20180430_2129','2018-04-30 21:29:29.307194'),(31,'ticket','0006_auto_20180505_1549','2018-05-05 15:49:16.131657'),(32,'workflow','0010_auto_20180505_1549','2018-05-05 15:49:16.168741'),(33,'workflow','0011_auto_20180509_0709','2018-05-09 07:09:37.847547'),(34,'workflow','0012_auto_20180511_0654','2018-05-11 06:54:50.920765'),(35,'ticket','0007_auto_20180516_0741','2018-05-16 07:46:02.412425'),(36,'ticket','0008_auto_20180516_0743','2018-05-16 07:46:02.417966'),(37,'workflow','0013_auto_20180511_1826','2018-05-16 07:46:02.420751'),(38,'workflow','0014_auto_20180516_0741','2018-05-16 07:46:02.423199'),(39,'ticket','0009_ticketflowlog_intervene_type_id','2018-05-17 06:36:01.493028'),(40,'ticket','0010_ticketcustomfield_multi_username_value','2018-05-22 06:46:49.124237'),(41,'workflow','0015_auto_20180522_0646','2018-05-22 06:46:49.132266');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('0i1a720i1w77eyltvbzhu5zyp8zfxnn0','ZGM2OGMzMDU3NDBkMTFhY2ViMjNlZjRhNWQyNDRhOTUxNGExNjQ4Mzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiZTkyMDVmNDcxNTM5ZDIwYjg0YzU1MjRjMjUwMWE5MGFjZTA0ZjczIn0=','2018-06-14 19:51:34.858861'),('2p4bd3iu2iz6cakbxn9hamdvqp3fvx7y','MWUzZjFjNThjNmM1MmRlMWIzYjY0NDFiODNlODE3MDIzMjQ2NGQwYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjQ2MTUwYzAwNmQyNGM0Y2QyNzQ5Zjc2NGE4N2MzZDNlNjY0ZDA5NzgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-05-06 15:24:30.402451'),('4vqium6osxcz4hkeeb2opkxlrmc6kobt','YmI5MjhmNmQ3YzFjMjM3ZjgwYTg4ZmRkMjk1MmU0ZGU5ZjI4Nzg0Mjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiJiZTkyMDVmNDcxNTM5ZDIwYjg0YzU1MjRjMjUwMWE5MGFjZTA0ZjczIn0=','2018-06-12 19:14:50.740323'),('gi4p54ka4u6vww4kpqogolmdquj52wup','YTQyMzg3NzMzMzRkZDgxNzU1YWM1OTE3YWExZTFjMDdlMWZmNzM5Zjp7Il9hdXRoX3VzZXJfaGFzaCI6IjQ2MTUwYzAwNmQyNGM0Y2QyNzQ5Zjc2NGE4N2MzZDNlNjY0ZDA5NzgiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2018-04-24 21:38:48.844698'),('ikpnzy0jsc0jiede5r6cxhoyagq2payb','YTQyMzg3NzMzMzRkZDgxNzU1YWM1OTE3YWExZTFjMDdlMWZmNzM5Zjp7Il9hdXRoX3VzZXJfaGFzaCI6IjQ2MTUwYzAwNmQyNGM0Y2QyNzQ5Zjc2NGE4N2MzZDNlNjY0ZDA5NzgiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2018-04-24 21:36:50.610586'),('nmmp7mq3hh1g9d9oc7tlkozq6l99cymu','ZGM2OGMzMDU3NDBkMTFhY2ViMjNlZjRhNWQyNDRhOTUxNGExNjQ4Mzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiZTkyMDVmNDcxNTM5ZDIwYjg0YzU1MjRjMjUwMWE5MGFjZTA0ZjczIn0=','2018-06-09 14:03:24.704275'),('qrugroidqpdoepvimz4mtqrsw8elq3px','M2EwMmViZmQyZDAxZmU2NmE2Njg4OWYxNzk3ZDVkY2E1NmM0NzNiYjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiYmU5MjA1ZjQ3MTUzOWQyMGI4NGM1NTI0YzI1MDFhOTBhY2UwNGY3MyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2018-06-06 09:50:27.154850'),('uc120vlnss4jhy3i8kxow00uqbozf6m4','ZGM2OGMzMDU3NDBkMTFhY2ViMjNlZjRhNWQyNDRhOTUxNGExNjQ4Mzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiZTkyMDVmNDcxNTM5ZDIwYjg0YzU1MjRjMjUwMWE5MGFjZTA0ZjczIn0=','2018-05-23 06:56:36.173728'),('yqo3dtnk8pasr19u3qwkgz4bvpv0yg08','NTU1NDRhMGM1MDIyMDczYmFlY2MzZDdkZTMyYWZlYmYyMGRiMzhiNDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYmU5MjA1ZjQ3MTUzOWQyMGI4NGM1NTI0YzI1MDFhOTBhY2UwNGY3MyIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-05-28 10:04:09.557125');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_ticketcustomfield`
--

DROP TABLE IF EXISTS `ticket_ticketcustomfield`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_ticketcustomfield`
--

LOCK TABLES `ticket_ticketcustomfield` WRITE;
/*!40000 ALTER TABLE `ticket_ticketcustomfield` DISABLE KEYS */;
INSERT INTO `ticket_ticketcustomfield` VALUES (14,'请假类型',13,'leave_type',40,'',0,0,0,'0001-01-01','0001-01-01 00:00:00.000000','00:00:01.000000','','2','','','','','admin','2018-05-13 21:53:15.776693','2018-05-13 21:53:15.776753',0,''),(15,'代理人',13,'leave_proxy',60,'',0,0,0,'0001-01-01','0001-01-01 00:00:00.000000','00:00:01.000000','','','','','','zhangsan','admin','2018-05-13 21:53:15.784787','2018-05-13 21:53:15.784839',0,''),(16,'请假原因及相关附件',13,'leave_reason',55,'',0,0,0,'0001-01-01','0001-01-01 00:00:00.000000','00:00:01.000000','','','','','去喝喜酒','','admin','2018-05-13 21:53:15.792655','2018-05-13 21:53:15.792711',0,''),(17,'开始时间',13,'leave_start',30,'',0,0,0,'0001-01-01','2018-04-10 09:00:00.000000','00:00:01.000000','','','','','','','admin','2018-05-13 21:53:15.800632','2018-05-13 21:53:15.800683',0,''),(18,'请假天数(0.5的倍数)',13,'leave_days',5,'3',0,0,0,'0001-01-01','0001-01-01 00:00:00.000000','00:00:01.000000','','','','','','','admin','2018-05-13 21:53:15.809216','2018-05-13 21:53:15.809266',0,''),(19,'结束时间',13,'leave_end',30,'',0,0,0,'0001-01-01','2018-04-12 18:00:00.000000','00:00:01.000000','','','','','','','admin','2018-05-13 21:53:15.817437','2018-05-13 21:53:15.817484',0,''),(20,'代理人',14,'leave_proxy',60,'',0,0,0,'0001-01-01','0001-01-01 00:00:00.000000','00:00:01.000000','','','','','','zhangsan1','admin','2018-05-13 22:24:41.969926','2018-05-13 22:24:41.969982',0,''),(21,'请假天数(0.5的倍数)',14,'leave_days',5,'3',0,0,0,'0001-01-01','0001-01-01 00:00:00.000000','00:00:01.000000','','','','','','','admin','2018-05-13 22:24:41.978508','2018-05-13 22:24:41.978600',0,''),(22,'开始时间',14,'leave_start',30,'',0,0,0,'0001-01-01','2018-05-10 09:00:00.000000','00:00:01.000000','','','','','','','admin','2018-05-13 22:24:41.988270','2018-05-13 22:24:41.988346',0,''),(23,'请假类型',14,'leave_type',40,'',0,0,0,'0001-01-01','0001-01-01 00:00:00.000000','00:00:01.000000','','1','','','','','admin','2018-05-13 22:24:41.997839','2018-05-13 22:24:41.997891',0,''),(24,'结束时间',14,'leave_end',30,'',0,0,0,'0001-01-01','2018-05-13 09:00:00.000000','00:00:01.000000','','','','','','','admin','2018-05-13 22:24:42.008241','2018-05-13 22:24:42.008292',0,''),(25,'请假原因及相关附件',14,'leave_reason',55,'',0,0,0,'0001-01-01','0001-01-01 00:00:00.000000','00:00:01.000000','','','','','喝喜酒','','admin','2018-05-13 22:24:42.016808','2018-05-13 22:24:42.016898',0,''),(26,'结束时间',15,'leave_end',30,'',0,0,0,'0001-01-01','2018-05-13 09:00:00.000000','00:00:01.000000','','','','','','','admin','2018-05-13 22:28:21.643297','2018-05-13 22:28:21.643346',0,''),(27,'请假原因及相关附件',15,'leave_reason',55,'',0,0,0,'0001-01-01','0001-01-01 00:00:00.000000','00:00:01.000000','','','','','喝喜酒','','admin','2018-05-13 22:28:21.650778','2018-05-13 22:28:21.650828',0,''),(28,'代理人',15,'leave_proxy',60,'',0,0,0,'0001-01-01','0001-01-01 00:00:00.000000','00:00:01.000000','','','','','','zhangsan1','admin','2018-05-13 22:28:21.659327','2018-05-13 22:28:21.659375',0,''),(29,'请假天数(0.5的倍数)',15,'leave_days',5,'3',0,0,0,'0001-01-01','0001-01-01 00:00:00.000000','00:00:01.000000','','','','','','','admin','2018-05-13 22:28:21.667908','2018-05-13 22:28:21.667955',0,''),(30,'开始时间',15,'leave_start',30,'',0,0,0,'0001-01-01','2018-05-10 09:00:00.000000','00:00:01.000000','','','','','','','admin','2018-05-13 22:28:21.675754','2018-05-13 22:28:21.675803',0,''),(31,'请假类型',15,'leave_type',40,'',0,0,0,'0001-01-01','0001-01-01 00:00:00.000000','00:00:01.000000','','1','','','','','admin','2018-05-13 22:28:21.683366','2018-05-13 22:28:21.683414',0,''),(32,'结束时间',16,'leave_end',30,'',0,0,0,'0001-01-01','2018-04-12 18:00:00.000000','00:00:01.000000','','','','','','','admin','2018-05-13 22:34:12.690959','2018-05-13 22:34:12.691033',0,''),(33,'请假原因及相关附件',16,'leave_reason',55,'',0,0,0,'0001-01-01','0001-01-01 00:00:00.000000','00:00:01.000000','','','','','去喝喜酒','','admin','2018-05-13 22:34:12.701832','2018-05-13 22:34:12.701889',0,''),(34,'代理人',16,'leave_proxy',60,'',0,0,0,'0001-01-01','0001-01-01 00:00:00.000000','00:00:01.000000','','','','','','zhangsan','admin','2018-05-13 22:34:12.711844','2018-05-13 22:34:12.711905',0,''),(35,'请假天数(0.5的倍数)',16,'leave_days',5,'3',0,0,0,'0001-01-01','0001-01-01 00:00:00.000000','00:00:01.000000','','','','','','','admin','2018-05-13 22:34:12.721909','2018-05-13 22:34:12.721966',0,''),(36,'开始时间',16,'leave_start',30,'',0,0,0,'0001-01-01','2018-04-10 09:00:00.000000','00:00:01.000000','','','','','','','admin','2018-05-13 22:34:12.730191','2018-05-13 22:34:12.730245',0,''),(37,'请假类型',16,'leave_type',40,'',0,0,0,'0001-01-01','0001-01-01 00:00:00.000000','00:00:01.000000','','2','','','','','admin','2018-05-13 22:34:12.741366','2018-05-13 22:34:12.741426',0,''),(38,'申请原因',17,'vpn_reason',55,'',0,0,0,'0001-01-01','0001-01-01 00:00:00.000000','00:00:01.000000','','','','','在家办公','','admin','2018-05-15 07:16:38.326174','2018-05-15 07:16:38.326274',0,''),(39,'申请原因',18,'vpn_reason',55,'',0,0,0,'0001-01-01','0001-01-01 00:00:00.000000','00:00:01.000000','','','','','在家办公','','admin','2018-05-15 07:37:28.008199','2018-05-15 07:37:28.008245',0,''),(40,'请假天数(0.5的倍数)',19,'leave_days',5,'5',0,0,0,'0001-01-01','0001-01-01 00:00:00.000000','00:00:01.000000','','','','','','','admin','2018-05-26 11:10:33.296086','2018-05-26 11:10:33.296105',0,''),(41,'请假类型',19,'leave_type',35,'',0,0,0,'0001-01-01','0001-01-01 00:00:00.000000','00:00:01.000000','1','','','','','','admin','2018-05-26 11:10:33.299991','2018-05-26 11:10:33.300010',0,''),(42,'请假原因及相关附件',19,'leave_reason',55,'',0,0,0,'0001-01-01','0001-01-01 00:00:00.000000','00:00:01.000000','','','','','请假申请001请假申请001请假申请001请假申请001请假申请001请假申请001','','admin','2018-05-26 11:10:33.303715','2018-05-26 11:10:33.303734',0,''),(43,'结束时间',19,'leave_end',30,'',0,0,0,'0001-01-01','2018-05-31 00:00:00.000000','00:00:01.000000','','','','','','','admin','2018-05-26 11:10:33.307797','2018-05-26 11:10:33.307825',0,''),(44,'开始时间',19,'leave_start',30,'',0,0,0,'0001-01-01','2018-05-27 00:00:00.000000','00:00:01.000000','','','','','','','admin','2018-05-26 11:10:33.312998','2018-05-26 11:10:33.313017',0,''),(45,'代理人',19,'leave_proxy',60,'',0,0,0,'0001-01-01','0001-01-01 00:00:00.000000','00:00:01.000000','','','','','','wangjun','admin','2018-05-26 11:10:33.317098','2018-05-26 11:10:33.317117',0,''),(46,'申请原因',20,'vpn_reason',55,'',0,0,0,'0001-01-01','0001-01-01 00:00:00.000000','00:00:01.000000','','','','','测试VPN申请001测试VPN申请001测试VPN申请001测试VPN申请001测试VPN申请001测试VPN申请001','','admin','2018-05-26 12:18:47.843392','2018-05-26 12:18:47.843427',0,''),(47,'请假天数(0.5的倍数)',21,'leave_days',5,'4',0,0,0,'0001-01-01','0001-01-01 00:00:00.000000','00:00:01.000000','','','','','','','admin','2018-05-26 14:08:07.923116','2018-05-26 14:08:07.923135',0,''),(48,'请假类型',21,'leave_type',35,'',0,0,0,'0001-01-01','0001-01-01 00:00:00.000000','00:00:01.000000','2','','','','','','admin','2018-05-26 14:08:07.927195','2018-05-26 14:08:07.927214',0,''),(49,'请假原因及相关附件',21,'leave_reason',55,'',0,0,0,'0001-01-01','0001-01-01 00:00:00.000000','00:00:01.000000','','','','','测试请假申请003 保存功能 ','','admin','2018-05-26 14:08:07.931029','2018-05-26 14:08:07.931048',0,''),(50,'结束时间',21,'leave_end',30,'',0,0,0,'0001-01-01','2018-05-31 00:00:00.000000','00:00:01.000000','','','','','','','admin','2018-05-26 14:08:07.937292','2018-05-26 14:08:07.937310',0,''),(51,'开始时间',21,'leave_start',30,'',0,0,0,'0001-01-01','2018-05-27 00:00:00.000000','00:00:01.000000','','','','','','','admin','2018-05-26 14:08:07.941182','2018-05-26 14:08:07.941200',0,''),(52,'代理人',21,'leave_proxy',60,'',0,0,0,'0001-01-01','0001-01-01 00:00:00.000000','00:00:01.000000','','','','','','admin','admin','2018-05-26 14:08:07.945132','2018-05-26 14:08:07.945151',0,''),(53,'请假天数(0.5的倍数)',22,'leave_days',5,'4',0,0,0,'0001-01-01','0001-01-01 00:00:00.000000','00:00:01.000000','','','','','','','admin','2018-05-26 16:05:32.950960','2018-05-26 16:05:32.950981',0,''),(54,'请假类型',22,'leave_type',35,'',0,0,0,'0001-01-01','0001-01-01 00:00:00.000000','00:00:01.000000','3','','','','','','admin','2018-05-26 16:05:32.955108','2018-05-26 16:05:32.955127',0,''),(55,'请假原因及相关附件',22,'leave_reason',55,'',0,0,0,'0001-01-01','0001-01-01 00:00:00.000000','00:00:01.000000','','','','','<p><strong>hello this 洒 a&nbsp;</strong>test&nbsp;<span style=\"background-color: #ff6600;\">ticket<span style=\"background-color: #ffffff;\">&nbsp;<em>请假申请</em></span></span></p>','','admin','2018-05-26 16:05:32.960603','2018-05-26 16:05:32.960623',0,''),(56,'结束时间',22,'leave_end',30,'',0,0,0,'0001-01-01','2018-05-31 00:00:00.000000','00:00:01.000000','','','','','','','admin','2018-05-26 16:05:32.965142','2018-05-26 16:05:32.965160',0,''),(57,'开始时间',22,'leave_start',30,'',0,0,0,'0001-01-01','2018-05-27 00:00:00.000000','00:00:01.000000','','','','','','','admin','2018-05-26 16:05:32.969076','2018-05-26 16:05:32.969094',0,''),(58,'代理人',22,'leave_proxy',60,'',0,0,0,'0001-01-01','0001-01-01 00:00:00.000000','00:00:01.000000','','','','','','admin','admin','2018-05-26 16:05:32.973200','2018-05-26 16:05:32.973220',0,''),(59,'申请原因',23,'vpn_reason',55,'',0,0,0,'0001-01-01','0001-01-01 00:00:00.000000','00:00:01.000000','','','','','<h1><em>测试一下哈</em></h1>\n<p><em>项目终于完成了，该做点笔记了，为以后类似项目提供思路。刚进公司不久就接到这项目，心里发毛；尼玛，这是要我写个协议的节奏啊，以前从没写过底层协议，怎么搞？手忙脚乱地找各种资料，居然没有开源的。只能乖乖的看<span style=\"color: #ff6600;\">RPC</span>文档，以及<span style=\"color: #ff6600;\">思科</span>文档了，把一些踩过的坑笔录下来，以表勉励...</em></p>','','admin','2018-05-26 16:32:48.512874','2018-05-26 16:32:48.512894',0,''),(60,'结束时间',24,'leave_end',30,'',0,0,0,'0001-01-01','2018-05-30 00:00:00.000000','00:00:01.000000','','','','','','','admin','2018-05-28 16:24:14.728456','2018-05-28 16:24:14.728482',0,''),(61,'代理人',24,'leave_proxy',60,'',0,0,0,'0001-01-01','0001-01-01 00:00:00.000000','00:00:01.000000','','','','','','admin','admin','2018-05-28 16:24:14.746124','2018-05-28 16:24:14.746140',0,''),(62,'请假类型',24,'leave_type',35,'',0,0,0,'0001-01-01','0001-01-01 00:00:00.000000','00:00:01.000000','2','','','','','','admin','2018-05-28 16:24:14.750271','2018-05-28 16:24:14.750288',0,''),(63,'开始时间',24,'leave_start',30,'',0,0,0,'0001-01-01','2018-05-29 00:00:00.000000','00:00:01.000000','','','','','','','admin','2018-05-28 16:24:14.754155','2018-05-28 16:24:14.754172',0,''),(64,'请假天数(0.5的倍数)',24,'leave_days',5,'1',0,0,0,'0001-01-01','0001-01-01 00:00:00.000000','00:00:01.000000','','','','','','','admin','2018-05-28 16:24:14.758651','2018-05-28 16:24:14.758672',0,''),(65,'请假原因及相关附件',24,'leave_reason',55,'',0,0,0,'0001-01-01','0001-01-01 00:00:00.000000','00:00:01.000000','','','','','<p>因私事需要请假一天，望批准，谢谢！</p>','','admin','2018-05-28 16:24:14.762735','2018-05-28 16:24:14.762751',0,''),(66,'结束时间',25,'leave_end',30,'',0,0,0,'0001-01-01','2018-05-31 00:00:00.000000','00:00:01.000000','','','','','','','admin','2018-05-28 16:27:02.090287','2018-05-28 16:27:02.090303',0,''),(67,'代理人',25,'leave_proxy',60,'',0,0,0,'0001-01-01','0001-01-01 00:00:00.000000','00:00:01.000000','','','','','','ops','admin','2018-05-28 16:27:02.104425','2018-05-28 16:27:02.104442',0,''),(68,'请假类型',25,'leave_type',35,'',0,0,0,'0001-01-01','0001-01-01 00:00:00.000000','00:00:01.000000','2','','','','','','admin','2018-05-28 16:27:02.136494','2018-05-28 16:27:02.136514',0,''),(69,'开始时间',25,'leave_start',30,'',0,0,0,'0001-01-01','2018-05-28 00:00:00.000000','00:00:01.000000','','','','','','','admin','2018-05-28 16:27:02.148904','2018-05-28 16:27:02.148944',0,''),(70,'请假天数(0.5的倍数)',25,'leave_days',5,'3',0,0,0,'0001-01-01','0001-01-01 00:00:00.000000','00:00:01.000000','','','','','','','admin','2018-05-28 16:27:02.155911','2018-05-28 16:27:02.155940',0,''),(71,'请假原因及相关附件',25,'leave_reason',55,'',0,0,0,'0001-01-01','0001-01-01 00:00:00.000000','00:00:01.000000','','','','','<p>因事请假一天，望批准，谢谢！</p>','','admin','2018-05-28 16:27:02.161214','2018-05-28 16:27:02.161338',0,''),(72,'申请原因',26,'vpn_reason',55,'',0,0,0,'0001-01-01','0001-01-01 00:00:00.000000','00:00:01.000000','','','','','<p>scm测试vpn申请</p>','','admin','2018-05-29 19:29:52.743451','2018-05-29 19:29:52.743469',0,''),(73,'请假类型',27,'leave_type',35,'',0,0,0,'0001-01-01','0001-01-01 00:00:00.000000','00:00:01.000000','2','','','','','','admin','2018-05-29 22:11:12.686369','2018-05-29 22:11:12.686386',0,''),(74,'代理人',27,'leave_proxy',60,'',0,0,0,'0001-01-01','0001-01-01 00:00:00.000000','00:00:01.000000','','','','','','admin','admin','2018-05-29 22:11:12.691113','2018-05-29 22:11:12.691129',0,''),(75,'开始时间',27,'leave_start',30,'',0,0,0,'0001-01-01','2018-05-30 00:00:00.000000','00:00:01.000000','','','','','','','admin','2018-05-29 22:11:12.694905','2018-05-29 22:11:12.694922',0,''),(76,'请假天数(0.5的倍数)',27,'leave_days',5,'1',0,0,0,'0001-01-01','0001-01-01 00:00:00.000000','00:00:01.000000','','','','','','','admin','2018-05-29 22:11:12.699130','2018-05-29 22:11:12.699146',0,''),(77,'结束时间',27,'leave_end',30,'',0,0,0,'0001-01-01','2018-05-31 00:00:00.000000','00:00:01.000000','','','','','','','admin','2018-05-29 22:11:12.702881','2018-05-29 22:11:12.702897',0,''),(78,'请假原因及相关附件',27,'leave_reason',55,'',0,0,0,'0001-01-01','0001-01-01 00:00:00.000000','00:00:01.000000','','','','','<p><span style=\"color: #ff0000;\">测试</span>富文本内容，因<span style=\"background-color: #ff6600;\">私事请假一天</span>，希望领导批准，谢谢！</p>','','admin','2018-05-29 22:11:12.706337','2018-05-29 22:11:12.706353',0,''),(79,'申请原因',28,'vpn_reason',55,'',0,0,0,'0001-01-01','0001-01-01 00:00:00.000000','00:00:01.000000','','','','','<p>asdfasdfasdfasdfasdfa</p>','','admin','2018-05-30 23:55:22.015887','2018-05-30 23:55:22.015905',0,''),(80,'请假天数(0.5的倍数)',29,'leave_days',5,'1',0,0,0,'0001-01-01','0001-01-01 00:00:00.000000','00:00:01.000000','','','','','','','admin','2018-05-31 21:22:21.602103','2018-05-31 21:22:21.602125',0,''),(81,'结束时间',29,'leave_end',30,'',0,0,0,'0001-01-01','2018-06-02 00:00:00.000000','00:00:01.000000','','','','','','','admin','2018-05-31 21:22:21.609603','2018-05-31 21:22:21.609621',0,''),(82,'请假原因及相关附件',29,'leave_reason',55,'',0,0,0,'0001-01-01','0001-01-01 00:00:00.000000','00:00:01.000000','','','','','<p>修改工单详情</p>','','admin','2018-05-31 21:22:21.614042','2018-05-31 21:22:21.614067',0,''),(83,'代理人',29,'leave_proxy',60,'',0,0,0,'0001-01-01','0001-01-01 00:00:00.000000','00:00:01.000000','','','','','','admin','admin','2018-05-31 21:22:21.621264','2018-05-31 21:22:21.621289',0,''),(84,'开始时间',29,'leave_start',30,'',0,0,0,'0001-01-01','2018-06-01 00:00:00.000000','00:00:01.000000','','','','','','','admin','2018-05-31 21:22:21.625190','2018-05-31 21:22:21.625205',0,''),(85,'请假类型',29,'leave_type',35,'',0,0,0,'0001-01-01','0001-01-01 00:00:00.000000','00:00:01.000000','2','','','','','','admin','2018-05-31 21:22:21.630080','2018-05-31 21:22:21.630098',0,''),(86,'请假天数(0.5的倍数)',30,'leave_days',5,'1',0,0,0,'0001-01-01','0001-01-01 00:00:00.000000','00:00:01.000000','','','','','','','admin','2018-05-31 21:34:39.032150','2018-05-31 21:34:39.032172',0,''),(87,'结束时间',30,'leave_end',30,'',0,0,0,'0001-01-01','2018-06-02 00:00:00.000000','00:00:01.000000','','','','','','','admin','2018-05-31 21:34:39.038362','2018-05-31 21:34:39.038382',0,''),(88,'请假原因及相关附件',30,'leave_reason',55,'',0,0,0,'0001-01-01','0001-01-01 00:00:00.000000','00:00:01.000000','','','','','<p>测试己保存测试己保存测试己保存</p>','','admin','2018-05-31 21:34:39.043184','2018-05-31 21:34:39.043200',0,''),(89,'代理人',30,'leave_proxy',60,'',0,0,0,'0001-01-01','0001-01-01 00:00:00.000000','00:00:01.000000','','','','','','admin','admin','2018-05-31 21:34:39.048164','2018-05-31 21:34:39.048184',0,''),(90,'开始时间',30,'leave_start',30,'',0,0,0,'0001-01-01','2018-06-01 00:00:00.000000','00:00:01.000000','','','','','','','admin','2018-05-31 21:34:39.053125','2018-05-31 21:34:39.053147',0,''),(91,'请假类型',30,'leave_type',35,'',0,0,0,'0001-01-01','0001-01-01 00:00:00.000000','00:00:01.000000','2','','','','','','admin','2018-05-31 21:34:39.058860','2018-05-31 21:34:39.058884',0,''),(92,'请假天数(0.5的倍数)',31,'leave_days',5,'1',0,0,0,'0001-01-01','0001-01-01 00:00:00.000000','00:00:01.000000','','','','','','','admin','2018-05-31 21:46:31.565195','2018-05-31 21:46:31.565217',0,''),(93,'结束时间',31,'leave_end',30,'',0,0,0,'0001-01-01','2018-06-02 00:00:00.000000','00:00:01.000000','','','','','','','admin','2018-05-31 21:46:31.571946','2018-05-31 21:46:31.572006',0,''),(94,'请假原因及相关附件',31,'leave_reason',55,'',0,0,0,'0001-01-01','0001-01-01 00:00:00.000000','00:00:01.000000','','','','','<p>asdfadfasfaasdf基本面在</p>','','admin','2018-05-31 21:46:31.577939','2018-05-31 21:46:31.577958',0,''),(95,'代理人',31,'leave_proxy',60,'',0,0,0,'0001-01-01','0001-01-01 00:00:00.000000','00:00:01.000000','','','','','','admin','admin','2018-05-31 21:46:31.582274','2018-05-31 21:46:31.582294',0,''),(96,'开始时间',31,'leave_start',30,'',0,0,0,'0001-01-01','2018-06-01 00:00:00.000000','00:00:01.000000','','','','','','','admin','2018-05-31 21:46:31.588782','2018-05-31 21:46:31.588815',0,''),(97,'请假类型',31,'leave_type',35,'',0,0,0,'0001-01-01','0001-01-01 00:00:00.000000','00:00:01.000000','3','','','','','','admin','2018-05-31 21:46:31.594344','2018-05-31 21:46:31.594367',0,''),(98,'请假天数(0.5的倍数)',32,'leave_days',5,'1',0,0,0,'0001-01-01','0001-01-01 00:00:00.000000','00:00:01.000000','','','','','','','admin','2018-05-31 22:30:55.994878','2018-05-31 22:30:55.994911',0,''),(99,'结束时间',32,'leave_end',30,'',0,0,0,'0001-01-01','2018-06-02 00:00:00.000000','00:00:01.000000','','','','','','','admin','2018-05-31 22:30:56.001442','2018-05-31 22:30:56.001472',0,''),(100,'请假原因及相关附件',32,'leave_reason',55,'',0,0,0,'0001-01-01','0001-01-01 00:00:00.000000','00:00:01.000000','','','','','<p>dvdaadfafdf革一末后一sergrgrtyjfyj韩非和hdttyjdthsrthsth要</p>','','admin','2018-05-31 22:30:56.013529','2018-05-31 22:30:56.013567',0,''),(101,'代理人',32,'leave_proxy',60,'',0,0,0,'0001-01-01','0001-01-01 00:00:00.000000','00:00:01.000000','','','','','','admin','admin','2018-05-31 22:30:56.019679','2018-05-31 22:30:56.019710',0,''),(102,'开始时间',32,'leave_start',30,'',0,0,0,'0001-01-01','2018-06-01 00:00:00.000000','00:00:01.000000','','','','','','','admin','2018-05-31 22:30:56.028536','2018-05-31 22:30:56.028564',0,''),(103,'请假类型',32,'leave_type',35,'',0,0,0,'0001-01-01','0001-01-01 00:00:00.000000','00:00:01.000000','2','','','','','','admin','2018-05-31 22:30:56.034402','2018-05-31 22:30:56.034425',0,'');
/*!40000 ALTER TABLE `ticket_ticketcustomfield` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_ticketflowlog`
--

DROP TABLE IF EXISTS `ticket_ticketflowlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_ticketflowlog`
--

LOCK TABLES `ticket_ticketflowlog` WRITE;
/*!40000 ALTER TABLE `ticket_ticketflowlog` DISABLE KEYS */;
INSERT INTO `ticket_ticketflowlog` VALUES (65,25,1,'',1,'webb',1,'','admin','2018-05-28 16:27:02.168166','2018-05-28 16:27:02.168222',0,0),(66,26,7,'',1,'scm',6,'','admin','2018-05-29 19:29:52.745351','2018-05-29 19:29:52.745375',0,0),(67,27,1,'',1,'webb',1,'','admin','2018-05-29 22:11:12.707914','2018-05-29 22:11:12.707951',0,0),(68,28,7,'',1,'webb',6,'','admin','2018-05-30 23:55:22.018001','2018-05-30 23:55:22.018023',0,0),(69,27,3,'同意',1,'scm',3,'','scm','2018-05-31 19:44:50.248248','2018-05-31 19:44:50.248291',0,0),(70,28,8,'同意',1,'scm',7,'','scm','2018-05-31 19:45:14.974210','2018-05-31 19:45:14.974233',0,0),(71,26,8,'sdfadfadfasfda',1,'scm',7,'','scm','2018-05-31 19:48:39.226847','2018-05-31 19:48:39.226880',0,0),(72,25,4,'SDfadfadsfasf',1,'scm',3,'','scm','2018-05-31 19:48:46.579701','2018-05-31 19:48:46.579749',0,0),(73,29,2,'',1,'webb',1,'','admin','2018-05-31 21:22:21.632172','2018-05-31 21:22:21.632198',0,0),(74,30,1,'',1,'webb',1,'','admin','2018-05-31 21:34:39.061054','2018-05-31 21:34:39.061131',0,0),(75,31,1,'',1,'webb',1,'','admin','2018-05-31 21:46:31.596253','2018-05-31 21:46:31.596299',0,0),(76,31,3,'同意，注意休息',1,'admin',3,'','admin','2018-05-31 21:56:07.455511','2018-05-31 21:56:07.455543',0,0),(77,32,1,'',1,'webb',1,'','admin','2018-05-31 22:30:56.036527','2018-05-31 22:30:56.036610',0,0),(78,29,13,'工单详情有误，己修改',1,'webb',2,'','webb','2018-06-02 14:32:17.256683','2018-06-02 14:32:17.256709',0,0),(79,25,14,'保存',1,'webb',2,'','webb','2018-06-02 14:39:56.722675','2018-06-02 14:39:56.722701',0,0),(80,25,13,'修改请假单',1,'webb',2,'','webb','2018-06-02 15:03:53.726246','2018-06-02 15:03:53.726276',0,0);
/*!40000 ALTER TABLE `ticket_ticketflowlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_ticketrecord`
--

DROP TABLE IF EXISTS `ticket_ticketrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket_ticketrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_ticketrecord`
--

LOCK TABLES `ticket_ticketrecord` WRITE;
/*!40000 ALTER TABLE `ticket_ticketrecord` DISABLE KEYS */;
INSERT INTO `ticket_ticketrecord` VALUES (25,'请假申请',1,'loonflow_201805280002',3,0,0,1,'admin','webb','2018-05-28 16:27:02.056257','2018-06-02 15:03:53.677013',0,'webb','',0),(26,'scm测试vpn申请',2,'loonflow_201805290001',8,0,0,3,'3','scm','2018-05-29 19:29:52.727134','2018-05-31 19:48:39.216895',0,'scm','',0),(27,'因私事请假一天',1,'loonflow_201805290002',4,0,0,1,'jack','webb','2018-05-29 22:11:12.672150','2018-05-31 19:44:50.240853',0,'webb','',0),(28,'测试第三方APP',2,'loonflow_201805300001',8,0,0,3,'3','webb','2018-05-30 23:55:22.000746','2018-05-31 19:45:14.968827',0,'webb','',0),(29,'测试请假申请',1,'loonflow_201805310001',3,0,0,1,'admin','webb','2018-05-31 21:22:21.569902','2018-06-02 14:32:17.214726',0,'webb','',0),(30,'测试己保存',1,'loonflow_201805310002',3,0,0,1,'admin','webb','2018-05-31 21:34:39.005752','2018-05-31 21:34:39.005917',0,'webb','',0),(31,'测试001',1,'loonflow_201805310003',4,0,0,1,'jack','webb','2018-05-31 21:46:31.551198','2018-05-31 21:56:07.443615',0,'webb','',0),(32,'测试002',1,'loonflow_201805310004',3,0,0,1,'admin','webb','2018-05-31 22:30:55.976675','2018-05-31 22:30:55.976776',0,'webb','',0);
/*!40000 ALTER TABLE `ticket_ticketrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_ticketstatelastman`
--

DROP TABLE IF EXISTS `ticket_ticketstatelastman`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket_ticketstatelastman` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state_id` int(11) NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `participant_type_id` int(11) NOT NULL,
  `participant` varchar(100) NOT NULL,
  `creator` varchar(50) NOT NULL,
  `gmt_created` datetime(6) NOT NULL,
  `gmt_modified` datetime(6) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_ticketstatelastman`
--

LOCK TABLES `ticket_ticketstatelastman` WRITE;
/*!40000 ALTER TABLE `ticket_ticketstatelastman` DISABLE KEYS */;
/*!40000 ALTER TABLE `ticket_ticketstatelastman` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_customfield`
--

DROP TABLE IF EXISTS `workflow_customfield`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  `boolean_field_display` varchar(100) DEFAULT NULL,
  `creator` varchar(50) NOT NULL,
  `gmt_created` datetime(6) NOT NULL,
  `gmt_modified` datetime(6) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `field_choice` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_customfield`
--

LOCK TABLES `workflow_customfield` WRITE;
/*!40000 ALTER TABLE `workflow_customfield` DISABLE KEYS */;
INSERT INTO `workflow_customfield` VALUES (1,1,30,'leave_start','开始时间',20,NULL,'','',NULL,'admin','2018-04-23 20:56:25.940486','2018-05-11 07:31:11.133782',0,'{}'),(2,1,30,'leave_end','结束时间',25,NULL,'','',NULL,'admin','2018-05-10 07:41:03.717540','2018-05-11 07:31:19.923554',0,'{}'),(3,1,5,'leave_days','请假天数(0.5的倍数)',30,NULL,'前端根据起止时间自动计算','',NULL,'admin','2018-05-11 07:28:31.649506','2018-05-11 07:31:28.835612',0,'{}'),(4,1,60,'leave_proxy','代理人',35,NULL,'请假期间的代理人','',NULL,'admin','2018-05-11 07:31:01.068850','2018-05-11 07:31:35.323117',0,'{}'),(5,1,35,'leave_type','请假类型',40,NULL,'','',NULL,'admin','2018-05-11 07:34:29.608579','2018-05-23 22:38:57.324916',0,'{\"1\": \"年假\", \"2\": \"调休\", \"3\": \"病假\", \"4\": \"婚假\"}'),(6,1,55,'leave_reason','请假原因及相关附件',45,NULL,'','病假请提供证明拍照附件， 婚假请提供结婚证拍照附件',NULL,'admin','2018-05-11 07:36:41.882377','2018-05-11 07:36:41.882413',0,'{}'),(7,2,55,'vpn_reason','申请原因',110,'请填写申请vpn的理由','vpn申请原因','',NULL,'admin','2018-05-12 10:02:31.501142','2018-05-12 10:02:31.501189',0,'{}'),(8,3,5,'project_code','项目标识',22,NULL,'项目的唯一标识','',NULL,'admin','2018-05-12 10:05:06.480383','2018-05-12 10:05:06.480553',0,'{}'),(9,3,60,'project_devs','项目开发人员',45,NULL,'','',NULL,'admin','2018-05-12 10:52:47.136366','2018-05-12 10:52:47.136413',0,'{}'),(10,3,60,'project_qas','项目测试人员',55,NULL,'','',NULL,'admin','2018-05-12 10:53:14.716232','2018-05-12 10:53:14.716279',0,'{}'),(11,4,5,'app_name','应用名称',10,NULL,'','',NULL,'admin','2018-05-13 11:00:50.496316','2018-05-13 11:00:50.496361',0,'{}'),(12,4,60,'app_owners','应用负责人',20,NULL,'','',NULL,'admin','2018-05-13 11:01:20.648063','2018-05-13 11:01:20.648092',0,'{}');
/*!40000 ALTER TABLE `workflow_customfield` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_state`
--

DROP TABLE IF EXISTS `workflow_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_state`
--

LOCK TABLES `workflow_state` WRITE;
/*!40000 ALTER TABLE `workflow_state` DISABLE KEYS */;
INSERT INTO `workflow_state` VALUES (1,'新建中',1,0,0,0,1,1,'wangfei',1,'{\"title\":2, \"leave_start\": 2,  \"leave_end\":2,  \"leave_days\":2,  \"leave_proxy\":2,  \"leave_type\":2, \"leave_reason\":2}','{}','admin','2018-04-23 20:53:33.052134','2018-05-13 11:42:11.273695',0),(2,'发起人-编辑中',1,0,1,2,0,5,'creator',1,'{\"sn\":1,  \"title\":2, \"leave_start\": 2,  \"leave_end\":2,  \"leave_days\":2,  \"leave_proxy\":2,  \"leave_type\":2, \"creator\":1, \"gmt_created\":1,  \"leave_reason\":2, \"state.state_name\":1}','{}','admin','2018-04-30 15:45:48.976712','2018-05-14 06:44:10.661777',0),(3,'TL审批中',1,0,0,3,0,1,'admin',1,'{\"sn\":1,  \"title\":1, \"leave_start\": 1,  \"leave_end\":1,  \"leave_days\":1,  \"leave_proxy\":1,  \"leave_type\":1, \"creator\":1, \"gmt_created\":1,  \"leave_reason\":1}','{}','admin','2018-04-30 15:46:42.184252','2018-05-31 21:43:06.002370',0),(4,'人事部门-处理中',1,0,0,4,0,1,'jack',1,'{\"sn\":1,  \"title\":1, \"leave_start\": 1,  \"leave_end\":1,  \"leave_days\":1,  \"leave_proxy\":1,  \"leave_type\":1, \"creator\":1, \"gmt_created\":1,  \"leave_reason\":1}','{}','admin','2018-04-30 15:47:58.790510','2018-05-13 11:42:59.834440',0),(5,'结束',1,0,0,6,2,0,'',1,'{}','{}','admin','2018-04-30 15:51:41.260309','2018-05-11 06:52:39.799922',0),(6,'发起人-新建中',2,0,0,1,1,5,'creator',1,'{\"vpn_reason\":2, \"title\":2}','{}','admin','2018-05-10 07:34:45.302697','2018-05-15 07:13:06.599270',0),(7,'发起人tl-审批中',2,0,0,2,0,5,'creator_tl',2,'{\"sn\":1,  \"title\":1, \"creator\":1, \"gmt_created\":1,  \"vpn_reason\":1}','{}','admin','2018-05-11 06:47:36.381658','2018-05-15 07:19:16.038155',0),(8,'运维人员-审批中',2,0,0,3,0,3,'3',1,'{}','{}','admin','2018-05-11 06:48:26.945117','2018-05-11 07:08:33.438818',0),(9,'授权脚本-自动执行中',2,0,0,4,0,6,'demo_script.py',1,'{}','{}','admin','2018-05-11 06:50:09.416344','2018-05-11 07:10:25.197748',0),(10,'发起人-确认中',2,0,0,6,1,5,'creator',1,'{\"participant_info.participant_name\":1, \"sn\":1, \"state.state_name\":1, \"workflow.workflow_name\":1}','{}','admin','2018-05-11 06:51:02.913212','2018-05-22 22:21:51.867707',0),(11,'结束',2,0,0,7,3,0,'',1,'{}','{}','admin','2018-05-11 07:11:53.076731','2018-05-11 07:11:53.076766',0),(13,'立项中',3,0,0,1,1,5,'creator',1,'{}','{}','admin','2018-05-12 09:43:27.851070','2018-05-12 09:43:27.851100',0),(14,'开发中',3,5,0,10,0,1,'loonrobot',1,'{}','{}','admin','2018-05-13 11:05:48.191064','2018-05-13 11:06:03.745046',0),(15,'联调中',3,0,0,20,0,7,'devs',1,'{}','{}','admin','2018-05-13 11:07:18.512068','2018-05-13 11:07:18.512103',0),(16,'测试中',3,0,0,25,0,7,'qas',1,'{}','{}','admin','2018-05-13 11:07:48.480254','2018-05-13 11:07:48.480303',0),(17,'预发验收中',3,0,0,30,0,7,'qas',1,'{}','{}','admin','2018-05-13 11:10:36.042794','2018-05-13 11:10:36.042824',0),(18,'上线验收中',3,0,0,40,0,7,'qas',1,'{}','{}','admin','2018-05-13 11:13:00.582648','2018-05-13 11:13:00.582678',0),(19,'项目结束',3,0,0,50,2,1,'',1,'{}','{}','admin','2018-05-13 11:13:25.613635','2018-05-13 11:13:25.613668',0),(20,'新建应用中',4,0,0,0,1,5,'creator',1,'{}','{}','admin','2018-05-13 11:18:07.520338','2018-05-13 11:18:07.520363',0),(21,'代码编写中',4,0,0,20,0,1,'loonrobot',1,'{}','{}','admin','2018-05-13 11:23:27.197190','2018-05-13 11:23:27.197222',0),(22,'静态扫描',4,0,0,25,0,6,'demo_script.py',1,'{}','{}','admin','2018-05-13 11:24:03.442364','2018-05-13 11:24:03.442389',0),(23,'单元测试',4,0,0,30,0,6,'demo_script.py',1,'{}','{}','admin','2018-05-13 11:24:26.019132','2018-05-13 11:24:26.019167',0),(24,'自动部署',4,0,0,30,0,6,'demo_script.py',1,'{}','{}','admin','2018-05-13 11:29:26.862712','2018-05-13 11:29:26.862744',0),(25,'结束',4,0,0,40,2,1,'',1,'{}','{}','admin','2018-05-13 11:29:54.165834','2018-05-13 11:29:54.165881',0);
/*!40000 ALTER TABLE `workflow_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_transition`
--

DROP TABLE IF EXISTS `workflow_transition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_transition`
--

LOCK TABLES `workflow_transition` WRITE;
/*!40000 ALTER TABLE `workflow_transition` DISABLE KEYS */;
INSERT INTO `workflow_transition` VALUES (1,'提交',1,1,1,3,0,'','admin','2018-04-24 07:09:25.922814','2018-04-30 15:48:57.047369',0,1),(2,'保存',1,1,1,2,0,'','admin','2018-04-30 15:30:25.650813','2018-04-30 15:48:52.372363',0,1),(3,'同意',1,1,3,4,0,'','admin','2018-04-30 15:49:23.451582','2018-04-30 15:49:23.451627',0,1),(4,'拒绝',1,1,3,2,1,'请确认是否真的拒绝','admin','2018-04-30 15:54:32.069649','2018-05-11 07:00:24.370322',0,0),(5,'同意',1,1,4,5,0,'','admin','2018-04-30 15:55:00.072437','2018-05-11 07:03:29.349770',0,1),(6,'退回',1,1,4,2,0,'','admin','2018-05-11 06:58:43.395655','2018-05-11 07:04:14.896678',0,0),(7,'提交',2,1,6,7,0,'','admin','2018-05-11 07:06:22.745312','2018-05-11 07:06:22.745342',0,1),(8,'同意',2,1,7,8,0,'','admin','2018-05-11 07:07:33.213731','2018-05-11 07:07:33.213760',0,1),(9,'同意',2,1,8,9,0,'','admin','2018-05-11 07:12:53.036037','2018-05-11 07:12:53.036077',0,1),(10,'脚本执行完成',2,1,9,10,0,'','admin','2018-05-11 07:13:12.070223','2018-05-11 07:13:12.070254',0,1),(11,'确认完成',2,1,10,11,0,'','admin','2018-05-11 07:13:52.427815','2018-05-11 07:13:52.427844',0,1),(12,'未生效',2,1,10,8,1,'是否真的退回？  请查看vpn使用文档保证使用姿势正确，再退回','admin','2018-05-11 07:16:26.826525','2018-05-11 07:16:36.072876',0,0),(13,'提交',1,1,2,3,0,'','admin','2018-05-13 22:34:55.808381','2018-05-13 22:34:55.808461',0,1),(14,'保存',1,1,2,2,0,'','admin','2018-05-13 22:35:05.020546','2018-05-13 22:35:05.020615',0,1);
/*!40000 ALTER TABLE `workflow_transition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_workflow`
--

DROP TABLE IF EXISTS `workflow_workflow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_workflow`
--

LOCK TABLES `workflow_workflow` WRITE;
/*!40000 ALTER TABLE `workflow_workflow` DISABLE KEYS */;
INSERT INTO `workflow_workflow` VALUES (1,'请假申请','请假申请','','[\"sn\", \"title\", \"leave_start\", \"leave_end\", \"leave_days\", \"leave_proxy\",  \"leave_type\", \"creator\", \"gmt_created\", \"leave_reason\"]','admin','2018-04-23 20:49:32.229386','2018-05-14 06:46:54.959779',0,0),(2,'vpn申请','vpn权限申请','flowchart/WechatIMG242_YpFQb5K.jpeg','[\"sn\", \"title\", \"model\", \"gmt_created\"]','admin','2018-05-06 12:32:36.690665','2018-05-09 07:17:41.650254',0,1),(3,'项目流程','项目的流程,立项、开发、测试、预发、上线等','','[]','admin','2018-05-12 09:40:48.912021','2018-05-12 09:40:48.912050',0,1),(4,'应用开发流程','应用开发中流程(提交代码、静态扫描、单元测试、自动部署等等)','','[]','admin','2018-05-12 09:41:56.331373','2018-05-12 09:41:56.331407',0,1);
/*!40000 ALTER TABLE `workflow_workflow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_workflowscript`
--

DROP TABLE IF EXISTS `workflow_workflowscript`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_workflowscript`
--

LOCK TABLES `workflow_workflowscript` WRITE;
/*!40000 ALTER TABLE `workflow_workflowscript` DISABLE KEYS */;
INSERT INTO `workflow_workflowscript` VALUES (5,'demo脚本','demo_script.py','demo脚本',1,'admin','2018-05-12 09:32:00.000000','2018-05-12 09:32:41.499172',0),(7,'sss','workflow_script/zanalert-0.0.1.tar_nGW7iWU.gz','sss',1,'admin','2018-05-23 22:54:44.591335','2018-05-23 22:54:44.591362',0);
/*!40000 ALTER TABLE `workflow_workflowscript` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-06-03  0:24:50
