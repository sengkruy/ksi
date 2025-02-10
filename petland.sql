-- MySQL dump 10.13  Distrib 8.0.25, for Linux (x86_64)
--
-- Host: localhost    Database: petland
-- ------------------------------------------------------
-- Server version	8.0.25

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
-- Table structure for table `sma_addresses`
--

DROP TABLE IF EXISTS `sma_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_addresses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `company_id` int NOT NULL,
  `line1` varchar(50) NOT NULL,
  `line2` varchar(50) DEFAULT NULL,
  `city` varchar(25) NOT NULL,
  `postal_code` varchar(20) DEFAULT NULL,
  `state` varchar(25) NOT NULL,
  `country` varchar(50) NOT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  KEY `company_id` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_addresses`
--

LOCK TABLES `sma_addresses` WRITE;
/*!40000 ALTER TABLE `sma_addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `sma_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_adjustment_items`
--

DROP TABLE IF EXISTS `sma_adjustment_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_adjustment_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `adjustment_id` int NOT NULL,
  `product_id` int NOT NULL,
  `option_id` int DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `type` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `adjustment_id` (`adjustment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_adjustment_items`
--

LOCK TABLES `sma_adjustment_items` WRITE;
/*!40000 ALTER TABLE `sma_adjustment_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `sma_adjustment_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_adjustments`
--

DROP TABLE IF EXISTS `sma_adjustments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_adjustments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL,
  `reference_no` varchar(55) NOT NULL,
  `warehouse_id` int NOT NULL,
  `note` text,
  `attachment` varchar(55) DEFAULT NULL,
  `created_by` int NOT NULL,
  `updated_by` int DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `count_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `warehouse_id` (`warehouse_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_adjustments`
--

LOCK TABLES `sma_adjustments` WRITE;
/*!40000 ALTER TABLE `sma_adjustments` DISABLE KEYS */;
/*!40000 ALTER TABLE `sma_adjustments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_api_keys`
--

DROP TABLE IF EXISTS `sma_api_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_api_keys` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `reference` varchar(40) NOT NULL,
  `key` varchar(40) NOT NULL,
  `level` int NOT NULL,
  `ignore_limits` tinyint(1) NOT NULL DEFAULT '0',
  `is_private_key` tinyint(1) NOT NULL DEFAULT '0',
  `ip_addresses` text,
  `date_created` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_api_keys`
--

LOCK TABLES `sma_api_keys` WRITE;
/*!40000 ALTER TABLE `sma_api_keys` DISABLE KEYS */;
/*!40000 ALTER TABLE `sma_api_keys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_api_limits`
--

DROP TABLE IF EXISTS `sma_api_limits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_api_limits` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uri` varchar(255) NOT NULL,
  `count` int NOT NULL,
  `hour_started` int NOT NULL,
  `api_key` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_api_limits`
--

LOCK TABLES `sma_api_limits` WRITE;
/*!40000 ALTER TABLE `sma_api_limits` DISABLE KEYS */;
/*!40000 ALTER TABLE `sma_api_limits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_api_logs`
--

DROP TABLE IF EXISTS `sma_api_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_api_logs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uri` varchar(255) NOT NULL,
  `method` varchar(6) NOT NULL,
  `params` text,
  `api_key` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `time` int NOT NULL,
  `rtime` float DEFAULT NULL,
  `authorized` varchar(1) NOT NULL,
  `response_code` smallint DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_api_logs`
--

LOCK TABLES `sma_api_logs` WRITE;
/*!40000 ALTER TABLE `sma_api_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `sma_api_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_attachments`
--

DROP TABLE IF EXISTS `sma_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_attachments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `subject_id` int NOT NULL,
  `subject_type` varchar(55) NOT NULL,
  `file_name` varchar(100) NOT NULL,
  `orig_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_attachments`
--

LOCK TABLES `sma_attachments` WRITE;
/*!40000 ALTER TABLE `sma_attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `sma_attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_brands`
--

DROP TABLE IF EXISTS `sma_brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_brands` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(20) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `image` varchar(50) DEFAULT NULL,
  `slug` varchar(55) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_brands`
--

LOCK TABLES `sma_brands` WRITE;
/*!40000 ALTER TABLE `sma_brands` DISABLE KEYS */;
/*!40000 ALTER TABLE `sma_brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_calendar`
--

DROP TABLE IF EXISTS `sma_calendar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_calendar` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(55) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `start` datetime NOT NULL,
  `end` datetime DEFAULT NULL,
  `color` varchar(7) NOT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_calendar`
--

LOCK TABLES `sma_calendar` WRITE;
/*!40000 ALTER TABLE `sma_calendar` DISABLE KEYS */;
/*!40000 ALTER TABLE `sma_calendar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_captcha`
--

DROP TABLE IF EXISTS `sma_captcha`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_captcha` (
  `captcha_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `captcha_time` int unsigned NOT NULL,
  `ip_address` varchar(16) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '0',
  `word` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`captcha_id`),
  KEY `word` (`word`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_captcha`
--

LOCK TABLES `sma_captcha` WRITE;
/*!40000 ALTER TABLE `sma_captcha` DISABLE KEYS */;
/*!40000 ALTER TABLE `sma_captcha` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_cart`
--

DROP TABLE IF EXISTS `sma_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_cart` (
  `id` varchar(40) NOT NULL,
  `time` varchar(30) NOT NULL,
  `user_id` int DEFAULT NULL,
  `data` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_cart`
--

LOCK TABLES `sma_cart` WRITE;
/*!40000 ALTER TABLE `sma_cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `sma_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_categories`
--

DROP TABLE IF EXISTS `sma_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(55) NOT NULL,
  `name` varchar(55) NOT NULL,
  `image` varchar(55) DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `slug` varchar(55) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_categories`
--

LOCK TABLES `sma_categories` WRITE;
/*!40000 ALTER TABLE `sma_categories` DISABLE KEYS */;
INSERT INTO `sma_categories` VALUES (1,'C1','Category 1',NULL,NULL,'category-1',NULL);
/*!40000 ALTER TABLE `sma_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_combo_items`
--

DROP TABLE IF EXISTS `sma_combo_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_combo_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `item_code` varchar(20) NOT NULL,
  `quantity` decimal(12,4) NOT NULL,
  `unit_price` decimal(25,4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_combo_items`
--

LOCK TABLES `sma_combo_items` WRITE;
/*!40000 ALTER TABLE `sma_combo_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `sma_combo_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_companies`
--

DROP TABLE IF EXISTS `sma_companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_companies` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int unsigned DEFAULT NULL,
  `group_name` varchar(20) NOT NULL,
  `customer_group_id` int DEFAULT NULL,
  `customer_group_name` varchar(100) DEFAULT NULL,
  `name` varchar(55) NOT NULL,
  `company` varchar(255) NOT NULL,
  `vat_no` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(55) DEFAULT NULL,
  `state` varchar(55) DEFAULT NULL,
  `postal_code` varchar(8) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `cf1` varchar(100) DEFAULT NULL,
  `cf2` varchar(100) DEFAULT NULL,
  `cf3` varchar(100) DEFAULT NULL,
  `cf4` varchar(100) DEFAULT NULL,
  `cf5` varchar(100) DEFAULT NULL,
  `cf6` varchar(100) DEFAULT NULL,
  `invoice_footer` text,
  `payment_term` int DEFAULT '0',
  `logo` varchar(255) DEFAULT 'logo.png',
  `award_points` int DEFAULT '0',
  `deposit_amount` decimal(25,4) DEFAULT NULL,
  `price_group_id` int DEFAULT NULL,
  `price_group_name` varchar(50) DEFAULT NULL,
  `gst_no` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`),
  KEY `group_id_2` (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_companies`
--

LOCK TABLES `sma_companies` WRITE;
/*!40000 ALTER TABLE `sma_companies` DISABLE KEYS */;
INSERT INTO `sma_companies` VALUES (1,3,'customer',1,'General','Walk-in Customer','Walk-in Customer','','Customer Address','Petaling Jaya','Selangor','46000','Malaysia','0123456789','customer@tecdiary.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,NULL),(2,4,'supplier',NULL,NULL,'Test Supplier','Supplier Company Name',NULL,'Supplier Address','Petaling Jaya','Selangor','46050','Malaysia','0123456789','supplier@tecdiary.com','-','-','-','-','-','-',NULL,0,'logo.png',0,NULL,NULL,NULL,NULL),(3,NULL,'biller',NULL,NULL,'Mian Saleem','Test Biller','5555','Biller adddress','City','','','Country','012345678','saleem@tecdiary.com','','','','','','',' Thank you for shopping with us. Please come again',0,'logo1.png',0,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `sma_companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_costing`
--

DROP TABLE IF EXISTS `sma_costing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_costing` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `product_id` int DEFAULT NULL,
  `sale_item_id` int NOT NULL,
  `sale_id` int DEFAULT NULL,
  `purchase_item_id` int DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `purchase_net_unit_cost` decimal(25,4) DEFAULT NULL,
  `purchase_unit_cost` decimal(25,4) DEFAULT NULL,
  `sale_net_unit_price` decimal(25,4) NOT NULL,
  `sale_unit_price` decimal(25,4) NOT NULL,
  `quantity_balance` decimal(15,4) DEFAULT NULL,
  `inventory` tinyint(1) DEFAULT '0',
  `overselling` tinyint(1) DEFAULT '0',
  `option_id` int DEFAULT NULL,
  `purchase_id` int DEFAULT NULL,
  `transfer_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_costing`
--

LOCK TABLES `sma_costing` WRITE;
/*!40000 ALTER TABLE `sma_costing` DISABLE KEYS */;
/*!40000 ALTER TABLE `sma_costing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_currencies`
--

DROP TABLE IF EXISTS `sma_currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_currencies` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(5) NOT NULL,
  `name` varchar(55) NOT NULL,
  `rate` decimal(12,4) NOT NULL,
  `auto_update` tinyint(1) NOT NULL DEFAULT '0',
  `symbol` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_currencies`
--

LOCK TABLES `sma_currencies` WRITE;
/*!40000 ALTER TABLE `sma_currencies` DISABLE KEYS */;
INSERT INTO `sma_currencies` VALUES (1,'USD','US Dollar',1.0000,0,NULL),(2,'EUR','EURO',0.7340,0,NULL);
/*!40000 ALTER TABLE `sma_currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_customer_groups`
--

DROP TABLE IF EXISTS `sma_customer_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_customer_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `percent` int NOT NULL,
  `discount` tinyint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_customer_groups`
--

LOCK TABLES `sma_customer_groups` WRITE;
/*!40000 ALTER TABLE `sma_customer_groups` DISABLE KEYS */;
INSERT INTO `sma_customer_groups` VALUES (1,'General',0,NULL),(2,'Reseller',-5,NULL),(3,'Distributor',-15,NULL),(4,'New Customer (+10)',10,NULL);
/*!40000 ALTER TABLE `sma_customer_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_date_format`
--

DROP TABLE IF EXISTS `sma_date_format`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_date_format` (
  `id` int NOT NULL AUTO_INCREMENT,
  `js` varchar(20) NOT NULL,
  `php` varchar(20) NOT NULL,
  `sql` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_date_format`
--

LOCK TABLES `sma_date_format` WRITE;
/*!40000 ALTER TABLE `sma_date_format` DISABLE KEYS */;
INSERT INTO `sma_date_format` VALUES (1,'mm-dd-yyyy','m-d-Y','%m-%d-%Y'),(2,'mm/dd/yyyy','m/d/Y','%m/%d/%Y'),(3,'mm.dd.yyyy','m.d.Y','%m.%d.%Y'),(4,'dd-mm-yyyy','d-m-Y','%d-%m-%Y'),(5,'dd/mm/yyyy','d/m/Y','%d/%m/%Y'),(6,'dd.mm.yyyy','d.m.Y','%d.%m.%Y');
/*!40000 ALTER TABLE `sma_date_format` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_deliveries`
--

DROP TABLE IF EXISTS `sma_deliveries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_deliveries` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sale_id` int NOT NULL,
  `do_reference_no` varchar(50) NOT NULL,
  `sale_reference_no` varchar(50) NOT NULL,
  `customer` varchar(55) NOT NULL,
  `address` varchar(1000) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `status` varchar(15) DEFAULT NULL,
  `attachment` varchar(50) DEFAULT NULL,
  `delivered_by` varchar(50) DEFAULT NULL,
  `received_by` varchar(50) DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_deliveries`
--

LOCK TABLES `sma_deliveries` WRITE;
/*!40000 ALTER TABLE `sma_deliveries` DISABLE KEYS */;
/*!40000 ALTER TABLE `sma_deliveries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_deposits`
--

DROP TABLE IF EXISTS `sma_deposits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_deposits` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `company_id` int NOT NULL,
  `amount` decimal(25,4) NOT NULL,
  `paid_by` varchar(50) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `created_by` int NOT NULL,
  `updated_by` int NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_deposits`
--

LOCK TABLES `sma_deposits` WRITE;
/*!40000 ALTER TABLE `sma_deposits` DISABLE KEYS */;
/*!40000 ALTER TABLE `sma_deposits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_expense_categories`
--

DROP TABLE IF EXISTS `sma_expense_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_expense_categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(55) NOT NULL,
  `name` varchar(55) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_expense_categories`
--

LOCK TABLES `sma_expense_categories` WRITE;
/*!40000 ALTER TABLE `sma_expense_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `sma_expense_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_expenses`
--

DROP TABLE IF EXISTS `sma_expenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_expenses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reference` varchar(50) NOT NULL,
  `amount` decimal(25,4) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `created_by` varchar(55) NOT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `warehouse_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_expenses`
--

LOCK TABLES `sma_expenses` WRITE;
/*!40000 ALTER TABLE `sma_expenses` DISABLE KEYS */;
/*!40000 ALTER TABLE `sma_expenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_gift_card_topups`
--

DROP TABLE IF EXISTS `sma_gift_card_topups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_gift_card_topups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL,
  `card_id` int NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `created_by` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `card_id` (`card_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_gift_card_topups`
--

LOCK TABLES `sma_gift_card_topups` WRITE;
/*!40000 ALTER TABLE `sma_gift_card_topups` DISABLE KEYS */;
/*!40000 ALTER TABLE `sma_gift_card_topups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_gift_cards`
--

DROP TABLE IF EXISTS `sma_gift_cards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_gift_cards` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `card_no` varchar(20) NOT NULL,
  `value` decimal(25,4) NOT NULL,
  `customer_id` int DEFAULT NULL,
  `customer` varchar(255) DEFAULT NULL,
  `balance` decimal(25,4) NOT NULL,
  `expiry` date DEFAULT NULL,
  `created_by` varchar(55) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `card_no` (`card_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_gift_cards`
--

LOCK TABLES `sma_gift_cards` WRITE;
/*!40000 ALTER TABLE `sma_gift_cards` DISABLE KEYS */;
/*!40000 ALTER TABLE `sma_gift_cards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_groups`
--

DROP TABLE IF EXISTS `sma_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_groups` (
  `id` mediumint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_groups`
--

LOCK TABLES `sma_groups` WRITE;
/*!40000 ALTER TABLE `sma_groups` DISABLE KEYS */;
INSERT INTO `sma_groups` VALUES (1,'owner','Owner'),(2,'admin','Administrator'),(3,'customer','Customer'),(4,'supplier','Supplier'),(5,'sales','Sales Staff');
/*!40000 ALTER TABLE `sma_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_login_attempts`
--

DROP TABLE IF EXISTS `sma_login_attempts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_login_attempts` (
  `id` mediumint unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varbinary(16) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_login_attempts`
--

LOCK TABLES `sma_login_attempts` WRITE;
/*!40000 ALTER TABLE `sma_login_attempts` DISABLE KEYS */;
/*!40000 ALTER TABLE `sma_login_attempts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_logs`
--

DROP TABLE IF EXISTS `sma_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_logs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `detail` varchar(190) NOT NULL,
  `model` longtext,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_logs`
--

LOCK TABLES `sma_logs` WRITE;
/*!40000 ALTER TABLE `sma_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `sma_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_migrations`
--

DROP TABLE IF EXISTS `sma_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_migrations` (
  `version` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_migrations`
--

LOCK TABLES `sma_migrations` WRITE;
/*!40000 ALTER TABLE `sma_migrations` DISABLE KEYS */;
INSERT INTO `sma_migrations` VALUES (315);
/*!40000 ALTER TABLE `sma_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_notifications`
--

DROP TABLE IF EXISTS `sma_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_notifications` (
  `id` int NOT NULL AUTO_INCREMENT,
  `comment` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `from_date` datetime DEFAULT NULL,
  `till_date` datetime DEFAULT NULL,
  `scope` tinyint(1) NOT NULL DEFAULT '3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_notifications`
--

LOCK TABLES `sma_notifications` WRITE;
/*!40000 ALTER TABLE `sma_notifications` DISABLE KEYS */;
INSERT INTO `sma_notifications` VALUES (1,'<p>Thank you for purchasing Stock Manager Advance. Please do not forget to check the documentation in help folder. If you find any error/bug, please email to support@tecdiary.com with details. You can send us your valued suggestions/feedback too.</p><p>Please rate Stock Manager Advance on your download page of codecanyon.net</p>','2014-08-15 06:00:57','2015-01-01 00:00:00','2017-01-01 00:00:00',3);
/*!40000 ALTER TABLE `sma_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_order_ref`
--

DROP TABLE IF EXISTS `sma_order_ref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_order_ref` (
  `ref_id` int NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `so` int NOT NULL DEFAULT '1',
  `qu` int NOT NULL DEFAULT '1',
  `po` int NOT NULL DEFAULT '1',
  `to` int NOT NULL DEFAULT '1',
  `pos` int NOT NULL DEFAULT '1',
  `do` int NOT NULL DEFAULT '1',
  `pay` int NOT NULL DEFAULT '1',
  `re` int NOT NULL DEFAULT '1',
  `rep` int NOT NULL DEFAULT '1',
  `ex` int NOT NULL DEFAULT '1',
  `ppay` int NOT NULL DEFAULT '1',
  `qa` int DEFAULT '1',
  PRIMARY KEY (`ref_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_order_ref`
--

LOCK TABLES `sma_order_ref` WRITE;
/*!40000 ALTER TABLE `sma_order_ref` DISABLE KEYS */;
INSERT INTO `sma_order_ref` VALUES (1,'2015-03-01',1,1,1,1,1,1,1,1,1,1,1,1);
/*!40000 ALTER TABLE `sma_order_ref` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_pages`
--

DROP TABLE IF EXISTS `sma_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_pages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(15) NOT NULL,
  `title` varchar(60) NOT NULL,
  `description` varchar(180) NOT NULL,
  `slug` varchar(55) DEFAULT NULL,
  `body` text NOT NULL,
  `active` tinyint(1) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `order_no` tinyint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_pages`
--

LOCK TABLES `sma_pages` WRITE;
/*!40000 ALTER TABLE `sma_pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `sma_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_payments`
--

DROP TABLE IF EXISTS `sma_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_payments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `sale_id` int DEFAULT NULL,
  `return_id` int DEFAULT NULL,
  `purchase_id` int DEFAULT NULL,
  `reference_no` varchar(50) NOT NULL,
  `transaction_id` varchar(50) DEFAULT NULL,
  `paid_by` varchar(20) NOT NULL,
  `cheque_no` varchar(20) DEFAULT NULL,
  `cc_no` varchar(20) DEFAULT NULL,
  `cc_holder` varchar(25) DEFAULT NULL,
  `cc_month` varchar(2) DEFAULT NULL,
  `cc_year` varchar(4) DEFAULT NULL,
  `cc_type` varchar(20) DEFAULT NULL,
  `amount` decimal(25,4) NOT NULL,
  `currency` varchar(3) DEFAULT NULL,
  `created_by` int NOT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `type` varchar(20) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `pos_paid` decimal(25,4) DEFAULT '0.0000',
  `pos_balance` decimal(25,4) DEFAULT '0.0000',
  `approval_code` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_payments`
--

LOCK TABLES `sma_payments` WRITE;
/*!40000 ALTER TABLE `sma_payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `sma_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_paypal`
--

DROP TABLE IF EXISTS `sma_paypal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_paypal` (
  `id` int NOT NULL,
  `active` tinyint NOT NULL,
  `account_email` varchar(255) NOT NULL,
  `paypal_currency` varchar(3) NOT NULL DEFAULT 'USD',
  `fixed_charges` decimal(25,4) NOT NULL DEFAULT '2.0000',
  `extra_charges_my` decimal(25,4) NOT NULL DEFAULT '3.9000',
  `extra_charges_other` decimal(25,4) NOT NULL DEFAULT '4.4000',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_paypal`
--

LOCK TABLES `sma_paypal` WRITE;
/*!40000 ALTER TABLE `sma_paypal` DISABLE KEYS */;
INSERT INTO `sma_paypal` VALUES (1,1,'mypaypal@paypal.com','USD',0.0000,0.0000,0.0000);
/*!40000 ALTER TABLE `sma_paypal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_permissions`
--

DROP TABLE IF EXISTS `sma_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `products-index` tinyint(1) DEFAULT '0',
  `products-add` tinyint(1) DEFAULT '0',
  `products-edit` tinyint(1) DEFAULT '0',
  `products-delete` tinyint(1) DEFAULT '0',
  `products-cost` tinyint(1) DEFAULT '0',
  `products-price` tinyint(1) DEFAULT '0',
  `quotes-index` tinyint(1) DEFAULT '0',
  `quotes-add` tinyint(1) DEFAULT '0',
  `quotes-edit` tinyint(1) DEFAULT '0',
  `quotes-pdf` tinyint(1) DEFAULT '0',
  `quotes-email` tinyint(1) DEFAULT '0',
  `quotes-delete` tinyint(1) DEFAULT '0',
  `sales-index` tinyint(1) DEFAULT '0',
  `sales-add` tinyint(1) DEFAULT '0',
  `sales-edit` tinyint(1) DEFAULT '0',
  `sales-pdf` tinyint(1) DEFAULT '0',
  `sales-email` tinyint(1) DEFAULT '0',
  `sales-delete` tinyint(1) DEFAULT '0',
  `purchases-index` tinyint(1) DEFAULT '0',
  `purchases-add` tinyint(1) DEFAULT '0',
  `purchases-edit` tinyint(1) DEFAULT '0',
  `purchases-pdf` tinyint(1) DEFAULT '0',
  `purchases-email` tinyint(1) DEFAULT '0',
  `purchases-delete` tinyint(1) DEFAULT '0',
  `transfers-index` tinyint(1) DEFAULT '0',
  `transfers-add` tinyint(1) DEFAULT '0',
  `transfers-edit` tinyint(1) DEFAULT '0',
  `transfers-pdf` tinyint(1) DEFAULT '0',
  `transfers-email` tinyint(1) DEFAULT '0',
  `transfers-delete` tinyint(1) DEFAULT '0',
  `customers-index` tinyint(1) DEFAULT '0',
  `customers-add` tinyint(1) DEFAULT '0',
  `customers-edit` tinyint(1) DEFAULT '0',
  `customers-delete` tinyint(1) DEFAULT '0',
  `suppliers-index` tinyint(1) DEFAULT '0',
  `suppliers-add` tinyint(1) DEFAULT '0',
  `suppliers-edit` tinyint(1) DEFAULT '0',
  `suppliers-delete` tinyint(1) DEFAULT '0',
  `sales-deliveries` tinyint(1) DEFAULT '0',
  `sales-add_delivery` tinyint(1) DEFAULT '0',
  `sales-edit_delivery` tinyint(1) DEFAULT '0',
  `sales-delete_delivery` tinyint(1) DEFAULT '0',
  `sales-email_delivery` tinyint(1) DEFAULT '0',
  `sales-pdf_delivery` tinyint(1) DEFAULT '0',
  `sales-gift_cards` tinyint(1) DEFAULT '0',
  `sales-add_gift_card` tinyint(1) DEFAULT '0',
  `sales-edit_gift_card` tinyint(1) DEFAULT '0',
  `sales-delete_gift_card` tinyint(1) DEFAULT '0',
  `pos-index` tinyint(1) DEFAULT '0',
  `sales-return_sales` tinyint(1) DEFAULT '0',
  `reports-index` tinyint(1) DEFAULT '0',
  `reports-warehouse_stock` tinyint(1) DEFAULT '0',
  `reports-quantity_alerts` tinyint(1) DEFAULT '0',
  `reports-expiry_alerts` tinyint(1) DEFAULT '0',
  `reports-products` tinyint(1) DEFAULT '0',
  `reports-daily_sales` tinyint(1) DEFAULT '0',
  `reports-monthly_sales` tinyint(1) DEFAULT '0',
  `reports-sales` tinyint(1) DEFAULT '0',
  `reports-payments` tinyint(1) DEFAULT '0',
  `reports-purchases` tinyint(1) DEFAULT '0',
  `reports-profit_loss` tinyint(1) DEFAULT '0',
  `reports-customers` tinyint(1) DEFAULT '0',
  `reports-suppliers` tinyint(1) DEFAULT '0',
  `reports-staff` tinyint(1) DEFAULT '0',
  `reports-register` tinyint(1) DEFAULT '0',
  `sales-payments` tinyint(1) DEFAULT '0',
  `purchases-payments` tinyint(1) DEFAULT '0',
  `purchases-expenses` tinyint(1) DEFAULT '0',
  `products-adjustments` tinyint(1) NOT NULL DEFAULT '0',
  `bulk_actions` tinyint(1) NOT NULL DEFAULT '0',
  `customers-deposits` tinyint(1) NOT NULL DEFAULT '0',
  `customers-delete_deposit` tinyint(1) NOT NULL DEFAULT '0',
  `products-barcode` tinyint(1) NOT NULL DEFAULT '0',
  `purchases-return_purchases` tinyint(1) NOT NULL DEFAULT '0',
  `reports-expenses` tinyint(1) NOT NULL DEFAULT '0',
  `reports-daily_purchases` tinyint(1) DEFAULT '0',
  `reports-monthly_purchases` tinyint(1) DEFAULT '0',
  `products-stock_count` tinyint(1) DEFAULT '0',
  `edit_price` tinyint(1) DEFAULT '0',
  `returns-index` tinyint(1) DEFAULT '0',
  `returns-add` tinyint(1) DEFAULT '0',
  `returns-edit` tinyint(1) DEFAULT '0',
  `returns-delete` tinyint(1) DEFAULT '0',
  `returns-email` tinyint(1) DEFAULT '0',
  `returns-pdf` tinyint(1) DEFAULT '0',
  `reports-tax` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_permissions`
--

LOCK TABLES `sma_permissions` WRITE;
/*!40000 ALTER TABLE `sma_permissions` DISABLE KEYS */;
INSERT INTO `sma_permissions` VALUES (1,5,1,0,0,0,0,0,1,1,1,1,1,0,1,1,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,1,1,1,0,0,1,1,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
/*!40000 ALTER TABLE `sma_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_pos_register`
--

DROP TABLE IF EXISTS `sma_pos_register`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_pos_register` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int NOT NULL,
  `cash_in_hand` decimal(25,4) NOT NULL,
  `status` varchar(10) NOT NULL,
  `total_cash` decimal(25,4) DEFAULT NULL,
  `total_cheques` int DEFAULT NULL,
  `total_cc_slips` int DEFAULT NULL,
  `total_cash_submitted` decimal(25,4) DEFAULT NULL,
  `total_cheques_submitted` int DEFAULT NULL,
  `total_cc_slips_submitted` int DEFAULT NULL,
  `note` text,
  `closed_at` timestamp NULL DEFAULT NULL,
  `transfer_opened_bills` varchar(50) DEFAULT NULL,
  `closed_by` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_pos_register`
--

LOCK TABLES `sma_pos_register` WRITE;
/*!40000 ALTER TABLE `sma_pos_register` DISABLE KEYS */;
/*!40000 ALTER TABLE `sma_pos_register` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_pos_settings`
--

DROP TABLE IF EXISTS `sma_pos_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_pos_settings` (
  `pos_id` int NOT NULL,
  `cat_limit` int NOT NULL,
  `pro_limit` int NOT NULL,
  `default_category` int NOT NULL,
  `default_customer` int NOT NULL,
  `default_biller` int NOT NULL,
  `display_time` varchar(3) NOT NULL DEFAULT 'yes',
  `cf_title1` varchar(255) DEFAULT NULL,
  `cf_title2` varchar(255) DEFAULT NULL,
  `cf_value1` varchar(255) DEFAULT NULL,
  `cf_value2` varchar(255) DEFAULT NULL,
  `receipt_printer` varchar(55) DEFAULT NULL,
  `cash_drawer_codes` varchar(55) DEFAULT NULL,
  `focus_add_item` varchar(55) DEFAULT NULL,
  `add_manual_product` varchar(55) DEFAULT NULL,
  `customer_selection` varchar(55) DEFAULT NULL,
  `add_customer` varchar(55) DEFAULT NULL,
  `toggle_category_slider` varchar(55) DEFAULT NULL,
  `toggle_subcategory_slider` varchar(55) DEFAULT NULL,
  `cancel_sale` varchar(55) DEFAULT NULL,
  `suspend_sale` varchar(55) DEFAULT NULL,
  `print_items_list` varchar(55) DEFAULT NULL,
  `finalize_sale` varchar(55) DEFAULT NULL,
  `today_sale` varchar(55) DEFAULT NULL,
  `open_hold_bills` varchar(55) DEFAULT NULL,
  `close_register` varchar(55) DEFAULT NULL,
  `keyboard` tinyint(1) NOT NULL,
  `pos_printers` varchar(255) DEFAULT NULL,
  `java_applet` tinyint(1) NOT NULL,
  `product_button_color` varchar(20) NOT NULL DEFAULT 'default',
  `tooltips` tinyint(1) DEFAULT '1',
  `paypal_pro` tinyint(1) DEFAULT '0',
  `stripe` tinyint(1) DEFAULT '0',
  `rounding` tinyint(1) DEFAULT '0',
  `char_per_line` tinyint DEFAULT '42',
  `pin_code` varchar(20) DEFAULT NULL,
  `purchase_code` varchar(100) DEFAULT 'purchase_code',
  `envato_username` varchar(50) DEFAULT 'envato_username',
  `version` varchar(10) DEFAULT '3.5.0',
  `after_sale_page` tinyint(1) DEFAULT '0',
  `item_order` tinyint(1) DEFAULT '0',
  `authorize` tinyint(1) DEFAULT '0',
  `toggle_brands_slider` varchar(55) DEFAULT NULL,
  `remote_printing` tinyint(1) DEFAULT '1',
  `printer` int DEFAULT NULL,
  `order_printers` varchar(55) DEFAULT NULL,
  `auto_print` tinyint(1) DEFAULT '0',
  `customer_details` tinyint(1) DEFAULT NULL,
  `local_printers` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`pos_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_pos_settings`
--

LOCK TABLES `sma_pos_settings` WRITE;
/*!40000 ALTER TABLE `sma_pos_settings` DISABLE KEYS */;
INSERT INTO `sma_pos_settings` VALUES (1,22,20,1,1,3,'1','GST Reg','VAT Reg','123456789','987654321','BIXOLON SRP-350II','x1C','Ctrl+F3','Ctrl+Shift+M','Ctrl+Shift+C','Ctrl+Shift+A','Ctrl+F11','Ctrl+F12','F4','F7','F9','F8','Ctrl+F1','Ctrl+F2','Ctrl+F10',1,'BIXOLON SRP-350II, BIXOLON SRP-350II',0,'default',1,0,0,0,42,NULL,'purchase_code','envato_username','3.5.0',0,0,0,NULL,1,NULL,NULL,0,NULL,NULL);
/*!40000 ALTER TABLE `sma_pos_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_price_groups`
--

DROP TABLE IF EXISTS `sma_price_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_price_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_price_groups`
--

LOCK TABLES `sma_price_groups` WRITE;
/*!40000 ALTER TABLE `sma_price_groups` DISABLE KEYS */;
INSERT INTO `sma_price_groups` VALUES (1,'Default');
/*!40000 ALTER TABLE `sma_price_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_printers`
--

DROP TABLE IF EXISTS `sma_printers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_printers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(55) NOT NULL,
  `type` varchar(25) NOT NULL,
  `profile` varchar(25) NOT NULL,
  `char_per_line` tinyint unsigned DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `ip_address` varbinary(45) DEFAULT NULL,
  `port` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_printers`
--

LOCK TABLES `sma_printers` WRITE;
/*!40000 ALTER TABLE `sma_printers` DISABLE KEYS */;
/*!40000 ALTER TABLE `sma_printers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_product_photos`
--

DROP TABLE IF EXISTS `sma_product_photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_product_photos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `photo` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_product_photos`
--

LOCK TABLES `sma_product_photos` WRITE;
/*!40000 ALTER TABLE `sma_product_photos` DISABLE KEYS */;
/*!40000 ALTER TABLE `sma_product_photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_product_prices`
--

DROP TABLE IF EXISTS `sma_product_prices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_product_prices` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `price_group_id` int NOT NULL,
  `price` decimal(25,4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  KEY `price_group_id` (`price_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_product_prices`
--

LOCK TABLES `sma_product_prices` WRITE;
/*!40000 ALTER TABLE `sma_product_prices` DISABLE KEYS */;
/*!40000 ALTER TABLE `sma_product_prices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_product_variants`
--

DROP TABLE IF EXISTS `sma_product_variants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_product_variants` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `name` varchar(55) NOT NULL,
  `cost` decimal(25,4) DEFAULT NULL,
  `price` decimal(25,4) DEFAULT NULL,
  `quantity` decimal(15,4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_product_id_name` (`product_id`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_product_variants`
--

LOCK TABLES `sma_product_variants` WRITE;
/*!40000 ALTER TABLE `sma_product_variants` DISABLE KEYS */;
/*!40000 ALTER TABLE `sma_product_variants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_products`
--

DROP TABLE IF EXISTS `sma_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `unit` int DEFAULT NULL,
  `cost` decimal(25,4) DEFAULT NULL,
  `price` decimal(25,4) NOT NULL,
  `alert_quantity` decimal(15,4) DEFAULT '20.0000',
  `image` varchar(255) DEFAULT 'no_image.png',
  `category_id` int NOT NULL,
  `subcategory_id` int DEFAULT NULL,
  `cf1` varchar(255) DEFAULT NULL,
  `cf2` varchar(255) DEFAULT NULL,
  `cf3` varchar(255) DEFAULT NULL,
  `cf4` varchar(255) DEFAULT NULL,
  `cf5` varchar(255) DEFAULT NULL,
  `cf6` varchar(255) DEFAULT NULL,
  `quantity` decimal(15,4) DEFAULT '0.0000',
  `tax_rate` int DEFAULT NULL,
  `track_quantity` tinyint(1) DEFAULT '1',
  `details` varchar(1000) DEFAULT NULL,
  `warehouse` int DEFAULT NULL,
  `barcode_symbology` varchar(55) NOT NULL DEFAULT 'code128',
  `file` varchar(100) DEFAULT NULL,
  `product_details` text,
  `tax_method` tinyint(1) DEFAULT '0',
  `type` varchar(55) NOT NULL DEFAULT 'standard',
  `supplier1` int DEFAULT NULL,
  `supplier1price` decimal(25,4) DEFAULT NULL,
  `supplier2` int DEFAULT NULL,
  `supplier2price` decimal(25,4) DEFAULT NULL,
  `supplier3` int DEFAULT NULL,
  `supplier3price` decimal(25,4) DEFAULT NULL,
  `supplier4` int DEFAULT NULL,
  `supplier4price` decimal(25,4) DEFAULT NULL,
  `supplier5` int DEFAULT NULL,
  `supplier5price` decimal(25,4) DEFAULT NULL,
  `promotion` tinyint(1) DEFAULT '0',
  `promo_price` decimal(25,4) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `supplier1_part_no` varchar(50) DEFAULT NULL,
  `supplier2_part_no` varchar(50) DEFAULT NULL,
  `supplier3_part_no` varchar(50) DEFAULT NULL,
  `supplier4_part_no` varchar(50) DEFAULT NULL,
  `supplier5_part_no` varchar(50) DEFAULT NULL,
  `sale_unit` int DEFAULT NULL,
  `purchase_unit` int DEFAULT NULL,
  `brand` int DEFAULT NULL,
  `slug` varchar(55) DEFAULT NULL,
  `featured` tinyint(1) DEFAULT NULL,
  `weight` decimal(10,4) DEFAULT NULL,
  `hsn_code` int DEFAULT NULL,
  `views` int NOT NULL DEFAULT '0',
  `hide` tinyint(1) NOT NULL DEFAULT '0',
  `second_name` varchar(255) DEFAULT NULL,
  `hide_pos` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `category_id` (`category_id`),
  KEY `id` (`id`),
  KEY `id_2` (`id`),
  KEY `category_id_2` (`category_id`),
  KEY `unit` (`unit`),
  KEY `brand` (`brand`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_products`
--

LOCK TABLES `sma_products` WRITE;
/*!40000 ALTER TABLE `sma_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `sma_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_promos`
--

DROP TABLE IF EXISTS `sma_promos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_promos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `product2buy` int NOT NULL,
  `product2get` int NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_promos`
--

LOCK TABLES `sma_promos` WRITE;
/*!40000 ALTER TABLE `sma_promos` DISABLE KEYS */;
/*!40000 ALTER TABLE `sma_promos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_purchase_items`
--

DROP TABLE IF EXISTS `sma_purchase_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_purchase_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `purchase_id` int DEFAULT NULL,
  `transfer_id` int DEFAULT NULL,
  `product_id` int NOT NULL,
  `product_code` varchar(50) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `option_id` int DEFAULT NULL,
  `net_unit_cost` decimal(25,4) NOT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int NOT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int DEFAULT NULL,
  `tax` varchar(20) DEFAULT NULL,
  `discount` varchar(20) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `expiry` date DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `quantity_balance` decimal(15,4) DEFAULT '0.0000',
  `date` date NOT NULL,
  `status` varchar(50) NOT NULL,
  `unit_cost` decimal(25,4) DEFAULT NULL,
  `real_unit_cost` decimal(25,4) DEFAULT NULL,
  `quantity_received` decimal(15,4) DEFAULT NULL,
  `supplier_part_no` varchar(50) DEFAULT NULL,
  `purchase_item_id` int DEFAULT NULL,
  `product_unit_id` int DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL,
  `gst` varchar(20) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL,
  `base_unit_cost` decimal(25,4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `purchase_id` (`purchase_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_purchase_items`
--

LOCK TABLES `sma_purchase_items` WRITE;
/*!40000 ALTER TABLE `sma_purchase_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `sma_purchase_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_purchases`
--

DROP TABLE IF EXISTS `sma_purchases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_purchases` (
  `id` int NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(55) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `supplier_id` int NOT NULL,
  `supplier` varchar(55) NOT NULL,
  `warehouse_id` int NOT NULL,
  `note` varchar(1000) NOT NULL,
  `total` decimal(25,4) DEFAULT NULL,
  `product_discount` decimal(25,4) DEFAULT NULL,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `order_discount` decimal(25,4) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT NULL,
  `product_tax` decimal(25,4) DEFAULT NULL,
  `order_tax_id` int DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT NULL,
  `total_tax` decimal(25,4) DEFAULT '0.0000',
  `shipping` decimal(25,4) DEFAULT '0.0000',
  `grand_total` decimal(25,4) NOT NULL,
  `paid` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `status` varchar(55) DEFAULT '',
  `payment_status` varchar(20) DEFAULT 'pending',
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `payment_term` tinyint DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `return_id` int DEFAULT NULL,
  `surcharge` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `return_purchase_ref` varchar(55) DEFAULT NULL,
  `purchase_id` int DEFAULT NULL,
  `return_purchase_total` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_purchases`
--

LOCK TABLES `sma_purchases` WRITE;
/*!40000 ALTER TABLE `sma_purchases` DISABLE KEYS */;
/*!40000 ALTER TABLE `sma_purchases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_quote_items`
--

DROP TABLE IF EXISTS `sma_quote_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_quote_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `quote_id` int NOT NULL,
  `product_id` int NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_type` varchar(20) DEFAULT NULL,
  `option_id` int DEFAULT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `unit_price` decimal(25,4) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `discount` varchar(55) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `real_unit_price` decimal(25,4) DEFAULT NULL,
  `product_unit_id` int DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL,
  `gst` varchar(20) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `quote_id` (`quote_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_quote_items`
--

LOCK TABLES `sma_quote_items` WRITE;
/*!40000 ALTER TABLE `sma_quote_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `sma_quote_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_quotes`
--

DROP TABLE IF EXISTS `sma_quotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_quotes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reference_no` varchar(55) NOT NULL,
  `customer_id` int NOT NULL,
  `customer` varchar(55) NOT NULL,
  `warehouse_id` int DEFAULT NULL,
  `biller_id` int NOT NULL,
  `biller` varchar(55) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `internal_note` varchar(1000) DEFAULT NULL,
  `total` decimal(25,4) NOT NULL,
  `product_discount` decimal(25,4) DEFAULT '0.0000',
  `order_discount` decimal(25,4) DEFAULT NULL,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT '0.0000',
  `product_tax` decimal(25,4) DEFAULT '0.0000',
  `order_tax_id` int DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT NULL,
  `total_tax` decimal(25,4) DEFAULT NULL,
  `shipping` decimal(25,4) DEFAULT '0.0000',
  `grand_total` decimal(25,4) NOT NULL,
  `status` varchar(20) DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `supplier_id` int DEFAULT NULL,
  `supplier` varchar(55) DEFAULT NULL,
  `hash` varchar(255) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_quotes`
--

LOCK TABLES `sma_quotes` WRITE;
/*!40000 ALTER TABLE `sma_quotes` DISABLE KEYS */;
/*!40000 ALTER TABLE `sma_quotes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_return_items`
--

DROP TABLE IF EXISTS `sma_return_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_return_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `return_id` int unsigned NOT NULL,
  `product_id` int unsigned NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_type` varchar(20) DEFAULT NULL,
  `option_id` int DEFAULT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `unit_price` decimal(25,4) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `discount` varchar(55) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `real_unit_price` decimal(25,4) DEFAULT NULL,
  `product_unit_id` int DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `gst` varchar(20) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `return_id` (`return_id`),
  KEY `product_id` (`product_id`),
  KEY `product_id_2` (`product_id`,`return_id`),
  KEY `return_id_2` (`return_id`,`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_return_items`
--

LOCK TABLES `sma_return_items` WRITE;
/*!40000 ALTER TABLE `sma_return_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `sma_return_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_returns`
--

DROP TABLE IF EXISTS `sma_returns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_returns` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reference_no` varchar(55) NOT NULL,
  `customer_id` int NOT NULL,
  `customer` varchar(55) NOT NULL,
  `biller_id` int NOT NULL,
  `biller` varchar(55) NOT NULL,
  `warehouse_id` int DEFAULT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `staff_note` varchar(1000) DEFAULT NULL,
  `total` decimal(25,4) NOT NULL,
  `product_discount` decimal(25,4) DEFAULT '0.0000',
  `order_discount_id` varchar(20) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT '0.0000',
  `order_discount` decimal(25,4) DEFAULT '0.0000',
  `product_tax` decimal(25,4) DEFAULT '0.0000',
  `order_tax_id` int DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT '0.0000',
  `total_tax` decimal(25,4) DEFAULT '0.0000',
  `grand_total` decimal(25,4) NOT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `total_items` smallint DEFAULT NULL,
  `paid` decimal(25,4) DEFAULT '0.0000',
  `surcharge` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `attachment` varchar(55) DEFAULT NULL,
  `hash` varchar(255) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL,
  `shipping` decimal(25,4) DEFAULT '0.0000',
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_returns`
--

LOCK TABLES `sma_returns` WRITE;
/*!40000 ALTER TABLE `sma_returns` DISABLE KEYS */;
/*!40000 ALTER TABLE `sma_returns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_sale_items`
--

DROP TABLE IF EXISTS `sma_sale_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_sale_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sale_id` int unsigned NOT NULL,
  `product_id` int unsigned NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_type` varchar(20) DEFAULT NULL,
  `option_id` int DEFAULT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `unit_price` decimal(25,4) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `discount` varchar(55) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `real_unit_price` decimal(25,4) DEFAULT NULL,
  `sale_item_id` int DEFAULT NULL,
  `product_unit_id` int DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `gst` varchar(20) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sale_id` (`sale_id`),
  KEY `product_id` (`product_id`),
  KEY `product_id_2` (`product_id`,`sale_id`),
  KEY `sale_id_2` (`sale_id`,`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_sale_items`
--

LOCK TABLES `sma_sale_items` WRITE;
/*!40000 ALTER TABLE `sma_sale_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `sma_sale_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_sales`
--

DROP TABLE IF EXISTS `sma_sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_sales` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reference_no` varchar(55) NOT NULL,
  `customer_id` int NOT NULL,
  `customer` varchar(55) NOT NULL,
  `biller_id` int NOT NULL,
  `biller` varchar(55) NOT NULL,
  `warehouse_id` int DEFAULT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `staff_note` varchar(1000) DEFAULT NULL,
  `total` decimal(25,4) NOT NULL,
  `product_discount` decimal(25,4) DEFAULT '0.0000',
  `order_discount_id` varchar(20) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT '0.0000',
  `order_discount` decimal(25,4) DEFAULT '0.0000',
  `product_tax` decimal(25,4) DEFAULT '0.0000',
  `order_tax_id` int DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT '0.0000',
  `total_tax` decimal(25,4) DEFAULT '0.0000',
  `shipping` decimal(25,4) DEFAULT '0.0000',
  `grand_total` decimal(25,4) NOT NULL,
  `sale_status` varchar(20) DEFAULT NULL,
  `payment_status` varchar(20) DEFAULT NULL,
  `payment_term` tinyint DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `total_items` smallint DEFAULT NULL,
  `pos` tinyint(1) NOT NULL DEFAULT '0',
  `paid` decimal(25,4) DEFAULT '0.0000',
  `return_id` int DEFAULT NULL,
  `surcharge` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `attachment` varchar(55) DEFAULT NULL,
  `return_sale_ref` varchar(55) DEFAULT NULL,
  `sale_id` int DEFAULT NULL,
  `return_sale_total` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `rounding` decimal(10,4) DEFAULT NULL,
  `suspend_note` varchar(255) DEFAULT NULL,
  `api` tinyint(1) DEFAULT '0',
  `shop` tinyint(1) DEFAULT '0',
  `address_id` int DEFAULT NULL,
  `reserve_id` int DEFAULT NULL,
  `hash` varchar(255) DEFAULT NULL,
  `manual_payment` varchar(55) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL,
  `payment_method` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_sales`
--

LOCK TABLES `sma_sales` WRITE;
/*!40000 ALTER TABLE `sma_sales` DISABLE KEYS */;
/*!40000 ALTER TABLE `sma_sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_sessions`
--

DROP TABLE IF EXISTS `sma_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int unsigned NOT NULL DEFAULT '0',
  `data` blob NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ci_sessions_timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_sessions`
--

LOCK TABLES `sma_sessions` WRITE;
/*!40000 ALTER TABLE `sma_sessions` DISABLE KEYS */;
INSERT INTO `sma_sessions` VALUES ('murmirhqcf1l01fp5f2d64i409jbt72k','103.118.46.61',1679153790,_binary '__ci_last_regenerate|i:1679153581;identity|s:18:\"owner@tecdiary.com\";username|s:5:\"owner\";email|s:18:\"owner@tecdiary.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1426618492\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";');
/*!40000 ALTER TABLE `sma_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_settings`
--

DROP TABLE IF EXISTS `sma_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_settings` (
  `setting_id` int NOT NULL,
  `logo` varchar(255) NOT NULL,
  `logo2` varchar(255) NOT NULL,
  `site_name` varchar(55) NOT NULL,
  `language` varchar(20) NOT NULL,
  `default_warehouse` int NOT NULL,
  `accounting_method` tinyint NOT NULL DEFAULT '0',
  `default_currency` varchar(3) NOT NULL,
  `default_tax_rate` int NOT NULL,
  `rows_per_page` int NOT NULL,
  `version` varchar(10) NOT NULL DEFAULT '1.0',
  `default_tax_rate2` int NOT NULL DEFAULT '0',
  `dateformat` int NOT NULL,
  `sales_prefix` varchar(20) DEFAULT NULL,
  `quote_prefix` varchar(20) DEFAULT NULL,
  `purchase_prefix` varchar(20) DEFAULT NULL,
  `transfer_prefix` varchar(20) DEFAULT NULL,
  `delivery_prefix` varchar(20) DEFAULT NULL,
  `payment_prefix` varchar(20) DEFAULT NULL,
  `return_prefix` varchar(20) DEFAULT NULL,
  `returnp_prefix` varchar(20) DEFAULT NULL,
  `expense_prefix` varchar(20) DEFAULT NULL,
  `item_addition` tinyint(1) NOT NULL DEFAULT '0',
  `theme` varchar(20) NOT NULL,
  `product_serial` tinyint NOT NULL,
  `default_discount` int NOT NULL,
  `product_discount` tinyint(1) NOT NULL DEFAULT '0',
  `discount_method` tinyint NOT NULL,
  `tax1` tinyint NOT NULL,
  `tax2` tinyint NOT NULL,
  `overselling` tinyint(1) NOT NULL DEFAULT '0',
  `restrict_user` tinyint NOT NULL DEFAULT '0',
  `restrict_calendar` tinyint NOT NULL DEFAULT '0',
  `timezone` varchar(100) DEFAULT NULL,
  `iwidth` int NOT NULL DEFAULT '0',
  `iheight` int NOT NULL,
  `twidth` int NOT NULL,
  `theight` int NOT NULL,
  `watermark` tinyint(1) DEFAULT NULL,
  `reg_ver` tinyint(1) DEFAULT NULL,
  `allow_reg` tinyint(1) DEFAULT NULL,
  `reg_notification` tinyint(1) DEFAULT NULL,
  `auto_reg` tinyint(1) DEFAULT NULL,
  `protocol` varchar(20) NOT NULL DEFAULT 'mail',
  `mailpath` varchar(55) DEFAULT '/usr/sbin/sendmail',
  `smtp_host` varchar(100) DEFAULT NULL,
  `smtp_user` varchar(100) DEFAULT NULL,
  `smtp_pass` varchar(255) DEFAULT NULL,
  `smtp_port` varchar(10) DEFAULT '25',
  `smtp_crypto` varchar(10) DEFAULT NULL,
  `corn` datetime DEFAULT NULL,
  `customer_group` int NOT NULL,
  `default_email` varchar(100) NOT NULL,
  `mmode` tinyint(1) NOT NULL,
  `bc_fix` tinyint NOT NULL DEFAULT '0',
  `auto_detect_barcode` tinyint(1) NOT NULL DEFAULT '0',
  `captcha` tinyint(1) NOT NULL DEFAULT '1',
  `reference_format` tinyint(1) NOT NULL DEFAULT '1',
  `racks` tinyint(1) DEFAULT '0',
  `attributes` tinyint(1) NOT NULL DEFAULT '0',
  `product_expiry` tinyint(1) NOT NULL DEFAULT '0',
  `decimals` tinyint NOT NULL DEFAULT '2',
  `qty_decimals` tinyint NOT NULL DEFAULT '2',
  `decimals_sep` varchar(2) NOT NULL DEFAULT '.',
  `thousands_sep` varchar(2) NOT NULL DEFAULT ',',
  `invoice_view` tinyint(1) DEFAULT '0',
  `default_biller` int DEFAULT NULL,
  `envato_username` varchar(50) DEFAULT NULL,
  `purchase_code` varchar(100) DEFAULT NULL,
  `rtl` tinyint(1) DEFAULT '0',
  `each_spent` decimal(15,4) DEFAULT NULL,
  `ca_point` tinyint DEFAULT NULL,
  `each_sale` decimal(15,4) DEFAULT NULL,
  `sa_point` tinyint DEFAULT NULL,
  `update` tinyint(1) DEFAULT '0',
  `sac` tinyint(1) DEFAULT '0',
  `display_all_products` tinyint(1) DEFAULT '0',
  `display_symbol` tinyint(1) DEFAULT NULL,
  `symbol` varchar(50) DEFAULT NULL,
  `remove_expired` tinyint(1) DEFAULT '0',
  `barcode_separator` varchar(2) NOT NULL DEFAULT '-',
  `set_focus` tinyint(1) NOT NULL DEFAULT '0',
  `price_group` int DEFAULT NULL,
  `barcode_img` tinyint(1) NOT NULL DEFAULT '1',
  `ppayment_prefix` varchar(20) DEFAULT 'POP',
  `disable_editing` smallint DEFAULT '90',
  `qa_prefix` varchar(55) DEFAULT NULL,
  `update_cost` tinyint(1) DEFAULT NULL,
  `apis` tinyint(1) NOT NULL DEFAULT '0',
  `state` varchar(100) DEFAULT NULL,
  `pdf_lib` varchar(20) DEFAULT 'dompdf',
  `use_code_for_slug` tinyint(1) DEFAULT NULL,
  `ws_barcode_type` varchar(10) DEFAULT 'weight',
  `ws_barcode_chars` tinyint DEFAULT NULL,
  `flag_chars` tinyint DEFAULT NULL,
  `item_code_start` tinyint DEFAULT NULL,
  `item_code_chars` tinyint DEFAULT NULL,
  `price_start` tinyint DEFAULT NULL,
  `price_chars` tinyint DEFAULT NULL,
  `price_divide_by` int DEFAULT NULL,
  `weight_start` tinyint DEFAULT NULL,
  `weight_chars` tinyint DEFAULT NULL,
  `weight_divide_by` int DEFAULT NULL,
  `ksa_qrcode` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`setting_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_settings`
--

LOCK TABLES `sma_settings` WRITE;
/*!40000 ALTER TABLE `sma_settings` DISABLE KEYS */;
INSERT INTO `sma_settings` VALUES (1,'logo2.png','logo3.png','Stock Manager Advance Original','english',1,0,'USD',1,100,'3.5.0',1,5,'PL','QUOTE','PO','TR','DO','IPAY','SR','PR','',0,'default',1,1,1,1,1,1,0,1,0,'Asia/Phnom_Penh',800,800,150,150,0,0,0,0,NULL,'mail','/usr/sbin/sendmail','pop.gmail.com','contact@sma.tecdiary.org','jEFTM4T63AiQ9dsidxhPKt9CIg4HQjCN58n/RW9vmdC/UDXCzRLR469ziZ0jjpFlbOg43LyoSmpJLBkcAHh0Yw==','25',NULL,NULL,1,'contact@tecdiary.com',0,4,1,0,3,0,0,0,2,2,'.',',',0,3,'passappk','ff716399-196f-4fa6-b379-c53eefee40fe',0,NULL,NULL,NULL,NULL,0,0,0,0,'',0,'-',0,1,1,'POP',90,'',0,0,'AN','dompdf',1,'weight',0,0,0,0,0,0,0,0,0,0,0);
/*!40000 ALTER TABLE `sma_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_shop_settings`
--

DROP TABLE IF EXISTS `sma_shop_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_shop_settings` (
  `shop_id` int NOT NULL,
  `shop_name` varchar(55) NOT NULL,
  `description` varchar(160) NOT NULL,
  `warehouse` int NOT NULL,
  `biller` int NOT NULL,
  `about_link` varchar(55) NOT NULL,
  `terms_link` varchar(55) NOT NULL,
  `privacy_link` varchar(55) NOT NULL,
  `contact_link` varchar(55) NOT NULL,
  `payment_text` varchar(100) NOT NULL,
  `follow_text` varchar(100) NOT NULL,
  `facebook` varchar(55) NOT NULL,
  `twitter` varchar(55) DEFAULT NULL,
  `google_plus` varchar(55) DEFAULT NULL,
  `instagram` varchar(55) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `email` varchar(55) DEFAULT NULL,
  `cookie_message` varchar(180) DEFAULT NULL,
  `cookie_link` varchar(55) DEFAULT NULL,
  `slider` text,
  `shipping` int DEFAULT NULL,
  `purchase_code` varchar(100) DEFAULT 'purchase_code',
  `envato_username` varchar(50) DEFAULT 'envato_username',
  `version` varchar(10) DEFAULT '3.5.0',
  `logo` varchar(55) DEFAULT NULL,
  `bank_details` varchar(255) DEFAULT NULL,
  `products_page` tinyint(1) DEFAULT NULL,
  `hide0` tinyint(1) DEFAULT '0',
  `products_description` varchar(255) DEFAULT NULL,
  `private` tinyint(1) DEFAULT '0',
  `hide_price` tinyint(1) DEFAULT '0',
  `stripe` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`shop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_shop_settings`
--

LOCK TABLES `sma_shop_settings` WRITE;
/*!40000 ALTER TABLE `sma_shop_settings` DISABLE KEYS */;
INSERT INTO `sma_shop_settings` VALUES (1,'SMA Shop','Stock Manager Advance - SMA Shop - Demo Ecommerce Shop that would help you to sell your products from your site.',1,3,'about','terms-conditions','privacy-policy','contact','We accept PayPal or you can pay with your credit/debit cards.','Please click the link below to follow us on social media.','http://facebook.com/tecdiary','http://twitter.com/tecdiary','','','010 1234 567','info@tecdiary.com','We use cookies to improve your experience on our website. By browsing this website, you agree to our use of cookies.','','[{\"image\":\"s1.jpg\",\"link\":\"http:\\/\\/ci.dev\\/sma\\/shop\\/products\",\"caption\":\"\"},{\"image\":\"s2.jpg\",\"link\":\"\",\"caption\":\"\"},{\"image\":\"s3.jpg\",\"link\":\"\",\"caption\":\"\"},{\"link\":\"\",\"caption\":\"\"},{\"link\":\"\",\"caption\":\"\"}]',0,'','envato_username','3.5.0','sma-shop.png',NULL,NULL,0,NULL,0,0,0);
/*!40000 ALTER TABLE `sma_shop_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_skrill`
--

DROP TABLE IF EXISTS `sma_skrill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_skrill` (
  `id` int NOT NULL,
  `active` tinyint NOT NULL,
  `account_email` varchar(255) NOT NULL DEFAULT 'testaccount2@moneybookers.com',
  `secret_word` varchar(20) NOT NULL DEFAULT 'mbtest',
  `skrill_currency` varchar(3) NOT NULL DEFAULT 'USD',
  `fixed_charges` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `extra_charges_my` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `extra_charges_other` decimal(25,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_skrill`
--

LOCK TABLES `sma_skrill` WRITE;
/*!40000 ALTER TABLE `sma_skrill` DISABLE KEYS */;
INSERT INTO `sma_skrill` VALUES (1,1,'testaccount2@moneybookers.com','mbtest','USD',0.0000,0.0000,0.0000);
/*!40000 ALTER TABLE `sma_skrill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_sms_settings`
--

DROP TABLE IF EXISTS `sma_sms_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_sms_settings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `auto_send` tinyint(1) DEFAULT NULL,
  `config` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_sms_settings`
--

LOCK TABLES `sma_sms_settings` WRITE;
/*!40000 ALTER TABLE `sma_sms_settings` DISABLE KEYS */;
INSERT INTO `sma_sms_settings` VALUES (1,NULL,'{\"gateway\":\"Log\",\"Log\":{}');
/*!40000 ALTER TABLE `sma_sms_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_stock_count_items`
--

DROP TABLE IF EXISTS `sma_stock_count_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_stock_count_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `stock_count_id` int NOT NULL,
  `product_id` int NOT NULL,
  `product_code` varchar(50) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `product_variant` varchar(55) DEFAULT NULL,
  `product_variant_id` int DEFAULT NULL,
  `expected` decimal(15,4) NOT NULL,
  `counted` decimal(15,4) NOT NULL,
  `cost` decimal(25,4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `stock_count_id` (`stock_count_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_stock_count_items`
--

LOCK TABLES `sma_stock_count_items` WRITE;
/*!40000 ALTER TABLE `sma_stock_count_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `sma_stock_count_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_stock_counts`
--

DROP TABLE IF EXISTS `sma_stock_counts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_stock_counts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL,
  `reference_no` varchar(55) NOT NULL,
  `warehouse_id` int NOT NULL,
  `type` varchar(10) NOT NULL,
  `initial_file` varchar(50) NOT NULL,
  `final_file` varchar(50) DEFAULT NULL,
  `brands` varchar(50) DEFAULT NULL,
  `brand_names` varchar(100) DEFAULT NULL,
  `categories` varchar(50) DEFAULT NULL,
  `category_names` varchar(100) DEFAULT NULL,
  `note` text,
  `products` int DEFAULT NULL,
  `rows` int DEFAULT NULL,
  `differences` int DEFAULT NULL,
  `matches` int DEFAULT NULL,
  `missing` int DEFAULT NULL,
  `created_by` int NOT NULL,
  `updated_by` int DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `finalized` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `warehouse_id` (`warehouse_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_stock_counts`
--

LOCK TABLES `sma_stock_counts` WRITE;
/*!40000 ALTER TABLE `sma_stock_counts` DISABLE KEYS */;
/*!40000 ALTER TABLE `sma_stock_counts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_suspended_bills`
--

DROP TABLE IF EXISTS `sma_suspended_bills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_suspended_bills` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `customer_id` int NOT NULL,
  `customer` varchar(55) DEFAULT NULL,
  `count` int NOT NULL,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `order_tax_id` int DEFAULT NULL,
  `total` decimal(25,4) NOT NULL,
  `biller_id` int DEFAULT NULL,
  `warehouse_id` int DEFAULT NULL,
  `created_by` int NOT NULL,
  `suspend_note` varchar(255) DEFAULT NULL,
  `shipping` decimal(15,4) DEFAULT '0.0000',
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_suspended_bills`
--

LOCK TABLES `sma_suspended_bills` WRITE;
/*!40000 ALTER TABLE `sma_suspended_bills` DISABLE KEYS */;
/*!40000 ALTER TABLE `sma_suspended_bills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_suspended_items`
--

DROP TABLE IF EXISTS `sma_suspended_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_suspended_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `suspend_id` int unsigned NOT NULL,
  `product_id` int unsigned NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `unit_price` decimal(25,4) NOT NULL,
  `quantity` decimal(15,4) DEFAULT '0.0000',
  `warehouse_id` int DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `discount` varchar(55) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `option_id` int DEFAULT NULL,
  `product_type` varchar(20) DEFAULT NULL,
  `real_unit_price` decimal(25,4) DEFAULT NULL,
  `product_unit_id` int DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `gst` varchar(20) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_suspended_items`
--

LOCK TABLES `sma_suspended_items` WRITE;
/*!40000 ALTER TABLE `sma_suspended_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `sma_suspended_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_tax_rates`
--

DROP TABLE IF EXISTS `sma_tax_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_tax_rates` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(55) NOT NULL,
  `code` varchar(10) DEFAULT NULL,
  `rate` decimal(12,4) NOT NULL,
  `type` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_tax_rates`
--

LOCK TABLES `sma_tax_rates` WRITE;
/*!40000 ALTER TABLE `sma_tax_rates` DISABLE KEYS */;
INSERT INTO `sma_tax_rates` VALUES (1,'No Tax','NT',0.0000,'2'),(2,'VAT @10%','VAT10',10.0000,'1'),(3,'GST @6%','GST',6.0000,'1'),(4,'VAT @20%','VT20',20.0000,'1');
/*!40000 ALTER TABLE `sma_tax_rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_transfer_items`
--

DROP TABLE IF EXISTS `sma_transfer_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_transfer_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `transfer_id` int NOT NULL,
  `product_id` int NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `option_id` int DEFAULT NULL,
  `expiry` date DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `tax_rate_id` int DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `net_unit_cost` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) DEFAULT NULL,
  `quantity_balance` decimal(15,4) NOT NULL,
  `unit_cost` decimal(25,4) DEFAULT NULL,
  `real_unit_cost` decimal(25,4) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `warehouse_id` int DEFAULT NULL,
  `product_unit_id` int DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL,
  `gst` varchar(20) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transfer_id` (`transfer_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_transfer_items`
--

LOCK TABLES `sma_transfer_items` WRITE;
/*!40000 ALTER TABLE `sma_transfer_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `sma_transfer_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_transfers`
--

DROP TABLE IF EXISTS `sma_transfers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_transfers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `transfer_no` varchar(55) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `from_warehouse_id` int NOT NULL,
  `from_warehouse_code` varchar(55) NOT NULL,
  `from_warehouse_name` varchar(55) NOT NULL,
  `to_warehouse_id` int NOT NULL,
  `to_warehouse_code` varchar(55) NOT NULL,
  `to_warehouse_name` varchar(55) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `total` decimal(25,4) DEFAULT NULL,
  `total_tax` decimal(25,4) DEFAULT NULL,
  `grand_total` decimal(25,4) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `status` varchar(55) NOT NULL DEFAULT 'pending',
  `shipping` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `attachment` varchar(55) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_transfers`
--

LOCK TABLES `sma_transfers` WRITE;
/*!40000 ALTER TABLE `sma_transfers` DISABLE KEYS */;
/*!40000 ALTER TABLE `sma_transfers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_units`
--

DROP TABLE IF EXISTS `sma_units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_units` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(10) NOT NULL,
  `name` varchar(55) NOT NULL,
  `base_unit` int DEFAULT NULL,
  `operator` varchar(1) DEFAULT NULL,
  `unit_value` varchar(55) DEFAULT NULL,
  `operation_value` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `base_unit` (`base_unit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_units`
--

LOCK TABLES `sma_units` WRITE;
/*!40000 ALTER TABLE `sma_units` DISABLE KEYS */;
/*!40000 ALTER TABLE `sma_units` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_user_logins`
--

DROP TABLE IF EXISTS `sma_user_logins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_user_logins` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `company_id` int DEFAULT NULL,
  `ip_address` varbinary(16) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_user_logins`
--

LOCK TABLES `sma_user_logins` WRITE;
/*!40000 ALTER TABLE `sma_user_logins` DISABLE KEYS */;
INSERT INTO `sma_user_logins` VALUES (1,1,NULL,_binary '103.118.46.61','owner@tecdiary.com','2023-03-18 22:33:14');
/*!40000 ALTER TABLE `sma_user_logins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_users`
--

DROP TABLE IF EXISTS `sma_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `last_ip_address` varbinary(45) DEFAULT NULL,
  `ip_address` varbinary(45) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(40) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int unsigned DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int unsigned NOT NULL,
  `last_login` int unsigned DEFAULT NULL,
  `active` tinyint unsigned DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `avatar` varchar(55) DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `group_id` int unsigned NOT NULL,
  `warehouse_id` int unsigned DEFAULT NULL,
  `biller_id` int unsigned DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  `show_cost` tinyint(1) DEFAULT '0',
  `show_price` tinyint(1) DEFAULT '0',
  `award_points` int DEFAULT '0',
  `view_right` tinyint(1) NOT NULL DEFAULT '0',
  `edit_right` tinyint(1) NOT NULL DEFAULT '0',
  `allow_discount` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`,`warehouse_id`,`biller_id`),
  KEY `group_id_2` (`group_id`,`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_users`
--

LOCK TABLES `sma_users` WRITE;
/*!40000 ALTER TABLE `sma_users` DISABLE KEYS */;
INSERT INTO `sma_users` VALUES (1,_binary '103.118.46.61',_binary '\0\0','owner','2c8ab736b2ccab4f50e72d5fd7d21020cbb77ae7',NULL,'owner@tecdiary.com',NULL,NULL,NULL,NULL,1351661704,1679153594,1,'Owner','Owner','Stock Manager','012345678',NULL,'male',1,NULL,NULL,NULL,0,0,0,0,0,0);
/*!40000 ALTER TABLE `sma_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_variants`
--

DROP TABLE IF EXISTS `sma_variants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_variants` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(55) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_variants`
--

LOCK TABLES `sma_variants` WRITE;
/*!40000 ALTER TABLE `sma_variants` DISABLE KEYS */;
/*!40000 ALTER TABLE `sma_variants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_warehouses`
--

DROP TABLE IF EXISTS `sma_warehouses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_warehouses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `map` varchar(255) DEFAULT NULL,
  `phone` varchar(55) DEFAULT NULL,
  `email` varchar(55) DEFAULT NULL,
  `price_group_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_warehouses`
--

LOCK TABLES `sma_warehouses` WRITE;
/*!40000 ALTER TABLE `sma_warehouses` DISABLE KEYS */;
INSERT INTO `sma_warehouses` VALUES (1,'WHI','Warehouse 1','<p>Address, City</p>',NULL,'012345678','whi@tecdiary.com',NULL),(2,'WHII','Warehouse 2','<p>Warehouse 2, Jalan Sultan Ismail, 54000, Kuala Lumpur</p>',NULL,'0105292122','whii@tecdiary.com',NULL);
/*!40000 ALTER TABLE `sma_warehouses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_warehouses_products`
--

DROP TABLE IF EXISTS `sma_warehouses_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_warehouses_products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `warehouse_id` int NOT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `rack` varchar(55) DEFAULT NULL,
  `avg_cost` decimal(25,4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  KEY `warehouse_id` (`warehouse_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_warehouses_products`
--

LOCK TABLES `sma_warehouses_products` WRITE;
/*!40000 ALTER TABLE `sma_warehouses_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `sma_warehouses_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_warehouses_products_variants`
--

DROP TABLE IF EXISTS `sma_warehouses_products_variants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_warehouses_products_variants` (
  `id` int NOT NULL AUTO_INCREMENT,
  `option_id` int NOT NULL,
  `product_id` int NOT NULL,
  `warehouse_id` int NOT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `rack` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `option_id` (`option_id`),
  KEY `product_id` (`product_id`),
  KEY `warehouse_id` (`warehouse_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_warehouses_products_variants`
--

LOCK TABLES `sma_warehouses_products_variants` WRITE;
/*!40000 ALTER TABLE `sma_warehouses_products_variants` DISABLE KEYS */;
/*!40000 ALTER TABLE `sma_warehouses_products_variants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_wishlist`
--

DROP TABLE IF EXISTS `sma_wishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_wishlist` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_wishlist`
--

LOCK TABLES `sma_wishlist` WRITE;
/*!40000 ALTER TABLE `sma_wishlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `sma_wishlist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-18 15:39:42
