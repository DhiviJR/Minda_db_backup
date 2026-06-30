-- MySQL dump 10.13  Distrib 8.0.46, for Linux (x86_64)
--
-- Host: localhost    Database: dpr_db
-- ------------------------------------------------------
-- Server version	8.0.46-0ubuntu0.24.04.3

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
-- Table structure for table `accounts_customuser`
--

DROP TABLE IF EXISTS `accounts_customuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_customuser` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `user_type` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_customuser`
--

LOCK TABLES `accounts_customuser` WRITE;
/*!40000 ALTER TABLE `accounts_customuser` DISABLE KEYS */;
INSERT INTO `accounts_customuser` VALUES (1,'pbkdf2_sha256$1200000$5DjuoJU5uSejhbK1OyLFZ2$HGNmFKgW0xwvaCkQuVhyXd2NdBLOc38UBKlRSflMJWc=','2026-06-30 07:04:36.373998',1,'admin','','','admin@gmail.com',1,1,'2026-06-05 10:28:26.827421','user');
/*!40000 ALTER TABLE `accounts_customuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_customuser_groups`
--

DROP TABLE IF EXISTS `accounts_customuser_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_customuser_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customuser_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accounts_customuser_groups_customuser_id_group_id_c074bdcb_uniq` (`customuser_id`,`group_id`),
  KEY `accounts_customuser_groups_group_id_86ba5f9e_fk_auth_group_id` (`group_id`),
  CONSTRAINT `accounts_customuser__customuser_id_bc55088e_fk_accounts_` FOREIGN KEY (`customuser_id`) REFERENCES `accounts_customuser` (`id`),
  CONSTRAINT `accounts_customuser_groups_group_id_86ba5f9e_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_customuser_groups`
--

LOCK TABLES `accounts_customuser_groups` WRITE;
/*!40000 ALTER TABLE `accounts_customuser_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_customuser_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_customuser_user_permissions`
--

DROP TABLE IF EXISTS `accounts_customuser_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_customuser_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customuser_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accounts_customuser_user_customuser_id_permission_9632a709_uniq` (`customuser_id`,`permission_id`),
  KEY `accounts_customuser__permission_id_aea3d0e5_fk_auth_perm` (`permission_id`),
  CONSTRAINT `accounts_customuser__customuser_id_0deaefae_fk_accounts_` FOREIGN KEY (`customuser_id`) REFERENCES `accounts_customuser` (`id`),
  CONSTRAINT `accounts_customuser__permission_id_aea3d0e5_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_customuser_user_permissions`
--

LOCK TABLES `accounts_customuser_user_permissions` WRITE;
/*!40000 ALTER TABLE `accounts_customuser_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_customuser_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

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
  `id` bigint NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',3,'add_permission'),(6,'Can change permission',3,'change_permission'),(7,'Can delete permission',3,'delete_permission'),(8,'Can view permission',3,'view_permission'),(9,'Can add group',2,'add_group'),(10,'Can change group',2,'change_group'),(11,'Can delete group',2,'delete_group'),(12,'Can view group',2,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add user',6,'add_customuser'),(22,'Can change user',6,'change_customuser'),(23,'Can delete user',6,'delete_customuser'),(24,'Can view user',6,'view_customuser'),(25,'Can add customer',7,'add_customer'),(26,'Can change customer',7,'change_customer'),(27,'Can delete customer',7,'delete_customer'),(28,'Can view customer',7,'view_customer'),(29,'Can add supplier',8,'add_supplier'),(30,'Can change supplier',8,'change_supplier'),(31,'Can delete supplier',8,'delete_supplier'),(32,'Can view supplier',8,'view_supplier'),(33,'Can add dpr',9,'add_dpr'),(34,'Can change dpr',9,'change_dpr'),(35,'Can delete dpr',9,'delete_dpr'),(36,'Can view dpr',9,'view_dpr'),(37,'Can add customer product',10,'add_customerproduct'),(38,'Can change customer product',10,'change_customerproduct'),(39,'Can delete customer product',10,'delete_customerproduct'),(40,'Can view customer product',10,'view_customerproduct'),(41,'Can add supplier product',11,'add_supplierproduct'),(42,'Can change supplier product',11,'change_supplierproduct'),(43,'Can delete supplier product',11,'delete_supplierproduct'),(44,'Can view supplier product',11,'view_supplierproduct'),(45,'Can add ethernet device',13,'add_ethernetdevice'),(46,'Can change ethernet device',13,'change_ethernetdevice'),(47,'Can delete ethernet device',13,'delete_ethernetdevice'),(48,'Can view ethernet device',13,'view_ethernetdevice'),(49,'Can add ethernet reading',14,'add_ethernetreading'),(50,'Can change ethernet reading',14,'change_ethernetreading'),(51,'Can delete ethernet reading',14,'delete_ethernetreading'),(52,'Can view ethernet reading',14,'view_ethernetreading'),(53,'Can add discovered ethernet source',12,'add_discoveredethernetsource'),(54,'Can change discovered ethernet source',12,'change_discoveredethernetsource'),(55,'Can delete discovered ethernet source',12,'delete_discoveredethernetsource'),(56,'Can view discovered ethernet source',12,'view_discoveredethernetsource');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers_customer`
--

DROP TABLE IF EXISTS `customers_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers_customer` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(255) NOT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `address` longtext,
  `created_at` datetime(6) NOT NULL,
  `region` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers_customer`
