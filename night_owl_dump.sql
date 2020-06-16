-- MySQL dump 10.13  Distrib 8.0.20, for Linux (x86_64)
--
-- Host: localhost    Database: night_owl
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
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add n c1 products',7,'add_nc1products'),(26,'Can change n c1 products',7,'change_nc1products'),(27,'Can delete n c1 products',7,'delete_nc1products'),(28,'Can view n c1 products',7,'view_nc1products'),(29,'Can add n c2 products',8,'add_nc2products'),(30,'Can change n c2 products',8,'change_nc2products'),(31,'Can delete n c2 products',8,'delete_nc2products'),(32,'Can view n c2 products',8,'view_nc2products'),(33,'Can add n c3 products',9,'add_nc3products'),(34,'Can change n c3 products',9,'change_nc3products'),(35,'Can delete n c3 products',9,'delete_nc3products'),(36,'Can view n c3 products',9,'view_nc3products'),(37,'Can add paid orders n c3',10,'add_paidordersnc3'),(38,'Can change paid orders n c3',10,'change_paidordersnc3'),(39,'Can delete paid orders n c3',10,'delete_paidordersnc3'),(40,'Can view paid orders n c3',10,'view_paidordersnc3'),(41,'Can add paid orders n c2',11,'add_paidordersnc2'),(42,'Can change paid orders n c2',11,'change_paidordersnc2'),(43,'Can delete paid orders n c2',11,'delete_paidordersnc2'),(44,'Can view paid orders n c2',11,'view_paidordersnc2'),(45,'Can add paid orders n c1',12,'add_paidordersnc1'),(46,'Can change paid orders n c1',12,'change_paidordersnc1'),(47,'Can delete paid orders n c1',12,'delete_paidordersnc1'),(48,'Can view paid orders n c1',12,'view_paidordersnc1'),(49,'Can add n c3 order details',13,'add_nc3orderdetails'),(50,'Can change n c3 order details',13,'change_nc3orderdetails'),(51,'Can delete n c3 order details',13,'delete_nc3orderdetails'),(52,'Can view n c3 order details',13,'view_nc3orderdetails'),(53,'Can add n c2 order details',14,'add_nc2orderdetails'),(54,'Can change n c2 order details',14,'change_nc2orderdetails'),(55,'Can delete n c2 order details',14,'delete_nc2orderdetails'),(56,'Can view n c2 order details',14,'view_nc2orderdetails'),(57,'Can add n c1 order details',15,'add_nc1orderdetails'),(58,'Can change n c1 order details',15,'change_nc1orderdetails'),(59,'Can delete n c1 order details',15,'delete_nc1orderdetails'),(60,'Can view n c1 order details',15,'view_nc1orderdetails');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$180000$7p9Z5blw535b$DEmGFc735TghVR2kultz2iN3xi+8Sq93bKqoEVEcdaA=','2020-06-12 04:11:37.233507',1,'admin','','','',1,1,'2020-06-11 21:06:29.377513'),(2,'pbkdf2_sha256$180000$x7sojutHTUFr$dZfarUsy9QQGsUjwti2hFuKeT5kwwkO0kNZh2gOTGEI=','2020-06-12 04:17:25.106656',0,'krithikvaidya','Krithik','Vaidya','krithikvaidya@gmail.com',0,1,'2020-06-11 21:06:59.000000'),(3,'pbkdf2_sha256$180000$AKpCmE8yS2KD$3eqAu77a2p4J1UrMHcr48qH6fvD19wdr/XDzzzvwv2I=','2020-06-12 04:33:07.050660',0,'nc1admin','','','',1,1,'2020-06-11 23:00:13.000000'),(4,'pbkdf2_sha256$180000$x6QxdvN9U0Je$oTftfqJNmKLxPWGb3ly2O19FofbWDJ/hqW71bkr3vRs=',NULL,0,'nc2admin','','','',1,1,'2020-06-12 02:27:19.000000'),(5,'pbkdf2_sha256$180000$YkNN6hneQlTj$qhktNRkk/l+IDHefn8KR7SQg94kCdo6Yw0VsLYsqKOs=',NULL,0,'nc3admin','','','',1,1,'2020-06-12 02:28:00.000000');
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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
INSERT INTO `auth_user_user_permissions` VALUES (12,3,25),(1,3,26),(2,3,27),(3,3,28),(4,3,45),(5,3,46),(6,3,47),(7,3,48),(8,3,57),(9,3,58),(10,3,59),(11,3,60),(22,4,29),(23,4,30),(24,4,31),(13,4,32),(14,4,41),(15,4,42),(16,4,43),(17,4,44),(18,4,53),(19,4,54),(20,4,55),(21,4,56),(25,5,33),(26,5,34),(27,5,35),(28,5,36),(29,5,37),(30,5,38),(31,5,39),(32,5,40),(33,5,49),(34,5,50),(35,5,51),(36,5,52);
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2020-06-11 21:07:00.023922','2','krithikvaidya',1,'[{\"added\": {}}]',4,1),(2,'2020-06-11 21:07:23.035122','2','krithikvaidya',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\"]}}]',4,1),(3,'2020-06-11 23:00:13.673376','3','nc1admin',1,'[{\"added\": {}}]',4,1),(4,'2020-06-11 23:00:20.864014','3','nc1admin',2,'[{\"changed\": {\"fields\": [\"Staff status\"]}}]',4,1),(5,'2020-06-12 02:13:17.480596','4','Order number - 4',2,'[{\"changed\": {\"fields\": [\"Order details\", \"Filters\"]}}]',12,1),(6,'2020-06-12 02:16:11.399736','3','nc1admin',2,'[{\"changed\": {\"fields\": [\"User permissions\"]}}]',4,1),(7,'2020-06-12 02:27:19.412016','4','nc2admin',1,'[{\"added\": {}}]',4,1),(8,'2020-06-12 02:27:46.997328','4','nc2admin',2,'[{\"changed\": {\"fields\": [\"Staff status\", \"User permissions\"]}}]',4,1),(9,'2020-06-12 02:28:00.808951','5','nc3admin',1,'[{\"added\": {}}]',4,1),(10,'2020-06-12 02:28:21.589443','5','nc3admin',2,'[{\"changed\": {\"fields\": [\"Staff status\", \"User permissions\"]}}]',4,1),(11,'2020-06-12 02:42:05.256219','5','Order number - 5',2,'[{\"changed\": {\"fields\": [\"Order details\"]}}]',12,1),(12,'2020-06-12 04:09:43.988511','9','Order number - 9',2,'[{\"changed\": {\"fields\": [\"Order details\", \"Filters\"]}}]',12,3),(13,'2020-06-12 04:21:43.070871','10','Order number - 10',2,'[{\"changed\": {\"fields\": [\"Order details\", \"Filters\"]}}]',12,3),(14,'2020-06-12 04:33:49.326315','11','Order number - 11',2,'[{\"changed\": {\"fields\": [\"Order details\", \"Filters\"]}}]',12,3);
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(15,'night_owl','nc1orderdetails'),(7,'night_owl','nc1products'),(14,'night_owl','nc2orderdetails'),(8,'night_owl','nc2products'),(13,'night_owl','nc3orderdetails'),(9,'night_owl','nc3products'),(12,'night_owl','paidordersnc1'),(11,'night_owl','paidordersnc2'),(10,'night_owl','paidordersnc3'),(6,'sessions','session');
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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2020-06-11 21:02:32.117310'),(2,'auth','0001_initial','2020-06-11 21:02:32.392850'),(3,'admin','0001_initial','2020-06-11 21:02:33.097710'),(4,'admin','0002_logentry_remove_auto_add','2020-06-11 21:02:33.300790'),(5,'admin','0003_logentry_add_action_flag_choices','2020-06-11 21:02:33.315525'),(6,'contenttypes','0002_remove_content_type_name','2020-06-11 21:02:33.467968'),(7,'auth','0002_alter_permission_name_max_length','2020-06-11 21:02:33.571955'),(8,'auth','0003_alter_user_email_max_length','2020-06-11 21:02:33.623155'),(9,'auth','0004_alter_user_username_opts','2020-06-11 21:02:33.647026'),(10,'auth','0005_alter_user_last_login_null','2020-06-11 21:02:33.742792'),(11,'auth','0006_require_contenttypes_0002','2020-06-11 21:02:33.750209'),(12,'auth','0007_alter_validators_add_error_messages','2020-06-11 21:02:33.775335'),(13,'auth','0008_alter_user_username_max_length','2020-06-11 21:02:33.890579'),(14,'auth','0009_alter_user_last_name_max_length','2020-06-11 21:02:33.996776'),(15,'auth','0010_alter_group_name_max_length','2020-06-11 21:02:34.036313'),(16,'auth','0011_update_proxy_permissions','2020-06-11 21:02:34.058111'),(17,'night_owl','0001_initial','2020-06-11 21:02:34.552484'),(18,'sessions','0001_initial','2020-06-11 21:02:36.316021'),(19,'night_owl','0002_paidordersnc1_order_details','2020-06-12 02:07:08.895052'),(20,'night_owl','0003_auto_20200612_0744','2020-06-12 02:14:24.444548'),(21,'night_owl','0004_auto_20200612_0751','2020-06-12 02:21:42.298068'),(22,'night_owl','0005_auto_20200612_0755','2020-06-12 02:25:45.382246');
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
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `night_owl_nc1orderdetails`
--

DROP TABLE IF EXISTS `night_owl_nc1orderdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `night_owl_nc1orderdetails` (
  `id` int NOT NULL AUTO_INCREMENT,
  `quantity` int unsigned NOT NULL,
  `total_price` int unsigned NOT NULL,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `night_owl_nc1orderde_order_id_92a5c57a_fk_night_owl` (`order_id`),
  KEY `night_owl_nc1orderde_product_id_0b76a7fc_fk_night_owl` (`product_id`),
  CONSTRAINT `night_owl_nc1orderde_order_id_92a5c57a_fk_night_owl` FOREIGN KEY (`order_id`) REFERENCES `night_owl_paidordersnc1` (`id`),
  CONSTRAINT `night_owl_nc1orderde_product_id_0b76a7fc_fk_night_owl` FOREIGN KEY (`product_id`) REFERENCES `night_owl_nc1products` (`id`),
  CONSTRAINT `night_owl_nc1orderdetails_chk_1` CHECK ((`quantity` >= 0)),
  CONSTRAINT `night_owl_nc1orderdetails_total_price_bbc937b9_check` CHECK ((`total_price` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `night_owl_nc1orderdetails`
--

LOCK TABLES `night_owl_nc1orderdetails` WRITE;
/*!40000 ALTER TABLE `night_owl_nc1orderdetails` DISABLE KEYS */;
INSERT INTO `night_owl_nc1orderdetails` VALUES (1,1,10,1,24),(2,2,30,1,27),(3,1,10,2,26),(4,1,20,2,34),(5,2,20,3,25),(6,1,25,3,37),(7,2,20,4,31),(8,2,30,5,28),(9,1,20,5,39),(10,1,10,6,25),(11,1,10,6,24),(12,1,20,6,32),(13,2,60,7,36),(14,1,10,8,26),(15,1,20,8,34),(16,1,10,9,25),(17,2,40,9,34),(18,2,20,10,24),(19,2,40,10,34),(20,2,20,11,26),(21,1,30,11,36),(22,1,20,11,33);
/*!40000 ALTER TABLE `night_owl_nc1orderdetails` ENABLE KEYS */;
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
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `veg_default` BEFORE INSERT ON `night_owl_nc1products` FOR EACH ROW BEGIN
IF NEW.veg IS NULL THEN SET NEW.veg = true; END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `night_owl_nc2orderdetails`
--

DROP TABLE IF EXISTS `night_owl_nc2orderdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `night_owl_nc2orderdetails` (
  `id` int NOT NULL AUTO_INCREMENT,
  `quantity` int unsigned NOT NULL,
  `total_price` int unsigned NOT NULL,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `night_owl_nc2orderde_order_id_9e00589d_fk_night_owl` (`order_id`),
  KEY `night_owl_nc2orderde_product_id_6480c049_fk_night_owl` (`product_id`),
  CONSTRAINT `night_owl_nc2orderde_order_id_9e00589d_fk_night_owl` FOREIGN KEY (`order_id`) REFERENCES `night_owl_paidordersnc2` (`id`),
  CONSTRAINT `night_owl_nc2orderde_product_id_6480c049_fk_night_owl` FOREIGN KEY (`product_id`) REFERENCES `night_owl_nc2products` (`id`),
  CONSTRAINT `night_owl_nc2orderdetails_chk_1` CHECK ((`quantity` >= 0)),
  CONSTRAINT `night_owl_nc2orderdetails_total_price_cbb11c5e_check` CHECK ((`total_price` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `night_owl_nc2orderdetails`
--

LOCK TABLES `night_owl_nc2orderdetails` WRITE;
/*!40000 ALTER TABLE `night_owl_nc2orderdetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `night_owl_nc2orderdetails` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `night_owl_nc2products`
--

LOCK TABLES `night_owl_nc2products` WRITE;
/*!40000 ALTER TABLE `night_owl_nc2products` DISABLE KEYS */;
/*!40000 ALTER TABLE `night_owl_nc2products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `night_owl_nc3orderdetails`
--

DROP TABLE IF EXISTS `night_owl_nc3orderdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `night_owl_nc3orderdetails` (
  `id` int NOT NULL AUTO_INCREMENT,
  `quantity` int unsigned NOT NULL,
  `total_price` int unsigned NOT NULL,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `night_owl_nc3orderde_order_id_7ee227aa_fk_night_owl` (`order_id`),
  KEY `night_owl_nc3orderde_product_id_635bfbe1_fk_night_owl` (`product_id`),
  CONSTRAINT `night_owl_nc3orderde_order_id_7ee227aa_fk_night_owl` FOREIGN KEY (`order_id`) REFERENCES `night_owl_paidordersnc3` (`id`),
  CONSTRAINT `night_owl_nc3orderde_product_id_635bfbe1_fk_night_owl` FOREIGN KEY (`product_id`) REFERENCES `night_owl_nc3products` (`id`),
  CONSTRAINT `night_owl_nc3orderdetails_chk_1` CHECK ((`quantity` >= 0)),
  CONSTRAINT `night_owl_nc3orderdetails_total_price_a6476fbe_check` CHECK ((`total_price` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `night_owl_nc3orderdetails`
--

LOCK TABLES `night_owl_nc3orderdetails` WRITE;
/*!40000 ALTER TABLE `night_owl_nc3orderdetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `night_owl_nc3orderdetails` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `night_owl_nc3products`
--

LOCK TABLES `night_owl_nc3products` WRITE;
/*!40000 ALTER TABLE `night_owl_nc3products` DISABLE KEYS */;
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
  `order_comments` longtext,
  `filters` varchar(10) NOT NULL,
  `user_id` int NOT NULL,
  `order_details` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `night_owl_paidordersnc1_user_id_2a11b68a_fk_auth_user_id` (`user_id`),
  CONSTRAINT `night_owl_paidordersnc1_user_id_2a11b68a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `night_owl_paidordersnc1`
--

LOCK TABLES `night_owl_paidordersnc1` WRITE;
/*!40000 ALTER TABLE `night_owl_paidordersnc1` DISABLE KEYS */;
INSERT INTO `night_owl_paidordersnc1` VALUES (1,1234567890,1234567890,'2','ok','a',2,''),(2,1111111111,1111111111,'1','qq','a',1,'Coffee - 1 - 10\nSet Dosa - 1 - 20\n'),(3,1234567890,1234567890,'GH-3','a','a',1,'Black Tea - 2 - 10\nMasala Dosa - 1 - 25\n'),(4,1234567890,1234567890,'GH-4','a','c',1,'Item Name - Quantity - Price Per Item\r\nLime Juice - 2 - 10'),(5,7588453427,7588453427,'8','Extra tomato','a',2,'Item Name - Quantity - Price Per Item\r\n\r\nBadam Milk Hot  -  2  - Rs.  15\r\nVeg Sandwich  -  1  - Rs.  20'),(6,7030424864,7030424864,'1','','a',1,'Item Name - Quantity - Price Per Item\n\nBlack Tea  -  1  - Rs.  10\nTea with milk  -  1  - Rs.  10\nMineral Water(1 Litre)  -  1  - Rs.  20\n'),(7,7875239632,7875239632,'3','a','a',1,'Item Name - Quantity - Price Per Item\n\nTomato Uthappa  -  2  - Rs.  30\n'),(8,9921837776,9921837776,'PG-Block','Strong Coffee','a',1,'Item Name - Quantity - Price Per Item\n\nCoffee  -  1  - Rs.  10\nSet Dosa  -  1  - Rs.  20\n'),(9,7030424864,7030424864,'MT-3','Strong tea','b',2,'Item Name - Quantity - Price Per Item\r\n\r\nBlack Tea  -  1  - Rs.  10\r\nSet Dosa  -  2  - Rs.  20'),(10,7030424864,7030424864,'GH-5','None','b',2,'Item Name - Quantity - Price Per Item\r\n\r\nTea with milk  -  2  - Rs.  10\r\nSet Dosa  -  2  - Rs.  20'),(11,7030424864,7030424864,'MT-1','Strong coffee','b',3,'Item Name - Quantity - Price Per Item\r\n\r\nCoffee  -  2  - Rs.  10\r\nTomato Uthappa  -  1  - Rs.  30\r\nDosa Plain  -  1  - Rs.  20');
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
  `order_comments` longtext,
  `filters` varchar(10) NOT NULL,
  `user_id` int NOT NULL,
  `order_details` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `night_owl_paidordersnc2_user_id_861d17a7_fk_auth_user_id` (`user_id`),
  CONSTRAINT `night_owl_paidordersnc2_user_id_861d17a7_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `night_owl_paidordersnc2`
--

LOCK TABLES `night_owl_paidordersnc2` WRITE;
/*!40000 ALTER TABLE `night_owl_paidordersnc2` DISABLE KEYS */;
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
  `order_comments` longtext,
  `filters` varchar(10) NOT NULL,
  `user_id` int NOT NULL,
  `order_details` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `night_owl_paidordersnc3_user_id_82d599ae_fk_auth_user_id` (`user_id`),
  CONSTRAINT `night_owl_paidordersnc3_user_id_82d599ae_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `night_owl_paidordersnc3`
--

LOCK TABLES `night_owl_paidordersnc3` WRITE;
/*!40000 ALTER TABLE `night_owl_paidordersnc3` DISABLE KEYS */;
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

-- Dump completed on 2020-06-15 11:43:50
