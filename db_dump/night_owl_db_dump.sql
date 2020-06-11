-- MySQL dump 10.13  Distrib 8.0.20, for Linux (x86_64)
--
-- Host: localhost    Database: night_owl_db
-- ------------------------------------------------------
-- Server version	8.0.20-0ubuntu0.20.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add paid orders n c1',1,'add_paidordersnc1'),(2,'Can change paid orders n c1',1,'change_paidordersnc1'),(3,'Can delete paid orders n c1',1,'delete_paidordersnc1'),(4,'Can view paid orders n c1',1,'view_paidordersnc1'),(5,'Can add paid orders n c2',2,'add_paidordersnc2'),(6,'Can change paid orders n c2',2,'change_paidordersnc2'),(7,'Can delete paid orders n c2',2,'delete_paidordersnc2'),(8,'Can view paid orders n c2',2,'view_paidordersnc2'),(9,'Can add paid orders n c3',3,'add_paidordersnc3'),(10,'Can change paid orders n c3',3,'change_paidordersnc3'),(11,'Can delete paid orders n c3',3,'delete_paidordersnc3'),(12,'Can view paid orders n c3',3,'view_paidordersnc3'),(13,'Can add n c1 products',4,'add_nc1products'),(14,'Can change n c1 products',4,'change_nc1products'),(15,'Can delete n c1 products',4,'delete_nc1products'),(16,'Can view n c1 products',4,'view_nc1products'),(17,'Can add n c2 products',5,'add_nc2products'),(18,'Can change n c2 products',5,'change_nc2products'),(19,'Can delete n c2 products',5,'delete_nc2products'),(20,'Can view n c2 products',5,'view_nc2products'),(21,'Can add n c3 products',6,'add_nc3products'),(22,'Can change n c3 products',6,'change_nc3products'),(23,'Can delete n c3 products',6,'delete_nc3products'),(24,'Can view n c3 products',6,'view_nc3products'),(25,'Can add log entry',7,'add_logentry'),(26,'Can change log entry',7,'change_logentry'),(27,'Can delete log entry',7,'delete_logentry'),(28,'Can view log entry',7,'view_logentry'),(29,'Can add permission',8,'add_permission'),(30,'Can change permission',8,'change_permission'),(31,'Can delete permission',8,'delete_permission'),(32,'Can view permission',8,'view_permission'),(33,'Can add group',9,'add_group'),(34,'Can change group',9,'change_group'),(35,'Can delete group',9,'delete_group'),(36,'Can view group',9,'view_group'),(37,'Can add user',10,'add_user'),(38,'Can change user',10,'change_user'),(39,'Can delete user',10,'delete_user'),(40,'Can view user',10,'view_user'),(41,'Can add content type',11,'add_contenttype'),(42,'Can change content type',11,'change_contenttype'),(43,'Can delete content type',11,'delete_contenttype'),(44,'Can view content type',11,'view_contenttype'),(45,'Can add session',12,'add_session'),(46,'Can change session',12,'change_session'),(47,'Can delete session',12,'delete_session'),(48,'Can view session',12,'view_session');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$180000$pUOGCODG1ZOw$8rqLSqzy9L4ZaXr1shm/Sid3sFjJadaeQJ2y3DgXm4w=','2020-06-11 11:55:26.081701',1,'admin','','','',1,1,'2020-06-11 11:54:34.470684');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2020-06-11 11:55:55.787807','33','Order number - 33',2,'[{\"changed\": {\"fields\": [\"Filters\"]}}]',1,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (7,'admin','logentry'),(9,'auth','group'),(8,'auth','permission'),(10,'auth','user'),(11,'contenttypes','contenttype'),(4,'night_owl','nc1products'),(5,'night_owl','nc2products'),(6,'night_owl','nc3products'),(1,'night_owl','paidordersnc1'),(2,'night_owl','paidordersnc2'),(3,'night_owl','paidordersnc3'),(12,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2020-06-11 04:15:29.252303'),(2,'auth','0001_initial','2020-06-11 04:15:30.120431'),(3,'admin','0001_initial','2020-06-11 04:15:32.206126'),(4,'admin','0002_logentry_remove_auto_add','2020-06-11 04:15:32.730249'),(5,'admin','0003_logentry_add_action_flag_choices','2020-06-11 04:15:32.760272'),(6,'contenttypes','0002_remove_content_type_name','2020-06-11 04:15:33.165003'),(7,'auth','0002_alter_permission_name_max_length','2020-06-11 04:15:33.472456'),(8,'auth','0003_alter_user_email_max_length','2020-06-11 04:15:33.548093'),(9,'auth','0004_alter_user_username_opts','2020-06-11 04:15:33.576797'),(10,'auth','0005_alter_user_last_login_null','2020-06-11 04:15:33.800542'),(11,'auth','0006_require_contenttypes_0002','2020-06-11 04:15:33.816031'),(12,'auth','0007_alter_validators_add_error_messages','2020-06-11 04:15:33.851497'),(13,'auth','0008_alter_user_username_max_length','2020-06-11 04:15:34.145134'),(14,'auth','0009_alter_user_last_name_max_length','2020-06-11 04:15:34.420838'),(15,'auth','0010_alter_group_name_max_length','2020-06-11 04:15:34.480986'),(16,'auth','0011_update_proxy_permissions','2020-06-11 04:15:34.509489'),(17,'night_owl','0001_initial','2020-06-11 04:15:34.937830'),(18,'night_owl','0002_auto_20190313_2135','2020-06-11 04:15:35.445717'),(19,'night_owl','0003_auto_20190314_1445','2020-06-11 04:15:35.808998'),(20,'night_owl','0004_auto_20190314_2327','2020-06-11 04:15:37.130340'),(21,'night_owl','0005_auto_20190315_1232','2020-06-11 04:15:37.461257'),(22,'night_owl','0006_auto_20190320_1532','2020-06-11 04:15:37.688609'),(23,'night_owl','0007_auto_20190320_1702','2020-06-11 04:15:38.326241'),(24,'night_owl','0008_auto_20190320_1717','2020-06-11 04:15:38.455614'),(25,'night_owl','0009_auto_20190321_0124','2020-06-11 04:19:49.535071'),(26,'night_owl','0010_auto_20190321_2102','2020-06-11 04:19:49.906511'),(27,'night_owl','0011_auto_20190321_2103','2020-06-11 04:19:50.620102'),(28,'night_owl','0012_auto_20190321_2103','2020-06-11 04:19:50.647168'),(29,'night_owl','0013_auto_20190321_2118','2020-06-11 04:19:51.782909'),(30,'night_owl','0014_auto_20190321_2120','2020-06-11 04:19:51.892299'),(31,'night_owl','0015_auto_20190322_1714','2020-06-11 04:19:51.932030'),(32,'night_owl','0016_auto_20190322_1722','2020-06-11 04:19:51.956489'),(33,'night_owl','0017_auto_20190322_1723','2020-06-11 04:19:51.977246'),(34,'night_owl','0018_auto_20200611_0946','2020-06-11 04:19:52.002551'),(35,'sessions','0001_initial','2020-06-11 04:19:52.130129'),(36,'night_owl','0019_auto_20200611_1713','2020-06-11 11:43:11.450395');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('qw50g6dmz38579vqud3g32klsdx07ajs','ZTVlMzQ4NDVlMmI5ZDg5Y2E1NWFiMjEyNTYxY2NmY2UzMWVhNmMzNjp7fQ==','2020-06-25 11:53:16.475060'),('uea2ia5w6sxeeenska8hxvqehz46e5a9','MTg1MDQzMzVkNjM3MGYxYzM4OTlkYTU2OTU1ZTMzMmZkZDM2NzVkNDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkMmM5MTI5OTliMjQwZDQ1NzUwYjg2ZDZjNzk4ZjUxNTU3ZGY3M2ZkIn0=','2020-06-25 11:56:34.444349');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `night_owl_nc1products`
--

DROP TABLE IF EXISTS `night_owl_nc1products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `night_owl_nc1products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `price` int NOT NULL,
  `veg` tinyint(1) NOT NULL,
  `currently_present` tinyint(1) NOT NULL,
  `filter` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `night_owl_nc1products`
--

LOCK TABLES `night_owl_nc1products` WRITE;
/*!40000 ALTER TABLE `night_owl_nc1products` DISABLE KEYS */;
INSERT INTO `night_owl_nc1products` VALUES (24,'Tea with milk',10,1,1,1),(25,'Black Tea',10,1,1,1),(26,'Coffee',10,1,1,1),(27,'Hot Boost',15,1,1,1),(28,'Badam Milk Hot',15,1,1,1),(29,'Badam Milk Shake',20,1,1,1),(30,'Boost Milk Shake',20,1,1,1),(31,'Lime Juice',10,1,1,1),(32,'Mineral Water(1 Litre)',20,1,1,1),(33,'Dosa Plain',20,1,1,2),(34,'Set Dosa',20,1,1,2),(35,'Onion Tomato Uthappa',30,1,1,2),(36,'Tomato Uthappa',30,1,1,2),(37,'Masala Dosa',25,1,1,2),(38,'Bread Butter',15,1,1,3),(39,'Veg Sandwich',20,1,1,3);
/*!40000 ALTER TABLE `night_owl_nc1products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `night_owl_nc2products`
--

DROP TABLE IF EXISTS `night_owl_nc2products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `night_owl_nc2products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `price` int NOT NULL,
  `veg` tinyint(1) NOT NULL,
  `currently_present` tinyint(1) NOT NULL,
  `filter` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `night_owl_nc2products`
--

LOCK TABLES `night_owl_nc2products` WRITE;
/*!40000 ALTER TABLE `night_owl_nc2products` DISABLE KEYS */;
INSERT INTO `night_owl_nc2products` VALUES (24,'Tea with Milk',10,1,1,1),(25,'Lime Juice',10,1,1,1),(26,'Plain Dosa',20,1,1,2),(27,'Masala Dosa',25,1,1,2),(28,'Bread Butter',15,1,1,3),(29,'Veg Sandwich',20,1,1,3);
/*!40000 ALTER TABLE `night_owl_nc2products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `night_owl_nc3products`
--

DROP TABLE IF EXISTS `night_owl_nc3products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `night_owl_nc3products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `price` int NOT NULL,
  `veg` tinyint(1) NOT NULL,
  `currently_present` tinyint(1) NOT NULL,
  `filter` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `night_owl_nc3products`
--

LOCK TABLES `night_owl_nc3products` WRITE;
/*!40000 ALTER TABLE `night_owl_nc3products` DISABLE KEYS */;
INSERT INTO `night_owl_nc3products` VALUES (1,'Veg Noodles',40,1,1,1),(2,'Egg Noodles',45,1,1,1),(3,'Veg Rice',40,1,1,2),(4,'Egg Rice',45,1,1,2);
/*!40000 ALTER TABLE `night_owl_nc3products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `night_owl_paidordersnc1`
--

DROP TABLE IF EXISTS `night_owl_paidordersnc1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `night_owl_paidordersnc1` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ph_no` bigint NOT NULL,
  `gpay_ph_no` bigint NOT NULL,
  `block` varchar(15) NOT NULL,
  `item_name` longtext NOT NULL,
  `price` longtext NOT NULL,
  `quantity` longtext NOT NULL,
  `order_comments` longtext,
  `filters` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `night_owl_paidordersnc1`
--

LOCK TABLES `night_owl_paidordersnc1` WRITE;
/*!40000 ALTER TABLE `night_owl_paidordersnc1` DISABLE KEYS */;
INSERT INTO `night_owl_paidordersnc1` VALUES (22,7030424864,7030424864,'1','Masala Dosa\r\nBoost Milk Shake','25\r\n20','1\r\n4','YUsss','c'),(23,1223212224,2313231234,'1','Tea with milk\r\nCoffee','10\r\n10','1\r\n1','dsad','b'),(24,7030424864,7030424864,'3','Tea with milk\r\nHot Boost\r\nTomato Uthappa','10\r\n15\r\n30','1\r\n1\r\n1','Veg Only','a'),(25,7030424864,7030424864,'1','Tea with milk\r\nSet Dosa','10\r\n20','1\r\n1','ABC','a'),(26,7030424864,7030424864,'MT-1','Coffee\r\nVeg Sandwich','10\r\n20','1\r\n1','','b'),(28,7030424864,7030424864,'MT-3','Tea with milk\nTomato Uthappa','10\n30','2\n1','','Pending'),(29,1234567890,1234567890,'3','Tomato Uthappa','30','3','ok da','Pending'),(30,1234567890,1234567890,'MT-2','Badam Milk Hot\nCoffee\nSet Dosa\nLime Juice','15\n10\n20\n10','1\n1\n1\n2','ok da josson','Pending'),(31,7030424864,7030424864,'3','Tea with milk\r\nCoffee','10\r\n10','1\r\n1','Nothing','b'),(32,7030424864,7030424864,'3','Set Dosa\nBread Butter','20\n15','1\n1','None','a'),(33,7030424864,7030424864,'3','Black Tea','10','1','Testt','c');
/*!40000 ALTER TABLE `night_owl_paidordersnc1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `night_owl_paidordersnc2`
--

DROP TABLE IF EXISTS `night_owl_paidordersnc2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `night_owl_paidordersnc2` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ph_no` bigint NOT NULL,
  `gpay_ph_no` bigint NOT NULL,
  `block` varchar(15) NOT NULL,
  `item_name` longtext NOT NULL,
  `price` longtext NOT NULL,
  `quantity` longtext NOT NULL,
  `order_comments` longtext,
  `filters` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `night_owl_paidordersnc2`
--

LOCK TABLES `night_owl_paidordersnc2` WRITE;
/*!40000 ALTER TABLE `night_owl_paidordersnc2` DISABLE KEYS */;
INSERT INTO `night_owl_paidordersnc2` VALUES (1,1234567899,1234567899,'2','Tea with Milk\r\nMasala Dosa','10\r\n25','1\r\n2','','b'),(2,2323232323,2323232323,'GH-4','Bread Butter','15','2','aasdsda','a'),(3,1234567988,1234567988,'1','Tea with Milk\r\nPlain Dosa','10\r\n20','1\r\n2','Abdhs','a');
/*!40000 ALTER TABLE `night_owl_paidordersnc2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `night_owl_paidordersnc3`
--

DROP TABLE IF EXISTS `night_owl_paidordersnc3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `night_owl_paidordersnc3` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ph_no` bigint NOT NULL,
  `gpay_ph_no` bigint NOT NULL,
  `block` varchar(15) NOT NULL,
  `item_name` longtext NOT NULL,
  `price` longtext NOT NULL,
  `quantity` longtext NOT NULL,
  `order_comments` longtext,
  `filters` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `night_owl_paidordersnc3`
--

LOCK TABLES `night_owl_paidordersnc3` WRITE;
/*!40000 ALTER TABLE `night_owl_paidordersnc3` DISABLE KEYS */;
INSERT INTO `night_owl_paidordersnc3` VALUES (1,1234567899,1234567899,'MT-2','Veg Noodles','40','2','','a'),(2,1234567899,1234567899,'1','Veg Noodles\r\nEgg Rice','40\r\n45','2\r\n1','','a');
/*!40000 ALTER TABLE `night_owl_paidordersnc3` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-11 17:55:28