--

LOCK TABLES `customers_customer` WRITE;
/*!40000 ALTER TABLE `customers_customer` DISABLE KEYS */;
INSERT INTO `customers_customer` VALUES (1,'UNO MINDA','9655778871','KKKKKKKKKKK','2026-06-05 11:16:12.096660','Hosur'),(2,'NEWTECH','9751197254','KJKBBKJN\nVBJK997\\BVGV\nGCTBB \nVCHGVNB','2026-06-15 10:32:53.100661','Chennai'),(3,'rane','9789481243',NULL,'2026-06-16 05:03:59.552855','Chennai'),(4,'SANSERA ENGINEERING LTD - PLANT 2','9164211833','261/C, Bommasandra Indl Area \nBangalore 560099 \nKarnataka, India-560099 \nGSTIN : 29AAECS2440M1Z3 \nKind Attension : Mr. Manjesha B M','2026-06-16 07:06:44.479969','Hosur'),(5,'SANSERA ENGINEERING LTD - PLANT 2',NULL,NULL,'2026-06-16 07:23:01.709572','Hosur'),(6,'VIJAYA ENGINEERING WORKS',NULL,NULL,'2026-06-16 08:55:30.534577','Hosur'),(7,'MM Forgings Ltd',NULL,NULL,'2026-06-16 10:33:47.733351','Hosur'),(8,'VIJAYA ENGINEERING WORKS',NULL,NULL,'2026-06-16 10:43:04.742910','Hosur'),(9,'JK MAINI PRECISION TECHNOLOGY LIMITED',NULL,NULL,'2026-06-16 11:10:52.889466','Hosur'),(10,'SUNDRAM FASTENERS LIMITED - HOSUR',NULL,NULL,'2026-06-17 09:05:11.487033','Hosur'),(11,'SRIMUKHA PRECISION TECHNOLOGIES Pvt. Ltd - U3',NULL,NULL,'2026-06-17 09:34:10.111243','Chennai'),(12,'DAESEUNG Auto Parts India Private limited',NULL,NULL,'2026-06-17 10:36:24.639009','Chennai'),(13,'Bhavani Industries Unit III',NULL,NULL,'2026-06-24 10:08:22.728139','Hosur'),(14,'SUNKID ELECTRO SYSTEMS','7540036345','No,20, SIDCO, Industrial Estate, Kakkalur, Tiruvallur, Chennai,\nTamil Nadu, 602003','2026-06-26 10:46:00.301384','Chennai');
/*!40000 ALTER TABLE `customers_customer` ENABLE KEYS */;
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
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_accounts_customuser_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_accounts_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_customuser` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (6,'accounts','customuser'),(1,'admin','logentry'),(2,'auth','group'),(3,'auth','permission'),(4,'contenttypes','contenttype'),(7,'customers','customer'),(9,'dpr','dpr'),(12,'instruments','discoveredethernetsource'),(13,'instruments','ethernetdevice'),(14,'instruments','ethernetreading'),(10,'products','customerproduct'),(11,'products','supplierproduct'),(5,'sessions','session'),(8,'suppliers','supplier');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2026-06-05 09:18:03.366538'),(2,'contenttypes','0002_remove_content_type_name','2026-06-05 09:18:03.498233'),(3,'auth','0001_initial','2026-06-05 09:18:03.825712'),(4,'auth','0002_alter_permission_name_max_length','2026-06-05 09:18:03.896707'),(5,'auth','0003_alter_user_email_max_length','2026-06-05 09:18:03.907922'),(6,'auth','0004_alter_user_username_opts','2026-06-05 09:18:03.939439'),(7,'auth','0005_alter_user_last_login_null','2026-06-05 09:18:03.953708'),(8,'auth','0006_require_contenttypes_0002','2026-06-05 09:18:03.957211'),(9,'auth','0007_alter_validators_add_error_messages','2026-06-05 09:18:03.965434'),(10,'auth','0008_alter_user_username_max_length','2026-06-05 09:18:03.972561'),(11,'auth','0009_alter_user_last_name_max_length','2026-06-05 09:18:03.980484'),(12,'auth','0010_alter_group_name_max_length','2026-06-05 09:18:04.015651'),(13,'auth','0011_update_proxy_permissions','2026-06-05 09:18:04.027946'),(14,'auth','0012_alter_user_first_name_max_length','2026-06-05 09:18:04.044412'),(15,'accounts','0001_initial','2026-06-05 09:18:04.572332'),(16,'admin','0001_initial','2026-06-05 09:18:04.755468'),(17,'admin','0002_logentry_remove_auto_add','2026-06-05 09:18:04.769282'),(18,'admin','0003_logentry_add_action_flag_choices','2026-06-05 09:18:04.779315'),(19,'customers','0001_initial','2026-06-05 09:18:04.812261'),(20,'customers','0002_customer_region','2026-06-05 09:18:04.872077'),(21,'dpr','0001_initial','2026-06-05 09:18:04.968468'),(22,'dpr','0002_dpr_serial_number','2026-06-05 09:18:05.046667'),(23,'dpr','0003_dpr_status','2026-06-05 09:18:05.112458'),(24,'dpr','0004_dpr_total_product','2026-06-05 09:18:05.199435'),(25,'dpr','0005_rename_and_add_qty_fields','2026-06-05 09:18:05.433221'),(26,'dpr','0006_remove_dpr_region','2026-06-05 09:18:05.501510'),(27,'dpr','0007_dpr_po_confirmation_date','2026-06-05 09:18:05.573337'),(28,'suppliers','0001_initial','2026-06-05 09:18:05.608509'),(29,'products','0001_initial','2026-06-05 09:18:05.884962'),(30,'products','0002_customerproduct_attachment','2026-06-05 09:18:05.946705'),(31,'products','0003_customerproduct_status','2026-06-05 09:18:05.999975'),(32,'products','0004_customerproduct_quantity_delivered_and_more','2026-06-05 09:18:06.082791'),(33,'products','0005_supplierproduct_quantity_received_and_more','2026-06-05 09:18:06.230776'),(34,'products','0006_supplierproduct_expected_date','2026-06-05 09:18:06.312485'),(35,'products','0007_customerproduct_invoice_dc_attachment_and_more','2026-06-05 09:18:06.436665'),(36,'products','0008_customerproduct_product_type','2026-06-05 09:18:06.531113'),(37,'sessions','0001_initial','2026-06-05 09:18:06.594527'),(38,'dpr','0008_dpr_enquiry_attachment','2026-06-09 04:53:21.835847'),(39,'instruments','0001_initial','2026-06-09 04:53:22.070214'),(40,'instruments','0002_ethernetdevice_device_code_udp','2026-06-09 04:53:22.134826'),(41,'instruments','0003_instrument_connection_fields','2026-06-09 04:53:22.503819'),(42,'instruments','0004_discoveredethernetsource','2026-06-09 04:53:22.583137'),(43,'products','0009_customerproduct_rate_per_unit','2026-06-09 04:53:22.732042'),(44,'products','0010_supplierproduct_rate_per_unit','2026-06-09 04:53:22.818992'),(45,'products','0011_supplierproduct_not_ok_fields','2026-06-09 04:53:22.888357'),(46,'products','0012_customerproduct_delivery_detail_type','2026-06-09 04:53:22.917209');
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
INSERT INTO `django_session` VALUES ('0hwxriucuozq34bveew1re1ff0fbowr2','.eJxVjMEOwiAQRP-FsyEUylI9evcbyC672KopSWlPxn-XJj3oZQ5v3sxbRdzWMW5VljixuqhOnX4ZYXrKvBf8wPledCrzukykd0UfbdW3wvK6Hu7fwYh1bOsA3kigAaxNwL2QtwYGDB17yabzjUCwlPPZURYYyDGaFhnYGeiz-nwB3Oc4NA:1wZM6S:YA8gYfy9ZrD7sLrKIPB5qeT3X7yWn5-4llxMrkf5k-Y','2026-06-30 05:12:48.152436'),('99hz5wr4znd9d9qpvdyzdphaqzlixy6c','.eJxVjMEOwiAQRP-FsyEUylI9evcbyC672KopSWlPxn-XJj3oZQ5v3sxbRdzWMW5VljixuqhOnX4ZYXrKvBf8wPledCrzukykd0UfbdW3wvK6Hu7fwYh1bOsA3kigAaxNwL2QtwYGDB17yabzjUCwlPPZURYYyDGaFhnYGeiz-nwB3Oc4NA:1wVRn8:fA1-r_VNycM-i9mY90ArsR1oYout_-WzJTLWzJ4Aayo','2026-06-19 10:28:42.860760'),('9ddonwi5967a5aawvwqfr0bvyzl64jqu','.eJxVjMEOwiAQRP-FsyEUylI9evcbyC672KopSWlPxn-XJj3oZQ5v3sxbRdzWMW5VljixuqhOnX4ZYXrKvBf8wPledCrzukykd0UfbdW3wvK6Hu7fwYh1bOsA3kigAaxNwL2QtwYGDB17yabzjUCwlPPZURYYyDGaFhnYGeiz-nwB3Oc4NA:1wdSqG:p1KgtgyXIzJDcXN8ubrUNWJGYMVcShl5VvfujMIlwLA','2026-07-11 13:13:04.709037'),('9ljndv4dq60sqie54i5w02q54f8hg72r','.eJxVjMEOwiAQRP-FsyEUylI9evcbyC672KopSWlPxn-XJj3oZQ5v3sxbRdzWMW5VljixuqhOnX4ZYXrKvBf8wPledCrzukykd0UfbdW3wvK6Hu7fwYh1bOsA3kigAaxNwL2QtwYGDB17yabzjUCwlPPZURYYyDGaFhnYGeiz-nwB3Oc4NA:1wVRpe:onbPO1ZbqhgiEEMT5c_1KVxBWR0rt5bNgW-FVqNLLE0','2026-06-19 10:31:18.798177'),('atc6r06kd5c5x4vn7vbxzfgpto6futh5','.eJxVjMEOwiAQRP-FsyEUylI9evcbyC672KopSWlPxn-XJj3oZQ5v3sxbRdzWMW5VljixuqhOnX4ZYXrKvBf8wPledCrzukykd0UfbdW3wvK6Hu7fwYh1bOsA3kigAaxNwL2QtwYGDB17yabzjUCwlPPZURYYyDGaFhnYGeiz-nwB3Oc4NA:1wXZS3:QXP_Cksatq4AIQ-Yh7f77Tge6eH4o2E10qprfCbzxMY','2026-06-25 07:03:43.785559'),('b4vhd4unc85ucovwvtu19ogtaew9xs7w','.eJxVjMEOwiAQRP-FsyEUylI9evcbyC672KopSWlPxn-XJj3oZQ5v3sxbRdzWMW5VljixuqhOnX4ZYXrKvBf8wPledCrzukykd0UfbdW3wvK6Hu7fwYh1bOsA3kigAaxNwL2QtwYGDB17yabzjUCwlPPZURYYyDGaFhnYGeiz-nwB3Oc4NA:1wbuVZ:HwXgIJHJWvA8GsQ56lmwXicY3QUe7he-DV82SXmfVus','2026-07-07 06:21:17.940297'),('h25dstfq2aiipnoy4xebycje6zw4hvb7','.eJxVjMEOwiAQRP-FsyEUylI9evcbyC672KopSWlPxn-XJj3oZQ5v3sxbRdzWMW5VljixuqhOnX4ZYXrKvBf8wPledCrzukykd0UfbdW3wvK6Hu7fwYh1bOsA3kigAaxNwL2QtwYGDB17yabzjUCwlPPZURYYyDGaFhnYGeiz-nwB3Oc4NA:1wZ4zE:MsBaHAQSGbbVEdnjv-eOtQR5Mg5iUm4dxGJ_BIy-ZqE','2026-06-29 10:56:12.397404'),('j3s0ojik079i6t37bderpbzj6umy8mfr','.eJxVjMEOwiAQRP-FsyEUylI9evcbyC672KopSWlPxn-XJj3oZQ5v3sxbRdzWMW5VljixuqhOnX4ZYXrKvBf8wPledCrzukykd0UfbdW3wvK6Hu7fwYh1bOsA3kigAaxNwL2QtwYGDB17yabzjUCwlPPZURYYyDGaFhnYGeiz-nwB3Oc4NA:1weSWK:h1LGuTcugNlxnjc3Axq53BIlZGUjQJaqAz1PKSdrkd4','2026-07-14 07:04:36.412667'),('jz9ppgkteje5tgm1k5mvx9hh5ks9xd3k','.eJxVjMEOwiAQRP-FsyEUylI9evcbyC672KopSWlPxn-XJj3oZQ5v3sxbRdzWMW5VljixuqhOnX4ZYXrKvBf8wPledCrzukykd0UfbdW3wvK6Hu7fwYh1bOsA3kigAaxNwL2QtwYGDB17yabzjUCwlPPZURYYyDGaFhnYGeiz-nwB3Oc4NA:1wZLh6:ABvC2PZbSmKg1igj4vM7gm_DQTbBCK_PI_jtorO38WA','2026-06-30 04:46:36.771629'),('l0nn0z7cgjettfigsa2y5querjnsqe13','.eJxVjMEOwiAQRP-FsyEUylI9evcbyC672KopSWlPxn-XJj3oZQ5v3sxbRdzWMW5VljixuqhOnX4ZYXrKvBf8wPledCrzukykd0UfbdW3wvK6Hu7fwYh1bOsA3kigAaxNwL2QtwYGDB17yabzjUCwlPPZURYYyDGaFhnYGeiz-nwB3Oc4NA:1wZLVA:fTutCks1GmfQG6ThN-VUuDfC5_zUsNo2Ef8zBFH2XN8','2026-06-30 04:34:16.252968'),('vf0jcrjhesmjxa067ndkzolqjtluuakk','.eJxVjMEOwiAQRP-FsyEUylI9evcbyC672KopSWlPxn-XJj3oZQ5v3sxbRdzWMW5VljixuqhOnX4ZYXrKvBf8wPledCrzukykd0UfbdW3wvK6Hu7fwYh1bOsA3kigAaxNwL2QtwYGDB17yabzjUCwlPPZURYYyDGaFhnYGeiz-nwB3Oc4NA:1wZRWb:9ZZfNsAmbrM7Kk43730Um9LaZFL42nVn7H3GH7Ji8oU','2026-06-30 11:00:09.606775'),('z1se3op0l3v2x5bm61ajn19p5gh6xwbn','.eJxVjMEOwiAQRP-FsyEUylI9evcbyC672KopSWlPxn-XJj3oZQ5v3sxbRdzWMW5VljixuqhOnX4ZYXrKvBf8wPledCrzukykd0UfbdW3wvK6Hu7fwYh1bOsA3kigAaxNwL2QtwYGDB17yabzjUCwlPPZURYYyDGaFhnYGeiz-nwB3Oc4NA:1wYI4r:DkVl1ScWR9jXIMwgKkRc07q9WiB2MsmfDWHhtOEvnZ4','2026-06-27 06:42:45.226602');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dpr_dpr`
--

