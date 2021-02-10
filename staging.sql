-- MySQL dump 10.13  Distrib 8.0.23, for Linux (x86_64)
--
-- Host: localhost    Database: tastyigniter_setup
-- ------------------------------------------------------
-- Server version	8.0.23-0ubuntu0.20.04.1

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
-- Table structure for table `ti_activities`
--

DROP TABLE IF EXISTS `ti_activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ti_activities` (
  `activity_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `date_added` datetime NOT NULL,
  `log_name` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `properties` text COLLATE utf8mb4_unicode_ci,
  `subject_id` int DEFAULT NULL,
  `subject_type` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `causer_id` int DEFAULT NULL,
  `causer_type` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_updated` datetime NOT NULL,
  `type` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `read_at` datetime DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `user_type` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`activity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ti_activities`
--

LOCK TABLES `ti_activities` WRITE;
/*!40000 ALTER TABLE `ti_activities` DISABLE KEYS */;
/*!40000 ALTER TABLE `ti_activities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ti_addresses`
--

DROP TABLE IF EXISTS `ti_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ti_addresses` (
  `address_id` int unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int DEFAULT NULL,
  `address_1` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address_2` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postcode` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` int NOT NULL,
  PRIMARY KEY (`address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ti_addresses`
--

LOCK TABLES `ti_addresses` WRITE;
/*!40000 ALTER TABLE `ti_addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `ti_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ti_allergenables`
--

DROP TABLE IF EXISTS `ti_allergenables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ti_allergenables` (
  `allergen_id` int unsigned NOT NULL,
  `allergenable_type` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `allergenable_id` bigint unsigned NOT NULL,
  UNIQUE KEY `allergenable_unique` (`allergen_id`,`allergenable_id`,`allergenable_type`),
  KEY `allergenable_index` (`allergenable_type`,`allergenable_id`),
  KEY `allergenables_allergen_id_index` (`allergen_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ti_allergenables`
--

LOCK TABLES `ti_allergenables` WRITE;
/*!40000 ALTER TABLE `ti_allergenables` DISABLE KEYS */;
/*!40000 ALTER TABLE `ti_allergenables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ti_allergens`
--

DROP TABLE IF EXISTS `ti_allergens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ti_allergens` (
  `allergen_id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`allergen_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ti_allergens`
--

LOCK TABLES `ti_allergens` WRITE;
/*!40000 ALTER TABLE `ti_allergens` DISABLE KEYS */;
/*!40000 ALTER TABLE `ti_allergens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ti_assignable_logs`
--

DROP TABLE IF EXISTS `ti_assignable_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ti_assignable_logs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `assignable_type` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `assignable_id` bigint unsigned NOT NULL,
  `assignee_id` int unsigned DEFAULT NULL,
  `assignee_group_id` int unsigned DEFAULT NULL,
  `status_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `assignable_logs_assignable_type_assignable_id_index` (`assignable_type`,`assignable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ti_assignable_logs`
--

LOCK TABLES `ti_assignable_logs` WRITE;
/*!40000 ALTER TABLE `ti_assignable_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `ti_assignable_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ti_banners`
--

DROP TABLE IF EXISTS `ti_banners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ti_banners` (
  `banner_id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` char(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `click_url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `language_id` int NOT NULL,
  `alt_text` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_code` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `custom_code` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`banner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ti_banners`
--

LOCK TABLES `ti_banners` WRITE;
/*!40000 ALTER TABLE `ti_banners` DISABLE KEYS */;
/*!40000 ALTER TABLE `ti_banners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ti_categories`
--

DROP TABLE IF EXISTS `ti_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ti_categories` (
  `category_id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `parent_id` int DEFAULT NULL,
  `priority` int NOT NULL DEFAULT '0',
  `image` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `nest_left` int DEFAULT NULL,
  `nest_right` int DEFAULT NULL,
  `permalink_slug` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ti_categories`
--

LOCK TABLES `ti_categories` WRITE;
/*!40000 ALTER TABLE `ti_categories` DISABLE KEYS */;
INSERT INTO `ti_categories` VALUES (1,'Appetizer','Sed consequat, sapien in scelerisque egestas, neque nisi dapibus magna, non malesuada lectus ligula vel justo. Vestibulum felis nisi, tincidunt eu est quis, faucibus tincidunt ante.',NULL,1,NULL,1,NULL,NULL,'appetizer'),(2,'Main Course','',NULL,6,NULL,1,NULL,NULL,'main-course'),(3,'Salads','Etiam tristique pretium enim, vel convallis sem fermentum eget. Donec porta risus vestibulum elit gravida ornare. Quisque neque mi, tincidunt quis leo eget, ornare aliquam nulla. Morbi at lacinia lorem. Aenean at accumsan turpis.',NULL,3,NULL,1,NULL,NULL,'salads'),(4,'Seafoods','Morbi blandit massa et massa ornare, sed aliquam risus suscipit. Suspendisse et felis vitae ex pulvinar dictum et non dui. Suspendisse ullamcorper diam ac aliquet malesuada. Duis auctor nisi turpis, a ornare nisi auctor sit amet. Suspendisse imperdiet magna accumsan libero laoreet, consectetur sollicitudin sem maximus.',NULL,4,NULL,1,NULL,NULL,'seafoods'),(5,'Traditional','Vivamus interdum erat ac aliquam porttitor. Morbi malesuada ligula non elit sagittis, et facilisis dolor porta. Aenean aliquet leo eu massa tempor varius. Donec a erat massa. Praesent vitae libero a ligula auctor laoreet.',NULL,5,NULL,1,NULL,NULL,'traditional'),(6,'Desserts','',NULL,8,NULL,1,NULL,NULL,'desserts'),(7,'Drinks','',NULL,9,NULL,1,NULL,NULL,'drinks'),(8,'Specials','Praesent nec velit faucibus, consequat justo eu, malesuada est. Aenean leo ipsum, venenatis nec dapibus ullamcorper, volutpat eget leo. Phasellus nec ipsum lorem. Etiam nec ullamcorper augue. Phasellus mauris turpis, consequat et rutrum at, bibendum eu mi.',NULL,2,NULL,1,NULL,NULL,'specials');
/*!40000 ALTER TABLE `ti_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ti_countries`
--

DROP TABLE IF EXISTS `ti_countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ti_countries` (
  `country_id` int unsigned NOT NULL AUTO_INCREMENT,
  `country_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `iso_code_2` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `iso_code_3` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `format` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `priority` int NOT NULL DEFAULT '999',
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=240 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ti_countries`
--

LOCK TABLES `ti_countries` WRITE;
/*!40000 ALTER TABLE `ti_countries` DISABLE KEYS */;
INSERT INTO `ti_countries` VALUES (1,'Afghanistan','AF','AFG','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(2,'Albania','AL','ALB','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(3,'Algeria','DZ','DZA','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(4,'American Samoa','AS','ASM','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(5,'Andorra','AD','AND','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(6,'Angola','AO','AGO','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(7,'Anguilla','AI','AIA','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(8,'Antarctica','AQ','ATA','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(9,'Antigua and Barbuda','AG','ATG','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(10,'Argentina','AR','ARG','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(11,'Armenia','AM','ARM','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(12,'Aruba','AW','ABW','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(13,'Australia','AU','AUS','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(14,'Austria','AT','AUT','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(15,'Azerbaijan','AZ','AZE','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(16,'Bahamas','BS','BHS','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(17,'Bahrain','BH','BHR','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(18,'Bangladesh','BD','BGD','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(19,'Barbados','BB','BRB','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(20,'Belarus','BY','BLR','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(21,'Belgium','BE','BEL','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(22,'Belize','BZ','BLZ','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(23,'Benin','BJ','BEN','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(24,'Bermuda','BM','BMU','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(25,'Bhutan','BT','BTN','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(26,'Bolivia','BO','BOL','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(27,'Bosnia and Herzegowina','BA','BIH','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(28,'Botswana','BW','BWA','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(29,'Bouvet Island','BV','BVT','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(30,'Brazil','BR','BRA','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(31,'British Indian Ocean Territory','IO','IOT','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(32,'Brunei Darussalam','BN','BRN','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(33,'Bulgaria','BG','BGR','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(34,'Burkina Faso','BF','BFA','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(35,'Burundi','BI','BDI','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(36,'Cambodia','KH','KHM','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(37,'Cameroon','CM','CMR','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(38,'Canada','CA','CAN','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(39,'Cape Verde','CV','CPV','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(40,'Cayman Islands','KY','CYM','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(41,'Central African Republic','CF','CAF','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(42,'Chad','TD','TCD','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(43,'Chile','CL','CHL','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(44,'China','CN','CHN','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(45,'Christmas Island','CX','CXR','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(46,'Cocos (Keeling) Islands','CC','CCK','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(47,'Colombia','CO','COL','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(48,'Comoros','KM','COM','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(49,'Congo','CG','COG','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(50,'Cook Islands','CK','COK','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(51,'Costa Rica','CR','CRI','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(52,'Cote D\'Ivoire','CI','CIV','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(53,'Croatia','HR','HRV','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(54,'Cuba','CU','CUB','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(55,'Cyprus','CY','CYP','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(56,'Czech Republic','CZ','CZE','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(57,'Denmark','DK','DNK','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(58,'Djibouti','DJ','DJI','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(59,'Dominica','DM','DMA','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(60,'Dominican Republic','DO','DOM','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(61,'East Timor','TP','TMP','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(62,'Ecuador','EC','ECU','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(63,'Egypt','EG','EGY','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(64,'El Salvador','SV','SLV','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(65,'Equatorial Guinea','GQ','GNQ','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(66,'Eritrea','ER','ERI','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(67,'Estonia','EE','EST','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(68,'Ethiopia','ET','ETH','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(69,'Falkland Islands (Malvinas)','FK','FLK','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(70,'Faroe Islands','FO','FRO','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(71,'Fiji','FJ','FJI','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(72,'Finland','FI','FIN','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(73,'France','FR','FRA','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(74,'France, Metropolitan','FX','FXX','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(75,'French Guiana','GF','GUF','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(76,'French Polynesia','PF','PYF','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(77,'French Southern Territories','TF','ATF','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(78,'Gabon','GA','GAB','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(79,'Gambia','GM','GMB','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(80,'Georgia','GE','GEO','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(81,'Germany','DE','DEU','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(82,'Ghana','GH','GHA','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(83,'Gibraltar','GI','GIB','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(84,'Greece','GR','GRC','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(85,'Greenland','GL','GRL','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(86,'Grenada','GD','GRD','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(87,'Guadeloupe','GP','GLP','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(88,'Guam','GU','GUM','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(89,'Guatemala','GT','GTM','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(90,'Guinea','GN','GIN','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(91,'Guinea-bissau','GW','GNB','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(92,'Guyana','GY','GUY','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(93,'Haiti','HT','HTI','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(94,'Heard and Mc Donald Islands','HM','HMD','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(95,'Honduras','HN','HND','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(96,'Hong Kong','HK','HKG','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(97,'Hungary','HU','HUN','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(98,'Iceland','IS','ISL','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(99,'India','IN','IND','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(100,'Indonesia','ID','IDN','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(101,'Iran (Islamic Republic of)','IR','IRN','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(102,'Iraq','IQ','IRQ','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(103,'Ireland','IE','IRL','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(104,'Israel','IL','ISR','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(105,'Italy','IT','ITA','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(106,'Jamaica','JM','JAM','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(107,'Japan','JP','JPN','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(108,'Jordan','JO','JOR','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(109,'Kazakhstan','KZ','KAZ','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(110,'Kenya','KE','KEN','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(111,'Kiribati','KI','KIR','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(112,'North Korea','KP','PRK','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(113,'Korea, Republic of','KR','KOR','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(114,'Kuwait','KW','KWT','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(115,'Kyrgyzstan','KG','KGZ','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(116,'Lao People\'s Democratic Republic','LA','LAO','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(117,'Latvia','LV','LVA','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(118,'Lebanon','LB','LBN','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(119,'Lesotho','LS','LSO','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(120,'Liberia','LR','LBR','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(121,'Libyan Arab Jamahiriya','LY','LBY','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(122,'Liechtenstein','LI','LIE','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(123,'Lithuania','LT','LTU','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(124,'Luxembourg','LU','LUX','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(125,'Macau','MO','MAC','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(126,'FYROM','MK','MKD','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(127,'Madagascar','MG','MDG','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(128,'Malawi','MW','MWI','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(129,'Malaysia','MY','MYS','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(130,'Maldives','MV','MDV','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(131,'Mali','ML','MLI','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(132,'Malta','MT','MLT','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(133,'Marshall Islands','MH','MHL','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(134,'Martinique','MQ','MTQ','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(135,'Mauritania','MR','MRT','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(136,'Mauritius','MU','MUS','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(137,'Mayotte','YT','MYT','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(138,'Mexico','MX','MEX','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(139,'Micronesia, Federated States of','FM','FSM','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(140,'Moldova, Republic of','MD','MDA','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(141,'Monaco','MC','MCO','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(142,'Mongolia','MN','MNG','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(143,'Montserrat','MS','MSR','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(144,'Morocco','MA','MAR','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(145,'Mozambique','MZ','MOZ','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(146,'Myanmar','MM','MMR','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(147,'Namibia','NA','NAM','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(148,'Nauru','NR','NRU','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(149,'Nepal','NP','NPL','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(150,'Netherlands','NL','NLD','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(151,'Netherlands Antilles','AN','ANT','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(152,'New Caledonia','NC','NCL','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(153,'New Zealand','NZ','NZL','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(154,'Nicaragua','NI','NIC','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(155,'Niger','NE','NER','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(156,'Nigeria','NG','NGA','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(157,'Niue','NU','NIU','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(158,'Norfolk Island','NF','NFK','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(159,'Northern Mariana Islands','MP','MNP','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(160,'Norway','NO','NOR','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(161,'Oman','OM','OMN','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(162,'Pakistan','PK','PAK','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(163,'Palau','PW','PLW','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(164,'Panama','PA','PAN','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(165,'Papua New Guinea','PG','PNG','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(166,'Paraguay','PY','PRY','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(167,'Peru','PE','PER','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(168,'Philippines','PH','PHL','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(169,'Pitcairn','PN','PCN','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(170,'Poland','PL','POL','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(171,'Portugal','PT','PRT','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(172,'Puerto Rico','PR','PRI','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(173,'Qatar','QA','QAT','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(174,'Reunion','RE','REU','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(175,'Romania','RO','ROM','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(176,'Russian Federation','RU','RUS','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(177,'Rwanda','RW','RWA','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(178,'Saint Kitts and Nevis','KN','KNA','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(179,'Saint Lucia','LC','LCA','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(180,'Saint Vincent and the Grenadines','VC','VCT','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(181,'Samoa','WS','WSM','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(182,'San Marino','SM','SMR','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(183,'Sao Tome and Principe','ST','STP','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(184,'Saudi Arabia','SA','SAU','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(185,'Senegal','SN','SEN','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(186,'Seychelles','SC','SYC','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(187,'Sierra Leone','SL','SLE','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(188,'Singapore','SG','SGP','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(189,'Slovak Republic','SK','SVK','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(190,'Slovenia','SI','SVN','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(191,'Solomon Islands','SB','SLB','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(192,'Somalia','SO','SOM','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(193,'South Africa','ZA','ZAF','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(194,'South Georgia &amp; South Sandwich Islands','GS','SGS','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(195,'Spain','ES','ESP','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(196,'Sri Lanka','LK','LKA','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(197,'St. Helena','SH','SHN','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(198,'St. Pierre and Miquelon','PM','SPM','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(199,'Sudan','SD','SDN','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(200,'Suriname','SR','SUR','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(201,'Svalbard and Jan Mayen Islands','SJ','SJM','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(202,'Swaziland','SZ','SWZ','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(203,'Sweden','SE','SWE','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(204,'Switzerland','CH','CHE','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(205,'Syrian Arab Republic','SY','SYR','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(206,'Taiwan','TW','TWN','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(207,'Tajikistan','TJ','TJK','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(208,'Tanzania, United Republic of','TZ','TZA','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(209,'Thailand','TH','THA','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(210,'Togo','TG','TGO','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(211,'Tokelau','TK','TKL','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(212,'Tonga','TO','TON','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(213,'Trinidad and Tobago','TT','TTO','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(214,'Tunisia','TN','TUN','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(215,'Turkey','TR','TUR','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(216,'Turkmenistan','TM','TKM','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(217,'Turks and Caicos Islands','TC','TCA','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(218,'Tuvalu','TV','TUV','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(219,'Uganda','UG','UGA','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(220,'Ukraine','UA','UKR','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(221,'United Arab Emirates','AE','ARE','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(222,'United Kingdom','GB','GBR','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(223,'United States','US','USA','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(224,'United States Minor Outlying Islands','UM','UMI','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(225,'Uruguay','UY','URY','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(226,'Uzbekistan','UZ','UZB','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(227,'Vanuatu','VU','VUT','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(228,'Vatican City State (Holy See)','VA','VAT','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(229,'Venezuela','VE','VEN','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(230,'Viet Nam','VN','VNM','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(231,'Virgin Islands (British)','VG','VGB','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(232,'Virgin Islands (U.S.)','VI','VIR','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(233,'Wallis and Futuna Islands','WF','WLF','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(234,'Western Sahara','EH','ESH','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(235,'Yemen','YE','YEM','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(236,'Yugoslavia','YU','YUG','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(237,'Democratic Republic of Congo','CD','COD','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(238,'Zambia','ZM','ZMB','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999),(239,'Zimbabwe','ZW','ZWE','{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}',1,999);
/*!40000 ALTER TABLE `ti_countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ti_currencies`
--

DROP TABLE IF EXISTS `ti_currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ti_currencies` (
  `currency_id` int unsigned NOT NULL AUTO_INCREMENT,
  `country_id` int NOT NULL,
  `currency_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_code` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_symbol` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_rate` decimal(15,8) NOT NULL,
  `symbol_position` tinyint(1) DEFAULT NULL,
  `thousand_sign` char(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `decimal_sign` char(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `decimal_position` char(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `iso_alpha2` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `iso_alpha3` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `iso_numeric` int DEFAULT NULL,
  `flag` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_status` int DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`currency_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ti_currencies`
--

LOCK TABLES `ti_currencies` WRITE;
/*!40000 ALTER TABLE `ti_currencies` DISABLE KEYS */;
INSERT INTO `ti_currencies` VALUES (1,222,'Pound Sterling','GBP','£',0.00000000,0,',','.','2','GB','GBR',826,NULL,1,'2017-10-03 19:08:49'),(2,223,'US Dollar','USD','$',0.00000000,0,',','.','2','US','USA',840,NULL,0,'2017-10-03 19:08:49'),(3,44,'Yuan Renminbi','CNY','¥',0.00000000,0,',','.','2','CN','CHN',156,NULL,0,'2017-10-03 19:08:49'),(4,13,'Australian Dollar','AUD','$',0.00000000,0,',','.','2','AU','AUS',36,NULL,1,'2017-10-03 19:08:49'),(5,156,'Naira','NGN','₦',0.00000000,0,',','.','2','NG','NGA',566,NULL,1,'2017-10-03 19:08:49');
/*!40000 ALTER TABLE `ti_currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ti_customer_groups`
--

DROP TABLE IF EXISTS `ti_customer_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ti_customer_groups` (
  `customer_group_id` int unsigned NOT NULL AUTO_INCREMENT,
  `group_name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `approval` tinyint(1) NOT NULL,
  PRIMARY KEY (`customer_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ti_customer_groups`
--

LOCK TABLES `ti_customer_groups` WRITE;
/*!40000 ALTER TABLE `ti_customer_groups` DISABLE KEYS */;
INSERT INTO `ti_customer_groups` VALUES (1,'Default group',NULL,0);
/*!40000 ALTER TABLE `ti_customer_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ti_customers`
--

DROP TABLE IF EXISTS `ti_customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ti_customers` (
  `customer_id` int unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(96) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `telephone` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_id` int DEFAULT NULL,
  `newsletter` tinyint(1) DEFAULT NULL,
  `customer_group_id` int NOT NULL,
  `ip_address` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_added` datetime NOT NULL,
  `status` tinyint(1) NOT NULL,
  `reset_code` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reset_time` datetime DEFAULT NULL,
  `activation_code` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_activated` tinyint(1) DEFAULT NULL,
  `date_activated` datetime DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `last_seen` datetime DEFAULT NULL,
  `last_location_area` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `customers_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ti_customers`
--

LOCK TABLES `ti_customers` WRITE;
/*!40000 ALTER TABLE `ti_customers` DISABLE KEYS */;
/*!40000 ALTER TABLE `ti_customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ti_customers_online`
--

DROP TABLE IF EXISTS `ti_customers_online`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ti_customers_online` (
  `activity_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `access_type` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `browser` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip_address` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_code` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `request_uri` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `referrer_uri` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `date_added` datetime NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`activity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ti_customers_online`
--

LOCK TABLES `ti_customers_online` WRITE;
/*!40000 ALTER TABLE `ti_customers_online` DISABLE KEYS */;
/*!40000 ALTER TABLE `ti_customers_online` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ti_extension_settings`
--

DROP TABLE IF EXISTS `ti_extension_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ti_extension_settings` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `item` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `extension_settings_item_unique` (`item`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ti_extension_settings`
--

LOCK TABLES `ti_extension_settings` WRITE;
/*!40000 ALTER TABLE `ti_extension_settings` DISABLE KEYS */;
INSERT INTO `ti_extension_settings` VALUES (1,'igniter_review_settings','a:3:{s:13:\"allow_reviews\";s:1:\"1\";s:15:\"approve_reviews\";s:1:\"1\";s:7:\"ratings\";a:1:{s:7:\"ratings\";a:5:{i:0;s:3:\"Bad\";i:1;s:5:\"Worse\";i:2;s:4:\"Good\";i:3;s:7:\"Average\";i:4;s:9:\"Excellent\";}}}');
/*!40000 ALTER TABLE `ti_extension_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ti_extensions`
--

DROP TABLE IF EXISTS `ti_extensions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ti_extensions` (
  `extension_id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '1.0.0',
  PRIMARY KEY (`extension_id`),
  UNIQUE KEY `extensions_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ti_extensions`
--

LOCK TABLES `ti_extensions` WRITE;
/*!40000 ALTER TABLE `ti_extensions` DISABLE KEYS */;
INSERT INTO `ti_extensions` VALUES (1,'igniter.cart','v2.6.0'),(2,'igniter.frontend','v1.4.1'),(3,'igniter.local','v1.10.0'),(4,'igniter.pages','v1.5.0'),(5,'igniter.payregister','v1.4.2'),(6,'igniter.reservation','v2.0.2'),(7,'igniter.user','v1.5.5'),(8,'igniter.coupons','v1.4.0'),(9,'igniter.demo','1.0.0');
/*!40000 ALTER TABLE `ti_extensions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ti_failed_jobs`
--

DROP TABLE IF EXISTS `ti_failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ti_failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ti_failed_jobs`
--

LOCK TABLES `ti_failed_jobs` WRITE;
/*!40000 ALTER TABLE `ti_failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `ti_failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ti_igniter_cart_cart`
--

DROP TABLE IF EXISTS `ti_igniter_cart_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ti_igniter_cart_cart` (
  `identifier` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `instance` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`identifier`,`instance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ti_igniter_cart_cart`
--

LOCK TABLES `ti_igniter_cart_cart` WRITE;
/*!40000 ALTER TABLE `ti_igniter_cart_cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `ti_igniter_cart_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ti_igniter_coupon_categories`
--

DROP TABLE IF EXISTS `ti_igniter_coupon_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ti_igniter_coupon_categories` (
  `coupon_id` int unsigned NOT NULL,
  `category_id` int unsigned NOT NULL,
  UNIQUE KEY `igniter_coupon_categories_coupon_id_category_id_unique` (`coupon_id`,`category_id`),
  KEY `igniter_coupon_categories_coupon_id_index` (`coupon_id`),
  KEY `igniter_coupon_categories_category_id_index` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ti_igniter_coupon_categories`
--

LOCK TABLES `ti_igniter_coupon_categories` WRITE;
/*!40000 ALTER TABLE `ti_igniter_coupon_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `ti_igniter_coupon_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ti_igniter_coupon_menus`
--

DROP TABLE IF EXISTS `ti_igniter_coupon_menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ti_igniter_coupon_menus` (
  `coupon_id` int unsigned NOT NULL,
  `menu_id` int unsigned NOT NULL,
  UNIQUE KEY `igniter_coupon_menus_coupon_id_menu_id_unique` (`coupon_id`,`menu_id`),
  KEY `igniter_coupon_menus_coupon_id_index` (`coupon_id`),
  KEY `igniter_coupon_menus_menu_id_index` (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ti_igniter_coupon_menus`
--

LOCK TABLES `ti_igniter_coupon_menus` WRITE;
/*!40000 ALTER TABLE `ti_igniter_coupon_menus` DISABLE KEYS */;
/*!40000 ALTER TABLE `ti_igniter_coupon_menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ti_igniter_coupons`
--

DROP TABLE IF EXISTS `ti_igniter_coupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ti_igniter_coupons` (
  `coupon_id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` char(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount` decimal(15,4) DEFAULT NULL,
  `min_total` decimal(15,4) DEFAULT NULL,
  `redemptions` int NOT NULL DEFAULT '0',
  `customer_redemptions` int NOT NULL DEFAULT '0',
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) DEFAULT NULL,
  `date_added` date NOT NULL,
  `validity` char(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fixed_date` date DEFAULT NULL,
  `fixed_from_time` time DEFAULT NULL,
  `fixed_to_time` time DEFAULT NULL,
  `period_start_date` date DEFAULT NULL,
  `period_end_date` date DEFAULT NULL,
  `recurring_every` varchar(35) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recurring_from_time` time DEFAULT NULL,
  `recurring_to_time` time DEFAULT NULL,
  `order_restriction` tinyint(1) NOT NULL,
  `is_limited_to_cart_item` tinyint(1) NOT NULL DEFAULT '0',
  `auto_apply` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`coupon_id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ti_igniter_coupons`
--

LOCK TABLES `ti_igniter_coupons` WRITE;
/*!40000 ALTER TABLE `ti_igniter_coupons` DISABLE KEYS */;
INSERT INTO `ti_igniter_coupons` VALUES (1,'Half Sundays','2222','F',100.0000,500.0000,0,0,NULL,1,'0000-00-00','forever',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0),(2,'Half Tuesdays','3333','P',30.0000,1000.0000,0,0,NULL,1,'0000-00-00','forever',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0),(3,'Full Mondays','MTo6TuTg','P',50.0000,0.0000,0,1,NULL,1,'0000-00-00','forever',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0),(4,'Full Tuesdays','4444','F',500.0000,5000.0000,0,0,NULL,1,'0000-00-00','forever',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0);
/*!40000 ALTER TABLE `ti_igniter_coupons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ti_igniter_coupons_history`
--

DROP TABLE IF EXISTS `ti_igniter_coupons_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ti_igniter_coupons_history` (
  `coupon_history_id` int unsigned NOT NULL AUTO_INCREMENT,
  `coupon_id` int NOT NULL,
  `order_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `code` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `min_total` decimal(15,4) DEFAULT NULL,
  `amount` decimal(15,4) DEFAULT NULL,
  `date_used` datetime NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`coupon_history_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ti_igniter_coupons_history`
--

LOCK TABLES `ti_igniter_coupons_history` WRITE;
/*!40000 ALTER TABLE `ti_igniter_coupons_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `ti_igniter_coupons_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ti_igniter_frontend_sliders`
--

DROP TABLE IF EXISTS `ti_igniter_frontend_sliders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ti_igniter_frontend_sliders` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadata` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `igniter_frontend_sliders_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ti_igniter_frontend_sliders`
--

LOCK TABLES `ti_igniter_frontend_sliders` WRITE;
/*!40000 ALTER TABLE `ti_igniter_frontend_sliders` DISABLE KEYS */;
INSERT INTO `ti_igniter_frontend_sliders` VALUES (1,'Homepage slider','home-slider',NULL,'2021-02-09 14:03:11','2021-02-09 14:03:11');
/*!40000 ALTER TABLE `ti_igniter_frontend_sliders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ti_igniter_frontend_subscribers`
--

DROP TABLE IF EXISTS `ti_igniter_frontend_subscribers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ti_igniter_frontend_subscribers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `statistics` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ti_igniter_frontend_subscribers`
--

LOCK TABLES `ti_igniter_frontend_subscribers` WRITE;
/*!40000 ALTER TABLE `ti_igniter_frontend_subscribers` DISABLE KEYS */;
/*!40000 ALTER TABLE `ti_igniter_frontend_subscribers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ti_igniter_pages_menu_items`
--

DROP TABLE IF EXISTS `ti_igniter_pages_menu_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ti_igniter_pages_menu_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int unsigned NOT NULL,
  `parent_id` int unsigned DEFAULT NULL,
  `title` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `config` text COLLATE utf8mb4_unicode_ci,
  `nest_left` int DEFAULT NULL,
  `nest_right` int DEFAULT NULL,
  `priority` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `igniter_pages_menu_items_menu_id_index` (`menu_id`),
  KEY `igniter_pages_menu_items_parent_id_index` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ti_igniter_pages_menu_items`
--

LOCK TABLES `ti_igniter_pages_menu_items` WRITE;
/*!40000 ALTER TABLE `ti_igniter_pages_menu_items` DISABLE KEYS */;
INSERT INTO `ti_igniter_pages_menu_items` VALUES (1,1,NULL,'TastyIgniter','',NULL,'header',NULL,NULL,'[]',1,8,1,'2021-02-09 17:49:17','2021-02-09 17:49:17'),(2,1,1,'main::lang.menu_menu','',NULL,'theme-page',NULL,'local/menus','[]',2,3,2,'2021-02-09 17:49:17','2021-02-09 17:49:17'),(3,1,1,'main::lang.menu_reservation','',NULL,'theme-page',NULL,'reservation/reservation','[]',4,5,3,'2021-02-09 17:49:17','2021-02-09 17:49:17'),(4,1,1,'main::lang.menu_locations','',NULL,'theme-page',NULL,'locations','[]',6,7,4,'2021-02-09 17:49:17','2021-02-09 17:49:17'),(5,1,NULL,'main::lang.text_information','',NULL,'header',NULL,NULL,'[]',9,18,5,'2021-02-09 17:49:17','2021-02-09 17:49:17'),(6,1,5,'main::lang.menu_contact','',NULL,'theme-page',NULL,'contact','[]',10,11,6,'2021-02-09 17:49:17','2021-02-09 17:49:17'),(7,1,5,'main::lang.menu_admin','',NULL,'url','https://staging.alfredmenu.com/admin',NULL,'[]',12,13,7,'2021-02-09 17:49:17','2021-02-09 17:49:17'),(8,1,5,'About Us','',NULL,'static-page',NULL,'1','[]',14,15,8,'2021-02-09 17:49:17','2021-02-09 17:49:17'),(9,1,5,'Privacy Policy','',NULL,'static-page',NULL,'2','[]',16,17,9,'2021-02-09 17:49:17','2021-02-09 17:49:17'),(10,2,NULL,'main::lang.menu_menu','view-menu',NULL,'theme-page',NULL,'local/menus','[]',19,20,10,'2021-02-09 17:49:17','2021-02-09 17:49:17'),(11,2,NULL,'main::lang.menu_reservation','reservation',NULL,'theme-page',NULL,'reservation/reservation','[]',21,22,11,'2021-02-09 17:49:17','2021-02-09 17:49:17'),(12,2,NULL,'main::lang.menu_login','login',NULL,'theme-page',NULL,'account/login','[]',23,24,12,'2021-02-09 17:49:17','2021-02-09 17:49:17'),(13,2,NULL,'main::lang.menu_register','register',NULL,'theme-page',NULL,'account/register','[]',25,26,13,'2021-02-09 17:49:17','2021-02-09 17:49:17'),(14,2,NULL,'main::lang.menu_my_account','account',NULL,'theme-page',NULL,'account/account','[]',27,38,14,'2021-02-09 17:49:17','2021-02-09 17:49:17'),(15,2,14,'main::lang.menu_recent_order','recent-orders',NULL,'theme-page',NULL,'account/orders','[]',28,29,15,'2021-02-09 17:49:17','2021-02-09 17:49:17'),(16,2,14,'main::lang.menu_my_account','',NULL,'theme-page',NULL,'account/account','[]',30,31,16,'2021-02-09 17:49:17','2021-02-09 17:49:17'),(17,2,14,'main::lang.menu_address','',NULL,'theme-page',NULL,'account/address','[]',32,33,17,'2021-02-09 17:49:17','2021-02-09 17:49:17'),(18,2,14,'main::lang.menu_recent_reservation','',NULL,'theme-page',NULL,'account/reservations','[]',34,35,18,'2021-02-09 17:49:17','2021-02-09 17:49:17'),(19,2,14,'main::lang.menu_logout','',NULL,'url','javascript:;',NULL,'{\"extraAttributes\":\"data-request=\\\"session::onLogout\\\"\"}',36,37,19,'2021-02-09 17:49:17','2021-02-09 17:49:17'),(20,3,NULL,'Pages','',NULL,'all-static-pages',NULL,'','[]',39,40,20,'2021-02-09 17:49:17','2021-02-09 17:49:17');
/*!40000 ALTER TABLE `ti_igniter_pages_menu_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ti_igniter_pages_menus`
--

DROP TABLE IF EXISTS `ti_igniter_pages_menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ti_igniter_pages_menus` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `theme_code` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `igniter_pages_menus_theme_code_index` (`theme_code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ti_igniter_pages_menus`
--

LOCK TABLES `ti_igniter_pages_menus` WRITE;
/*!40000 ALTER TABLE `ti_igniter_pages_menus` DISABLE KEYS */;
INSERT INTO `ti_igniter_pages_menus` VALUES (1,'tastyigniter-orange','Footer menu','footer-menu','2021-02-09 17:49:17','2021-02-09 17:49:17'),(2,'tastyigniter-orange','Main menu','main-menu','2021-02-09 17:49:17','2021-02-09 17:49:17'),(3,'tastyigniter-orange','Pages menu','pages-menu','2021-02-09 17:49:17','2021-02-09 17:49:17');
/*!40000 ALTER TABLE `ti_igniter_pages_menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ti_igniter_reviews`
--

DROP TABLE IF EXISTS `ti_igniter_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ti_igniter_reviews` (
  `review_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int DEFAULT NULL,
  `sale_id` int NOT NULL,
  `sale_type` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `author` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location_id` int NOT NULL,
  `quality` int NOT NULL,
  `delivery` int NOT NULL,
  `service` int NOT NULL,
  `review_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `date_added` datetime NOT NULL,
  `review_status` tinyint(1) NOT NULL,
  PRIMARY KEY (`review_id`),
  KEY `igniter_reviews_review_id_sale_type_sale_id_index` (`review_id`,`sale_type`,`sale_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ti_igniter_reviews`
--

LOCK TABLES `ti_igniter_reviews` WRITE;
/*!40000 ALTER TABLE `ti_igniter_reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `ti_igniter_reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ti_jobs`
--

DROP TABLE IF EXISTS `ti_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ti_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ti_jobs`
--

LOCK TABLES `ti_jobs` WRITE;
/*!40000 ALTER TABLE `ti_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `ti_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ti_language_translations`
--

DROP TABLE IF EXISTS `ti_language_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ti_language_translations` (
  `translation_id` int unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `namespace` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '*',
  `group` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `unstable` tinyint(1) NOT NULL DEFAULT '0',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`translation_id`),
  UNIQUE KEY `language_translations_locale_namespace_group_item_unique` (`locale`,`namespace`,`group`,`item`),
  KEY `language_translations_group_index` (`group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ti_language_translations`
--

LOCK TABLES `ti_language_translations` WRITE;
/*!40000 ALTER TABLE `ti_language_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ti_language_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ti_languages`
--

DROP TABLE IF EXISTS `ti_languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ti_languages` (
  `language_id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `idiom` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `can_delete` tinyint(1) NOT NULL,
  `original_id` int DEFAULT NULL,
  PRIMARY KEY (`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ti_languages`
--

LOCK TABLES `ti_languages` WRITE;
/*!40000 ALTER TABLE `ti_languages` DISABLE KEYS */;
INSERT INTO `ti_languages` VALUES (1,'en','English',NULL,'english',1,0,NULL);
/*!40000 ALTER TABLE `ti_languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ti_location_areas`
--

DROP TABLE IF EXISTS `ti_location_areas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ti_location_areas` (
  `area_id` int unsigned NOT NULL AUTO_INCREMENT,
  `location_id` int NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `boundaries` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `conditions` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `priority` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`area_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ti_location_areas`
--

LOCK TABLES `ti_location_areas` WRITE;
/*!40000 ALTER TABLE `ti_location_areas` DISABLE KEYS */;
/*!40000 ALTER TABLE `ti_location_areas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ti_locationables`
--

DROP TABLE IF EXISTS `ti_locationables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ti_locationables` (
  `location_id` int NOT NULL,
  `locationable_id` int NOT NULL,
  `locationable_type` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ti_locationables`
--

LOCK TABLES `ti_locationables` WRITE;
/*!40000 ALTER TABLE `ti_locationables` DISABLE KEYS */;
INSERT INTO `ti_locationables` VALUES (1,1,'tables',''),(1,2,'tables',''),(1,3,'tables',''),(1,4,'tables',''),(1,5,'tables',''),(1,6,'tables',''),(1,7,'tables',''),(1,8,'tables',''),(1,9,'tables',''),(1,10,'tables',''),(1,11,'tables',''),(1,12,'tables',''),(1,13,'tables',''),(1,14,'tables',''),(1,1,'staffs','');
/*!40000 ALTER TABLE `ti_locationables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ti_locations`
--

DROP TABLE IF EXISTS `ti_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ti_locations` (
  `location_id` int unsigned NOT NULL AUTO_INCREMENT,
  `location_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `location_email` varchar(96) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `location_address_1` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location_address_2` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location_city` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location_state` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location_postcode` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location_country_id` int DEFAULT NULL,
  `location_telephone` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `location_lat` double DEFAULT NULL,
  `location_lng` double DEFAULT NULL,
  `location_radius` int DEFAULT NULL,
  `location_status` tinyint(1) DEFAULT NULL,
  `options` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `location_image` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permalink_slug` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`location_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ti_locations`
--

LOCK TABLES `ti_locations` WRITE;
/*!40000 ALTER TABLE `ti_locations` DISABLE KEYS */;
INSERT INTO `ti_locations` VALUES (1,'Default','admin@restaurant.com',NULL,'Broad Ln',NULL,'Coventry',NULL,NULL,222,'8765456789',52.415884,-1.603648,NULL,1,'a:9:{s:14:\"offer_delivery\";i:1;s:16:\"offer_collection\";i:1;s:18:\"delivery_lead_time\";i:15;s:20:\"collection_lead_time\";i:15;s:22:\"delivery_time_interval\";i:15;s:24:\"collection_time_interval\";i:15;s:25:\"reservation_time_interval\";i:15;s:21:\"reservation_lead_time\";i:45;s:5:\"hours\";a:3:{s:7:\"opening\";a:2:{s:4:\"type\";s:4:\"24_7\";s:4:\"days\";a:0:{}}s:8:\"delivery\";a:2:{s:4:\"type\";s:4:\"24_7\";s:4:\"days\";a:0:{}}s:10:\"collection\";a:2:{s:4:\"type\";s:4:\"24_7\";s:4:\"days\";a:0:{}}}}',NULL,'default');
/*!40000 ALTER TABLE `ti_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ti_mail_layouts`
--

DROP TABLE IF EXISTS `ti_mail_layouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ti_mail_layouts` (
  `layout_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `language_id` int NOT NULL,
  `date_added` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `status` tinyint(1) NOT NULL,
  `code` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `layout` text COLLATE utf8mb4_unicode_ci,
  `plain_layout` text COLLATE utf8mb4_unicode_ci,
  `layout_css` text COLLATE utf8mb4_unicode_ci,
  `is_locked` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`layout_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ti_mail_layouts`
--

LOCK TABLES `ti_mail_layouts` WRITE;
/*!40000 ALTER TABLE `ti_mail_layouts` DISABLE KEYS */;
/*!40000 ALTER TABLE `ti_mail_layouts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ti_mail_partials`
--

DROP TABLE IF EXISTS `ti_mail_partials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ti_mail_partials` (
  `partial_id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `html` text COLLATE utf8mb4_unicode_ci,
  `text` text COLLATE utf8mb4_unicode_ci,
  `is_custom` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`partial_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ti_mail_partials`
--

LOCK TABLES `ti_mail_partials` WRITE;
/*!40000 ALTER TABLE `ti_mail_partials` DISABLE KEYS */;
/*!40000 ALTER TABLE `ti_mail_partials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ti_mail_templates`
--

DROP TABLE IF EXISTS `ti_mail_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ti_mail_templates` (
  `template_id` int NOT NULL AUTO_INCREMENT,
  `layout_id` int NOT NULL,
  `code` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_added` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `label` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_custom` tinyint(1) DEFAULT NULL,
  `plain_body` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`template_id`),
  UNIQUE KEY `mail_templates_data_template_id_code_unique` (`layout_id`,`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ti_mail_templates`
--

LOCK TABLES `ti_mail_templates` WRITE;
/*!40000 ALTER TABLE `ti_mail_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `ti_mail_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ti_mealtimes`
--

DROP TABLE IF EXISTS `ti_mealtimes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ti_mealtimes` (
  `mealtime_id` int NOT NULL AUTO_INCREMENT,
  `mealtime_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_time` time NOT NULL DEFAULT '00:00:00',
  `end_time` time NOT NULL DEFAULT '23:59:59',
  `mealtime_status` tinyint(1) NOT NULL,
  PRIMARY KEY (`mealtime_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ti_mealtimes`
--

LOCK TABLES `ti_mealtimes` WRITE;
/*!40000 ALTER TABLE `ti_mealtimes` DISABLE KEYS */;
INSERT INTO `ti_mealtimes` VALUES (1,'Breakfast','07:00:00','10:00:00',1),(2,'Lunch','12:00:00','14:30:00',1),(3,'Dinner','18:00:00','20:00:00',1);
/*!40000 ALTER TABLE `ti_mealtimes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ti_media_attachments`
--

DROP TABLE IF EXISTS `ti_media_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ti_media_attachments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `disk` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int unsigned NOT NULL,
  `tag` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachment_type` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachment_id` bigint unsigned DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL DEFAULT '1',
  `custom_properties` text COLLATE utf8mb4_unicode_ci,
  `priority` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `media_attachments_attachment_type_attachment_id_index` (`attachment_type`,`attachment_id`),
  KEY `media_attachments_tag_index` (`tag`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ti_media_attachments`
--

LOCK TABLES `ti_media_attachments` WRITE;
/*!40000 ALTER TABLE `ti_media_attachments` DISABLE KEYS */;
INSERT INTO `ti_media_attachments` VALUES (1,'media','6022961f1b96f425606461.png','slide.png','image/jpeg',748127,'images','sliders',1,1,'[]',1,'2021-02-09 14:03:11','2021-02-09 14:03:11');
/*!40000 ALTER TABLE `ti_media_attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ti_menu_categories`
--

DROP TABLE IF EXISTS `ti_menu_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ti_menu_categories` (
  `menu_id` int unsigned NOT NULL,
  `category_id` int unsigned NOT NULL,
  UNIQUE KEY `menu_categories_menu_id_category_id_unique` (`menu_id`,`category_id`),
  KEY `menu_categories_menu_id_index` (`menu_id`),
  KEY `menu_categories_category_id_index` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ti_menu_categories`
--

LOCK TABLES `ti_menu_categories` WRITE;
/*!40000 ALTER TABLE `ti_menu_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `ti_menu_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ti_menu_item_option_values`
--

DROP TABLE IF EXISTS `ti_menu_item_option_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ti_menu_item_option_values` (
  `menu_option_value_id` int NOT NULL AUTO_INCREMENT,
  `menu_option_id` int NOT NULL,
  `option_value_id` int NOT NULL,
  `new_price` decimal(15,4) DEFAULT NULL,
  `quantity` int NOT NULL DEFAULT '0',
  `subtract_stock` tinyint(1) DEFAULT NULL,
  `priority` int NOT NULL DEFAULT '0',
  `is_default` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`menu_option_value_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ti_menu_item_option_values`
--

LOCK TABLES `ti_menu_item_option_values` WRITE;
/*!40000 ALTER TABLE `ti_menu_item_option_values` DISABLE KEYS */;
INSERT INTO `ti_menu_item_option_values` VALUES (1,1,9,0.0000,0,0,1,NULL),(2,1,10,0.0000,0,0,2,NULL),(3,2,7,0.0000,0,0,1,NULL),(4,2,8,5.0000,0,0,2,NULL),(5,3,4,4.9500,0,0,4,NULL),(6,3,5,4.9500,0,0,2,NULL),(7,3,6,6.9500,0,0,3,NULL),(8,4,7,0.0000,0,0,1,NULL),(9,4,8,5.0000,0,0,2,NULL),(10,5,4,4.9500,0,0,4,NULL),(11,5,5,4.9500,0,0,2,NULL),(12,5,6,6.9500,0,0,3,NULL),(13,6,7,0.0000,0,0,1,NULL),(14,6,8,5.0000,0,0,2,NULL),(15,7,7,0.0000,0,0,1,NULL),(16,7,8,5.0000,0,0,2,NULL),(17,8,4,4.9500,0,0,4,NULL),(18,8,5,4.9500,0,0,2,NULL),(19,8,6,6.9500,0,0,3,NULL),(20,9,9,0.0000,0,0,1,NULL),(21,9,10,0.0000,0,0,2,NULL);
/*!40000 ALTER TABLE `ti_menu_item_option_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ti_menu_item_options`
--

DROP TABLE IF EXISTS `ti_menu_item_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ti_menu_item_options` (
  `menu_option_id` int NOT NULL AUTO_INCREMENT,
  `option_id` int NOT NULL,
  `menu_id` int NOT NULL,
  `required` tinyint(1) NOT NULL,
  `priority` int NOT NULL DEFAULT '0',
  `min_selected` int NOT NULL DEFAULT '0',
  `max_selected` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`menu_option_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ti_menu_item_options`
--

LOCK TABLES `ti_menu_item_options` WRITE;
/*!40000 ALTER TABLE `ti_menu_item_options` DISABLE KEYS */;
INSERT INTO `ti_menu_item_options` VALUES (1,4,1,0,0,0,0),(2,3,2,0,0,0,0),(3,2,3,0,0,0,0),(4,3,3,0,0,0,0),(5,2,4,0,0,0,0),(6,3,4,0,0,0,0),(7,3,5,0,0,0,0),(8,2,10,0,0,0,0),(9,4,10,0,0,0,0);
/*!40000 ALTER TABLE `ti_menu_item_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ti_menu_mealtimes`
--

DROP TABLE IF EXISTS `ti_menu_mealtimes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ti_menu_mealtimes` (
  `menu_id` int unsigned NOT NULL,
  `mealtime_id` int unsigned NOT NULL,
  UNIQUE KEY `menu_mealtimes_menu_id_mealtime_id_unique` (`menu_id`,`mealtime_id`),
  KEY `menu_mealtimes_menu_id_index` (`menu_id`),
  KEY `menu_mealtimes_mealtime_id_index` (`mealtime_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ti_menu_mealtimes`
--

LOCK TABLES `ti_menu_mealtimes` WRITE;
/*!40000 ALTER TABLE `ti_menu_mealtimes` DISABLE KEYS */;
/*!40000 ALTER TABLE `ti_menu_mealtimes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ti_menu_option_values`
--

DROP TABLE IF EXISTS `ti_menu_option_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ti_menu_option_values` (
  `option_value_id` int NOT NULL AUTO_INCREMENT,
  `option_id` int NOT NULL,
  `value` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(15,4) DEFAULT NULL,
  `priority` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`option_value_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ti_menu_option_values`
--

LOCK TABLES `ti_menu_option_values` WRITE;
/*!40000 ALTER TABLE `ti_menu_option_values` DISABLE KEYS */;
INSERT INTO `ti_menu_option_values` VALUES (1,1,'Peperoni',1.9900,2),(2,1,'Jalapenos',3.9900,1),(3,1,'Sweetcorn',1.9900,3),(4,2,'Meat',4.9500,4),(5,2,'Fish',4.9500,2),(6,2,'Beef',6.9500,3),(7,3,'Small',0.0000,1),(8,3,'Large',5.0000,2),(9,4,'Coke',0.0000,1),(10,4,'Diet Coke',0.0000,2);
/*!40000 ALTER TABLE `ti_menu_option_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ti_menu_options`
--

DROP TABLE IF EXISTS `ti_menu_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ti_menu_options` (
  `option_id` int NOT NULL AUTO_INCREMENT,
  `option_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_type` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `priority` int NOT NULL DEFAULT '0',
  `update_related_menu_item` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`option_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ti_menu_options`
--

LOCK TABLES `ti_menu_options` WRITE;
/*!40000 ALTER TABLE `ti_menu_options` DISABLE KEYS */;
INSERT INTO `ti_menu_options` VALUES (1,'Toppings','checkbox',0,0),(2,'Sides','checkbox',0,0),(3,'Size','radio',0,0),(4,'Drinks','checkbox',0,0);
/*!40000 ALTER TABLE `ti_menu_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ti_menus`
--

DROP TABLE IF EXISTS `ti_menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ti_menus` (
  `menu_id` int NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `menu_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `menu_price` decimal(15,4) NOT NULL,
  `menu_photo` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stock_qty` int NOT NULL DEFAULT '0',
  `minimum_qty` int NOT NULL DEFAULT '0',
  `subtract_stock` tinyint(1) DEFAULT NULL,
  `menu_status` tinyint(1) NOT NULL,
  `menu_priority` int NOT NULL DEFAULT '0',
  `order_restriction` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ti_menus`
--

LOCK TABLES `ti_menus` WRITE;
/*!40000 ALTER TABLE `ti_menus` DISABLE KEYS */;
INSERT INTO `ti_menus` VALUES (1,'Puff-Puff','Traditional Nigerian donut ball, rolled in sugar',4.9900,NULL,1000,3,1,1,0,0),(2,'SCOTCH EGG','Boiled egg wrapped in a ground meat mixture, coated in breadcrumbs, and deep-fried.',2.0000,NULL,1000,1,1,1,0,0),(3,'ATA RICE','Small pieces of beef, goat, stipe, and tendon sautéed in crushed green Jamaican pepper.',12.0000,NULL,1000,1,0,1,0,0),(4,'RICE AND DODO','(plantains) w/chicken, fish, beef or goat',11.9900,NULL,1000,1,1,1,0,0),(5,'Special Shrimp Deluxe','Fresh shrimp sautéed in blended mixture of tomatoes, onion, peppers over choice of rice',12.9900,NULL,1000,1,1,1,0,0),(6,'Whole catfish with rice and vegetables','Whole catfish slow cooked in tomatoes, pepper and onion sauce with seasoning to taste',13.9900,NULL,1000,1,1,1,0,0),(7,'African Salad','With baked beans, egg, tuna, onion, tomatoes , green peas and carrot with your choice of dressing.',8.9900,NULL,500,1,0,1,0,0),(8,'Seafood Salad','With shrimp, egg and imitation crab meat',5.9900,NULL,1000,1,0,1,0,0),(9,'EBA','Grated cassava',11.9900,NULL,335,1,1,1,0,0),(10,'AMALA','Yam flour',11.9900,NULL,405,1,1,1,0,0),(11,'YAM PORRIDGE','in tomatoes sauce',9.9900,NULL,448,1,1,1,0,0),(12,'Boiled Plantain','w/spinach soup',9.9900,NULL,431,1,1,1,0,0);
/*!40000 ALTER TABLE `ti_menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ti_menus_specials`
--

DROP TABLE IF EXISTS `ti_menus_specials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ti_menus_specials` (
  `special_id` int NOT NULL AUTO_INCREMENT,
  `menu_id` int NOT NULL DEFAULT '0',
  `start_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `end_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `special_price` decimal(15,4) DEFAULT NULL,
  `special_status` tinyint(1) NOT NULL,
  `type` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `validity` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `recurring_every` text COLLATE utf8mb4_unicode_ci,
  `recurring_from` time DEFAULT NULL,
  `recurring_to` time DEFAULT NULL,
  PRIMARY KEY (`special_id`),
  UNIQUE KEY `menus_specials_special_id_menu_id_unique` (`special_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ti_menus_specials`
--

LOCK TABLES `ti_menus_specials` WRITE;
/*!40000 ALTER TABLE `ti_menus_specials` DISABLE KEYS */;
/*!40000 ALTER TABLE `ti_menus_specials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ti_migrations`
--

DROP TABLE IF EXISTS `ti_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ti_migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `group` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `migration` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ti_migrations`
--

LOCK TABLES `ti_migrations` WRITE;
/*!40000 ALTER TABLE `ti_migrations` DISABLE KEYS */;
INSERT INTO `ti_migrations` VALUES (1,'System','2015_03_25_000001_create_tables',1),(2,'System','2016_11_29_000300_optimize_tables_columns',1),(3,'System','2017_04_13_000300_modify_columns_on_users_and_customers_tables',1),(4,'System','2017_05_08_000300_add_columns',1),(5,'System','2017_06_11_000300_create_payments_and_payment_logs_table',1),(6,'System','2017_08_23_000300_create_themes_table',1),(7,'System','2018_01_23_000300_create_language_translations_table',1),(8,'System','2018_03_30_000300_create_extension_settings_table',1),(9,'System','2018_06_12_000300_rename_model_class_names_to_morph_map_custom_names',1),(10,'System','2018_10_19_000300_create_media_attachments_table',1),(11,'System','2018_10_21_131033_create_queue_table',1),(12,'System','2018_10_21_131044_create_sessions_table',1),(13,'System','2019_04_16_000300_nullify_customer_id_on_addresses_table',1),(14,'System','2019_07_01_000300_delete_unused_columns_from_activities_table',1),(15,'System','2019_07_22_000300_add_user_type_column_to_activities_table',1),(16,'System','2019_07_30_000300_create_mail_partials_table',1),(17,'System','2020_02_05_000300_delete_stale_unused_table',1),(18,'System','2020_04_16_000300_drop_stale_unused_columns',1),(19,'System','2020_05_24_000300_create_request_logs_table',1),(20,'Admin','2017_08_25_000300_create_location_areas_table',1),(21,'Admin','2017_08_25_000300_create_menu_categories_table',1),(22,'Admin','2018_01_19_000300_add_hash_columns_on_orders_reservations_table',1),(23,'Admin','2018_04_06_000300_drop_unique_on_order_totals_table',1),(24,'Admin','2018_04_12_000300_modify_columns_on_orders_reservations_table',1),(25,'Admin','2018_05_21_000300_drop_redundant_columns_on_kitchen_tables',1),(26,'Admin','2018_05_29_000300_add_columns_on_location_areas_table',1),(27,'Admin','2018_06_12_000300_create_locationables_table',1),(28,'Admin','2018_07_04_000300_create_user_preferences_table',1),(29,'Admin','2018_10_09_000300_auto_increment_on_order_totals_table',1),(30,'Admin','2019_04_09_000300_auto_increment_on_user_preferences_table',1),(31,'Admin','2019_07_02_000300_add_columns_on_menu_specials_table',1),(32,'Admin','2019_07_16_000300_create_reservation_tables_table',1),(33,'Admin','2019_07_21_000300_change_sort_value_ratings_to_config_on_settings_table',1),(34,'Admin','2019_11_08_000300_add_selected_columns_to_menu_options_table',1),(35,'Admin','2020_02_18_000400_create_staffs_groups_and_locations_table',1),(36,'Admin','2020_02_21_000400_create_staff_roles_table',1),(37,'Admin','2020_02_22_000300_remove_add_columns_on_staff_staff_groups_table',1),(38,'Admin','2020_02_25_000300_create_assignable_logs_table',1),(39,'Admin','2020_03_18_000300_add_quantity_column_to_order_menu_options_table',1),(40,'Admin','2020_04_05_000300_create_payment_profiles_table',1),(41,'Admin','2020_04_16_000300_drop_stale_unused_columns',1),(42,'Admin','2020_05_31_000300_drop_more_unused_columns',1),(43,'Admin','2020_06_11_000300_create_menu_mealtimes_table',1),(44,'Admin','2020_08_16_000300_modify_columns_on_tables_reservations_table',1),(45,'Admin','2020_08_18_000300_create_allergens_table',1),(46,'Admin','2020_09_28_000300_add_refund_columns_to_payment_logs_table',1),(47,'Admin','2020_12_13_000300_merge_staffs_locations_into_locationables_table',1),(48,'Admin','2020_12_22_000300_add_priority_column_to_location_areas_table',1),(49,'Admin','2021_01_04_000300_add_update_related_column_to_menu_options_table',1),(50,'Admin','2021_01_04_010000_add_order_time_is_asap_on_orders_table',1),(51,'igniter.cart','2017_10_20_000100_create_conditions_settings',1),(52,'igniter.cart','2017_11_20_010000_create_cart_table',1),(53,'igniter.cart','2018_09_20_010000_rename_content_field_on_cart_table',1),(54,'igniter.frontend','2018_01_28_000300_create_subscribers_table',1),(55,'igniter.frontend','2018_06_28_000300_create_banners_table',1),(56,'igniter.frontend','2019_11_02_000300_create_sliders_table',1),(57,'igniter.local','2020_09_17_000300_create_reviews_table_or_rename',1),(58,'igniter.local','2020_12_10_000300_update_reviews_table',1),(59,'igniter.local','2021_01_02_000300_add_last_location_area_customers_table',1),(60,'igniter.pages','2018_06_28_000300_create_pages_table',1),(61,'igniter.pages','2019_11_28_000300_create_menus_table',1),(62,'igniter.pages','2019_11_28_000400_alter_columns_on_pages_table',1),(63,'igniter.coupons','2020_09_17_000300_create_coupons_table_or_rename',1),(64,'igniter.coupons','2020_09_18_000300_create_coupon_relations_tables',1),(65,'igniter.coupons','2020_10_15_000300_create_cart_restriction',1),(66,'igniter.coupons','2020_11_01_000300_add_auto_apply_field_on_coupons_table',1);
/*!40000 ALTER TABLE `ti_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ti_order_menu_options`
--

DROP TABLE IF EXISTS `ti_order_menu_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ti_order_menu_options` (
  `order_option_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `menu_id` int NOT NULL,
  `order_option_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_option_price` decimal(15,4) DEFAULT NULL,
  `order_menu_id` int NOT NULL,
  `order_menu_option_id` int NOT NULL,
  `menu_option_value_id` int NOT NULL,
  `quantity` int DEFAULT '1',
  PRIMARY KEY (`order_option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ti_order_menu_options`
--

LOCK TABLES `ti_order_menu_options` WRITE;
/*!40000 ALTER TABLE `ti_order_menu_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `ti_order_menu_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ti_order_menus`
--

DROP TABLE IF EXISTS `ti_order_menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ti_order_menus` (
  `order_menu_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `menu_id` int NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int NOT NULL,
  `price` decimal(15,4) DEFAULT NULL,
  `subtotal` decimal(15,4) DEFAULT NULL,
  `option_values` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`order_menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ti_order_menus`
--

LOCK TABLES `ti_order_menus` WRITE;
/*!40000 ALTER TABLE `ti_order_menus` DISABLE KEYS */;
/*!40000 ALTER TABLE `ti_order_menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ti_order_totals`
--

DROP TABLE IF EXISTS `ti_order_totals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ti_order_totals` (
  `order_total_id` int unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int unsigned NOT NULL,
  `code` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` decimal(15,4) NOT NULL,
  `priority` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_total_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ti_order_totals`
--

LOCK TABLES `ti_order_totals` WRITE;
/*!40000 ALTER TABLE `ti_order_totals` DISABLE KEYS */;
/*!40000 ALTER TABLE `ti_order_totals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ti_orders`
--

DROP TABLE IF EXISTS `ti_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ti_orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int DEFAULT NULL,
  `first_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(96) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telephone` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `location_id` int NOT NULL,
  `address_id` int DEFAULT NULL,
  `cart` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_items` int NOT NULL,
  `comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `payment` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_type` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `order_time` time NOT NULL,
  `order_date` date NOT NULL,
  `order_total` decimal(15,4) DEFAULT NULL,
  `status_id` int NOT NULL,
  `ip_address` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_agent` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `assignee_id` int DEFAULT NULL,
  `assignee_group_id` int unsigned DEFAULT NULL,
  `invoice_prefix` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_date` datetime DEFAULT NULL,
  `hash` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `processed` tinyint(1) DEFAULT NULL,
  `status_updated_at` datetime DEFAULT NULL,
  `assignee_updated_at` datetime DEFAULT NULL,
  `order_time_is_asap` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_id`),
  KEY `orders_hash_index` (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ti_orders`
--

LOCK TABLES `ti_orders` WRITE;
/*!40000 ALTER TABLE `ti_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `ti_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ti_pages`
--

DROP TABLE IF EXISTS `ti_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ti_pages` (
  `page_id` int NOT NULL AUTO_INCREMENT,
  `language_id` int NOT NULL,
  `title` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keywords` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_added` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `status` tinyint(1) NOT NULL,
  `permalink_slug` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `layout` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `metadata` mediumtext COLLATE utf8mb4_unicode_ci,
  `priority` int DEFAULT NULL,
  PRIMARY KEY (`page_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ti_pages`
--

LOCK TABLES `ti_pages` WRITE;
/*!40000 ALTER TABLE `ti_pages` DISABLE KEYS */;
INSERT INTO `ti_pages` VALUES (1,1,'About Us','Lorem ipsum dolor sit amet, consectetur adipiscing elit.','','','2021-02-09 14:03:11','2021-02-09 14:03:11',1,'about-us','static','{\"navigation\":\"0\"}',NULL),(2,1,'Policy','Lorem ipsum dolor sit amet, consectetur adipiscing elit.','','','2021-02-09 14:03:11','2021-02-09 14:03:11',1,'policy','static','{\"navigation\":\"0\"}',NULL),(3,1,'Terms and Conditions','Lorem ipsum dolor sit amet, consectetur adipiscing elit.','','','2021-02-09 14:03:11','2021-02-09 14:03:11',1,'terms-and-conditions','static','{\"navigation\":\"0\"}',NULL);
/*!40000 ALTER TABLE `ti_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ti_payment_logs`
--

DROP TABLE IF EXISTS `ti_payment_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ti_payment_logs` (
  `payment_log_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `payment_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `request` text COLLATE utf8mb4_unicode_ci,
  `response` text COLLATE utf8mb4_unicode_ci,
  `is_success` tinyint(1) NOT NULL DEFAULT '0',
  `date_added` datetime DEFAULT NULL,
  `date_updated` datetime DEFAULT NULL,
  `payment_code` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_refundable` tinyint(1) NOT NULL DEFAULT '0',
  `refunded_at` datetime DEFAULT NULL,
  PRIMARY KEY (`payment_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ti_payment_logs`
--

LOCK TABLES `ti_payment_logs` WRITE;
/*!40000 ALTER TABLE `ti_payment_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `ti_payment_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ti_payment_profiles`
--

DROP TABLE IF EXISTS `ti_payment_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ti_payment_profiles` (
  `payment_profile_id` int unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int unsigned DEFAULT NULL,
  `payment_id` int unsigned DEFAULT NULL,
  `card_brand` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_last4` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile_data` text COLLATE utf8mb4_unicode_ci,
  `is_primary` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`payment_profile_id`),
  KEY `payment_profiles_customer_id_index` (`customer_id`),
  KEY `payment_profiles_payment_id_index` (`payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ti_payment_profiles`
--

LOCK TABLES `ti_payment_profiles` WRITE;
/*!40000 ALTER TABLE `ti_payment_profiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `ti_payment_profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ti_payments`
--

DROP TABLE IF EXISTS `ti_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ti_payments` (
  `payment_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `class_name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `data` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `priority` int NOT NULL DEFAULT '0',
  `date_added` datetime DEFAULT NULL,
  `date_updated` datetime DEFAULT NULL,
  PRIMARY KEY (`payment_id`),
  UNIQUE KEY `payments_code_unique` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ti_payments`
--

LOCK TABLES `ti_payments` WRITE;
/*!40000 ALTER TABLE `ti_payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `ti_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ti_request_logs`
--

DROP TABLE IF EXISTS `ti_request_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ti_request_logs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_code` int DEFAULT NULL,
  `referrer` text COLLATE utf8mb4_unicode_ci,
  `count` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ti_request_logs`
--

LOCK TABLES `ti_request_logs` WRITE;
/*!40000 ALTER TABLE `ti_request_logs` DISABLE KEYS */;
INSERT INTO `ti_request_logs` VALUES (1,'https://staging.alfredmenu.com/registeer',404,NULL,1,'2021-02-09 17:44:25','2021-02-09 17:44:25'),(2,'https://staging.alfredmenu.com/.well-known/acme-challenge/2PUKZ4RHOO-PYKQL8ACKHCOR9XVCNMWH',404,NULL,1,'2021-02-10 03:13:53','2021-02-10 03:13:53');
/*!40000 ALTER TABLE `ti_request_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ti_reservation_tables`
--

DROP TABLE IF EXISTS `ti_reservation_tables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ti_reservation_tables` (
  `reservation_id` int unsigned NOT NULL,
  `table_id` int unsigned NOT NULL,
  UNIQUE KEY `reservation_tables_reservation_id_table_id_unique` (`reservation_id`,`table_id`),
  KEY `reservation_tables_reservation_id_index` (`reservation_id`),
  KEY `reservation_tables_table_id_index` (`table_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ti_reservation_tables`
--

LOCK TABLES `ti_reservation_tables` WRITE;
/*!40000 ALTER TABLE `ti_reservation_tables` DISABLE KEYS */;
/*!40000 ALTER TABLE `ti_reservation_tables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ti_reservations`
--

DROP TABLE IF EXISTS `ti_reservations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ti_reservations` (
  `reservation_id` int NOT NULL AUTO_INCREMENT,
  `location_id` int NOT NULL,
  `table_id` int NOT NULL,
  `guest_num` int NOT NULL,
  `occasion_id` int DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  `first_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(96) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telephone` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `reserve_time` time NOT NULL,
  `reserve_date` date NOT NULL,
  `date_added` date NOT NULL,
  `date_modified` date NOT NULL,
  `assignee_id` int DEFAULT NULL,
  `assignee_group_id` int unsigned DEFAULT NULL,
  `notify` tinyint(1) DEFAULT NULL,
  `ip_address` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_agent` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_id` tinyint(1) NOT NULL,
  `hash` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `duration` int DEFAULT NULL,
  `processed` tinyint(1) DEFAULT NULL,
  `status_updated_at` datetime DEFAULT NULL,
  `assignee_updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`reservation_id`),
  KEY `reservations_location_id_table_id_index` (`location_id`,`table_id`),
  KEY `reservations_hash_index` (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ti_reservations`
--

LOCK TABLES `ti_reservations` WRITE;
/*!40000 ALTER TABLE `ti_reservations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ti_reservations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ti_sessions`
--

DROP TABLE IF EXISTS `ti_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ti_sessions` (
  `id` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci,
  `last_activity` int DEFAULT NULL,
  UNIQUE KEY `sessions_id_unique` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ti_sessions`
--

LOCK TABLES `ti_sessions` WRITE;
/*!40000 ALTER TABLE `ti_sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `ti_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ti_settings`
--

DROP TABLE IF EXISTS `ti_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ti_settings` (
  `setting_id` int NOT NULL AUTO_INCREMENT,
  `sort` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `serialized` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`setting_id`),
  UNIQUE KEY `settings_sort_item_unique` (`sort`,`item`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ti_settings`
--

LOCK TABLES `ti_settings` WRITE;
/*!40000 ALTER TABLE `ti_settings` DISABLE KEYS */;
INSERT INTO `ti_settings` VALUES (1,'config','site_location_mode','multiple',NULL),(2,'prefs','default_location_id','1',NULL),(3,'config','site_logo','no_photo.png',NULL),(4,'config','country_id','222',NULL),(5,'config','timezone','Europe/London',NULL),(6,'config','default_currency_code','GBP',NULL),(7,'config','default_language','en',NULL),(8,'config','detect_language','0',NULL),(10,'config','allow_registration','1',NULL),(11,'config','customer_group_id','11',NULL),(15,'config','maps_api_key','',NULL),(16,'config','distance_unit','mi',NULL),(17,'config','location_order','0',NULL),(18,'config','location_order_email','0',NULL),(19,'config','location_reserve_email','0',NULL),(20,'config','default_order_status','1',NULL),(23,'config','menus_page','local/menus',NULL),(24,'config','guest_order','1',NULL),(25,'config','default_reservation_status','8',NULL),(26,'config','confirmed_reservation_status','6',NULL),(27,'config','canceled_order_status','9',NULL),(28,'config','canceled_reservation_status','7',NULL),(30,'config','tax_mode','0',NULL),(31,'config','invoice_prefix','INV-{year}-00',NULL),(32,'config','protocol','sendmail',NULL),(33,'config','smtp_host','smtp.mailgun.org',NULL),(34,'config','smtp_port','587',NULL),(35,'config','smtp_user','',NULL),(36,'config','smtp_pass','',NULL),(37,'config','log_threshold','1',NULL),(38,'config','permalink','1',NULL),(39,'config','maintenance_mode','0',NULL),(40,'config','maintenance_message','Site is under maintenance. Please check back later.',NULL),(41,'config','cache_mode','0',NULL),(42,'config','cache_time','0',NULL),(44,'prefs','ti_setup','installed',NULL),(45,'prefs','ti_version','v3.0.4-beta.27',NULL),(46,'prefs','sys_hash','e8de07ec28d5d20d5b637ef5ba461adb0d9e5289',NULL),(48,'config','completed_order_status.0','5',NULL),(49,'config','image_manager.max_size','300',NULL),(50,'config','image_manager.thumb_width','320',NULL),(51,'config','image_manager.thumb_height','220',NULL),(52,'config','image_manager.uploads','1',NULL),(53,'config','image_manager.new_folder','1',NULL),(54,'config','image_manager.copy','1',NULL),(55,'config','image_manager.move','1',NULL),(56,'config','image_manager.rename','1',NULL),(57,'config','image_manager.delete','1',NULL),(58,'config','image_manager.transliteration','0',NULL),(59,'config','image_manager.remember_days','7',NULL),(60,'config','order_email.0','customer',NULL),(61,'config','order_email.1','admin',NULL),(62,'config','processing_order_status.0','2',NULL),(63,'config','processing_order_status.1','3',NULL),(64,'config','processing_order_status.2','4',NULL),(65,'config','registration_email.0','customer',NULL),(66,'config','reservation_email.0','customer',NULL),(67,'config','reservation_email.1','admin',NULL),(68,'config','supported_languages.0','en',NULL),(69,'config','demo_data','1',NULL),(70,'config','site_name','TastyIgniter',NULL),(71,'config','site_email','admin@restaurant.com',NULL),(72,'config','staff_name','Chef Sam',NULL),(73,'config','username','admin',NULL),(74,'config','password','12345678',NULL),(75,'config','sender_name','TastyIgniter',NULL),(76,'config','sender_email','admin@restaurant.com',NULL),(78,'config','installed_themes.demo','1',NULL),(79,'config','installed_themes.tastyigniter-orange','1',NULL),(80,'prefs','default_themes.main','tastyigniter-orange-t9c',NULL),(81,'config','installed_themes.tastyigniter-orange-t9c','1',NULL);
/*!40000 ALTER TABLE `ti_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ti_staff_groups`
--

DROP TABLE IF EXISTS `ti_staff_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ti_staff_groups` (
  `staff_group_id` int NOT NULL AUTO_INCREMENT,
  `staff_group_name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `auto_assign` tinyint(1) DEFAULT '0',
  `auto_assign_mode` tinyint DEFAULT '1',
  `auto_assign_limit` int DEFAULT '20',
  `auto_assign_availability` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`staff_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ti_staff_groups`
--

LOCK TABLES `ti_staff_groups` WRITE;
/*!40000 ALTER TABLE `ti_staff_groups` DISABLE KEYS */;
INSERT INTO `ti_staff_groups` VALUES (1,'Owners','','Default group for owners',0,1,20,1),(2,'Managers','','Default group for managers',0,1,20,1),(3,'Waiters','','Default group for waiters.',0,1,20,1),(4,'Delivery','','Default group for delivery drivers.',0,1,20,1);
/*!40000 ALTER TABLE `ti_staff_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ti_staff_roles`
--

DROP TABLE IF EXISTS `ti_staff_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ti_staff_roles` (
  `staff_role_id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`staff_role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ti_staff_roles`
--

LOCK TABLES `ti_staff_roles` WRITE;
/*!40000 ALTER TABLE `ti_staff_roles` DISABLE KEYS */;
INSERT INTO `ti_staff_roles` VALUES (1,'Owner','owner','Default role for restaurant owners',NULL,NULL,NULL),(2,'Manager','manager','Default role for restaurant managers.','a:16:{s:15:\"Admin.Dashboard\";s:1:\"1\";s:16:\"Admin.Categories\";s:1:\"1\";s:14:\"Admin.Statuses\";s:1:\"1\";s:12:\"Admin.Staffs\";s:1:\"1\";s:17:\"Admin.StaffGroups\";s:1:\"1\";s:15:\"Admin.Customers\";s:1:\"1\";s:20:\"Admin.CustomerGroups\";s:1:\"1\";s:14:\"Admin.Payments\";s:1:\"1\";s:18:\"Admin.Reservations\";s:1:\"1\";s:12:\"Admin.Orders\";s:1:\"1\";s:12:\"Admin.Tables\";s:1:\"1\";s:15:\"Admin.Locations\";s:1:\"1\";s:15:\"Admin.Mealtimes\";s:1:\"1\";s:11:\"Admin.Menus\";s:1:\"1\";s:11:\"Site.Themes\";s:1:\"1\";s:18:\"Admin.MediaManager\";s:1:\"1\";}',NULL,NULL),(3,'Waiter','waiter','Default role for restaurant waiters.','a:4:{s:16:\"Admin.Categories\";s:1:\"1\";s:18:\"Admin.Reservations\";s:1:\"1\";s:12:\"Admin.Orders\";s:1:\"1\";s:11:\"Admin.Menus\";s:1:\"1\";}',NULL,NULL),(4,'Delivery','delivery','Default role for restaurant delivery.','a:3:{s:14:\"Admin.Statuses\";s:1:\"1\";s:18:\"Admin.Reservations\";s:1:\"1\";s:12:\"Admin.Orders\";s:1:\"1\";}',NULL,NULL);
/*!40000 ALTER TABLE `ti_staff_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ti_staffs`
--

DROP TABLE IF EXISTS `ti_staffs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ti_staffs` (
  `staff_id` int NOT NULL AUTO_INCREMENT,
  `staff_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `staff_email` varchar(96) COLLATE utf8mb4_unicode_ci NOT NULL,
  `staff_role_id` int NOT NULL,
  `staff_location_id` int NOT NULL,
  `timezone` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `language_id` int DEFAULT NULL,
  `date_added` date NOT NULL,
  `staff_status` tinyint(1) NOT NULL,
  `sale_permission` tinyint DEFAULT '1',
  PRIMARY KEY (`staff_id`),
  UNIQUE KEY `staff_email` (`staff_email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ti_staffs`
--

LOCK TABLES `ti_staffs` WRITE;
/*!40000 ALTER TABLE `ti_staffs` DISABLE KEYS */;
INSERT INTO `ti_staffs` VALUES (1,'Chef Sam','admin@restaurant.com',1,1,'0',1,'2021-02-09',1,1);
/*!40000 ALTER TABLE `ti_staffs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ti_staffs_groups`
--

DROP TABLE IF EXISTS `ti_staffs_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ti_staffs_groups` (
  `staff_id` int unsigned NOT NULL,
  `staff_group_id` int unsigned NOT NULL,
  PRIMARY KEY (`staff_id`,`staff_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ti_staffs_groups`
--

LOCK TABLES `ti_staffs_groups` WRITE;
/*!40000 ALTER TABLE `ti_staffs_groups` DISABLE KEYS */;
INSERT INTO `ti_staffs_groups` VALUES (1,1);
/*!40000 ALTER TABLE `ti_staffs_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ti_status_history`
--

DROP TABLE IF EXISTS `ti_status_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ti_status_history` (
  `status_history_id` int NOT NULL AUTO_INCREMENT,
  `object_id` int NOT NULL,
  `object_type` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `staff_id` int DEFAULT NULL,
  `status_id` int NOT NULL,
  `notify` tinyint(1) DEFAULT NULL,
  `comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`status_history_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ti_status_history`
--

LOCK TABLES `ti_status_history` WRITE;
/*!40000 ALTER TABLE `ti_status_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `ti_status_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ti_statuses`
--

DROP TABLE IF EXISTS `ti_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ti_statuses` (
  `status_id` int NOT NULL AUTO_INCREMENT,
  `status_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `notify_customer` tinyint(1) DEFAULT NULL,
  `status_for` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_color` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ti_statuses`
--

LOCK TABLES `ti_statuses` WRITE;
/*!40000 ALTER TABLE `ti_statuses` DISABLE KEYS */;
INSERT INTO `ti_statuses` VALUES (1,'Received','Your order has been received.',1,'order','#686663'),(2,'Pending','Your order is pending',1,'order','#f0ad4e'),(3,'Preparation','Your order is in the kitchen',1,'order','#00c0ef'),(4,'Delivery','Your order will be with you shortly.',0,'order','#00a65a'),(5,'Completed','',0,'order','#00a65a'),(6,'Confirmed','Your table reservation has been confirmed.',0,'reserve','#00a65a'),(7,'Canceled','Your table reservation has been canceled.',0,'reserve','#dd4b39'),(8,'Pending','Your table reservation is pending.',0,'reserve',''),(9,'Canceled','',0,'order','#ea0b29');
/*!40000 ALTER TABLE `ti_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ti_tables`
--

DROP TABLE IF EXISTS `ti_tables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ti_tables` (
  `table_id` int NOT NULL AUTO_INCREMENT,
  `table_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `min_capacity` int NOT NULL,
  `max_capacity` int NOT NULL,
  `table_status` tinyint(1) NOT NULL,
  `extra_capacity` int NOT NULL DEFAULT '0',
  `is_joinable` tinyint(1) NOT NULL DEFAULT '1',
  `priority` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ti_tables`
--

LOCK TABLES `ti_tables` WRITE;
/*!40000 ALTER TABLE `ti_tables` DISABLE KEYS */;
INSERT INTO `ti_tables` VALUES (1,'Table 1',5,10,1,0,1,0),(2,'Table 2',4,6,1,0,1,0),(3,'Table 3',4,11,1,0,1,0),(4,'Table 4',5,10,1,0,1,0),(5,'Table 5',5,12,1,0,1,0),(6,'Table 6',4,9,1,0,1,0),(7,'Table 7',2,9,1,0,1,0),(8,'Table 8',3,8,1,0,1,0),(9,'Table 9',2,9,1,0,1,0),(10,'Table 10',3,12,1,0,1,0),(11,'Table 11',2,7,1,0,1,0),(12,'Table 12',4,6,1,0,1,0),(13,'Table 13',2,11,1,0,1,0),(14,'Table 14',4,6,1,0,1,0);
/*!40000 ALTER TABLE `ti_tables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ti_themes`
--

DROP TABLE IF EXISTS `ti_themes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ti_themes` (
  `theme_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `version` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT '0.0.1',
  `data` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`theme_id`),
  UNIQUE KEY `themes_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ti_themes`
--

LOCK TABLES `ti_themes` WRITE;
/*!40000 ALTER TABLE `ti_themes` DISABLE KEYS */;
INSERT INTO `ti_themes` VALUES (1,'Demo Theme','demo','Demonstration theme for TastyIgniter front-end','0.1.0',NULL,1,0),(2,'Orange Theme','tastyigniter-orange','Free Modern, Responsive and Clean TastyIgniter Theme based on Bootstrap 4.','v2.8.0',NULL,1,0),(3,'Orange Theme [child]','tastyigniter-orange-t9c','Free Modern, Responsive and Clean TastyIgniter Theme based on Bootstrap 4.','0.0.1','a:0:{}',1,0);
/*!40000 ALTER TABLE `ti_themes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ti_user_preferences`
--

DROP TABLE IF EXISTS `ti_user_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ti_user_preferences` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `item` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ti_user_preferences`
--

LOCK TABLES `ti_user_preferences` WRITE;
/*!40000 ALTER TABLE `ti_user_preferences` DISABLE KEYS */;
/*!40000 ALTER TABLE `ti_user_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ti_users`
--

DROP TABLE IF EXISTS `ti_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ti_users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `staff_id` int NOT NULL,
  `username` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `salt` varchar(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `super_user` tinyint(1) DEFAULT NULL,
  `reset_code` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reset_time` datetime DEFAULT NULL,
  `activation_code` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_activated` tinyint(1) DEFAULT NULL,
  `date_activated` datetime DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `last_seen` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `users_staff_id_unique` (`staff_id`),
  UNIQUE KEY `users_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ti_users`
--

LOCK TABLES `ti_users` WRITE;
/*!40000 ALTER TABLE `ti_users` DISABLE KEYS */;
INSERT INTO `ti_users` VALUES (1,1,'admin','$2y$10$VN8FrnIzhVEpmcWpEqMbTeIhOxQtbTXkz79GePsVPNs0KWgdSc1yC',NULL,1,NULL,NULL,NULL,'VfnQYTdCDOjdP6opufYVRANqbpfS58RO5K93utntFF',1,'2021-02-09 14:03:10','2021-02-09 14:05:16',NULL);
/*!40000 ALTER TABLE `ti_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ti_working_hours`
--

DROP TABLE IF EXISTS `ti_working_hours`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ti_working_hours` (
  `location_id` int NOT NULL,
  `weekday` int NOT NULL,
  `opening_time` time NOT NULL DEFAULT '00:00:00',
  `closing_time` time NOT NULL DEFAULT '00:00:00',
  `status` tinyint(1) NOT NULL,
  `type` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  KEY `working_hours_location_id_weekday_type_index` (`location_id`,`weekday`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ti_working_hours`
--

LOCK TABLES `ti_working_hours` WRITE;
/*!40000 ALTER TABLE `ti_working_hours` DISABLE KEYS */;
INSERT INTO `ti_working_hours` VALUES (1,0,'00:00:00','23:59:00',1,'opening'),(1,1,'00:00:00','23:59:00',1,'opening'),(1,2,'00:00:00','23:59:00',1,'opening'),(1,3,'00:00:00','23:59:00',1,'opening'),(1,4,'00:00:00','23:59:00',1,'opening'),(1,5,'00:00:00','23:59:00',1,'opening'),(1,6,'00:00:00','23:59:00',1,'opening'),(1,0,'00:00:00','23:59:00',1,'delivery'),(1,1,'00:00:00','23:59:00',1,'delivery'),(1,2,'00:00:00','23:59:00',1,'delivery'),(1,3,'00:00:00','23:59:00',1,'delivery'),(1,4,'00:00:00','23:59:00',1,'delivery'),(1,5,'00:00:00','23:59:00',1,'delivery'),(1,6,'00:00:00','23:59:00',1,'delivery'),(1,0,'00:00:00','23:59:00',1,'collection'),(1,1,'00:00:00','23:59:00',1,'collection'),(1,2,'00:00:00','23:59:00',1,'collection'),(1,3,'00:00:00','23:59:00',1,'collection'),(1,4,'00:00:00','23:59:00',1,'collection'),(1,5,'00:00:00','23:59:00',1,'collection'),(1,6,'00:00:00','23:59:00',1,'collection');
/*!40000 ALTER TABLE `ti_working_hours` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-02-10 13:05:15
