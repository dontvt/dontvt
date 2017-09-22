-- MySQL dump 10.16  Distrib 10.1.26-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: appotapay_report
-- ------------------------------------------------------
-- Server version	10.1.26-MariaDB

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
-- Table structure for table `administrators`
--

DROP TABLE IF EXISTS `administrators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrators` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `fullname` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `permission` varchar(100) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `isRoot` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `all_revenue_daily`
--

DROP TABLE IF EXISTS `all_revenue_daily`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `all_revenue_daily` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `total_revenue_vnd` bigint(16) unsigned NOT NULL,
  `total_earning_revenue_vnd` bigint(16) unsigned NOT NULL,
  `total_revenue_usd` decimal(15,3) unsigned NOT NULL,
  `total_earning_revenue_usd` decimal(15,3) unsigned NOT NULL,
  `total_card_revenue` bigint(16) unsigned NOT NULL,
  `total_bank_revenue` bigint(16) unsigned NOT NULL,
  `total_sms_revenue` int(11) unsigned NOT NULL,
  `total_ewallet_revenue` bigint(16) unsigned NOT NULL,
  `total_apple_revenue` decimal(15,3) unsigned NOT NULL,
  `total_google_revenue` decimal(15,3) unsigned NOT NULL,
  `total_card_earning_revenue` bigint(16) unsigned NOT NULL,
  `total_bank_earning_revenue` bigint(16) unsigned NOT NULL,
  `total_ewallet_earning_revenue` bigint(16) unsigned NOT NULL,
  `total_sms_earning_revenue` int(11) unsigned NOT NULL,
  `total_apple_earning_revenue` decimal(15,3) unsigned NOT NULL,
  `total_google_earning_revenue` decimal(15,3) unsigned NOT NULL,
  `total_card_transaction` int(11) unsigned NOT NULL,
  `total_bank_transaction` int(11) unsigned NOT NULL,
  `total_sms_transaction` int(11) unsigned NOT NULL,
  `total_ewallet_transaction` int(11) unsigned NOT NULL,
  `total_apple_transaction` int(11) unsigned NOT NULL,
  `total_google_transaction` int(11) unsigned NOT NULL,
  `date` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `date` (`date`)
) ENGINE=InnoDB AUTO_INCREMENT=1390 DEFAULT CHARSET=latin1 COMMENT='Bang thong ke tong giao dich, revenue cua 2 thong AP va App';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `apple_transaction`
--