DROP TABLE IF EXISTS `dpr_dpr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dpr_dpr` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quotation_number` varchar(100) DEFAULT NULL,
  `quotation_value` decimal(12,2) DEFAULT NULL,
  `quotation_attachment` varchar(100) DEFAULT NULL,
  `confirmation_type` varchar(100) DEFAULT NULL,
  `po_number` varchar(100) DEFAULT NULL,
  `po_value` decimal(12,2) DEFAULT NULL,
  `po_date` date DEFAULT NULL,
  `po_validity` date DEFAULT NULL,
  `po_attachment` varchar(100) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `customer_id` bigint NOT NULL,
  `serial_number` varchar(50) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `cust_qty_ordered` int NOT NULL,
  `supplier_qty_ordered` int NOT NULL,
  `customer_qty_delivered` int NOT NULL,
  `supplier_qty_received` int NOT NULL,
  `po_confirmation_date` date DEFAULT NULL,
  `enquiry_attachment` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `serial_number` (`serial_number`),
  KEY `dpr_dpr_customer_id_4a2cd001_fk_customers_customer_id` (`customer_id`),
  CONSTRAINT `dpr_dpr_customer_id_4a2cd001_fk_customers_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customers_customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dpr_dpr`
--

LOCK TABLES `dpr_dpr` WRITE;
/*!40000 ALTER TABLE `dpr_dpr` DISABLE KEYS */;
INSERT INTO `dpr_dpr` VALUES (1,'MES Q001',20000.00,'quotation_files/metrology_engineering_solutions_gstr_1.pdf','Mail Confirmation',NULL,40000.00,'2026-06-03','2026-06-17','po_files/metrology_engineering_solutions_gstr_1.pdf','2026-06-05 11:20:30.919296',1,'DPR-2026-0001',NULL,2,3,2,2,NULL,NULL),(2,'MESQ002',10000.00,'quotation_files/metrology_engineering_solutions_gstr_1_7yoxq5M.pdf','Mail Confirmation',NULL,20000.00,'2026-06-05','2026-06-12','po_files/metrology_engineering_solutions_gstr_1_LW9MsXs.pdf','2026-06-05 11:42:16.317304',1,'DPR-2026-0002',NULL,1,0,2,0,NULL,NULL),(3,'MESQ005',10000.00,'quotation_files/Approval_eReceipt1__Jun_14_112321.pdf','Customer PO','NEW007',30000.00,'2026-06-15','2026-07-03','po_files/Approval_eReceipt1__Jun_14_112321.pdf','2026-06-15 10:37:15.332407',2,'DPR-2026-0003',NULL,1,3,0,0,NULL,'enquiry_files/Approval_eReceipt1__Jun_14_112321.pdf'),(4,'mes_q201',50000.00,'quotation_files/MES_Q00915_25-26-DPR_3685.pdf','Customer PO','234568',10000.00,'2026-06-12','2026-08-12','po_files/280048490-METROLOGY_HOSUR-DPR_3685.pdf','2026-06-16 04:53:19.833889',2,'DPR-2026-0004',NULL,1,0,0,0,NULL,'enquiry_files/DPR_3685_RFQ_.docx'),(5,'mes_q201',20000.00,'quotation_files/MES_Q00915_25-26-DPR_3685_2learpx.pdf','Customer PO','9789481243',20000.00,'2026-06-16','2026-10-25','po_files/280048490-METROLOGY_HOSUR-DPR_3685_7UyqkxE.pdf','2026-06-16 05:19:11.006701',3,'DPR-2026-0005',NULL,1,1,0,1,NULL,'enquiry_files/DPR_3685_RFQ__47LsUhh.docx'),(6,'MES_Q00643',7030.00,'quotation_files/MES_Q00643_21-22_DPR_3689.pdf','Customer PO','4500032836',6327.00,'2026-06-05','2026-06-30','po_files/4500032836.pdf','2026-06-16 10:38:33.644972',7,'DPR-2026-0006',NULL,1,0,1,0,NULL,'enquiry_files/DRG_Ø37.03.pdf'),(7,'MES_Q00618',117000.00,'quotation_files/MES_Q00618_25-26-DPR_3681_.pdf','Customer PO','VEW102/26-27',99400.00,'2026-06-06','2026-07-06','po_files/Vijaya_Engg_Works_PO_-_06.06.2026-DPR_3681.pdf','2026-06-16 10:51:34.622768',8,'DPR-2026-0007',NULL,2,0,0,0,NULL,'enquiry_files/2.pdf'),(8,'MES_Q0056R1R1_24-25',103000.00,'quotation_files/MES_Q0056R1R1_24-25.pdf','Customer PO','1000008357',437750.00,'2026-04-04','2026-04-07','po_files/PO_-1000008357_-_Metrology_Engg.pdf','2026-06-16 11:16:21.052714',9,'DPR-2026-0008',NULL,1,1,5,1,NULL,''),(9,'MES_Q00862/25-26',42925.00,'quotation_files/MES_Q00862_25-26.pdf','Customer PO','280047869',50500.00,'2026-03-28','2026-04-28','po_files/280047869-METROLOGY.pdf','2026-06-17 09:23:39.028128',10,'DPR-2026-0009',NULL,1,0,0,0,NULL,'enquiry_files/PR-MAIL.pdf'),(10,'MES_Q00864/25-26',1450.00,'quotation_files/MES_Q00864_25-26.pdf','Customer PO','PO3250634 / 2025 - 26',16250.00,'2026-03-26','2026-04-26','po_files/MES_PO002_26-27.pdf','2026-06-17 09:59:58.536000',11,'DPR-2026-0010',NULL,2,25,25,25,NULL,'enquiry_files/RFQ.pdf'),(11,'MES_Q00890/25-26',9710.00,'quotation_files/MES_Q00864_25-26_Ssieg5a.pdf','Customer PO','DSI/GP/203/03/26',45150.00,'2026-03-28','2026-04-28','po_files/MES_PO002_26-27_5NTVFbE.pdf','2026-06-17 11:05:42.928084',12,'DPR-2026-0011',NULL,3,5,0,0,NULL,'enquiry_files/RFQ_qWFULRz.pdf'),(12,'MES_Q171',32500.00,'quotation_files/Bhavani_Industries_Unit_III_Quotation_MES_Q171_3706_.pdf','Customer PO','JAY0000834',29250.00,'2026-06-19','2026-07-24','po_files/POJAY0000834_MES.pdf','2026-06-24 11:07:05.555437',13,'DPR-2026-0012',NULL,1,0,0,0,NULL,'enquiry_files/DPR_3706_RFQ.pdf'),(13,'MES_Q58',2400.00,'quotation_files/MES_Q58_26-27_3721.pdf','Customer PO','SRPO0009/26-27',2400.00,'2026-06-25','2026-07-26','po_files/SRPO0009_-_METROLOGY_ENGINEERING_SOLUTIONS_25-06-2026_3721_.pdf','2026-06-26 11:01:35.213731',14,'DPR-2026-0013',NULL,1,0,0,0,NULL,'enquiry_files/DPR_3721_RFQ.pdf');
/*!40000 ALTER TABLE `dpr_dpr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instruments_discoveredethernetsource`
--

DROP TABLE IF EXISTS `instruments_discoveredethernetsource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `instruments_discoveredethernetsource` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `host` varchar(100) NOT NULL,
  `port` int unsigned NOT NULL,
  `last_message` varchar(255) DEFAULT NULL,
  `last_seen_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `instruments_discoveredethernetsource_host_port_3dfa5a0b_uniq` (`host`,`port`),
  CONSTRAINT `instruments_discoveredethernetsource_chk_1` CHECK ((`port` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instruments_discoveredethernetsource`
