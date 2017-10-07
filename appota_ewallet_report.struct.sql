-- MySQL dump 10.16  Distrib 10.1.26-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: appota_ewallet_report
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
-- Table structure for table `all_statistics_daily`
--

DROP TABLE IF EXISTS `all_statistics_daily`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `all_statistics_daily` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `new_users` int(10) unsigned NOT NULL,
  `cashin_transaction` int(10) unsigned NOT NULL,
  `cashout_transaction` int(10) unsigned NOT NULL,
  `cashback_transaction` int(10) unsigned NOT NULL,
  `topup_transaction` int(10) unsigned NOT NULL,
  `buy_card_transaction` int(10) unsigned NOT NULL,
  `game_ewallet_transaction` int(10) unsigned NOT NULL,
  `game_bank_transaction` int(10) unsigned NOT NULL,
  `game_card_transaction` int(10) unsigned NOT NULL,
  `payment_services_transaction` int(10) unsigned NOT NULL,
  `buy_spin_transaction` int(10) unsigned NOT NULL,
  `game_betting_transaction` int(10) unsigned NOT NULL,
  `voucher_transaction` int(10) unsigned NOT NULL,
  `cashin_revenue` bigint(20) unsigned NOT NULL,
  `cashout_revenue` bigint(20) unsigned NOT NULL,
  `cashback_revenue` bigint(20) unsigned NOT NULL,
  `topup_revenue` bigint(20) unsigned NOT NULL,
  `buy_card_revenue` bigint(20) unsigned NOT NULL,
  `game_ewallet_revenue` bigint(20) unsigned NOT NULL,
  `game_card_revenue` bigint(20) unsigned NOT NULL,
  `game_bank_revenue` bigint(20) unsigned NOT NULL,
  `payment_services_revenue` bigint(20) unsigned NOT NULL,
  `buy_spin_revenue` bigint(20) unsigned NOT NULL,
  `game_betting_revenue` bigint(20) unsigned NOT NULL,
  `voucher_revenue` bigint(20) unsigned NOT NULL,
  `date` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `date` (`date`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-10-07 18:51:05