DROP TABLE IF EXISTS `apple_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `apple_transaction` (
  `transaction_id` varchar(30) NOT NULL,
  `developer_trans_id` char(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `developer_id` int(11) unsigned NOT NULL,
  `developer_name` varchar(150) NOT NULL,
  `application_id` int(11) unsigned NOT NULL,
  `application_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('error','pending','success') NOT NULL DEFAULT 'error',
  `amount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00',
  `earning_amount` decimal(15,3) unsigned NOT NULL DEFAULT '0.000',
  `currency` char(5) NOT NULL DEFAULT 'VND',
  `state` varchar(100) NOT NULL DEFAULT '',
  `target` varchar(100) NOT NULL DEFAULT '',
  `receipt_data` longtext NOT NULL,
  `product_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `error_code` tinyint(3) NOT NULL,
  `message` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `input_content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `apple_transaction_id` char(60) NOT NULL DEFAULT '',
  `request_time` int(11) unsigned NOT NULL,
  `response_time` int(11) unsigned NOT NULL,
  `ip` char(20) NOT NULL,
  `country_code` char(5) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'VN',
  `user_agent` varchar(200) NOT NULL DEFAULT '',
  `sandbox` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `system` char(15) NOT NULL DEFAULT '',
  `gma_id` char(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `pid` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `appota_app_id` int(11) unsigned NOT NULL DEFAULT '0',
  `share_percent` decimal(5,2) unsigned NOT NULL DEFAULT '0.00',
  `product_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`transaction_id`),
  KEY `response_time` (`response_time`),
  KEY `developer_id` (`developer_id`),
  KEY `application_id` (`application_id`),
  KEY `gma_id` (`gma_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `apple_value_statistics`
--

DROP TABLE IF EXISTS `apple_value_statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `apple_value_statistics` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `application_id` int(11) unsigned NOT NULL,
  `application_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `developer_id` int(11) unsigned NOT NULL,
  `developer_email` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `gma_id` char(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `product_type` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `transaction_amount` decimal(15,2) unsigned NOT NULL,
  `total_transaction` int(11) unsigned NOT NULL,
  `date` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `application_id` (`application_id`,`transaction_amount`,`date`)
) ENGINE=InnoDB AUTO_INCREMENT=8144 DEFAULT CHARSET=latin1 COMMENT='Bang thong ke giao dich theo value giao dich';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `appota_apple_transaction`
--

DROP TABLE IF EXISTS `appota_apple_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appota_apple_transaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_id` varchar(25) NOT NULL,
  `user_id` int(11) unsigned NOT NULL DEFAULT '0',
  `username` varchar(150) NOT NULL DEFAULT '',
  `pid` varchar(100) NOT NULL DEFAULT 'appota',
  `status` enum('success','error') NOT NULL DEFAULT 'error',
  `amount` decimal(10,2) NOT NULL,
  `earning_amount` decimal(10,3) NOT NULL DEFAULT '0.000',
  `currency` enum('USD') NOT NULL DEFAULT 'USD',
  `application_id` int(11) unsigned NOT NULL,
  `application_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `developer_id` int(11) unsigned NOT NULL,
  `developer_name` varchar(150) NOT NULL,
  `input_content` varchar(1000) NOT NULL,
  `receipt_data` varchar(4000) NOT NULL DEFAULT '',
  `input_transaction_id` varchar(50) NOT NULL,
  `product_id` varchar(100) NOT NULL,
  `state` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `target` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ipn_url` varchar(200) NOT NULL DEFAULT '',
  `request_time` int(11) unsigned NOT NULL,
  `input_time` int(11) unsigned NOT NULL DEFAULT '0',
  `developer_percent` int(11) NOT NULL,
  `error_code` tinyint(3) NOT NULL,
  `ip` varchar(25) NOT NULL DEFAULT '',
  `country_code` varchar(5) NOT NULL DEFAULT '',
  `gma_id` char(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `transaction_id` (`transaction_id`),
  UNIQUE KEY `input_transaction_id` (`input_transaction_id`),
  KEY `application_id` (`application_id`),
  KEY `input_time` (`input_time`),
  KEY `status` (`status`),
  KEY `developer_id` (`developer_id`),
  KEY `gma_id` (`gma_id`)
) ENGINE=InnoDB AUTO_INCREMENT=377219 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `appota_bank_transaction`
--

DROP TABLE IF EXISTS `appota_bank_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appota_bank_transaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_id` varchar(25) NOT NULL,
  `user_id` int(11) unsigned NOT NULL DEFAULT '0',
  `username` varchar(150) NOT NULL DEFAULT '',
  `pid` varchar(100) NOT NULL DEFAULT 'appota',
  `status` enum('success','error') NOT NULL DEFAULT 'error',
  `amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `earning_amount` decimal(12,3) unsigned NOT NULL DEFAULT '0.000',
  `currency` char(6) NOT NULL DEFAULT 'VND',
  `application_id` int(11) unsigned NOT NULL,
  `application_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `developer_id` int(11) unsigned NOT NULL,
  `developer_name` varchar(150) NOT NULL,
  `store` varchar(20) NOT NULL DEFAULT '',
  `state` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `target` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ipn_url` varchar(200) NOT NULL DEFAULT '',
  `input_content` varchar(1000) NOT NULL,
  `input_id` tinyint(3) unsigned NOT NULL,
  `input_transaction_id` varchar(50) NOT NULL,
  `request_time` int(11) unsigned NOT NULL,
  `input_time` int(11) unsigned NOT NULL DEFAULT '0',
  `developer_percent` int(11) NOT NULL,
  `inapp_content` varchar(500) NOT NULL,
  `vendor` enum('smartlink','onepay') NOT NULL,
  `type` varchar(10) NOT NULL DEFAULT 'atm',
  `ipn_confirm` tinyint(1) NOT NULL DEFAULT '0',
  `error_code` tinyint(3) NOT NULL,
  `ip` varchar(25) NOT NULL DEFAULT '',
  `country_code` varchar(5) NOT NULL DEFAULT '',
  `gma_id` char(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `transaction_id` (`transaction_id`),
  KEY `application_id` (`application_id`),
  KEY `input_time` (`input_time`),
  KEY `status` (`status`),
  KEY `developer_id` (`developer_id`),
  KEY `gma_id` (`gma_id`)
) ENGINE=InnoDB AUTO_INCREMENT=108253 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `appota_card_transaction`
--

DROP TABLE IF EXISTS `appota_card_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appota_card_transaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_id` varchar(25) NOT NULL,
  `user_id` int(11) unsigned NOT NULL DEFAULT '0',
  `username` varchar(150) NOT NULL DEFAULT '',
  `pid` varchar(100) NOT NULL DEFAULT 'appota',
  `card_code` varchar(25) NOT NULL,
  `card_serial` varchar(25) NOT NULL,
  `vendor` char(15) NOT NULL,
  `amount` int(11) unsigned NOT NULL,
  `earning_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `currency` enum('VND') NOT NULL DEFAULT 'VND',
  `status` enum('success','error') NOT NULL DEFAULT 'error',
  `state` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `target` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `application_id` int(11) unsigned NOT NULL,
  `application_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `developer_id` int(11) unsigned NOT NULL,
  `developer_name` varchar(150) NOT NULL,
  `developer_percent` varchar(5) NOT NULL,
  `input_content` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `input_id` tinyint(3) NOT NULL,
  `input_transaction_id` varchar(100) NOT NULL,
  `ipn_url` varchar(200) NOT NULL DEFAULT '',
  `request_time` int(11) unsigned NOT NULL,
  `input_time` int(11) unsigned NOT NULL DEFAULT '0',
  `error_code` tinyint(3) NOT NULL,
  `store` varchar(20) NOT NULL DEFAULT '',
  `ip` varchar(25) NOT NULL DEFAULT '',
  `country_code` varchar(5) NOT NULL DEFAULT '',
  `gma_id` char(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `transaction_id` (`transaction_id`),
  KEY `application_id` (`application_id`),
  KEY `card_code` (`card_code`),
  KEY `card_serial` (`card_serial`),
  KEY `input_time` (`input_time`),
  KEY `status` (`status`),
  KEY `developer_id` (`developer_id`),
  KEY `gma_id` (`gma_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6913454 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `appota_google_transaction`
--

DROP TABLE IF EXISTS `appota_google_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appota_google_transaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_id` varchar(25) NOT NULL,
  `user_id` int(11) unsigned NOT NULL DEFAULT '0',
  `username` varchar(150) NOT NULL DEFAULT '',
  `pid` varchar(100) DEFAULT 'appota',
  `status` enum('success','error') NOT NULL DEFAULT 'error',
  `amount` decimal(10,2) NOT NULL,
  `earning_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `currency` enum('USD') NOT NULL DEFAULT 'USD',
  `application_id` int(11) unsigned NOT NULL,
  `application_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `developer_id` int(11) unsigned NOT NULL,
  `developer_name` varchar(150) NOT NULL,
  `input_content` varchar(1000) NOT NULL,
  `input_transaction_id` varchar(50) NOT NULL,
  `product_id` varchar(100) NOT NULL,
  `state` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `target` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ipn_url` varchar(200) NOT NULL DEFAULT '',
  `request_time` int(11) unsigned NOT NULL,
  `input_time` int(11) unsigned NOT NULL DEFAULT '0',
  `developer_percent` int(11) NOT NULL,
  `error_code` tinyint(3) NOT NULL,
  `ip` varchar(25) NOT NULL DEFAULT '',
  `country_code` varchar(5) NOT NULL DEFAULT '',
  `gma_id` char(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `transaction_id` (`transaction_id`),
  UNIQUE KEY `input_transaction_id` (`input_transaction_id`),
  KEY `application_id` (`application_id`),
  KEY `input_time` (`input_time`),
  KEY `status` (`status`),
  KEY `developer_id` (`developer_id`),
  KEY `gma_id` (`gma_id`)
) ENGINE=InnoDB AUTO_INCREMENT=44695 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `appota_sms_transaction`
--

DROP TABLE IF EXISTS `appota_sms_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appota_sms_transaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_id` varchar(25) NOT NULL,
  `user_id` int(11) unsigned NOT NULL DEFAULT '0',
  `username` varchar(150) NOT NULL DEFAULT '',
  `pid` varchar(100) NOT NULL DEFAULT 'appota',
  `phone` varchar(15) NOT NULL,
  `status` enum('success','error') NOT NULL DEFAULT 'error',
  `amount` int(11) unsigned NOT NULL,
  `earning_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `vendor` enum('viettel','vinaphone','mobifone','other') NOT NULL,
  `currency` enum('VND') NOT NULL DEFAULT 'VND',
  `type` enum('SMS STATIC','SMS DYNAMIC') NOT NULL DEFAULT 'SMS DYNAMIC',
  `method` char(10) NOT NULL DEFAULT 'SMS_MOMT',
  `application_id` int(11) unsigned NOT NULL,
  `application_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `developer_id` int(11) unsigned NOT NULL,
  `developer_name` varchar(150) NOT NULL,
  `input_content` varchar(255) NOT NULL,
  `input_id` tinyint(3) unsigned NOT NULL,
  `input_transaction_id` varchar(50) NOT NULL,
  `state` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `target` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ipn_url` varchar(200) NOT NULL DEFAULT '',
  `request_time` int(11) unsigned NOT NULL,
  `input_time` int(11) unsigned NOT NULL DEFAULT '0',
  `developer_percent` tinyint(3) unsigned NOT NULL,
  `error_code` tinyint(3) NOT NULL,
  `times` int(11) NOT NULL DEFAULT '0',
  `store` varchar(20) NOT NULL DEFAULT '',
  `ip` varchar(25) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `transaction_id` (`transaction_id`),
  KEY `application_id` (`application_id`),
  KEY `phone` (`phone`),
  KEY `input_time` (`input_time`),
  KEY `status` (`status`),
  KEY `target` (`target`),
  KEY `developer_id` (`developer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1006035 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `appota_user_transaction`
--

DROP TABLE IF EXISTS `appota_user_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appota_user_transaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_id` varchar(30) NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `username` varchar(150) NOT NULL,
  `status` enum('success','error') NOT NULL DEFAULT 'error',
  `amount` decimal(10,2) NOT NULL,
  `currency` varchar(10) NOT NULL DEFAULT 'VND',
  `application_id` int(11) unsigned NOT NULL,
  `application_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `developer_id` int(11) unsigned NOT NULL,
  `developer_name` varchar(150) NOT NULL,
  `type` varchar(15) NOT NULL,
  `input_time` int(11) unsigned NOT NULL,
  `gma_id` char(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `date` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `transaction_id` (`transaction_id`),
  KEY `user_id` (`user_id`),
  KEY `input_time` (`input_time`),
  KEY `date` (`date`),
  KEY `gma_id` (`gma_id`),
  KEY `application_id` (`application_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6707531 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bank_statistics`
--

DROP TABLE IF EXISTS `bank_statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bank_statistics` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `application_id` int(11) unsigned NOT NULL,
  `application_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `developer_id` int(11) unsigned NOT NULL,
  `developer_email` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `gma_id` char(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `product_type` char(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `bank_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `total_transaction` int(11) unsigned NOT NULL,
  `date` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `application_id` (`application_id`,`bank_name`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Bang thong ke loai bank';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bank_transaction`
--

DROP TABLE IF EXISTS `bank_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bank_transaction` (
  `transaction_id` varchar(30) NOT NULL,
  `developer_trans_id` char(30) NOT NULL DEFAULT '',
  `developer_id` int(11) unsigned NOT NULL,
  `developer_name` varchar(50) NOT NULL,
  `application_id` int(11) unsigned NOT NULL,
  `application_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('error','pending','success','rollback','cancel') NOT NULL DEFAULT 'error',
  `amount` int(11) NOT NULL DEFAULT '0',
  `earning_amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `dev_earning_amount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00',
  `currency` char(5) NOT NULL DEFAULT 'VND',
  `vendor` char(15) NOT NULL,
  `type` char(5) NOT NULL DEFAULT 'atm',
  `bank_name` char(25) NOT NULL DEFAULT '',
  `ipn_confirm` tinyint(1) NOT NULL DEFAULT '0',
  `token_user` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `state` varchar(100) NOT NULL DEFAULT '',
  `target` varchar(100) NOT NULL DEFAULT '',
  `extra_info` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `error_code` tinyint(3) NOT NULL,
  `message` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `input_id` tinyint(3) NOT NULL,
  `input_content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `input_transaction_id` char(60) NOT NULL DEFAULT '',
  `request_time` int(11) unsigned NOT NULL,
  `response_time` int(11) unsigned NOT NULL,
  `ip` char(20) NOT NULL,
  `country_code` char(5) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'VN',
  `user_agent` varchar(200) NOT NULL DEFAULT '',
  `stick` tinyint(2) NOT NULL DEFAULT '0',
  `system` char(15) NOT NULL DEFAULT '',
  `pid` char(20) NOT NULL DEFAULT '',
  `appota_app_id` int(11) unsigned NOT NULL DEFAULT '0',
  `share_percent` decimal(5,2) unsigned NOT NULL DEFAULT '0.00',
  `gma_id` char(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `product_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `platform` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`transaction_id`),
  UNIQUE KEY `developer_trans_id` (`developer_trans_id`,`developer_id`),
  KEY `response_time` (`response_time`),
  KEY `application_id` (`application_id`),
  KEY `gma_id` (`gma_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bank_value_statistics`
--

DROP TABLE IF EXISTS `bank_value_statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bank_value_statistics` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `application_id` int(11) unsigned NOT NULL,
  `application_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `developer_id` int(11) unsigned NOT NULL,
  `developer_email` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `gma_id` char(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `product_type` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `transaction_amount` int(11) unsigned NOT NULL,
  `total_transaction` int(11) unsigned NOT NULL,
  `date` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `application_id` (`application_id`,`transaction_amount`,`date`)
) ENGINE=InnoDB AUTO_INCREMENT=40357 DEFAULT CHARSET=latin1 COMMENT='Bang thong ke giao dich theo value';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `card_statistics`
--

DROP TABLE IF EXISTS `card_statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `card_statistics` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `application_id` int(11) unsigned NOT NULL,
  `application_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `developer_id` int(11) unsigned NOT NULL,
  `developer_email` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `gma_id` char(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `product_type` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `total_viettel` int(11) unsigned NOT NULL,
  `total_mobifone` int(11) unsigned NOT NULL,
  `total_vinaphone` int(11) unsigned NOT NULL,
  `total_fpt` int(11) unsigned NOT NULL,
  `total_mega` int(11) unsigned NOT NULL,
  `total_vtc` int(11) unsigned NOT NULL,
  `total_appota` int(11) unsigned NOT NULL,
  `total_viettel_revenue` bigint(16) unsigned NOT NULL,
  `total_vinaphone_revenue` bigint(16) unsigned NOT NULL,
  `total_mobifone_revenue` bigint(16) unsigned NOT NULL,
  `total_appota_revenue` bigint(16) unsigned NOT NULL,
  `total_fpt_revenue` bigint(16) unsigned NOT NULL,
  `total_mega_revenue` bigint(16) unsigned NOT NULL,
  `total_vtc_revenue` bigint(16) unsigned NOT NULL,
  `date` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `application_id` (`application_id`,`date`)
) ENGINE=InnoDB AUTO_INCREMENT=14664 DEFAULT CHARSET=latin1 COMMENT='Bang thong ke loai the cao';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `card_transaction`
--

DROP TABLE IF EXISTS `card_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `card_transaction` (
  `transaction_id` varchar(30) NOT NULL,
  `developer_trans_id` char(30) NOT NULL DEFAULT '',
  `card_code` char(25) NOT NULL,
  `card_serial` char(25) NOT NULL,
  `vendor` char(15) NOT NULL,
  `developer_id` int(11) unsigned NOT NULL,
  `developer_name` varchar(50) NOT NULL,
  `application_id` int(11) unsigned NOT NULL,
  `application_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('error','pending','success') NOT NULL DEFAULT 'error',
  `amount` int(11) unsigned NOT NULL DEFAULT '0',
  `earning_amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `dev_earning_amount` int(11) unsigned NOT NULL DEFAULT '0',
  `currency` char(5) NOT NULL DEFAULT 'VND',
  `state` varchar(100) NOT NULL DEFAULT '',
  `target` varchar(100) NOT NULL DEFAULT '',
  `error_code` tinyint(3) NOT NULL,
  `message` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `input_id` tinyint(3) NOT NULL,
  `input_content` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `input_transaction_id` char(60) NOT NULL DEFAULT '',
  `request_time` int(11) unsigned NOT NULL,
  `response_time` int(11) unsigned NOT NULL,
  `ip` char(20) NOT NULL,
  `country_code` char(5) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'VN',
  `user_agent` varchar(200) NOT NULL DEFAULT '',
  `stick` tinyint(2) NOT NULL DEFAULT '0',
  `system` char(15) NOT NULL DEFAULT '',
  `pid` char(20) NOT NULL DEFAULT '',
  `appota_app_id` int(11) unsigned NOT NULL DEFAULT '0',
  `share_percent` decimal(5,2) unsigned NOT NULL DEFAULT '0.00',
  `gma_id` char(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `product_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `platform` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`transaction_id`),
  UNIQUE KEY `developer_trans_id` (`developer_trans_id`,`developer_id`),
  KEY `response_time` (`response_time`),
  KEY `application_id` (`application_id`),
  KEY `gma_id` (`gma_id`),
  KEY `card_serial` (`card_serial`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `card_value_statistics`
--

DROP TABLE IF EXISTS `card_value_statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `card_value_statistics` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `application_id` int(11) unsigned NOT NULL,
  `application_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `developer_id` int(11) unsigned NOT NULL,
  `developer_email` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `gma_id` char(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `product_type` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `total_v10000` int(11) unsigned NOT NULL,
  `total_v20000` int(11) unsigned NOT NULL,
  `total_v30000` int(11) unsigned NOT NULL,
  `total_v50000` int(11) unsigned NOT NULL,
  `total_v100000` int(11) unsigned NOT NULL,
  `total_v200000` int(11) unsigned NOT NULL,
  `total_v300000` int(11) unsigned NOT NULL,
  `total_v500000` int(11) unsigned NOT NULL,
  `total_v1000000` int(11) unsigned NOT NULL,
  `total_v2000000` int(11) unsigned NOT NULL,
  `total_3000000` int(11) unsigned NOT NULL,
  `total_5000000` int(11) unsigned NOT NULL,
  `card_type` char(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `date` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `application_id` (`application_id`,`card_type`,`date`)
) ENGINE=InnoDB AUTO_INCREMENT=68807 DEFAULT CHARSET=latin1 COMMENT='Bang thong ke theo tung loai the va menh gia';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ewallet_statistics`
--

DROP TABLE IF EXISTS `ewallet_statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ewallet_statistics` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `application_id` int(11) unsigned NOT NULL,
  `application_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `developer_id` int(11) unsigned NOT NULL,
  `developer_email` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `gma_id` char(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `product_type` char(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `provider_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `total_transaction` int(11) unsigned NOT NULL,
  `date` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `application_id` (`application_id`,`provider_name`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Bang thong ke theo tung loai vi';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ewallet_transaction`
--

DROP TABLE IF EXISTS `ewallet_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ewallet_transaction` (
  `transaction_id` varchar(30) NOT NULL,
  `developer_trans_id` char(30) NOT NULL,
  `developer_id` int(11) unsigned NOT NULL,
  `developer_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `application_id` int(11) unsigned NOT NULL,
  `application_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('error','success','pending','rollback') NOT NULL DEFAULT 'error',
  `amount` int(11) unsigned NOT NULL,
  `earning_amount` decimal(15,0) unsigned NOT NULL,
  `vendor` char(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `currency` char(5) NOT NULL DEFAULT 'VND',
  `state` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `target` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `input_id` tinyint(3) unsigned NOT NULL,
  `input_content` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `input_transaction_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `error_code` tinyint(3) unsigned NOT NULL,
  `message` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `extra_info` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ip` char(25) NOT NULL,
  `country_code` char(5) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'VN',
  `user_agent` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `stick` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `system` char(15) NOT NULL,
  `pid` char(20) NOT NULL,
  `appota_app_id` int(11) unsigned NOT NULL DEFAULT '0',
  `share_percent` decimal(5,0) unsigned NOT NULL DEFAULT '0',
  `gma_id` char(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `product_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `platform` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `request_time` int(11) unsigned NOT NULL,
  `response_time` int(11) unsigned NOT NULL,
  PRIMARY KEY (`transaction_id`),
  UNIQUE KEY `developer_trans_id` (`developer_trans_id`),
  KEY `developer_id` (`developer_id`),
  KEY `application_id` (`application_id`),
  KEY `response_time` (`response_time`),
  KEY `gma_id` (`gma_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ewallet_value_statistics`
--

DROP TABLE IF EXISTS `ewallet_value_statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ewallet_value_statistics` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `application_id` int(11) unsigned NOT NULL,
  `application_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `developer_id` int(11) unsigned NOT NULL,
  `developer_email` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `gma_id` char(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `product_type` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `transaction_amount` int(11) unsigned NOT NULL,
  `total_transaction` int(11) unsigned NOT NULL,
  `date` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `application_id` (`application_id`,`transaction_amount`,`date`)
) ENGINE=InnoDB AUTO_INCREMENT=6530 DEFAULT CHARSET=latin1 COMMENT='Bang thong ke theo gia tri giao dich';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gamota_game_revenue_daily`
--

DROP TABLE IF EXISTS `gamota_game_revenue_daily`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gamota_game_revenue_daily` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `gma_id` char(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `game_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `total_revenue_vnd` bigint(16) unsigned NOT NULL,
  `total_earning_revenue_vnd` bigint(16) unsigned NOT NULL,
  `total_revenue_usd` decimal(15,3) unsigned NOT NULL,
  `total_earning_revenue_usd` decimal(15,3) unsigned NOT NULL,
  `total_card_revenue` bigint(16) unsigned NOT NULL,
  `total_bank_revenue` bigint(16) unsigned NOT NULL,
  `total_sms_revenue` int(11) unsigned NOT NULL,
  `total_ewallet_revenue` bigint(16) unsigned NOT NULL,
  `total_apple_revenue` decimal(15,3) unsigned NOT NULL,
  `total_google_revenue` decimal(15,3) unsigned NOT NULL,
  `total_card_earning_revenue` bigint(16) unsigned NOT NULL,
  `total_bank_earning_revenue` bigint(16) unsigned NOT NULL,
  `total_ewallet_earning_revenue` bigint(16) unsigned NOT NULL,
  `total_sms_earning_revenue` int(11) unsigned NOT NULL,
  `total_apple_earning_revenue` decimal(15,3) unsigned NOT NULL,
  `total_google_earning_revenue` decimal(15,3) unsigned NOT NULL,
  `total_card_transaction` int(11) unsigned NOT NULL,
  `total_bank_transaction` int(11) unsigned NOT NULL,
  `total_sms_transaction` int(11) unsigned NOT NULL,
  `total_ewallet_transaction` int(11) unsigned NOT NULL,
  `total_apple_transaction` int(11) unsigned NOT NULL,
  `total_google_transaction` int(11) unsigned NOT NULL,
  `date` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `gma_id` (`gma_id`,`date`)
) ENGINE=InnoDB AUTO_INCREMENT=24074 DEFAULT CHARSET=latin1 COMMENT='Bang luu tong revenue hang ngay cua game gamota o 2 he thong AP va APPOTA';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `google_transaction`
--

DROP TABLE IF EXISTS `google_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `google_transaction` (
  `transaction_id` varchar(30) NOT NULL,
  `developer_trans_id` char(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `developer_id` int(11) unsigned NOT NULL,
  `developer_name` varchar(150) NOT NULL,
  `application_id` int(11) unsigned NOT NULL,
  `application_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('error','pending','success') NOT NULL DEFAULT 'error',
  `amount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00',
  `earning_amount` decimal(15,3) unsigned NOT NULL DEFAULT '0.000',
  `currency` char(5) NOT NULL DEFAULT 'VND',
  `state` varchar(100) NOT NULL DEFAULT '',
  `target` varchar(100) NOT NULL DEFAULT '',
  `receipt_data` longtext NOT NULL,
  `product_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `error_code` tinyint(3) NOT NULL,
  `message` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `input_content` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `google_transaction_id` char(60) NOT NULL DEFAULT '',
  `request_time` int(11) unsigned NOT NULL,
  `response_time` int(11) unsigned NOT NULL,
  `ip` char(20) NOT NULL,
  `country_code` char(5) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'VN',
  `user_agent` varchar(200) NOT NULL DEFAULT '',
  `sandbox` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `system` char(15) NOT NULL DEFAULT '',
  `gma_id` char(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `pid` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `appota_app_id` int(11) unsigned NOT NULL DEFAULT '0',
  `share_percent` decimal(5,2) unsigned NOT NULL DEFAULT '0.00',
  `product_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`transaction_id`),
  UNIQUE KEY `developer_trans_id` (`developer_trans_id`,`developer_id`),
  KEY `response_time` (`response_time`),
  KEY `application_id` (`application_id`),
  KEY `gma_id` (`gma_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `google_value_statistics`
--

DROP TABLE IF EXISTS `google_value_statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `google_value_statistics` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `application_id` int(11) unsigned NOT NULL,
  `application_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `developer_id` int(11) unsigned NOT NULL,
  `developer_email` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `gma_id` char(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `product_type` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `transaction_amount` decimal(15,2) unsigned NOT NULL,
  `total_transaction` int(11) unsigned NOT NULL,
  `date` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `application_id` (`application_id`,`transaction_amount`,`date`)
) ENGINE=InnoDB AUTO_INCREMENT=5291 DEFAULT CHARSET=latin1 COMMENT='Bang thong ke giao dich theo value';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `location_matching`
--

DROP TABLE IF EXISTS `location_matching`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location_matching` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `country_code` char(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `country_name` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timestamp` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=246 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `location_statistics`
--

DROP TABLE IF EXISTS `location_statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location_statistics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `application_id` int(11) unsigned NOT NULL,
  `application_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `developer_id` int(11) unsigned NOT NULL,
  `developer_email` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `gma_id` char(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `product_type` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `country_code` char(5) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `country_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `city_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `total_transaction` int(11) unsigned NOT NULL,
  `date` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `application_id` (`application_id`,`country_code`,`date`)
) ENGINE=InnoDB AUTO_INCREMENT=56912 DEFAULT CHARSET=latin1 COMMENT='Bang luu thong ke giao dich theo location';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `payhub_apple_transaction`
--

DROP TABLE IF EXISTS `payhub_apple_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payhub_apple_transaction` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `transaction_id` char(30) NOT NULL,
  `partner_trans_id` char(30) NOT NULL,
  `user_id` int(11) unsigned NOT NULL DEFAULT '0',
  `username` varchar(150) NOT NULL DEFAULT '',
  `game_id` int(11) unsigned NOT NULL,
  `game_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `developer_id` int(11) unsigned NOT NULL,
  `developer_name` varchar(150) NOT NULL,
  `platform` char(15) NOT NULL DEFAULT '',
  `amount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00',
  `status` enum('error','success','pending') NOT NULL DEFAULT 'error',
  `currency` char(5) NOT NULL DEFAULT 'USD',
  `input_content` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `country_code` char(5) NOT NULL DEFAULT 'VN',
  `ip_address` char(25) NOT NULL DEFAULT '',
  `user_agent` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `role_id` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `role_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `server_id` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `server_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `package_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value_in_game` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `game_currency` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sandbox` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `receipt` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `track_info` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `gma_id` char(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `request_time` int(11) unsigned NOT NULL,
  `response_time` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `transaction_id` (`transaction_id`),
  UNIQUE KEY `partner_trans_id` (`partner_trans_id`),
  KEY `game_id` (`game_id`),
  KEY `gma_id` (`gma_id`),
  KEY `response_time` (`response_time`)
) ENGINE=InnoDB AUTO_INCREMENT=425915 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `payhub_bank_transaction`
--

DROP TABLE IF EXISTS `payhub_bank_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payhub_bank_transaction` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `transaction_id` char(30) NOT NULL,
  `partner_trans_id` char(30) NOT NULL,
  `user_id` int(11) unsigned NOT NULL DEFAULT '0',
  `username` varchar(150) NOT NULL DEFAULT '',
  `game_id` int(11) unsigned NOT NULL,
  `game_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `developer_id` int(11) unsigned NOT NULL,
  `developer_name` varchar(150) NOT NULL,
  `platform` char(15) NOT NULL DEFAULT '',
  `amount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00',
  `status` enum('error','success','pending') NOT NULL DEFAULT 'error',
  `type` char(10) NOT NULL DEFAULT 'atm',
  `input_content` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `currency` char(5) NOT NULL DEFAULT 'VND',
  `country_code` char(5) NOT NULL DEFAULT 'VN',
  `ip_address` char(20) NOT NULL DEFAULT '',
  `user_agent` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `role_id` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `role_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `server_id` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `server_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `package_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value_in_game` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `game_currency` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sandbox` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `track_info` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `refer` char(15) NOT NULL DEFAULT '',
  `gma_id` char(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `request_time` int(11) unsigned NOT NULL,
  `response_time` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `transaction_id` (`transaction_id`),
  UNIQUE KEY `partner_trans_id` (`partner_trans_id`),
  KEY `game_id` (`game_id`),
  KEY `gma_id` (`gma_id`),
  KEY `response_time` (`response_time`)
) ENGINE=InnoDB AUTO_INCREMENT=208688 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `payhub_card_transaction`
--

DROP TABLE IF EXISTS `payhub_card_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payhub_card_transaction` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `transaction_id` char(30) NOT NULL,
  `partner_trans_id` char(30) NOT NULL,
  `user_id` int(11) unsigned NOT NULL DEFAULT '0',
  `username` varchar(150) NOT NULL DEFAULT '',
  `game_id` int(11) unsigned NOT NULL,
  `game_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `developer_id` int(11) unsigned NOT NULL,
  `developer_name` varchar(150) NOT NULL,
  `platform` char(15) NOT NULL DEFAULT '',
  `code` char(25) NOT NULL,
  `serial` char(25) NOT NULL,
  `vendor` char(20) NOT NULL,
  `amount` int(11) unsigned NOT NULL DEFAULT '0',
  `status` enum('error','success','pending') NOT NULL DEFAULT 'error',
  `currency` char(5) NOT NULL DEFAULT 'VND',
  `input_content` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `country_code` char(5) NOT NULL DEFAULT 'VN',
  `ip_address` char(25) NOT NULL DEFAULT '',
  `user_agent` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `role_id` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `role_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `server_id` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `server_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `package_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value_in_game` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `game_currency` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sandbox` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `track_info` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `refer` char(15) NOT NULL DEFAULT '',
  `gma_id` char(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `request_time` int(11) unsigned NOT NULL,
  `response_time` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `transaction_id` (`transaction_id`),
  UNIQUE KEY `partner_trans_id` (`partner_trans_id`),
  KEY `game_id` (`game_id`),
  KEY `gma_id` (`gma_id`),
  KEY `response_time` (`response_time`),
  KEY `serial` (`serial`)
) ENGINE=InnoDB AUTO_INCREMENT=7368470 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `payhub_ewallet_transaction`
--

DROP TABLE IF EXISTS `payhub_ewallet_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payhub_ewallet_transaction` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `transaction_id` char(30) NOT NULL,
  `partner_trans_id` char(30) NOT NULL,
  `user_id` int(11) unsigned NOT NULL DEFAULT '0',
  `username` varchar(150) NOT NULL DEFAULT '',
  `game_id` int(11) unsigned NOT NULL,
  `game_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `developer_id` int(11) unsigned NOT NULL,
  `developer_name` varchar(150) NOT NULL,
  `platform` char(15) NOT NULL DEFAULT '',
  `amount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00',
  `status` enum('error','success','pending') NOT NULL DEFAULT 'error',
  `vendor` char(20) NOT NULL,
  `input_content` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `currency` char(5) NOT NULL DEFAULT 'VND',
  `country_code` char(5) NOT NULL DEFAULT 'VN',
  `ip_address` char(20) NOT NULL DEFAULT '',
  `user_agent` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `role_id` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `role_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `server_id` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `server_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `package_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value_in_game` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `game_currency` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sandbox` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `track_info` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `refer` char(15) NOT NULL DEFAULT '',
  `gma_id` char(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `request_time` int(11) unsigned NOT NULL,
  `response_time` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `transaction_id` (`transaction_id`),
  UNIQUE KEY `partner_trans_id` (`partner_trans_id`),
  KEY `game_id` (`game_id`),
  KEY `gma_id` (`gma_id`),
  KEY `response_time` (`response_time`)
) ENGINE=InnoDB AUTO_INCREMENT=81794 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `payhub_google_transaction`
--

DROP TABLE IF EXISTS `payhub_google_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payhub_google_transaction` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `transaction_id` char(30) NOT NULL,
  `partner_trans_id` char(30) NOT NULL,
  `user_id` int(11) unsigned NOT NULL DEFAULT '0',
  `username` varchar(150) NOT NULL DEFAULT '',
  `game_id` int(11) unsigned NOT NULL,
  `game_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `developer_id` int(11) unsigned NOT NULL,
  `developer_name` varchar(150) NOT NULL,
  `platform` char(15) NOT NULL DEFAULT '',
  `amount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00',
  `status` enum('error','success','pending') NOT NULL DEFAULT 'error',
  `currency` char(5) NOT NULL DEFAULT 'USD',
  `input_content` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `country_code` char(5) NOT NULL DEFAULT 'VN',
  `ip_address` char(25) NOT NULL DEFAULT '',
  `user_agent` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `role_id` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `role_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `server_id` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `server_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `package_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value_in_game` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `game_currency` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sandbox` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `receipt` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `track_info` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `gma_id` char(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `request_time` int(11) unsigned NOT NULL,
  `response_time` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `transaction_id` (`transaction_id`),
  UNIQUE KEY `partner_trans_id` (`partner_trans_id`),
  KEY `game_id` (`game_id`),
  KEY `gma_id` (`gma_id`),
  KEY `response_time` (`response_time`)
) ENGINE=InnoDB AUTO_INCREMENT=144938 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `payhub_sms_transaction`
--

DROP TABLE IF EXISTS `payhub_sms_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payhub_sms_transaction` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `transaction_id` char(30) NOT NULL,
  `partner_trans_id` char(30) NOT NULL,
  `user_id` int(11) unsigned NOT NULL DEFAULT '0',
  `username` varchar(150) NOT NULL DEFAULT '',
  `game_id` int(11) unsigned NOT NULL,
  `game_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `developer_id` int(11) unsigned NOT NULL,
  `developer_name` varchar(150) NOT NULL,
  `platform` char(15) NOT NULL DEFAULT '',
  `phone` char(15) NOT NULL,
  `vendor` char(20) NOT NULL,
  `amount` int(11) unsigned NOT NULL DEFAULT '0',
  `status` enum('error','success','pending') NOT NULL DEFAULT 'error',
  `currency` char(5) NOT NULL DEFAULT 'VND',
  `input_content` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `country_code` char(5) NOT NULL DEFAULT 'VN',
  `ip_address` char(25) NOT NULL DEFAULT '',
  `user_agent` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `role_id` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `role_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `server_id` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `server_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `package_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value_in_game` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `game_currency` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sandbox` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `request_time` int(11) unsigned NOT NULL,
  `response_time` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `transaction_id` (`transaction_id`),
  UNIQUE KEY `partner_trans_id` (`partner_trans_id`),
  KEY `username` (`username`),
  KEY `game_id` (`game_id`),
  KEY `response_time` (`response_time`)
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `payhub_user_transaction`
--

DROP TABLE IF EXISTS `payhub_user_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payhub_user_transaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_id` char(30) NOT NULL,
  `partner_trans_id` char(30) NOT NULL,
  `user_id` int(11) unsigned NOT NULL DEFAULT '0',
  `username` char(150) NOT NULL DEFAULT '',
  `game_id` int(11) unsigned NOT NULL,
  `game_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `developer_id` int(11) unsigned NOT NULL,
  `developer_name` varchar(150) NOT NULL,
  `platform` char(15) NOT NULL DEFAULT '',
  `role_id` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `role_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `server_id` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `server_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `type` char(20) NOT NULL,
  `vendor` char(20) NOT NULL DEFAULT '',
  `amount` decimal(15,3) unsigned NOT NULL,
  `currency` char(5) NOT NULL,
  `package_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value_in_game` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `game_currency` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `gma_id` char(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timestamp` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `transaction_id` (`transaction_id`),
  UNIQUE KEY `partner_trans_id` (`partner_trans_id`),
  KEY `username` (`username`),
  KEY `game_id` (`game_id`),
  KEY `gma_id` (`gma_id`),
  KEY `timestamp` (`timestamp`)
) ENGINE=InnoDB AUTO_INCREMENT=5463014 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `permission`
--

DROP TABLE IF EXISTS `permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `role` text,
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `revenue_daily`
--

DROP TABLE IF EXISTS `revenue_daily`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `revenue_daily` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `application_id` int(11) unsigned NOT NULL,
  `application_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `developer_id` int(11) unsigned NOT NULL,
  `developer_email` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `gma_id` char(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `product_type` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `total_revenue_vnd` bigint(16) unsigned NOT NULL,
  `total_earning_revenue_vnd` bigint(16) unsigned NOT NULL,
  `total_revenue_usd` decimal(15,3) unsigned NOT NULL,
  `total_earning_revenue_usd` decimal(15,3) unsigned NOT NULL,
  `total_card_revenue` bigint(16) unsigned NOT NULL,
  `total_bank_revenue` bigint(16) unsigned NOT NULL,
  `total_sms_revenue` int(11) unsigned NOT NULL,
  `total_ewallet_revenue` bigint(16) unsigned NOT NULL,
  `total_apple_revenue` decimal(15,3) unsigned NOT NULL,
  `total_google_revenue` decimal(15,3) unsigned NOT NULL,
  `total_card_earning_revenue` bigint(16) unsigned NOT NULL,
  `total_bank_earning_revenue` bigint(16) unsigned NOT NULL,
  `total_ewallet_earning_revenue` bigint(16) unsigned NOT NULL,
  `total_sms_earning_revenue` int(11) unsigned NOT NULL,
  `total_apple_earning_revenue` decimal(15,3) unsigned NOT NULL,
  `total_google_earning_revenue` decimal(15,3) unsigned NOT NULL,
  `total_card_transaction` int(11) unsigned NOT NULL,
  `total_bank_transaction` int(11) unsigned NOT NULL,
  `total_sms_transaction` int(11) unsigned NOT NULL,
  `total_ewallet_transaction` int(11) unsigned NOT NULL,
  `total_apple_transaction` int(11) unsigned NOT NULL,
  `total_google_transaction` int(11) unsigned NOT NULL,
  `date` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `application_id` (`application_id`,`date`)
) ENGINE=InnoDB AUTO_INCREMENT=17530 DEFAULT CHARSET=latin1 COMMENT='Bang luu revenue hang ngay cac app tren he thong AP';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_group` varchar(255) DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `module` varchar(255) DEFAULT NULL,
  `controller` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `role_group`
--

DROP TABLE IF EXISTS `role_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sms_transaction`
--

DROP TABLE IF EXISTS `sms_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms_transaction` (
  `transaction_id` varchar(30) NOT NULL,
  `developer_id` int(1) unsigned NOT NULL,
  `developer_name` varchar(50) NOT NULL,
  `application_id` int(11) unsigned NOT NULL,
  `application_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `phone` char(15) NOT NULL,
  `status` enum('error','pending','success') NOT NULL DEFAULT 'error',
  `amount` int(11) unsigned NOT NULL DEFAULT '0',
  `earning_amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `vendor` char(15) NOT NULL,
  `state` varchar(100) NOT NULL DEFAULT '',
  `target` varchar(100) NOT NULL DEFAULT '',
  `error_code` tinyint(3) NOT NULL,
  `type` char(15) NOT NULL,
  `method` char(10) NOT NULL DEFAULT 'SMS_MOMT',
  `input_content` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `input_transaction_id` char(50) NOT NULL DEFAULT '',
  `request_time` int(11) unsigned NOT NULL,
  `response_time` int(11) unsigned NOT NULL,
  `provider` char(20) NOT NULL,
  `ip` char(20) NOT NULL,
  `user_agent` varchar(200) NOT NULL DEFAULT '',
  `stick` tinyint(2) NOT NULL DEFAULT '0',
  `system` char(15) NOT NULL DEFAULT '',
  `product_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`transaction_id`),
  KEY `response_time` (`response_time`),
  KEY `developer_id` (`developer_id`),
  KEY `application_id` (`application_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Bang luu giao dich tren he thong AP';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-09-23  1:49:58