--

LOCK TABLES `instruments_discoveredethernetsource` WRITE;
/*!40000 ALTER TABLE `instruments_discoveredethernetsource` DISABLE KEYS */;
/*!40000 ALTER TABLE `instruments_discoveredethernetsource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instruments_ethernetdevice`
--

DROP TABLE IF EXISTS `instruments_ethernetdevice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `instruments_ethernetdevice` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `host` varchar(100) NOT NULL,
  `port` int unsigned NOT NULL,
  `protocol` varchar(10) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `last_value` decimal(14,4) DEFAULT NULL,
  `last_raw_message` varchar(255) DEFAULT NULL,
  `last_seen_at` datetime(6) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `device_code` varchar(50) DEFAULT NULL,
  `connection_type` varchar(20) NOT NULL,
  `parameter_name` varchar(100) DEFAULT NULL,
  `serial_port` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `device_code` (`device_code`),
  CONSTRAINT `instruments_ethernetdevice_chk_1` CHECK ((`port` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instruments_ethernetdevice`
--

LOCK TABLES `instruments_ethernetdevice` WRITE;
/*!40000 ALTER TABLE `instruments_ethernetdevice` DISABLE KEYS */;
/*!40000 ALTER TABLE `instruments_ethernetdevice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instruments_ethernetreading`
--

DROP TABLE IF EXISTS `instruments_ethernetreading`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `instruments_ethernetreading` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `value` decimal(14,4) NOT NULL,
  `raw_message` varchar(255) NOT NULL,
  `received_at` datetime(6) NOT NULL,
  `device_id` bigint NOT NULL,
  `source_host` varchar(100) DEFAULT NULL,
  `source_port` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `instrument_device_9ddd12_idx` (`device_id`,`received_at` DESC),
  CONSTRAINT `instruments_ethernet_device_id_81d6db52_fk_instrumen` FOREIGN KEY (`device_id`) REFERENCES `instruments_ethernetdevice` (`id`),
  CONSTRAINT `instruments_ethernetreading_chk_1` CHECK ((`source_port` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instruments_ethernetreading`
--

LOCK TABLES `instruments_ethernetreading` WRITE;
/*!40000 ALTER TABLE `instruments_ethernetreading` DISABLE KEYS */;
/*!40000 ALTER TABLE `instruments_ethernetreading` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_customerproduct`
--

DROP TABLE IF EXISTS `products_customerproduct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_customerproduct` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `product_name` varchar(255) NOT NULL,
  `quantity_ordered` int NOT NULL,
  `value` decimal(12,2) NOT NULL,
  `remarks` longtext,
  `dpr_id` bigint NOT NULL,
  `attachment` varchar(100) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `quantity_delivered` int NOT NULL,
  `invoice_dc_attachment` varchar(100) DEFAULT NULL,
  `invoice_dc_number` varchar(150) DEFAULT NULL,
  `product_type` varchar(50) DEFAULT NULL,
  `rate_per_unit` decimal(12,2) NOT NULL,
  `delivery_detail_type` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_customerproduct_dpr_id_86547a7c_fk_dpr_dpr_id` (`dpr_id`),
  CONSTRAINT `products_customerproduct_dpr_id_86547a7c_fk_dpr_dpr_id` FOREIGN KEY (`dpr_id`) REFERENCES `dpr_dpr` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_customerproduct`
--

LOCK TABLES `products_customerproduct` WRITE;
/*!40000 ALTER TABLE `products_customerproduct` DISABLE KEYS */;
INSERT INTO `products_customerproduct` VALUES (1,'AIR PLUG DIA 15',2,20000.00,'',1,'','delivered',2,'invoice_dc_attachments/MES_PO009_26-27_Cj1YjTl.pdf','452125','APG steel',10000.00,'invoice'),(2,'AIR RING DIA 50',1,20000.00,'',1,'',NULL,0,'',NULL,'ARG steel',20000.00,NULL),(3,'AIR PLUG DIA 15',2,20000.00,'',2,'','delivered',2,'invoice_dc_attachments/MES_PO009_26-27.pdf','45552','APG steel',10000.00,'invoice'),(4,'AIR PLUG DIA 15',3,30000.00,'',3,'',NULL,0,'',NULL,'APG steel',10000.00,NULL),(6,'unit',1,10000.00,'ok',4,'product_attachments/280048490-METROLOGY_HOSUR-DPR_3685.pdf',NULL,0,'',NULL,'Multi-Gauge',10000.00,NULL),(7,'unit',1,20000.00,'4ch air gauge',5,'product_attachments/280048490-METROLOGY_HOSUR-DPR_3685_JqV9UkO.pdf',NULL,0,'',NULL,'unit SPC lvdt',20000.00,NULL),(8,'ARG',1,6327.00,'',6,'','delivered',1,'invoice_dc_attachments/MES-G0863_25-26.pdf','MES-G0863_25-26','ARG steel',6327.00,'invoice'),(9,'Air Gauge Fixture',1,49700.00,'Product Name : Special 3 Level Caliper Fixture With Double Master Size: 1. Ø40 (-0.03) mm at 2 Jet 2. Ø30 (+0.010/+0.002) mm at 2 Jet 3. Ø25 (0.007/-0.016) mm at 2 Jet Remarks : 8 Kg',7,'',NULL,0,'',NULL,'Spares',49700.00,NULL),(10,'Air Gauge Fixture',1,49700.00,'Product Name : Special 3 Level Caliper Fixture With Double Master Size: 1. Ø45 (-0.03) mm at 2 Jet 2. Ø35 (+0.010/+0.002) mm at 2 Jet 3. Ø30 (0.007/-0.016) mm at 2 Jet Remarks : 9 Kg & 11 Kg',7,'',NULL,0,'',NULL,'Spares',49700.00,NULL),(15,'AIR ELECTRONIC UNIT',5,437750.00,'Product Name : Air Electronic Unit 3 Channel 4Display Unit Principle : Electronic Piezo Additional Features : - LEAST COUNT : 0.001/0.0005/0.0001 Display : Tri Color (RYG) STANDARD FEATURES : RS232 / Programs / Calibration Error / O-R Option Module : Module 1A ACCESSORIES : Air Dryer / Air Auto Drain Filter / Unit Cover / Adaptor Handle - Per Channel',8,'','delivered',5,'invoice_dc_attachments/MES_PO003_26-27.pdf','521556','unit Std Air',87550.00,'invoice'),(16,'Digital Read Out Unit',1,50500.00,'Product Name : Digital Read Out Unit 2 Channel 2 Display Display : Tri Color (RYG) Additional Features : PKB Box For Mastering',9,'',NULL,0,'',NULL,'unit Std Air',50500.00,NULL),(17,'GPA 1A',20,12000.00,'',10,'','delivered',20,'invoice_dc_attachments/MES-H0149_26-27.pdf','MES-H0149_26-27','Spares',600.00,'invoice'),(18,'DIAL HOLDING CUP',5,4250.00,'',10,'','delivered',5,'invoice_dc_attachments/MES-H0149_26-27_b7CUML4.pdf','MES-H0149_26-27','Spares',850.00,'invoice'),(19,'SPL PIN GAUGE',5,15670.00,'',11,'',NULL,0,'',NULL,'SPPG',3134.00,NULL),(20,'SPL PIN GAUGE',5,14740.00,'',11,'',NULL,0,'',NULL,'SPPG',2948.00,NULL),(21,'SPL PIN GAUGE ',5,14740.00,'',11,'',NULL,0,'',NULL,'SPPG',2948.00,NULL),(22,'Combined APG & ARG',1,29250.00,'',12,'product_attachments/Turbine_Housing_Bush_41554_011_1101_-_ARG__APG_Requirement-FINAL.pdf',NULL,0,'',NULL,'SARG',29250.00,NULL),(25,'AIR ELECTRONIC UNIT 1CH 1D',1,2400.00,'',13,'',NULL,0,'',NULL,'Service',2400.00,NULL);
/*!40000 ALTER TABLE `products_customerproduct` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_supplierproduct`
--

DROP TABLE IF EXISTS `products_supplierproduct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_supplierproduct` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `po_value` decimal(12,2) NOT NULL,
  `po_date` date DEFAULT NULL,
  `po_validity` date DEFAULT NULL,
  `quantity` int NOT NULL,
  `po_number` varchar(100) NOT NULL,
  `po_attachment` varchar(100) DEFAULT NULL,
  `customer_product_id` bigint NOT NULL,
  `supplier_id` bigint NOT NULL,
  `quantity_received` int NOT NULL,
  `status` varchar(20) DEFAULT NULL,
  `expected_date` date DEFAULT NULL,
  `rate_per_unit` decimal(12,2) NOT NULL,
  `quantity_not_ok` int NOT NULL,
  `not_ok_reason` longtext,
  PRIMARY KEY (`id`),
  KEY `products_supplierpro_customer_product_id_2f5b71b1_fk_products_` (`customer_product_id`),
  KEY `products_supplierpro_supplier_id_f750ddb7_fk_suppliers` (`supplier_id`),
  CONSTRAINT `products_supplierpro_customer_product_id_2f5b71b1_fk_products_` FOREIGN KEY (`customer_product_id`) REFERENCES `products_customerproduct` (`id`),
  CONSTRAINT `products_supplierpro_supplier_id_f750ddb7_fk_suppliers` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers_supplier` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_supplierproduct`
--

LOCK TABLES `products_supplierproduct` WRITE;
/*!40000 ALTER TABLE `products_supplierproduct` DISABLE KEYS */;
INSERT INTO `products_supplierproduct` VALUES (2,7000.00,'2026-06-05','2026-06-15',1,'MESAVVPO001','supplier_po/metrology_engineering_solutions_gstr_1.pdf',1,1,1,'delivered','2026-06-12',7000.00,0,NULL),(3,7000.00,'2026-06-05','2026-06-15',1,'MESAVVPO001','supplier_po/metrology_engineering_solutions_gstr_1_F7XhG4t.pdf',1,2,1,'partially_delivered','2026-06-25',7000.00,1,'SYMETTRY'),(4,15000.00,'2026-06-05','2026-06-15',1,'MESAVVPO001','supplier_po/metrology_engineering_solutions_gstr_1_6yc5R7X.pdf',2,1,0,NULL,NULL,15000.00,0,NULL),(5,14000.00,'2026-06-15','2026-06-29',2,'AVV001','supplier_po/Approval_eReceipt1__Jun_14_112321.pdf',4,1,0,NULL,NULL,7000.00,0,NULL),(6,7000.00,'2026-06-15','2026-06-29',1,'JSQ001','supplier_po/Approval_eReceipt1__Jun_14_112321_52jIdx1.pdf',4,2,0,NULL,NULL,7000.00,0,NULL),(9,20000.00,'2026-06-16','2026-07-16',1,'12435','supplier_po/280048490-METROLOGY_HOSUR-DPR_3685.pdf',7,1,0,NULL,NULL,20000.00,0,NULL),(11,51000.00,'2026-04-04','2026-04-05',1,'MES_PO0072','supplier_po/MES_PO0072_26-27_42wdFwv.pdf',15,1,1,'delivered',NULL,51000.00,0,NULL),(14,4000.00,'2026-04-02','2026-04-10',20,'MES_PO002/26-27','supplier_po/MES_PO002_26-27.pdf',17,3,20,'delivered',NULL,200.00,0,NULL),(15,1500.00,'2026-04-02','2026-04-10',5,'MES_PO002','supplier_po/MES_PO002_26-27_N4IASu9.pdf',18,4,5,'delivered',NULL,300.00,0,NULL),(16,10820.00,'2026-04-09','2026-04-23',5,'MES_PO0032_26-27','supplier_po/MES_PO002_26-27_057DPtZ.pdf',19,5,0,NULL,NULL,2164.00,0,NULL);
/*!40000 ALTER TABLE `products_supplierproduct` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suppliers_supplier`
--

DROP TABLE IF EXISTS `suppliers_supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suppliers_supplier` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `supplier_name` varchar(255) NOT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `address` longtext,
  `created_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers_supplier`
--

LOCK TABLES `suppliers_supplier` WRITE;
/*!40000 ALTER TABLE `suppliers_supplier` DISABLE KEYS */;
INSERT INTO `suppliers_supplier` VALUES (1,'AVVIRAT','9999999999',',KJHLNLN','2026-06-05 11:20:50.028886'),(2,'JSQUARE','9999999999','BNKH','2026-06-05 11:23:48.933256'),(3,'INMICRON',NULL,NULL,'2026-06-17 10:00:43.816136'),(4,'INMICRON',NULL,NULL,'2026-06-17 10:02:46.000917'),(5,'ATOMIC GAUGES',NULL,NULL,'2026-06-17 11:06:14.350602');
/*!40000 ALTER TABLE `suppliers_supplier` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-30  7:16:22
