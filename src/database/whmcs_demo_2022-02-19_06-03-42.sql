-- MySQL dump 10.19  Distrib 10.3.32-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: whmcs_demo
-- ------------------------------------------------------
-- Server version	10.3.32-MariaDB-0ubuntu0.20.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `mod_invoicedata`
--

DROP TABLE IF EXISTS `mod_invoicedata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mod_invoicedata` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `invoiceid` int(10) NOT NULL,
  `clientsdetails` text COLLATE utf8_unicode_ci NOT NULL,
  `customfields` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mod_invoicedata`
--

LOCK TABLES `mod_invoicedata` WRITE;
/*!40000 ALTER TABLE `mod_invoicedata` DISABLE KEYS */;
/*!40000 ALTER TABLE `mod_invoicedata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblaccounts`
--

DROP TABLE IF EXISTS `tblaccounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblaccounts` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `userid` int(10) NOT NULL,
  `currency` int(10) NOT NULL,
  `gateway` text COLLATE utf8_unicode_ci NOT NULL,
  `date` datetime DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `amountin` decimal(16,2) NOT NULL DEFAULT 0.00,
  `fees` decimal(16,2) NOT NULL DEFAULT 0.00,
  `amountout` decimal(16,2) NOT NULL DEFAULT 0.00,
  `rate` decimal(16,5) NOT NULL DEFAULT 1.00000,
  `transid` text COLLATE utf8_unicode_ci NOT NULL,
  `invoiceid` int(10) NOT NULL DEFAULT 0,
  `refundid` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `invoiceid` (`invoiceid`),
  KEY `userid` (`userid`),
  KEY `date` (`date`),
  KEY `transid` (`transid`(32))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblaccounts`
--

LOCK TABLES `tblaccounts` WRITE;
/*!40000 ALTER TABLE `tblaccounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblaccounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblactivitylog`
--

DROP TABLE IF EXISTS `tblactivitylog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblactivitylog` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `user` text COLLATE utf8_unicode_ci NOT NULL,
  `userid` int(10) unsigned NOT NULL DEFAULT 0,
  `user_id` int(10) unsigned NOT NULL DEFAULT 0,
  `admin_id` int(10) unsigned NOT NULL DEFAULT 0,
  `ipaddr` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `user_id` (`user_id`),
  KEY `admin_id` (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblactivitylog`
--

LOCK TABLES `tblactivitylog` WRITE;
/*!40000 ALTER TABLE `tblactivitylog` DISABLE KEYS */;
INSERT INTO `tblactivitylog` VALUES (1,'2022-02-19 05:02:03','Updated WHMCS Rewrite Rules: new rules applied.','System',0,0,0,''),(2,'2022-02-19 05:02:03','URI Path Management Setting \"Rewrite Auto Management\" Enabled','System',0,0,0,''),(3,'2022-02-19 05:02:03','Updated URI Path Mode to: basic','System',0,0,0,'');
/*!40000 ALTER TABLE `tblactivitylog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbladdonmodules`
--

DROP TABLE IF EXISTS `tbladdonmodules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbladdonmodules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module` text COLLATE utf8_unicode_ci NOT NULL,
  `setting` text COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbladdonmodules`
--

LOCK TABLES `tbladdonmodules` WRITE;
/*!40000 ALTER TABLE `tbladdonmodules` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbladdonmodules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbladdons`
--

DROP TABLE IF EXISTS `tbladdons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbladdons` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `packages` text COLLATE utf8_unicode_ci NOT NULL,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `billingcycle` text COLLATE utf8_unicode_ci NOT NULL,
  `allowqty` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `tax` tinyint(1) NOT NULL,
  `showorder` tinyint(1) NOT NULL,
  `hidden` tinyint(1) NOT NULL DEFAULT 0,
  `retired` tinyint(1) NOT NULL DEFAULT 0,
  `downloads` text COLLATE utf8_unicode_ci NOT NULL,
  `autoactivate` text COLLATE utf8_unicode_ci NOT NULL,
  `suspendproduct` tinyint(1) NOT NULL,
  `welcomeemail` int(10) NOT NULL,
  `type` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `module` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `server_group_id` int(10) NOT NULL DEFAULT 0,
  `prorate` tinyint(1) NOT NULL DEFAULT 0,
  `weight` int(2) NOT NULL DEFAULT 0,
  `autolinkby` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `name` (`name`(32))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbladdons`
--

LOCK TABLES `tbladdons` WRITE;
/*!40000 ALTER TABLE `tbladdons` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbladdons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbladminlog`
--

DROP TABLE IF EXISTS `tbladminlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbladminlog` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `adminusername` text COLLATE utf8_unicode_ci NOT NULL,
  `logintime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `logouttime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ipaddress` text COLLATE utf8_unicode_ci NOT NULL,
  `sessionid` text COLLATE utf8_unicode_ci NOT NULL,
  `lastvisit` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `logouttime` (`logouttime`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbladminlog`
--

LOCK TABLES `tbladminlog` WRITE;
/*!40000 ALTER TABLE `tbladminlog` DISABLE KEYS */;
INSERT INTO `tbladminlog` VALUES (1,'admin','2022-02-19 05:02:33','0000-00-00 00:00:00','91.96.93.36','aov4mluaj8rnvlndurg2lpn179','2022-02-19 05:02:33'),(2,'admin','2022-02-19 05:03:42','0000-00-00 00:00:00','92.106.151.87','3m93lvt7o4q383i364fv89i94u','2022-02-19 05:03:42');
/*!40000 ALTER TABLE `tbladminlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbladminperms`
--

DROP TABLE IF EXISTS `tbladminperms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbladminperms` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `roleid` int(1) NOT NULL,
  `permid` int(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `roleid_permid` (`roleid`,`permid`)
) ENGINE=InnoDB AUTO_INCREMENT=253 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbladminperms`
--

LOCK TABLES `tbladminperms` WRITE;
/*!40000 ALTER TABLE `tbladminperms` DISABLE KEYS */;
INSERT INTO `tbladminperms` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(8,1,8),(9,1,9),(10,1,10),(11,1,11),(12,1,12),(13,1,13),(14,1,14),(15,1,15),(16,1,16),(17,1,17),(18,1,18),(19,1,19),(20,1,20),(21,1,21),(22,1,22),(23,1,23),(24,1,24),(25,1,25),(26,1,26),(27,1,27),(28,1,28),(29,1,29),(30,1,30),(31,1,31),(32,1,32),(33,1,33),(34,1,34),(35,1,35),(36,1,36),(37,1,37),(38,1,38),(39,1,39),(40,1,40),(41,1,41),(42,1,42),(43,1,43),(44,1,44),(45,1,45),(46,1,46),(47,1,47),(48,1,49),(49,1,50),(50,1,51),(51,1,52),(52,1,53),(53,1,54),(54,1,55),(55,1,56),(56,1,57),(57,1,58),(58,1,59),(59,1,60),(60,1,61),(61,1,62),(62,1,63),(63,1,64),(64,1,65),(65,1,66),(66,1,67),(67,1,68),(68,1,69),(69,1,70),(70,1,71),(71,1,72),(72,1,73),(73,1,74),(74,1,75),(75,1,76),(76,1,77),(77,1,78),(78,1,79),(79,1,80),(80,1,81),(81,1,82),(82,1,83),(83,1,84),(84,1,85),(85,1,86),(86,1,87),(87,1,88),(88,1,89),(89,1,90),(90,1,91),(91,1,92),(92,1,93),(93,1,94),(94,1,95),(95,1,96),(96,1,97),(97,1,98),(98,1,99),(99,1,100),(100,1,101),(101,1,102),(102,1,103),(103,1,104),(104,1,105),(105,1,106),(106,1,107),(107,1,108),(108,1,109),(109,1,110),(110,1,111),(111,1,112),(112,1,113),(113,1,114),(114,1,115),(115,1,116),(116,1,117),(117,1,118),(118,1,119),(119,1,120),(120,1,122),(121,1,123),(122,1,124),(123,1,125),(124,1,125),(125,1,126),(126,1,126),(127,1,127),(128,1,128),(129,1,129),(130,1,131),(131,1,132),(132,1,133),(133,1,134),(134,1,135),(135,1,136),(136,1,137),(137,1,138),(138,1,139),(139,1,139),(140,1,140),(141,1,141),(142,1,142),(143,1,143),(144,1,144),(145,1,145),(146,1,146),(231,1,147),(232,1,148),(233,1,149),(245,1,150),(246,1,151),(247,1,152),(248,1,153),(249,1,154),(250,1,155),(251,1,156),(252,1,157),(147,2,1),(148,2,2),(149,2,3),(150,2,4),(151,2,5),(152,2,6),(153,2,7),(154,2,8),(155,2,9),(156,2,10),(157,2,11),(158,2,12),(159,2,13),(160,2,14),(161,2,15),(162,2,16),(163,2,17),(164,2,18),(165,2,19),(166,2,20),(167,2,21),(168,2,22),(169,2,23),(170,2,24),(171,2,25),(172,2,26),(173,2,27),(174,2,28),(175,2,29),(176,2,30),(177,2,31),(178,2,32),(179,2,33),(180,2,34),(181,2,35),(182,2,36),(183,2,37),(184,2,38),(185,2,39),(186,2,40),(187,2,41),(188,2,42),(189,2,43),(190,2,44),(191,2,45),(192,2,46),(193,2,47),(194,2,49),(195,2,50),(196,2,51),(197,2,52),(198,2,71),(199,2,73),(200,2,85),(201,2,98),(202,2,99),(203,2,101),(204,2,104),(205,2,105),(206,2,110),(207,2,120),(208,2,123),(209,2,124),(210,2,125),(211,2,125),(212,2,126),(213,2,126),(214,2,128),(215,2,129),(216,2,145),(244,2,149),(217,3,3),(218,3,38),(219,3,39),(220,3,40),(221,3,41),(222,3,42),(223,3,43),(224,3,44),(225,3,50),(226,3,105),(227,3,125),(228,3,125),(229,3,126),(230,3,128);
/*!40000 ALTER TABLE `tbladminperms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbladminroles`
--

DROP TABLE IF EXISTS `tbladminroles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbladminroles` (
  `id` int(1) NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `widgets` text COLLATE utf8_unicode_ci NOT NULL,
  `reports` text COLLATE utf8_unicode_ci NOT NULL,
  `systememails` int(1) NOT NULL,
  `accountemails` int(1) NOT NULL,
  `supportemails` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbladminroles`
--

LOCK TABLES `tbladminroles` WRITE;
/*!40000 ALTER TABLE `tbladminroles` DISABLE KEYS */;
INSERT INTO `tbladminroles` VALUES (1,'Full Administrator','activity_log,getting_started,income_forecast,income_overview,my_notes,network_status,open_invoices,orders_overview,paypal_addon,admin_activity,client_activity,system_overview,todo_list,whmcs_news,supporttickets_overview,calendar','',1,1,1),(2,'Sales Operator','activity_log,getting_started,income_forecast,income_overview,my_notes,network_status,open_invoices,orders_overview,paypal_addon,client_activity,todo_list,whmcs_news,supporttickets_overview,calendar','',0,1,1),(3,'Support Operator','activity_log,getting_started,my_notes,todo_list,whmcs_news,supporttickets_overview,calendar','',0,0,1);
/*!40000 ALTER TABLE `tbladminroles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbladmins`
--

DROP TABLE IF EXISTS `tbladmins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbladmins` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `roleid` int(1) NOT NULL,
  `username` text COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `passwordhash` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `authmodule` text COLLATE utf8_unicode_ci NOT NULL,
  `authdata` text COLLATE utf8_unicode_ci NOT NULL,
  `firstname` text COLLATE utf8_unicode_ci NOT NULL,
  `lastname` text COLLATE utf8_unicode_ci NOT NULL,
  `email` text COLLATE utf8_unicode_ci NOT NULL,
  `signature` text COLLATE utf8_unicode_ci NOT NULL,
  `notes` text COLLATE utf8_unicode_ci NOT NULL,
  `template` text COLLATE utf8_unicode_ci NOT NULL,
  `language` text COLLATE utf8_unicode_ci NOT NULL,
  `disabled` int(1) NOT NULL,
  `loginattempts` int(1) NOT NULL,
  `supportdepts` text COLLATE utf8_unicode_ci NOT NULL,
  `ticketnotifications` text COLLATE utf8_unicode_ci NOT NULL,
  `homewidgets` text COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_key` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `password_reset_data` text COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_expiry` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `hidden_widgets` text COLLATE utf8_unicode_ci NOT NULL,
  `widget_order` text COLLATE utf8_unicode_ci NOT NULL,
  `user_preferences` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `username` (`username`(32))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbladmins`
--

LOCK TABLES `tbladmins` WRITE;
/*!40000 ALTER TABLE `tbladmins` DISABLE KEYS */;
INSERT INTO `tbladmins` VALUES (1,'d6280735-f9bc-4769-b73d-761dde537595',1,'admin','$2y$10$TvpzIoEBDDE0DZckm8lGf.X9FLpS7Y24Aa3Kq9gGfdc22qzVU23Ri','$2y$10$A4e5Wcx6SIghLyYhUkiOPegsZsRTA3/uI0uOa/ja2L9/9Cg6Iv.wy','','','Pascal','Leenders','p.leenders@lchcloud.de','','Welcome to WHMCS!  Please ensure you have setup the cron job to automate tasks','blend','',0,0,',','','getting_started:true,orders_overview:true,supporttickets_overview:true,my_notes:true,client_activity:true,open_invoices:true,activity_log:true|income_overview:true,system_overview:true,whmcs_news:true,sysinfo:true,admin_activity:true,todo_list:true,network_status:true,income_forecast:true|','','','0000-00-00 00:00:00','','',NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `tbladmins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbladminsecurityquestions`
--

DROP TABLE IF EXISTS `tbladminsecurityquestions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbladminsecurityquestions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `question` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbladminsecurityquestions`
--

LOCK TABLES `tbladminsecurityquestions` WRITE;
/*!40000 ALTER TABLE `tbladminsecurityquestions` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbladminsecurityquestions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblaffiliates`
--

DROP TABLE IF EXISTS `tblaffiliates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblaffiliates` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `clientid` int(10) NOT NULL,
  `visitors` int(1) NOT NULL,
  `paytype` text COLLATE utf8_unicode_ci NOT NULL,
  `payamount` decimal(16,2) NOT NULL,
  `onetime` int(1) NOT NULL,
  `balance` decimal(16,2) NOT NULL DEFAULT 0.00,
  `withdrawn` decimal(16,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `clientid` (`clientid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblaffiliates`
--

LOCK TABLES `tblaffiliates` WRITE;
/*!40000 ALTER TABLE `tblaffiliates` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblaffiliates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblaffiliates_hits`
--

DROP TABLE IF EXISTS `tblaffiliates_hits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblaffiliates_hits` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `affiliate_id` int(10) unsigned NOT NULL DEFAULT 0,
  `referrer_id` int(10) unsigned NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `affiliate_id` (`affiliate_id`,`referrer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblaffiliates_hits`
--

LOCK TABLES `tblaffiliates_hits` WRITE;
/*!40000 ALTER TABLE `tblaffiliates_hits` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblaffiliates_hits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblaffiliates_referrers`
--

DROP TABLE IF EXISTS `tblaffiliates_referrers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblaffiliates_referrers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `affiliate_id` int(10) unsigned NOT NULL DEFAULT 0,
  `referrer` varchar(500) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `affiliate_id` (`affiliate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblaffiliates_referrers`
--

LOCK TABLES `tblaffiliates_referrers` WRITE;
/*!40000 ALTER TABLE `tblaffiliates_referrers` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblaffiliates_referrers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblaffiliatesaccounts`
--

DROP TABLE IF EXISTS `tblaffiliatesaccounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblaffiliatesaccounts` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `affiliateid` int(10) NOT NULL,
  `relid` int(10) NOT NULL,
  `lastpaid` date NOT NULL DEFAULT '0000-00-00',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `affiliateid` (`affiliateid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblaffiliatesaccounts`
--

LOCK TABLES `tblaffiliatesaccounts` WRITE;
/*!40000 ALTER TABLE `tblaffiliatesaccounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblaffiliatesaccounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblaffiliateshistory`
--

DROP TABLE IF EXISTS `tblaffiliateshistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblaffiliateshistory` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `affiliateid` int(10) NOT NULL,
  `date` date NOT NULL,
  `affaccid` int(10) NOT NULL,
  `invoice_id` int(10) unsigned NOT NULL DEFAULT 0,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `amount` decimal(16,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `affiliateid` (`affiliateid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblaffiliateshistory`
--

LOCK TABLES `tblaffiliateshistory` WRITE;
/*!40000 ALTER TABLE `tblaffiliateshistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblaffiliateshistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblaffiliatespending`
--

DROP TABLE IF EXISTS `tblaffiliatespending`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblaffiliatespending` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `affaccid` int(10) NOT NULL DEFAULT 0,
  `invoice_id` int(10) unsigned NOT NULL DEFAULT 0,
  `amount` decimal(16,2) NOT NULL,
  `clearingdate` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `clearingdate` (`clearingdate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblaffiliatespending`
--

LOCK TABLES `tblaffiliatespending` WRITE;
/*!40000 ALTER TABLE `tblaffiliatespending` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblaffiliatespending` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblaffiliateswithdrawals`
--

DROP TABLE IF EXISTS `tblaffiliateswithdrawals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblaffiliateswithdrawals` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `affiliateid` int(10) NOT NULL,
  `date` date NOT NULL,
  `amount` decimal(16,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `affiliateid` (`affiliateid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblaffiliateswithdrawals`
--

LOCK TABLES `tblaffiliateswithdrawals` WRITE;
/*!40000 ALTER TABLE `tblaffiliateswithdrawals` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblaffiliateswithdrawals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblannouncements`
--

DROP TABLE IF EXISTS `tblannouncements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblannouncements` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `announcement` text COLLATE utf8_unicode_ci NOT NULL,
  `published` tinyint(1) NOT NULL,
  `parentid` int(10) NOT NULL,
  `language` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `date` (`date`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblannouncements`
--

LOCK TABLES `tblannouncements` WRITE;
/*!40000 ALTER TABLE `tblannouncements` DISABLE KEYS */;
INSERT INTO `tblannouncements` VALUES (1,'2022-02-19 05:02:03','Thank you for choosing WHMCS!','<p>Welcome to <a title=\"WHMCS\" href=\"http://whmcs.com\" target=\"_blank\">WHMCS</a>!\n You have made a great choice and we want to help you get up and running as\n quickly as possible.</p>\n<p>This is a sample announcement. Announcements are a great way to keep your\n customers informed about news and special offers. You can edit or delete this\n announcement by logging into the admin area and navigating to <em>Support &gt;\n Announcements</em>.</p>\n<p>If at any point you get stuck, our support team is available 24x7 to\n assist you. Simply visit <a title=\"www.whmcs.com/support\"\n href=\"https://www.whmcs.com/support\" target=\"_blank\">www.whmcs.com/support</a>\n to request assistance.</p>',1,0,'','0000-00-00 00:00:00','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `tblannouncements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblapi_roles`
--

DROP TABLE IF EXISTS `tblapi_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblapi_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `permissions` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblapi_roles`
--

LOCK TABLES `tblapi_roles` WRITE;
/*!40000 ALTER TABLE `tblapi_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblapi_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblapilog`
--

DROP TABLE IF EXISTS `tblapilog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblapilog` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `action` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `request` text COLLATE utf8_unicode_ci NOT NULL,
  `response` text COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `headers` text COLLATE utf8_unicode_ci NOT NULL,
  `level` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblapilog`
--

LOCK TABLES `tblapilog` WRITE;
/*!40000 ALTER TABLE `tblapilog` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblapilog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblapplinks`
--

DROP TABLE IF EXISTS `tblapplinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblapplinks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `module_type` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `module_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `is_enabled` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblapplinks`
--

LOCK TABLES `tblapplinks` WRITE;
/*!40000 ALTER TABLE `tblapplinks` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblapplinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblapplinks_links`
--

DROP TABLE IF EXISTS `tblapplinks_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblapplinks_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `applink_id` int(10) unsigned NOT NULL DEFAULT 0,
  `scope` varchar(80) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `display_label` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `is_enabled` tinyint(4) NOT NULL DEFAULT 0,
  `order` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblapplinks_links`
--

LOCK TABLES `tblapplinks_links` WRITE;
/*!40000 ALTER TABLE `tblapplinks_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblapplinks_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblapplinks_log`
--

DROP TABLE IF EXISTS `tblapplinks_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblapplinks_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `applink_id` int(10) unsigned NOT NULL DEFAULT 0,
  `message` varchar(2000) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `level` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblapplinks_log`
--

LOCK TABLES `tblapplinks_log` WRITE;
/*!40000 ALTER TABLE `tblapplinks_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblapplinks_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblauthn_account_links`
--

DROP TABLE IF EXISTS `tblauthn_account_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblauthn_account_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `provider` char(32) COLLATE utf8_unicode_ci NOT NULL,
  `remote_user_id` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL,
  `contact_id` int(11) DEFAULT NULL,
  `metadata` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tblauthn_account_links_provider_remote_user_id_unique` (`provider`,`remote_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblauthn_account_links`
--

LOCK TABLES `tblauthn_account_links` WRITE;
/*!40000 ALTER TABLE `tblauthn_account_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblauthn_account_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblauthn_config`
--

DROP TABLE IF EXISTS `tblauthn_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblauthn_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `provider` char(64) COLLATE utf8_unicode_ci NOT NULL,
  `setting` char(128) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tblauthn_config_provider_setting_unique` (`provider`,`setting`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblauthn_config`
--

LOCK TABLES `tblauthn_config` WRITE;
/*!40000 ALTER TABLE `tblauthn_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblauthn_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblbankaccts`
--

DROP TABLE IF EXISTS `tblbankaccts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblbankaccts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pay_method_id` int(11) NOT NULL DEFAULT 0,
  `bank_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `acct_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `bank_data` blob NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tblbankaccts_pay_method_id` (`pay_method_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblbankaccts`
--

LOCK TABLES `tblbankaccts` WRITE;
/*!40000 ALTER TABLE `tblbankaccts` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblbankaccts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblbannedemails`
--

DROP TABLE IF EXISTS `tblbannedemails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblbannedemails` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `domain` text COLLATE utf8_unicode_ci NOT NULL,
  `count` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `domain` (`domain`(64))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblbannedemails`
--

LOCK TABLES `tblbannedemails` WRITE;
/*!40000 ALTER TABLE `tblbannedemails` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblbannedemails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblbannedips`
--

DROP TABLE IF EXISTS `tblbannedips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblbannedips` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `ip` text COLLATE utf8_unicode_ci NOT NULL,
  `reason` text COLLATE utf8_unicode_ci NOT NULL,
  `expires` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ip` (`ip`(32))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblbannedips`
--

LOCK TABLES `tblbannedips` WRITE;
/*!40000 ALTER TABLE `tblbannedips` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblbannedips` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblbillableitems`
--

DROP TABLE IF EXISTS `tblbillableitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblbillableitems` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `userid` int(10) NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `hours` decimal(5,1) NOT NULL,
  `amount` decimal(16,2) NOT NULL,
  `recur` int(5) NOT NULL DEFAULT 0,
  `recurcycle` text COLLATE utf8_unicode_ci NOT NULL,
  `recurfor` int(5) NOT NULL DEFAULT 0,
  `invoiceaction` int(1) NOT NULL,
  `unit` tinyint(1) NOT NULL DEFAULT 0,
  `duedate` date NOT NULL,
  `invoicecount` int(5) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblbillableitems`
--

LOCK TABLES `tblbillableitems` WRITE;
/*!40000 ALTER TABLE `tblbillableitems` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblbillableitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblbundles`
--

DROP TABLE IF EXISTS `tblbundles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblbundles` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `validfrom` date NOT NULL,
  `validuntil` date NOT NULL,
  `uses` int(4) NOT NULL,
  `maxuses` int(4) NOT NULL,
  `itemdata` text COLLATE utf8_unicode_ci NOT NULL,
  `allowpromo` int(1) NOT NULL,
  `showgroup` int(1) NOT NULL,
  `gid` int(10) NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `displayprice` decimal(16,2) NOT NULL,
  `sortorder` int(3) NOT NULL,
  `is_featured` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblbundles`
--

LOCK TABLES `tblbundles` WRITE;
/*!40000 ALTER TABLE `tblbundles` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblbundles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblcalendar`
--

DROP TABLE IF EXISTS `tblcalendar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblcalendar` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `desc` text COLLATE utf8_unicode_ci NOT NULL,
  `start` int(10) NOT NULL,
  `end` int(10) NOT NULL,
  `allday` int(1) NOT NULL,
  `adminid` int(10) NOT NULL,
  `recurid` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblcalendar`
--

LOCK TABLES `tblcalendar` WRITE;
/*!40000 ALTER TABLE `tblcalendar` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblcalendar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblcampaigns`
--

DROP TABLE IF EXISTS `tblcampaigns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblcampaigns` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `admin_id` int(10) unsigned NOT NULL DEFAULT 0,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `configuration` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `message_data` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `sending_start_at` datetime DEFAULT NULL,
  `draft` tinyint(1) NOT NULL DEFAULT 0,
  `started` tinyint(1) NOT NULL DEFAULT 0,
  `paused` tinyint(1) NOT NULL DEFAULT 0,
  `position` int(10) unsigned NOT NULL DEFAULT 0,
  `completed` tinyint(1) NOT NULL DEFAULT 0,
  `completed_at` timestamp NULL DEFAULT NULL,
  `queue_completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tblcampaigns_started_index` (`started`),
  KEY `tblcampaigns_paused_index` (`paused`),
  KEY `tblcampaigns_completed_index` (`completed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblcampaigns`
--

LOCK TABLES `tblcampaigns` WRITE;
/*!40000 ALTER TABLE `tblcampaigns` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblcampaigns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblcancelrequests`
--

DROP TABLE IF EXISTS `tblcancelrequests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblcancelrequests` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `relid` int(10) NOT NULL,
  `reason` text COLLATE utf8_unicode_ci NOT NULL,
  `type` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `serviceid` (`relid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblcancelrequests`
--

LOCK TABLES `tblcancelrequests` WRITE;
/*!40000 ALTER TABLE `tblcancelrequests` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblcancelrequests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblclientgroups`
--

DROP TABLE IF EXISTS `tblclientgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblclientgroups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `groupname` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `groupcolour` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `discountpercent` decimal(10,2) unsigned DEFAULT 0.00,
  `susptermexempt` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `separateinvoices` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblclientgroups`
--

LOCK TABLES `tblclientgroups` WRITE;
/*!40000 ALTER TABLE `tblclientgroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblclientgroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblclients`
--

DROP TABLE IF EXISTS `tblclients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblclients` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `firstname` text COLLATE utf8_unicode_ci NOT NULL,
  `lastname` text COLLATE utf8_unicode_ci NOT NULL,
  `companyname` text COLLATE utf8_unicode_ci NOT NULL,
  `email` text COLLATE utf8_unicode_ci NOT NULL,
  `address1` text COLLATE utf8_unicode_ci NOT NULL,
  `address2` text COLLATE utf8_unicode_ci NOT NULL,
  `city` text COLLATE utf8_unicode_ci NOT NULL,
  `state` text COLLATE utf8_unicode_ci NOT NULL,
  `postcode` text COLLATE utf8_unicode_ci NOT NULL,
  `country` text COLLATE utf8_unicode_ci NOT NULL,
  `phonenumber` text COLLATE utf8_unicode_ci NOT NULL,
  `tax_id` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `password` text COLLATE utf8_unicode_ci NOT NULL,
  `authmodule` text COLLATE utf8_unicode_ci NOT NULL,
  `authdata` text COLLATE utf8_unicode_ci NOT NULL,
  `currency` int(10) NOT NULL,
  `defaultgateway` text COLLATE utf8_unicode_ci NOT NULL,
  `credit` decimal(16,2) NOT NULL,
  `taxexempt` tinyint(1) NOT NULL,
  `latefeeoveride` tinyint(1) NOT NULL,
  `overideduenotices` tinyint(1) NOT NULL,
  `separateinvoices` tinyint(1) NOT NULL,
  `disableautocc` tinyint(1) NOT NULL,
  `datecreated` date NOT NULL,
  `notes` text COLLATE utf8_unicode_ci NOT NULL,
  `billingcid` int(10) NOT NULL,
  `securityqid` int(10) NOT NULL,
  `securityqans` text COLLATE utf8_unicode_ci NOT NULL,
  `groupid` int(10) NOT NULL,
  `cardtype` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `cardlastfour` text COLLATE utf8_unicode_ci NOT NULL,
  `cardnum` blob NOT NULL,
  `startdate` blob NOT NULL,
  `expdate` blob NOT NULL,
  `issuenumber` blob NOT NULL,
  `bankname` text COLLATE utf8_unicode_ci NOT NULL,
  `banktype` text COLLATE utf8_unicode_ci NOT NULL,
  `bankcode` blob NOT NULL,
  `bankacct` blob NOT NULL,
  `gatewayid` text COLLATE utf8_unicode_ci NOT NULL,
  `lastlogin` datetime DEFAULT NULL,
  `ip` text COLLATE utf8_unicode_ci NOT NULL,
  `host` text COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('Active','Inactive','Closed') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Active',
  `language` text COLLATE utf8_unicode_ci NOT NULL,
  `pwresetkey` text COLLATE utf8_unicode_ci NOT NULL,
  `emailoptout` int(1) NOT NULL,
  `marketing_emails_opt_in` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `overrideautoclose` int(1) NOT NULL,
  `allow_sso` tinyint(1) NOT NULL DEFAULT 1,
  `email_verified` tinyint(1) NOT NULL DEFAULT 0,
  `email_preferences` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `pwresetexpiry` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `firstname_lastname` (`firstname`(32),`lastname`(32)),
  KEY `email` (`email`(64))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblclients`
--

LOCK TABLES `tblclients` WRITE;
/*!40000 ALTER TABLE `tblclients` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblclients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblclientsfiles`
--

DROP TABLE IF EXISTS `tblclientsfiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblclientsfiles` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `userid` int(10) NOT NULL,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `filename` text COLLATE utf8_unicode_ci NOT NULL,
  `adminonly` int(1) NOT NULL,
  `dateadded` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblclientsfiles`
--

LOCK TABLES `tblclientsfiles` WRITE;
/*!40000 ALTER TABLE `tblclientsfiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblclientsfiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblconfiguration`
--

DROP TABLE IF EXISTS `tblconfiguration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblconfiguration` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `setting` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `whmcs_setting_unique` (`setting`),
  KEY `setting` (`setting`)
) ENGINE=InnoDB AUTO_INCREMENT=247 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblconfiguration`
--

LOCK TABLES `tblconfiguration` WRITE;
/*!40000 ALTER TABLE `tblconfiguration` DISABLE KEYS */;
INSERT INTO `tblconfiguration` VALUES (1,'Language','English','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2,'CompanyName','Company Name','0000-00-00 00:00:00','0000-00-00 00:00:00'),(3,'Email','changeme@example.com','0000-00-00 00:00:00','0000-00-00 00:00:00'),(4,'Domain','http://www.yourdomain.com/','0000-00-00 00:00:00','0000-00-00 00:00:00'),(5,'LogoURL','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(6,'AutoSuspension','on','0000-00-00 00:00:00','0000-00-00 00:00:00'),(7,'AutoSuspensionDays','5','0000-00-00 00:00:00','0000-00-00 00:00:00'),(8,'CreateInvoiceDaysBefore','14','0000-00-00 00:00:00','0000-00-00 00:00:00'),(9,'AffiliateEnabled','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(10,'AffiliateEarningPercent','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(11,'AffiliateBonusDeposit','0.00','0000-00-00 00:00:00','0000-00-00 00:00:00'),(12,'AffiliatePayout','25.00','0000-00-00 00:00:00','2018-04-18 10:21:37'),(13,'AffiliateLinks','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(14,'ActivityLimit','10000','0000-00-00 00:00:00','0000-00-00 00:00:00'),(15,'DateFormat','DD/MM/YYYY','0000-00-00 00:00:00','0000-00-00 00:00:00'),(16,'PreSalesQuestions','on','0000-00-00 00:00:00','0000-00-00 00:00:00'),(17,'Template','twenty-one','0000-00-00 00:00:00','0000-00-00 00:00:00'),(18,'AllowRegister','on','0000-00-00 00:00:00','0000-00-00 00:00:00'),(19,'AllowTransfer','on','0000-00-00 00:00:00','0000-00-00 00:00:00'),(20,'AllowOwnDomain','on','0000-00-00 00:00:00','0000-00-00 00:00:00'),(21,'EnableTOSAccept','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(22,'TermsOfService','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(23,'AllowLanguageChange','on','0000-00-00 00:00:00','0000-00-00 00:00:00'),(24,'CutUtf8Mb4','on','0000-00-00 00:00:00','0000-00-00 00:00:00'),(25,'AllowCustomerChangeInvoiceGateway','on','0000-00-00 00:00:00','0000-00-00 00:00:00'),(26,'DefaultNameserver1','ns1.example.com','0000-00-00 00:00:00','0000-00-00 00:00:00'),(27,'DefaultNameserver2','ns2.example.com','0000-00-00 00:00:00','0000-00-00 00:00:00'),(28,'SendInvoiceReminderDays','7','0000-00-00 00:00:00','0000-00-00 00:00:00'),(29,'SendReminder','on','0000-00-00 00:00:00','0000-00-00 00:00:00'),(30,'NumRecordstoDisplay','50','0000-00-00 00:00:00','0000-00-00 00:00:00'),(31,'BCCMessages','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(32,'MailType','mail','0000-00-00 00:00:00','0000-00-00 00:00:00'),(33,'SMTPHost','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(34,'SMTPUsername','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(35,'SMTPPassword','zAUN4WdG8mWRlZCQZwk2Z2ippXU=','0000-00-00 00:00:00','0000-00-00 00:00:00'),(36,'SMTPPort','25','0000-00-00 00:00:00','0000-00-00 00:00:00'),(37,'ShowCancellationButton','on','0000-00-00 00:00:00','0000-00-00 00:00:00'),(38,'UpdateStatsAuto','on','0000-00-00 00:00:00','0000-00-00 00:00:00'),(39,'InvoicePayTo','Address goes here...','0000-00-00 00:00:00','0000-00-00 00:00:00'),(40,'SendAffiliateReportMonthly','on','0000-00-00 00:00:00','0000-00-00 00:00:00'),(41,'InvalidLoginBanLength','15','0000-00-00 00:00:00','0000-00-00 00:00:00'),(42,'Signature','Signature goes here...','0000-00-00 00:00:00','0000-00-00 00:00:00'),(43,'DomainOnlyOrderEnabled','on','0000-00-00 00:00:00','0000-00-00 00:00:00'),(44,'TicketBannedAddresses','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(45,'SendEmailNotificationonUserDetailsChange','on','0000-00-00 00:00:00','0000-00-00 00:00:00'),(46,'TicketAllowedFileTypes','.jpg,.gif,.jpeg,.png,.txt,.pdf','0000-00-00 00:00:00','0000-00-00 00:00:00'),(47,'CloseInactiveTickets','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(48,'InvoiceLateFeeAmount','10.00','0000-00-00 00:00:00','0000-00-00 00:00:00'),(49,'AutoTermination','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(50,'AutoTerminationDays','30','0000-00-00 00:00:00','0000-00-00 00:00:00'),(51,'RegistrarAdminFirstName','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(52,'RegistrarAdminLastName','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(53,'RegistrarAdminCompanyName','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(54,'RegistrarAdminAddress1','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(55,'RegistrarAdminAddress2','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(56,'RegistrarAdminCity','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(57,'RegistrarAdminStateProvince','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(58,'RegistrarAdminCountry','US','0000-00-00 00:00:00','0000-00-00 00:00:00'),(59,'RegistrarAdminPostalCode','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(60,'RegistrarAdminPhone','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(61,'RegistrarAdminFax','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(62,'RegistrarAdminEmailAddress','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(63,'RegistrarAdminUseClientDetails','on','0000-00-00 00:00:00','0000-00-00 00:00:00'),(64,'Charset','utf-8','0000-00-00 00:00:00','0000-00-00 00:00:00'),(65,'AutoUnsuspend','on','0000-00-00 00:00:00','0000-00-00 00:00:00'),(66,'RunScriptonCheckOut','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(67,'License','NjUwMGNjN2E2N2M5OTRhNGNhMDEzZDljYzA1Y2JlNWQ5ZTYwN2Q2NzNad1YzTGNSM1lsSlhha1ZtY3Z3\nVmJ2Tm1Mek5XYm9kbkwzZDNkdncxTGNwemN3Ukhkb0ppT2l3bWNWVkdaaEozWndWRmRwMVdhTVJuYmxs\nR2JESkNMaVVtY3YxV0x1SlhZbHgyTGNWR1poSjNad1YzTGNSM1lsSlhha1ZtY3Z3VmJ2Tm1Mek5XYm9k\nbkwzZDNkdncxTGNwemN3Ukhkb0ppT2l3bWNWVm1jdjFrYnlGV1pNUlhhdGxHVDA1V1pweDJRaXdTWjFK\nSGQ2SUNabHhtWWg1V1JsUldZeWRHY1Y5R2QxRkVkcDFXYU1SbmJsbEdiREpDTHdVak02SUNkcDFXYU1S\nbmJsbEdiREpDTGxOSGJoWm1PaVFXWnNKV1l1VjBjMGxXYnB4RWR1Vldhc05rSXNJaUk2SWljbHhHYmxO\nWFp5SkNMbFZuYzBwakl6Tlhaak5XWTBKM2J3QlhkekpDTGlNakxqSlhMdzRDTXVnakk2SWlidmwyY3lW\nbWRsTlhZbHhXWnlWbWN3UjNjbFJYWXNKQ0xpRWpMbE5YWWx4V1p5MWlNdUFUTXVjakk2SWlidmwyY3lW\nbWRqbEdiaVZIYzBOWFowRkdiaXdpSWlvaklsUlhZa1ZXZGtSSGVsNW1Jc0lTWnRsR1ZnVW1iUEppT2lV\nR2JqbDNZbjVXYXN4V2FpSkNMaVlUTXRrRE10a1RNd0lqSTZJU1owRkdablZtY2l3aUlsTm5ibE5XYU1C\nQ2R1VldidzlHYmxaWFpFSmlPaVVXYmg1R2RqVkhadkpIY2l3aUlrVjNic05FSUlORVRpb2pJbDFXWXVS\nV1p5VkdkemwyWmxKbklzVTJjc0ZtWjZJQ2JoWjNidFZtVW41V2FrNVdZeUprSXMwMVc2SXljdTlHWmtG\nbUlzMG5JaW9qSXpsWFpMbG1ZMWxsSXNJeWNsbGxJNklDVVU5RVZpd0NNNklTZTBsbWMxTldaVEJ5YjFS\na0k3cGpJejUyYnBSSGN2ZFdhbTUyYmpKQ0xpQURNNlVETXRBRE02QURNNkFETVVoVE10TURNdElqTXdJ\nakk2SVNaMEZHWjVSWGFreFdZMlZHZGhSR2MxSkNMbE5IYmhabU9pTVhaMEZHWndWM2NsSlhhMUZYWnlK\nQ0xpQUROM1FHTTFBVE5rZFROekVUTTNJbU4wTVdPdFlYWkVKaU9pa1hackpDTGlVbWRwUjNZQkppT2lN\nWGQwRkdkekpDTGlVR1p1UVdkdngyWW9OR2J1QTNZejlDWGxSbUxrVjNic05HYWp4MkxjTkhkejlHYTI5\nQ1gzZDNkdndsY2haM0xjSmlPaU1uY3BSR1pweFdZMkpDTDlKaUk2SXljME5XYXNabWJ2TkVJUWxFSTM5\nR2JzRmtJN3BqSXpSR2JsbG1adDlHZHpWM1lpd2lJeFFUTXVVek15NENNeklqTDVBVE1pb2pJekJYYWts\nR2JoWm5Jc0lTWms1Q1oxOUdiamgyWXM1Q2NqTm5MM2QzZHNVR1p1UVdkdngyWW9OR2J1QTNZekppT2lN\nbmJwRldidlJHWnB4V1kySnllNDk4Y2FkNjIzM2IxMjdlYTRiZDFkN2ZiMzQ2MmYwZTVlOGU3MDhmODlK\nU094MGlNdzBpTXlBak1pb2pJbFJYWWt0MllsaDJZaXdpSWpsak1rWmpOMWN6TjRVek1rUmpaeVEyWTFR\nbVpsSkdOell6WWtoak41UUdPNFlHTW1sVFprSmlPaWcyY2hobUlzMFhmbE5IYmhabU9pRWpNd0l6WDZs\nbVlpc25PaTAyYmo1aWJ2bEdkaFJXYXNGbWRpc25PaU0zYnQ5bWNRSkNMOTFuSTFnVE5pUjJZMGNUT21K\nVE01VW1ZNGNETjNjellrSlROd2t6TWxKRE01WVdPbUpqTjJFaloya0ROMEVXT3hZbVppUnpOelFETWtG\nV1ptRkRPeElHWjI0U1A5RWxacEZFUk5KVFFVeGtNSnAyVDVGa2FQcFhTRVpGTkZSRlQ1RkVWTWxYU0Ux\nVWVKbDJUcFYxUmtobVV0bDBjSk5sV3JWelFhRlRPSEptYW9KVFd6VnpRanBtVHV4ME1rTkRacDltYUp4\nbVR0SkdhU056WTF4bU1ZcG5UWEoyYms1V1N6bDBVaVpuVHR4VWQ1Y1ZZd1kwUmFCSGVYbGxNS2wyVHBW\nMVZpaFdOeWdsYjFjVlkxUjJWaHBuUzVWbUk2SVNidk5tTHU5V2EwRkdacHhXWTJKeWU2SVNaazVDWjE5\nR2JqaDJZczVDY2pObkwzZDNkaXdTZmlZV1pqTnpOakpHWmxSMk5pVkRNd1FHTXhNR1p3UVdNelFETXpZ\nV09tWkdNbU5EWmtOV096Y1RPeUlETWxGV056VWpZeFl6WWtWek13RVdPaVZETWlaakw1bzBRTmRYV0Ux\nRWRacFdUMmtFUk5aVFRxMVVWb1JWVDBsRVJOUlhTcTEwZEpwV1MyazBVYUJqUkhwVmEzbFdTc0pWYk10\nbVZ6STJjT2RVWXFoWGJNZG5UeU1XYXZwV1NzNVViaWhtVXpNV2RzSkRXNjUwVmk5R1p1bDBjSk5sWTI1\nVWJNVlhPWEZHTUdka1d3aDNWWkpqU3A5VWFWZGxZb1ZqTVk1V05YRldka2RWWTZwVWVsSmlPaTAyYmo1\naWJ2bEdkaFJXYXNGbWRpc25PaVVHWnVRV2R2eDJZb05HYnVBM1l6SnllNkl5Y3VWMmF2UlZlMGwyWXBS\nbmJsaEdkMUZrYnBGV2J2UmtJczBuSW1WMll6Y3pZaVJXWmtkalkxQURNa0JUTWpSR01rRnpNMEF6TW1s\nalptQmpaelFHWmpsek0za2pNeUFUWmhWek0xSVdNMk1HWjFNRE1obGpZMUFqWTI0U09LTlVUM2xGUk5S\nWFdxMWtOSlJVVDIwa2FOVkZhVTFFZEpSVVQwbGthTmRYU3Fsa05KTmxXd1kwUmFsMmRwbEViUzFHVHJa\nMU1pTm5USEZtYTQxR1QzNWtNamwyYnFsRWJPMW1Zb0oxTWpWSGJ5Z2xlT2RsWXZSbWJKTlhTVEptZE8x\nR1QxbHpWaEJqUkhwRmM0ZFZXeW9VYVBsV1ZYSkdhMUlEV3VWelZoVkhaWEZtZUtsWFppb2pJdDkyWXU0\nMmJwUlhZa2xHYmhabkk3cGpJejVXWnI5R1Y1UlhhamxHZHVWR2EwVlhRaXdpSWlvakkwVm1jalYyVWxO\nbmJsTldhTUpDTGlVR1poSmFhZGExNTZmOTZhMjk1MzBhMzc4NmExMTBlOWQ0ZGI0MGE5MmU5Mzg=','0000-00-00 00:00:00','2022-02-19 05:02:26'),(68,'OrderFormTemplate','standard_cart','0000-00-00 00:00:00','0000-00-00 00:00:00'),(69,'AllowDomainsTwice','on','0000-00-00 00:00:00','0000-00-00 00:00:00'),(70,'AddLateFeeDays','5','0000-00-00 00:00:00','0000-00-00 00:00:00'),(71,'TaxEnabled','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(72,'DefaultCountry','US','0000-00-00 00:00:00','0000-00-00 00:00:00'),(73,'AutoRedirectoInvoice','gateway','0000-00-00 00:00:00','0000-00-00 00:00:00'),(74,'EnablePDFInvoices','on','0000-00-00 00:00:00','0000-00-00 00:00:00'),(75,'CaptchaSetting','offloggedin','0000-00-00 00:00:00','0000-00-00 00:00:00'),(76,'SupportTicketOrder','ASC','0000-00-00 00:00:00','0000-00-00 00:00:00'),(77,'SendFirstOverdueInvoiceReminder','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(78,'TaxType','Exclusive','0000-00-00 00:00:00','0000-00-00 00:00:00'),(79,'DomainDNSManagement','5.00','0000-00-00 00:00:00','0000-00-00 00:00:00'),(80,'DomainEmailForwarding','5.00','0000-00-00 00:00:00','0000-00-00 00:00:00'),(81,'InvoiceIncrement','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(82,'ContinuousInvoiceGeneration','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(83,'AutoCancellationRequests','on','0000-00-00 00:00:00','0000-00-00 00:00:00'),(84,'SystemEmailsFromName','WHMCompleteSolution','0000-00-00 00:00:00','0000-00-00 00:00:00'),(85,'SystemEmailsFromEmail','noreply@yourdomain.com','0000-00-00 00:00:00','0000-00-00 00:00:00'),(86,'AllowClientRegister','on','0000-00-00 00:00:00','0000-00-00 00:00:00'),(87,'BulkCheckTLDs','.com,.net','0000-00-00 00:00:00','0000-00-00 00:00:00'),(88,'CreditOnDowngrade','on','0000-00-00 00:00:00','0000-00-00 00:00:00'),(90,'TaxDomains','on','0000-00-00 00:00:00','0000-00-00 00:00:00'),(91,'TaxLateFee','on','0000-00-00 00:00:00','0000-00-00 00:00:00'),(92,'MarketingEmailConvert','on','0000-00-00 00:00:00','0000-00-00 00:00:00'),(93,'ProductMonthlyPricingBreakdown','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(94,'LateFeeType','Percentage','0000-00-00 00:00:00','0000-00-00 00:00:00'),(95,'SendSecondOverdueInvoiceReminder','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(96,'SendThirdOverdueInvoiceReminder','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(97,'DomainIDProtection','5.00','0000-00-00 00:00:00','0000-00-00 00:00:00'),(98,'DomainRenewalNotices','30,7,-3,0,0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(99,'SequentialInvoiceNumbering','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(100,'SequentialInvoiceNumberFormat','{NUMBER}','0000-00-00 00:00:00','0000-00-00 00:00:00'),(101,'SequentialInvoiceNumberValue','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(102,'DefaultNameserver3','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(103,'DefaultNameserver4','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(104,'AffiliatesDelayCommission','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(105,'SupportModule','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(106,'AddFundsEnabled','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(107,'AddFundsMinimum','10','0000-00-00 00:00:00','0000-00-00 00:00:00'),(108,'AddFundsMaximum','100','0000-00-00 00:00:00','0000-00-00 00:00:00'),(109,'AddFundsMaximumBalance','300','0000-00-00 00:00:00','0000-00-00 00:00:00'),(110,'CCProcessDaysBefore','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(111,'CCAttemptOnlyOnce','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(112,'CCDaySendExpiryNotices','25','0000-00-00 00:00:00','0000-00-00 00:00:00'),(113,'BulkDomainSearchEnabled','on','0000-00-00 00:00:00','0000-00-00 00:00:00'),(114,'AutoRenewDomainsonPayment','on','0000-00-00 00:00:00','0000-00-00 00:00:00'),(115,'DomainAutoRenewDefault','on','0000-00-00 00:00:00','0000-00-00 00:00:00'),(116,'CCRetryEveryWeekFor','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(117,'SupportTicketKBSuggestions','on','0000-00-00 00:00:00','0000-00-00 00:00:00'),(118,'DailyEmailBackup','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(119,'FTPBackupHostname','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(120,'FTPBackupUsername','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(121,'FTPBackupPassword','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(122,'FTPBackupDestination','/','0000-00-00 00:00:00','0000-00-00 00:00:00'),(123,'TaxL2Compound','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(124,'SEOFriendlyUrls','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(125,'ShowCCIssueStart','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(126,'TicketRatingEnabled','on','0000-00-00 00:00:00','0000-00-00 00:00:00'),(127,'NetworkIssuesRequireLogin','on','0000-00-00 00:00:00','0000-00-00 00:00:00'),(128,'ShowNotesFieldOnCheckout','on','0000-00-00 00:00:00','0000-00-00 00:00:00'),(129,'RequireLoginforClientTickets','on','0000-00-00 00:00:00','0000-00-00 00:00:00'),(130,'EmailCSS','.ExternalClass,.ExternalClass div,.ExternalClass font,.ExternalClass p,.ExternalClass span,.ExternalClass td,h1,img{line-height:100%}h1,h2{display:block;font-family:Helvetica;font-style:normal;font-weight:700}#outlook a{padding:0}.ExternalClass,.ReadMsgBody{width:100%}a,blockquote,body,li,p,table,td{-webkit-text-size-adjust:100%;-ms-text-size-adjust:100%}table,td{mso-table-lspace:0;mso-table-rspace:0}img{-ms-interpolation-mode:bicubic;border:0;height:auto;outline:0;text-decoration:none}table{border-collapse:collapse!important}#bodyCell,#bodyTable,body{height:100%!important;margin:0;padding:0;width:100%!important}#bodyCell{padding:20px;}#templateContainer{width:600px;border:1px solid #ddd;background-color:#fff}#bodyTable,body{background-color:#FAFAFA}h1{color:#202020!important;font-size:26px;letter-spacing:normal;text-align:left;margin:0 0 10px}h2{color:#404040!important;font-size:20px;line-height:100%;letter-spacing:normal;text-align:left;margin:0 0 10px}h3,h4{display:block;font-style:italic;font-weight:400;letter-spacing:normal;text-align:left;margin:0 0 10px;font-family:Helvetica;line-height:100%}h3{color:#606060!important;font-size:16px}h4{color:grey!important;font-size:14px}.headerContent{background-color:#f8f8f8;border-bottom:1px solid #ddd;color:#505050;font-family:Helvetica;font-size:20px;font-weight:700;line-height:100%;text-align:left;vertical-align:middle;padding:0}.bodyContent,.footerContent{font-family:Helvetica;line-height:150%;text-align:left;}.footerContent{text-align:center}.bodyContent pre{padding:15px;background-color:#444;color:#f8f8f8;border:0}.bodyContent pre code{white-space:pre;word-break:normal;word-wrap:normal}.bodyContent table{margin:10px 0;background-color:#fff;border:1px solid #ddd}.bodyContent table th{padding:4px 10px;background-color:#f8f8f8;border:1px solid #ddd;font-weight:700;text-align:center}.bodyContent table td{padding:3px 8px;border:1px solid #ddd}.table-responsive{border:0}.bodyContent a{word-break:break-all}.headerContent a .yshortcuts,.headerContent a:link,.headerContent a:visited{color:#1f5d8c;font-weight:400;text-decoration:underline}#headerImage{height:auto;max-width:600px;padding:20px}#templateBody{background-color:#fff}.bodyContent{color:#505050;font-size:14px;padding:20px}.bodyContent a .yshortcuts,.bodyContent a:link,.bodyContent a:visited{color:#1f5d8c;font-weight:400;text-decoration:underline}.bodyContent a:hover{text-decoration:none}.bodyContent img{display:inline;height:auto;max-width:560px}.footerContent{color:grey;font-size:12px;padding:20px}.footerContent a .yshortcuts,.footerContent a span,.footerContent a:link,.footerContent a:visited{color:#606060;font-weight:400;text-decoration:underline}@media only screen and (max-width:640px){h1,h2,h3,h4{line-height:100%!important}#templateContainer{max-width:600px!important;width:100%!important}#templateContainer,body{width:100%!important}a,blockquote,body,li,p,table,td{-webkit-text-size-adjust:none!important}body{min-width:100%!important}#bodyCell{padding:10px!important}h1{font-size:24px!important}h2{font-size:20px!important}h3{font-size:18px!important}h4{font-size:16px!important}#templatePreheader{display:none!important}.headerContent{font-size:20px!important;line-height:125%!important}.footerContent{font-size:14px!important;line-height:115%!important}.footerContent a{display:block!important}.hide-mobile{display:none;}}','0000-00-00 00:00:00','2018-04-18 10:21:38'),(131,'CurrencyAutoUpdateExchangeRates','on','0000-00-00 00:00:00','0000-00-00 00:00:00'),(132,'CurrencyAutoUpdateProductPrices','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(133,'RequiredPWStrength','50','0000-00-00 00:00:00','0000-00-00 00:00:00'),(134,'MaintenanceMode','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(135,'MaintenanceModeMessage','We are currently performing maintenance and will be back shortly.','0000-00-00 00:00:00','0000-00-00 00:00:00'),(136,'SkipFraudForExisting','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(137,'SMTPSSL','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(138,'ContactFormDept','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(139,'ContactFormTo','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(140,'TicketEscalationLastRun','2009-01-01 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00'),(141,'APIAllowedIPs','a:1:{i:0;a:2:{s:2:\"ip\";s:0:\"\";s:4:\"note\";s:0:\"\";}}','0000-00-00 00:00:00','0000-00-00 00:00:00'),(142,'NOMD5','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(143,'DisableSessionIPCheck','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(144,'DisableSupportTicketReplyEmailsLogging','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(145,'OverageBillingMethod','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(147,'CCAllowCustomerDelete','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(148,'CreateDomainInvoiceDaysBefore','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(149,'NoInvoiceEmailOnOrder','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(150,'TaxInclusiveDeduct','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(151,'LateFeeMinimum','0.00','0000-00-00 00:00:00','0000-00-00 00:00:00'),(152,'AutoProvisionExistingOnly','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(153,'EnableDomainRenewalOrders','on','0000-00-00 00:00:00','0000-00-00 00:00:00'),(154,'EnableMassPay','on','0000-00-00 00:00:00','0000-00-00 00:00:00'),(155,'NoAutoApplyCredit','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(156,'CreateInvoiceDaysBeforeMonthly','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(157,'CreateInvoiceDaysBeforeQuarterly','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(158,'CreateInvoiceDaysBeforeSemiAnnually','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(159,'CreateInvoiceDaysBeforeAnnually','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(160,'CreateInvoiceDaysBeforeBiennially','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(161,'CreateInvoiceDaysBeforeTriennially','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(162,'ClientsProfileUneditableFields','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(163,'ClientDisplayFormat','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(164,'CCDoNotRemoveOnExpiry','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(165,'GenerateRandomUsername','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(166,'AddFundsRequireOrder','on','0000-00-00 00:00:00','0000-00-00 00:00:00'),(167,'GroupSimilarLineItems','on','0000-00-00 00:00:00','0000-00-00 00:00:00'),(168,'ProrataClientsAnniversaryDate','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(169,'TCPDFFont','helvetica','0000-00-00 00:00:00','0000-00-00 00:00:00'),(170,'CancelInvoiceOnCancellation','on','0000-00-00 00:00:00','0000-00-00 00:00:00'),(171,'AttachmentThumbnails','on','0000-00-00 00:00:00','0000-00-00 00:00:00'),(172,'EmailGlobalHeader','<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\n<html xmlns=\"http://www.w3.org/1999/xhtml\">\n    <head>\n        <meta http-equiv=\"Content-Type\" content=\"text/html; charset={$charset}\" />\n        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no\">\n        <style type=\"text/css\">\n            [EmailCSS]\n        </style>\n    </head>\n    <body leftmargin=\"0\" marginwidth=\"0\" topmargin=\"0\" marginheight=\"0\" offset=\"0\">\n        <center>\n            <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" height=\"100%\" width=\"100%\" id=\"bodyTable\">\n                <tr>\n                    <td align=\"center\" valign=\"top\" id=\"bodyCell\">\n                        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" id=\"templateContainer\">\n                            <tr>\n                                <td align=\"center\" valign=\"top\">\n                                    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" id=\"templateHeader\">\n                                        <tr>\n                                            <td valign=\"top\" class=\"headerContent\">\n                                                <a href=\"{$company_domain}\">\n                                                    {if $company_logo_url}\n                                                        <img src=\"{$company_logo_url}\" style=\"max-width:600px;padding:20px 20px 0 20px\" id=\"headerImage\" alt=\"{$company_name}\" />\n                                                    {else}\n                                                        {$company_name}\n                                                    {/if}\n                                                </a>\n                                            </td>\n                                        </tr>\n                                    </table>\n                                </td>\n                            </tr>\n                            <tr>\n                                <td align=\"center\" valign=\"top\">\n                                    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" id=\"templateBody\">\n                                        <tr>\n                                            <td valign=\"top\" class=\"bodyContent\">','0000-00-00 00:00:00','2018-04-18 10:21:38'),(173,'EmailGlobalFooter','</td>\n                                        </tr>\n                                    </table>\n                                </td>\n                            </tr>\n                            <tr>\n                                <td align=\"center\" valign=\"top\">\n                                    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" id=\"templateFooter\">\n                                        <tr>\n                                            <td valign=\"top\" class=\"footerContent\">\n                                                &nbsp;<a href=\"{$company_domain}\">visit our website</a>\n                                                <span class=\"hide-mobile\"> | </span>\n                                                <a href=\"{$whmcs_url}\">log in to your account</a>\n                                                <span class=\"hide-mobile\"> | </span>\n                                                <a href=\"{$whmcs_url}submitticket.php\">get support</a>&nbsp;<br />\n                                                Copyright &copy; {$company_name}, All rights reserved.\n                                            </td>\n                                        </tr>\n                                    </table>\n                                </td>\n                            </tr>\n                        </table>\n                    </td>\n                </tr>\n            </table>\n        </center>\n    </body>\n</html>','0000-00-00 00:00:00','2018-04-18 10:21:38'),(174,'DomainSyncEnabled','on','0000-00-00 00:00:00','0000-00-00 00:00:00'),(175,'DomainSyncNextDueDate','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(176,'DomainSyncNextDueDateDays','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(177,'TicketMask','%A%A%A-%n%n%n%n%n%n','0000-00-00 00:00:00','0000-00-00 00:00:00'),(178,'AutoClientStatusChange','2','0000-00-00 00:00:00','0000-00-00 00:00:00'),(179,'AllowClientsEmailOptOut','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(180,'BannedSubdomainPrefixes','mail,mx,gapps,gmail,webmail,cpanel,whm,ftp,clients,billing,members,login,accounts,access','0000-00-00 00:00:00','0000-00-00 00:00:00'),(181,'FreeDomainAutoRenewRequiresProduct','on','0000-00-00 00:00:00','0000-00-00 00:00:00'),(182,'DomainToDoListEntries','on','0000-00-00 00:00:00','0000-00-00 00:00:00'),(183,'Version','8.4.0-release.1','0000-00-00 00:00:00','2021-01-07 10:30:00'),(184,'OrderDaysGrace','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(185,'OrderFormSidebarToggle','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(187,'UpdaterLatestVersion','7.5.1-release.1','2018-04-18 10:21:38','2018-04-18 10:21:38'),(188,'UpdaterLatestBetaVersion','7.5.1-release.1','2018-04-18 10:21:38','2018-04-18 10:21:38'),(189,'UpdaterLatestStableVersion','7.5.1-release.1','2018-04-18 10:21:38','2018-04-18 10:21:38'),(190,'UpdaterLatestSupportAndUpdatesVersion','7.5.1-release.1','2018-04-18 10:21:39','2018-04-18 10:21:39'),(191,'DailyCronExecutionHour','09','2018-04-18 10:21:39','2018-04-18 10:21:39'),(192,'PremiumDomains','0','2018-04-18 15:21:39','2018-04-18 15:21:39'),(193,'UriRewriteAutoManage','1','2018-04-18 10:21:40','2022-02-19 05:02:03'),(194,'InstanceID','oozdGR1RCou8','2018-04-18 10:21:41','2022-02-19 05:02:06'),(195,'token_namespaces','a:3:{s:13:\"WHMCS.default\";b:1;s:19:\"WHMCS.admin.default\";b:1;s:19:\"WHMCS.domainchecker\";b:0;}','2018-04-18 10:21:41','2018-04-18 10:21:41'),(196,'RouteUriPathMode','basic','2018-04-18 10:21:42','2018-04-18 10:21:42'),(197,'ReversalChangeInvoiceStatus','1','2018-04-18 10:21:42','2018-04-18 10:21:42'),(198,'ReversalChangeDueDates','1','2018-04-18 10:21:42','2018-04-18 10:21:42'),(199,'ActiveBackupSystems','','2018-04-18 10:21:42','2018-04-18 10:21:42'),(200,'PhoneNumberDropdown','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(201,'EmailMarketingOptInMessage','We would like to send you occasional news, information and special offers by email. Choose below whether you want to join our mailing list. You can unsubscribe at any time.','2018-04-18 15:21:43','2018-04-18 15:21:43'),(202,'DomainExpirationFeeHandling','existing','2018-04-18 15:21:43','2018-04-18 15:21:43'),(203,'TaxPerLineItem','1','2018-04-18 15:21:43','2018-04-18 15:21:43'),(204,'AdminUserNamesWithSpaces','0','2018-04-18 10:21:43','2018-04-18 10:21:43'),(205,'EnableSafeInclude','1','2018-04-18 15:21:43','2018-04-18 15:21:43'),(206,'ModuleHooks','','2018-04-18 10:21:43','2018-04-18 10:21:43'),(207,'AddonModulesHooks','','2018-04-18 10:21:43','2018-04-18 10:21:43'),(208,'WHMCSUpdatePinVersion','stable','2018-04-18 10:21:43','2018-04-18 10:21:43'),(209,'MemberPubKey','l/DqxmWHOe13NMLZ5Q5HRB/jczTysK/s5AOIhffLAsl55Frg7umK4OYGSOBxSbrePnPRqQkAmEXqyvvtsqh8y9SDnt7QELuDHybnPcq6tiF2mToFau38QcPYxY8KyVejx+hedgH8FrWSw20VPMoWKseGzwV2b2aQBsyGgawGrxp2yVAtBTfdPiqUh9YNsUGNw+JIkwcXkRcjaqEzuObQS09Ur2DwWUIDEUEGbTSmjZfotBt8QVID40Pd+JYGyEIzjbZfYb6TNI08k2oBiNwModWv+xkj0jO6Kdi2jQ5gBq0XB6PjFCe03OKG2kv5YA1+75R4014XmhvCC0zrIcLGUJgXbbEaJkJEZWtTa96/gaSQ20l1ShgCYxJkCdH+fTNms1YeBddArsl6TntD/LYNt/AB1X3431IZRQBiQRnB4mw13HKpxQX6UHc+CjvQvDm53T+yaQQAFSoqKmMaXlKRNMDtlFSHFINSVOdffSWvwS+8EI4AxRlMs35KTD2yEEi4q/w+b2dzd+hD9GYYIWRL69aNzbFHcyFHAID50wXDqQtf3fAyZHnW2jWSg2juFJS7G/kJgCivNiyIK4uX+NbbpOMyyL+zttp72AyvALcTdGD4S4+XIaHahuvCPEPzKHDoybMTXcqHFb/UWBmYmbiu803vG660XjiOovVEJjkf0yxC+h0RUoi+Wv64OKZxpubgnThVtjxiSAgvQ0u4bzOH1VZU/KjMBeOD7P1mwglZj2bXu2Vy+SLgRgNk8rbbfy59QufL6uJD4ww15xwEhW8RlkIBanI2AVeGiXatYeT+TU5q+xhVzObsvfeTov3r75B2mYjmUU4B+l+obThPsdhzonyQifke5zKm5s1WAsdtCRiA+dUdqHpdZ9hCEyeJAi0IBc4fMWplETE5JsV+ZapnAbO9vZ80I8+8PY9wItGI1vQDQ+2ZwYq9xb7d+eIaFaXRHO8avrCzF47ploxLvZzhPQBqITJQ0z4wGMyxQxznMkVWDbUul1R85uE4jzaYQUcuC4dj/9pfClN+Iq2jnCBwrpE50O7sl/3z+CZLsCOMq51MyDyKEyY=','2018-04-23 17:19:29','2022-02-19 05:02:26'),(210,'domainLookupProvider','WhmcsDomains','2018-06-19 16:29:29','2018-06-19 16:29:29'),(211,'ReCAPTCHAForms','{\"checkoutCompletion\":false}','2018-07-26 12:10:09','2018-07-26 12:10:09'),(212,'TaxEUTaxValidation','0','2018-08-09 09:00:00','2018-08-09 09:00:00'),(213,'TaxVatCustomFieldId','0','2018-08-09 09:00:00','2018-08-09 09:00:00'),(214,'TaxEUHomeCountry','','2018-08-09 09:00:00','2018-08-09 09:00:00'),(215,'TaxEUTaxExempt','0','2018-08-09 09:00:00','2018-08-09 09:00:00'),(216,'TaxEUHomeCountryNoExempt','0','2018-08-09 09:00:00','2018-08-09 09:00:00'),(217,'TaxCustomInvoiceNumbering','0','2018-08-09 09:00:00','2018-08-09 09:00:00'),(218,'TaxNextCustomInvoiceNumber','1','2018-08-09 09:00:00','2018-08-09 09:00:00'),(219,'TaxSetInvoiceDateOnPayment','0','2018-08-09 09:00:00','2018-08-09 09:00:00'),(220,'TaxAutoResetNumbering','never','2018-08-09 09:00:00','2018-08-09 09:00:00'),(221,'TaxAutoResetPaidNumbering','never','2018-08-09 09:00:00','2018-08-09 09:00:00'),(222,'TaxCustomInvoiceNumberFormat','{NUMBER}','2018-08-09 09:00:00','2018-08-09 09:00:00'),(223,'PruneTicketAttachmentsMonths','0','2019-04-01 09:00:00','2019-04-01 09:00:00'),(224,'2fasettings','a:3:{s:7:\"modules\";a:1:{s:4:\"totp\";a:2:{s:13:\"clientenabled\";i:1;s:12:\"adminenabled\";i:1;}}s:11:\"forceclient\";i:0;s:10:\"forceadmin\";i:0;}','2019-07-10 11:46:00','2019-07-10 11:46:00'),(225,'TicketAddCarbonCopyRecipients','1','2018-08-02 11:00:00','2018-08-02 11:00:00'),(228,'AcceptedCardTypes','Visa,MasterCard,Discover,American Express,JCB,Diners Club','2019-08-08 17:00:00','2019-08-08 17:00:00'),(229,'TaxNextCustomInvoiceNumberResetTimestamp','','2019-10-03 12:00:00','2019-10-03 12:00:00'),(230,'SequentialInvoiceNumberValueResetTimestamp','','2019-10-03 12:00:00','2019-10-03 12:00:00'),(231,'MetricUsageCollection','1','2019-11-13 12:00:00','2019-11-13 12:00:00'),(232,'MetricUsageInvoicing','1','2019-11-13 12:00:00','2019-11-13 12:00:00'),(233,'DisableClientEmailPreferences','0','2020-03-18 09:00:00','2020-03-18 09:00:00'),(235,'AllowIDNDomains','on','2020-03-18 12:00:00','2020-03-18 12:00:00'),(236,'TaxBillableItems','on','2020-09-09 12:00:00','2020-09-09 12:00:00'),(237,'TaxCustomInvoices','on','2020-09-09 12:00:00','2020-09-09 12:00:00'),(238,'ClientDateFormat','','2021-02-02 12:00:00','2021-02-02 12:00:00'),(239,'HooksDebugMode','','2021-02-02 12:00:00','2021-02-02 12:00:00'),(240,'FreeDomainReminders','1','2020-12-21 15:00:00','2020-12-21 15:00:00'),(241,'SupportReopenTicketOnFailedImport','1','2021-09-24 00:00:00','2021-09-24 00:00:00'),(242,'SystemURL','https://scp.lchcloud.de/','2022-02-19 05:01:32','2022-02-19 05:01:32'),(243,'MDEFromTime','2022-02-19 05:02:03','2022-02-19 05:02:03','2022-02-19 05:02:03'),(244,'InstallationTimestamp','1645246923','2022-02-19 05:02:03','2022-02-19 05:02:03'),(245,'EulaAgreementAccepted','{\"hash\":\"c0ac9edca53ea8940bc7d9f26034acf9\",\"date\":\"2022-02-19\",\"admin\":\"1:admin\"}','2022-02-19 05:02:03','2022-02-19 05:02:03'),(246,'LandingPages','{\"wptk\":{\"landing\":{\"2022-02-19\":0,\"lifetime\":0},\"cart\":{\"2022-02-19\":0,\"lifetime\":0}}}','2022-02-19 05:02:25','2022-02-19 05:02:25');
/*!40000 ALTER TABLE `tblconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblcontacts`
--

DROP TABLE IF EXISTS `tblcontacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblcontacts` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `userid` int(10) NOT NULL,
  `firstname` text COLLATE utf8_unicode_ci NOT NULL,
  `lastname` text COLLATE utf8_unicode_ci NOT NULL,
  `companyname` text COLLATE utf8_unicode_ci NOT NULL,
  `email` text COLLATE utf8_unicode_ci NOT NULL,
  `address1` text COLLATE utf8_unicode_ci NOT NULL,
  `address2` text COLLATE utf8_unicode_ci NOT NULL,
  `city` text COLLATE utf8_unicode_ci NOT NULL,
  `state` text COLLATE utf8_unicode_ci NOT NULL,
  `postcode` text COLLATE utf8_unicode_ci NOT NULL,
  `country` text COLLATE utf8_unicode_ci NOT NULL,
  `phonenumber` text COLLATE utf8_unicode_ci NOT NULL,
  `tax_id` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `subaccount` int(1) NOT NULL DEFAULT 0,
  `password` text COLLATE utf8_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8_unicode_ci NOT NULL,
  `domainemails` int(1) NOT NULL,
  `generalemails` int(1) NOT NULL,
  `invoiceemails` int(1) NOT NULL,
  `productemails` int(1) NOT NULL,
  `supportemails` int(1) NOT NULL,
  `affiliateemails` int(1) NOT NULL,
  `pwresetkey` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `pwresetexpiry` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `userid_firstname_lastname` (`userid`,`firstname`(32),`lastname`(32)),
  KEY `email` (`email`(64))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblcontacts`
--

LOCK TABLES `tblcontacts` WRITE;
/*!40000 ALTER TABLE `tblcontacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblcontacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblcredit`
--

DROP TABLE IF EXISTS `tblcredit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblcredit` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `clientid` int(10) NOT NULL,
  `admin_id` int(10) unsigned NOT NULL DEFAULT 0,
  `date` date NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `amount` decimal(16,2) NOT NULL,
  `relid` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblcredit`
--

LOCK TABLES `tblcredit` WRITE;
/*!40000 ALTER TABLE `tblcredit` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblcredit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblcreditcards`
--

DROP TABLE IF EXISTS `tblcreditcards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblcreditcards` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pay_method_id` int(11) NOT NULL DEFAULT 0,
  `card_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `last_four` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `expiry_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `card_data` blob NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tblcreditcards_pay_method_id` (`pay_method_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblcreditcards`
--

LOCK TABLES `tblcreditcards` WRITE;
/*!40000 ALTER TABLE `tblcreditcards` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblcreditcards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblcurrencies`
--

DROP TABLE IF EXISTS `tblcurrencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblcurrencies` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `code` text COLLATE utf8_unicode_ci NOT NULL,
  `prefix` text COLLATE utf8_unicode_ci NOT NULL,
  `suffix` text COLLATE utf8_unicode_ci NOT NULL,
  `format` int(1) NOT NULL,
  `rate` decimal(10,5) NOT NULL DEFAULT 1.00000,
  `default` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblcurrencies`
--

LOCK TABLES `tblcurrencies` WRITE;
/*!40000 ALTER TABLE `tblcurrencies` DISABLE KEYS */;
INSERT INTO `tblcurrencies` VALUES (1,'USD','$',' USD',2,1.00000,1);
/*!40000 ALTER TABLE `tblcurrencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblcustomfields`
--

DROP TABLE IF EXISTS `tblcustomfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblcustomfields` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type` text COLLATE utf8_unicode_ci NOT NULL,
  `relid` int(10) NOT NULL DEFAULT 0,
  `fieldname` text COLLATE utf8_unicode_ci NOT NULL,
  `fieldtype` text COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `fieldoptions` text COLLATE utf8_unicode_ci NOT NULL,
  `regexpr` text COLLATE utf8_unicode_ci NOT NULL,
  `adminonly` text COLLATE utf8_unicode_ci NOT NULL,
  `required` text COLLATE utf8_unicode_ci NOT NULL,
  `showorder` text COLLATE utf8_unicode_ci NOT NULL,
  `showinvoice` text COLLATE utf8_unicode_ci NOT NULL,
  `sortorder` int(10) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `serviceid` (`relid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblcustomfields`
--

LOCK TABLES `tblcustomfields` WRITE;
/*!40000 ALTER TABLE `tblcustomfields` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblcustomfields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblcustomfieldsvalues`
--

DROP TABLE IF EXISTS `tblcustomfieldsvalues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblcustomfieldsvalues` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fieldid` int(10) NOT NULL,
  `relid` int(10) NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `fieldid_relid` (`fieldid`,`relid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblcustomfieldsvalues`
--

LOCK TABLES `tblcustomfieldsvalues` WRITE;
/*!40000 ALTER TABLE `tblcustomfieldsvalues` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblcustomfieldsvalues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbldeviceauth`
--

DROP TABLE IF EXISTS `tbldeviceauth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbldeviceauth` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `secret` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `compat_secret` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL DEFAULT 0,
  `is_admin` tinyint(1) NOT NULL DEFAULT 0,
  `role_ids` text COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `last_access` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tbldeviceauth_identifier_unique` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbldeviceauth`
--

LOCK TABLES `tbldeviceauth` WRITE;
/*!40000 ALTER TABLE `tbldeviceauth` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbldeviceauth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbldomain_lookup_configuration`
--

DROP TABLE IF EXISTS `tbldomain_lookup_configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbldomain_lookup_configuration` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `registrar` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `setting` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `registrar_setting_index` (`registrar`,`setting`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbldomain_lookup_configuration`
--

LOCK TABLES `tbldomain_lookup_configuration` WRITE;
/*!40000 ALTER TABLE `tbldomain_lookup_configuration` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbldomain_lookup_configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbldomainpricing`
--

DROP TABLE IF EXISTS `tbldomainpricing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbldomainpricing` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `extension` text COLLATE utf8_unicode_ci NOT NULL,
  `dnsmanagement` tinyint(1) NOT NULL,
  `emailforwarding` tinyint(1) NOT NULL,
  `idprotection` tinyint(1) NOT NULL,
  `eppcode` tinyint(1) NOT NULL,
  `autoreg` text COLLATE utf8_unicode_ci NOT NULL,
  `order` int(1) NOT NULL DEFAULT 0,
  `group` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none',
  `grace_period` int(1) NOT NULL DEFAULT -1,
  `grace_period_fee` decimal(16,2) NOT NULL DEFAULT 0.00,
  `redemption_grace_period` int(1) NOT NULL DEFAULT -1,
  `redemption_grace_period_fee` decimal(16,2) NOT NULL DEFAULT -1.00,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `extension_registrationperiod` (`extension`(32)),
  KEY `order` (`order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbldomainpricing`
--

LOCK TABLES `tbldomainpricing` WRITE;
/*!40000 ALTER TABLE `tbldomainpricing` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbldomainpricing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbldomainpricing_premium`
--

DROP TABLE IF EXISTS `tbldomainpricing_premium`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbldomainpricing_premium` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `to_amount` decimal(16,2) NOT NULL DEFAULT 0.00,
  `markup` decimal(8,5) NOT NULL DEFAULT 0.00000,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `tbldomain_pricing_premium_to_amount_unique` (`to_amount`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbldomainpricing_premium`
--

LOCK TABLES `tbldomainpricing_premium` WRITE;
/*!40000 ALTER TABLE `tbldomainpricing_premium` DISABLE KEYS */;
INSERT INTO `tbldomainpricing_premium` VALUES (1,200.00,20.00000,'2018-04-18 15:21:39','2018-04-18 15:21:39'),(2,500.00,25.00000,'2018-04-18 15:21:39','2018-04-18 15:21:39'),(3,1000.00,30.00000,'2018-04-18 15:21:39','2018-04-18 15:21:39'),(4,-1.00,20.00000,'2018-04-18 15:21:39','2018-04-18 15:21:39');
/*!40000 ALTER TABLE `tbldomainpricing_premium` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbldomainreminders`
--

DROP TABLE IF EXISTS `tbldomainreminders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbldomainreminders` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `domain_id` int(10) NOT NULL,
  `date` date NOT NULL,
  `recipients` text COLLATE utf8_unicode_ci NOT NULL,
  `type` tinyint(4) NOT NULL,
  `days_before_expiry` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbldomainreminders`
--

LOCK TABLES `tbldomainreminders` WRITE;
/*!40000 ALTER TABLE `tbldomainreminders` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbldomainreminders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbldomains`
--

DROP TABLE IF EXISTS `tbldomains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbldomains` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `userid` int(10) NOT NULL,
  `orderid` int(1) NOT NULL,
  `type` enum('Register','Transfer') COLLATE utf8_unicode_ci NOT NULL,
  `registrationdate` date NOT NULL,
  `domain` text COLLATE utf8_unicode_ci NOT NULL,
  `firstpaymentamount` decimal(16,2) NOT NULL DEFAULT 0.00,
  `recurringamount` decimal(16,2) NOT NULL,
  `registrar` text COLLATE utf8_unicode_ci NOT NULL,
  `registrationperiod` int(1) NOT NULL DEFAULT 1,
  `expirydate` date DEFAULT NULL,
  `subscriptionid` text COLLATE utf8_unicode_ci NOT NULL,
  `promoid` int(10) NOT NULL,
  `status` enum('Pending','Pending Registration','Pending Transfer','Active','Grace','Redemption','Expired','Cancelled','Fraud','Transferred Away') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Pending',
  `nextduedate` date NOT NULL DEFAULT '0000-00-00',
  `nextinvoicedate` date NOT NULL,
  `additionalnotes` text COLLATE utf8_unicode_ci NOT NULL,
  `paymentmethod` text COLLATE utf8_unicode_ci NOT NULL,
  `dnsmanagement` tinyint(1) NOT NULL,
  `emailforwarding` tinyint(1) NOT NULL,
  `idprotection` tinyint(1) NOT NULL,
  `is_premium` tinyint(1) DEFAULT NULL,
  `donotrenew` tinyint(1) NOT NULL,
  `reminders` text COLLATE utf8_unicode_ci NOT NULL,
  `synced` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `orderid` (`orderid`),
  KEY `domain` (`domain`(64)),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbldomains`
--

LOCK TABLES `tbldomains` WRITE;
/*!40000 ALTER TABLE `tbldomains` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbldomains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbldomains_extra`
--

DROP TABLE IF EXISTS `tbldomains_extra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbldomains_extra` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `domain_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `tbldomains_extra_domain_id_type_unique` (`domain_id`,`name`),
  KEY `tbldomains_extra_type_index` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbldomains_extra`
--

LOCK TABLES `tbldomains_extra` WRITE;
/*!40000 ALTER TABLE `tbldomains_extra` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbldomains_extra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbldomainsadditionalfields`
--

DROP TABLE IF EXISTS `tbldomainsadditionalfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbldomainsadditionalfields` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `domainid` int(10) NOT NULL,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `domainid` (`domainid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbldomainsadditionalfields`
--

LOCK TABLES `tbldomainsadditionalfields` WRITE;
/*!40000 ALTER TABLE `tbldomainsadditionalfields` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbldomainsadditionalfields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbldownloadcats`
--

DROP TABLE IF EXISTS `tbldownloadcats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbldownloadcats` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `parentid` int(10) NOT NULL DEFAULT 0,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `hidden` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `parentid` (`parentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbldownloadcats`
--

LOCK TABLES `tbldownloadcats` WRITE;
/*!40000 ALTER TABLE `tbldownloadcats` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbldownloadcats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbldownloads`
--

DROP TABLE IF EXISTS `tbldownloads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbldownloads` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `category` int(10) NOT NULL,
  `type` text COLLATE utf8_unicode_ci NOT NULL,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `downloads` int(10) NOT NULL DEFAULT 0,
  `location` text COLLATE utf8_unicode_ci NOT NULL,
  `clientsonly` tinyint(1) NOT NULL,
  `hidden` tinyint(1) NOT NULL,
  `productdownload` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `title` (`title`(32)),
  KEY `downloads` (`downloads`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbldownloads`
--

LOCK TABLES `tbldownloads` WRITE;
/*!40000 ALTER TABLE `tbldownloads` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbldownloads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbldynamic_translations`
--

DROP TABLE IF EXISTS `tbldynamic_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbldynamic_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `related_type` enum('configurable_option.{id}.name','configurable_option_option.{id}.name','custom_field.{id}.description','custom_field.{id}.name','download.{id}.description','download.{id}.title','product.{id}.description','product.{id}.name','product_addon.{id}.description','product_addon.{id}.name','product_bundle.{id}.description','product_bundle.{id}.name','product_group.{id}.headline','product_group.{id}.name','product_group.{id}.tagline','product_group_features.{id}.feature','ticket_department.{id}.description','ticket_department.{id}.name') COLLATE utf8_unicode_ci NOT NULL,
  `related_id` int(10) unsigned NOT NULL DEFAULT 0,
  `language` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `translation` text COLLATE utf8_unicode_ci NOT NULL,
  `input_type` enum('text','textarea') COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `tbldynamic_translations_id` (`related_id`),
  KEY `tbldynamic_translations_type` (`related_type`),
  KEY `tbldynamic_translations_id_type` (`related_id`,`related_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbldynamic_translations`
--

LOCK TABLES `tbldynamic_translations` WRITE;
/*!40000 ALTER TABLE `tbldynamic_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbldynamic_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblemail_images`
--

DROP TABLE IF EXISTS `tblemail_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblemail_images` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `filename` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `original_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblemail_images`
--

LOCK TABLES `tblemail_images` WRITE;
/*!40000 ALTER TABLE `tblemail_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblemail_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblemailmarketer`
--

DROP TABLE IF EXISTS `tblemailmarketer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblemailmarketer` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `type` text COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci NOT NULL,
  `disable` int(1) NOT NULL,
  `marketing` int(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblemailmarketer`
--

LOCK TABLES `tblemailmarketer` WRITE;
/*!40000 ALTER TABLE `tblemailmarketer` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblemailmarketer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblemailmarketer_related_pivot`
--

DROP TABLE IF EXISTS `tblemailmarketer_related_pivot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblemailmarketer_related_pivot` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `task_id` int(10) unsigned NOT NULL DEFAULT 0,
  `product_id` int(10) unsigned NOT NULL DEFAULT 0,
  `addon_id` int(10) unsigned NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblemailmarketer_related_pivot`
--

LOCK TABLES `tblemailmarketer_related_pivot` WRITE;
/*!40000 ALTER TABLE `tblemailmarketer_related_pivot` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblemailmarketer_related_pivot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblemails`
--

DROP TABLE IF EXISTS `tblemails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblemails` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `userid` int(10) NOT NULL,
  `subject` text COLLATE utf8_unicode_ci NOT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `date` datetime DEFAULT NULL,
  `to` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `cc` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `bcc` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `attachments` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `pending` tinyint(1) NOT NULL DEFAULT 0,
  `message_data` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `failed` tinyint(1) NOT NULL DEFAULT 0,
  `failure_reason` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `retry_count` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `campaign_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `pending` (`pending`),
  KEY `campaign_id` (`campaign_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblemails`
--

LOCK TABLES `tblemails` WRITE;
/*!40000 ALTER TABLE `tblemails` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblemails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblemailtemplates`
--

DROP TABLE IF EXISTS `tblemailtemplates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblemailtemplates` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type` text COLLATE utf8_unicode_ci NOT NULL,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `subject` text COLLATE utf8_unicode_ci NOT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `attachments` text COLLATE utf8_unicode_ci NOT NULL,
  `fromname` text COLLATE utf8_unicode_ci NOT NULL,
  `fromemail` text COLLATE utf8_unicode_ci NOT NULL,
  `disabled` tinyint(1) NOT NULL,
  `custom` tinyint(1) NOT NULL,
  `language` text COLLATE utf8_unicode_ci NOT NULL,
  `copyto` text COLLATE utf8_unicode_ci NOT NULL,
  `blind_copy_to` text COLLATE utf8_unicode_ci NOT NULL,
  `plaintext` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `type` (`type`(32)),
  KEY `name` (`name`(64))
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblemailtemplates`
--

LOCK TABLES `tblemailtemplates` WRITE;
/*!40000 ALTER TABLE `tblemailtemplates` DISABLE KEYS */;
INSERT INTO `tblemailtemplates` VALUES (1,'product','Hosting Account Welcome Email','New Account Information','<p>Dear {$client_name},</p><p align=\"center\"><strong>PLEASE READ THIS EMAIL IN FULL AND PRINT IT FOR YOUR RECORDS</strong></p><p>Thank you for your order from us! Your hosting account has now been setup and this email contains all the information you will need in order to begin using your account.</p><p>If you have requested a domain name during sign up, please keep in mind that your domain name will not be visible on the internet instantly. This process is called propagation and can take up to 48 hours. Until your domain has propagated, your website and email will not function, we have provided a temporary url which you may use to view your website and upload files in the meantime.</p><p><strong>New Account Information</strong></p><p>Hosting Package: {$service_product_name}<br />Domain: {$service_domain}<br />First Payment Amount: {$service_first_payment_amount}<br />Recurring Amount: {$service_recurring_amount}<br />Billing Cycle: {$service_billing_cycle}<br />Next Due Date: {$service_next_due_date}</p><p><strong>Login Details</strong></p><p>Username: {$service_username}<br />Password: {$service_password}</p><p>Control Panel URL: <a href=\"http://{$service_server_ip}:2082/\">http://{$service_server_ip}:2082/</a><br />Once your domain has propagated, you may also use <a href=\"http://www.{$service_domain}:2082/\">http://www.{$service_domain}:2082/</a></p><p><strong>Server Information</strong></p><p>Server Name: {$service_server_name}<br />Server IP: {$service_server_ip}</p><p>If you are using an existing domain with your new hosting account, you will need to update the nameservers to point to the nameservers listed below.</p><p>Nameserver 1: {$service_ns1} ({$service_ns1_ip})<br />Nameserver 2: {$service_ns2} ({$service_ns2_ip}){if $service_ns3}<br />Nameserver 3: {$service_ns3} ({$service_ns3_ip}){/if}{if $service_ns4}<br />Nameserver 4: {$service_ns4} ({$service_ns4_ip}){/if}</p><p><strong>Uploading Your Website</strong></p><p>Temporarily you may use one of the addresses given below to manage your web site:</p><p>Temporary FTP Hostname: {$service_server_ip}<br />Temporary Webpage URL: <a href=\"http://{$service_server_ip}/~{$service_username}/\">http://{$service_server_ip}/~{$service_username}/</a></p><p>And once your domain has propagated you may use the details below:</p><p>FTP Hostname: {$service_domain}<br />Webpage URL: <a href=\"http://www.{$service_domain}\">http://www.{$service_domain}</a></p><p><strong>Email Settings</strong></p><p>For email accounts that you setup, you should use the following connection details in your email program:</p><p>POP3 Host Address: mail.{$service_domain}<br />SMTP Host Address: mail.{$service_domain}<br />Username: The email address you are checking email for<br />Password: As specified in your control panel</p><p>Thank you for choosing us.</p><p>{$signature}</p>','','','',0,0,'','','',0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(3,'domain','Domain Registration Confirmation','Domain Registration Confirmation','<p>\r\nDear {$client_name}, \r\n</p>\r\n<p>\r\nThis message is to confirm that your domain purchase has been successful. The details of the domain purchase are below: \r\n</p>\r\n<p>\r\nRegistration Date: {$domain_reg_date}<br />\r\nDomain: {$domain_name}<br />\r\nRegistration Period: {$domain_reg_period}<br />\r\nAmount: {$domain_first_payment_amount}<br />\r\nNext Due Date: {$domain_next_due_date} \r\n</p>\r\n<p>\r\nYou may login to your client area at <a href=\"{$whmcs_url}\">{$whmcs_url}</a> to manage your new domain. \r\n</p>\r\n<p>\r\n{$signature} \r\n</p>\r\n','','','',0,0,'','','',0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(4,'product','Reseller Account Welcome Email','Reseller Account Information','<p align=\"center\">\r\n<strong>PLEASE PRINT THIS MESSAGE FOR YOUR RECORDS - PLEASE READ THIS EMAIL IN FULL.</strong>\r\n</p>\r\n<p>\r\nIf you have requested a domain name during sign up then this will not be visible on the internet for between 24 and 72 hours. This process is called Propagation. Until your domain has Propagated your website and email will not function, we have provided a temporary url which you may use to view your website and upload files in the meantime.\r\n</p>\r\n<p>\r\nDear {$client_name},\r\n</p>\r\n<p>\r\nThe reseller hosting account for {$service_domain} has been set up. The username and password below are for both cPanel to manage the website at {$service_domain} and WebHostManager to manage your Reseller Account.\r\n</p>\r\n<p>\r\n<strong>New Account Info</strong>\r\n</p>\r\n<p>\r\nDomain: {$service_domain}<br />\r\nUsername: {$service_username}<br />\r\nPassword: {$service_password}<br />\r\nHosting Package: {$service_product_name}\r\n</p>\r\n<p>\r\nControl Panel: <a href=\"http://{$service_server_ip}:2082/\">http://{$service_server_ip}:2082/</a><br />\r\nWeb Host Manager: <a href=\"http://{$service_server_ip}:2086/\">http://{$service_server_ip}:2086/</a>\r\n</p>\r\n<p>\r\n-------------------------------------------------------------------------------------------- <br />\r\n<strong>Web Host Manager Quick Start</strong> <br />\r\n-------------------------------------------------------------------------------------------- <br />\r\n<br />\r\nTo access your Web Host Manager, use the following address:<br />\r\n<br />\r\n<a href=\"http://{$service_server_ip}:2086/\">http://{$service_server_ip}:2086/</a><br />\r\n<br />\r\nThe <strong>http://</strong> must be in the address line to connect to port :2086 <br />\r\nPlease use the username/password given above. <br />\r\n<br />\r\n<strong><em>To Create a New Account <br />\r\n</em></strong><br />\r\nThe first thing you need to do is scroll down on the left and click on &#39Add Package&#39 so that you can create your own hosting packages. You cannot install a domain onto your account without first creating packages.<br />\r\n<br />\r\n1. Click on &#39Create a New Account&#39 from the left hand side menu <br />\r\n2. Put the domain in the &#39Domain&#39 box (no www or http or spaces ? just domainname.com). After putting in the domain, hit TAB and it will automatically create a username. Also, enter a password for the account.<br />\r\n3. Your package selection should be one that you created earlier <br />\r\n4. Then press the create button <br />\r\n<br />\r\nThis will give you a confirmation page (you should print this for your records)\r\n</p>\r\n<p>\r\nPlease do not click on anything that you are not sure what it does. Please do not try to alter the WHM Theme from the selection box - fatal errors may occur. \r\n</p>\r\n<p>\r\n-------------------------------------------------------------------------------------------- \r\n</p>\r\n<p>\r\nTemporarily you may use one of the addresses given below manage your web site\r\n</p>\r\n<p>\r\nTemporary FTP Hostname: {$service_server_ip}<br />\r\nTemporary Webpage URL: <a href=\"http://{$service_server_ip}/~{$service_username}/\">http://{$service_server_ip}/~{$service_username}/</a><br />\r\nTemporary Control Panel: <a href=\"http://{$service_server_ip}/cpanel\">http://{$service_server_ip}/cpanel</a>\r\n</p>\r\n<p>\r\nOnce your domain has Propagated\r\n</p>\r\n<p>\r\nFTP Hostname: www.{$service_domain}<br />\r\nWebpage URL: <a href=\"http://www.{$service_domain}\">http://www.{$service_domain}</a><br />\r\nControl Panel: <a href=\"http://www.{$service_domain}/cpanel\">http://www.{$service_domain}/cpanel</a><br />\r\nWeb Host Manager: <a href=\"http://www.{$service_domain}/whm\">http://www.{$service_domain}/whm</a>\r\n</p>\r\n<p>\r\n<strong>Mail settings</strong>\r\n</p>\r\n<p>\r\nCatch all email with your default email account\r\n</p>\r\n<p>\r\nPOP3 Host Address : mail.{$service_domain}<br />\r\nSMTP Host Address: mail.{$service_domain}<br />\r\nUsername: {$service_username}<br />\r\nPassword: {$service_password}\r\n</p>\r\n<p>\r\nAdditional mail accounts that you add\r\n</p>\r\n<p>\r\nPOP3 Host Address : mail.{$service_domain}<br />\r\nSMTP Host Address: mail.{$service_domain}<br />\r\nUsername : The FULL email address that you are picking up from (e.g. info@example.com). <br />\r\nIf your email client cannot accept a @ symbol, then you may replace this with a backslash .<br />\r\nPassword : As specified in your control panel \r\n</p>\r\n<p>\r\nThank you for choosing us.\r\n</p>\r\n<p>\r\n{$signature}\r\n</p>\r\n','','','',0,0,'','','',0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(7,'support','Support Ticket Opened','New Support Ticket Opened','<p>\r\n{$client_name},\r\n</p>\r\n<p>\r\nThank you for contacting our support team. A support ticket has now been opened for your request. You will be notified when a response is made by email. The details of your ticket are shown below.\r\n</p>\r\n<p>\r\nSubject: {$ticket_subject}<br />\r\nPriority: {$ticket_priority}<br />\r\nStatus: {$ticket_status}\r\n</p>\r\n<p>\r\nYou can view the ticket at any time at {$ticket_link}\r\n</p>\r\n<p>\r\n{$signature}\r\n</p>\r\n','','','',0,0,'','','',0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(8,'support','Support Ticket Reply','Support Ticket Response','<p>\r\n{$ticket_message}\r\n</p>\r\n<p>\r\n----------------------------------------------<br />\r\nTicket ID: #{$ticket_id}<br />\r\nSubject: {$ticket_subject}<br />\r\nStatus: {$ticket_status}<br />\r\nTicket URL: {$ticket_link}<br />\r\n----------------------------------------------\r\n</p>\r\n','','','',0,0,'','','',0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(9,'general','Client Signup Email','Welcome','<p>Dear {$client_first_name},</p>\r\n<p>Thank you for creating a {$companyname} account. Please review this email in its entirety as it contains important information.</p>\r\n<p><strong>Logging In</strong></p>\r\n<p>You can access our client area at {$whmcs_link}</p>\r\n<p>You will need your email address and the password you chose during signup to login.</p>\r\n<p>If you created an account as part of placing a new order with us, you will shortly receive an order confirmation email.</p>\r\n<p><strong>Getting Support</strong></p>\r\n<p>If you need any help or assistance, you can access our support resources below.</p>\r\n<ul>\r\n<li><a href=\"{$whmcs_url}/knowledgebase.php\">Knowledgebase</a></li>\r\n<li><a href=\"{$whmcs_url}/submitticket.php\">Submit a Ticket</a></li>\r\n</ul>\r\n<p>{$signature}</p>\r\n<p><small>You are receiving this email because you recently created an account. If you did not do this, please contact us.</small></p>','','','',0,0,'','','',0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(10,'product','Service Suspension Notification','Service Suspension Notification','<p>Dear {$client_name},</p><p>This is a notification that your service has now been suspended.  The details of this suspension are below:</p><p>Product/Service: {$service_product_name}<br />{if $service_domain}Domain: {$service_domain}<br />{/if}Amount: {$service_recurring_amount}<br />Due Date: {$service_next_due_date}<br />Suspension Reason: <strong>{$service_suspension_reason}</strong></p><p>Please contact us as soon as possible to get your service reactivated.</p><p>{$signature}</p>','','','',0,0,'','','',0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(13,'invoice','Invoice Payment Confirmation','Invoice Payment Confirmation','<p>Dear {$client_name},</p>\r\n<p>This is a payment receipt for Invoice {$invoice_num} sent on {$invoice_date_created}</p>\r\n<p>{$invoice_html_contents}</p>\r\n<p>Amount: {$invoice_last_payment_amount}<br />Transaction #: {$invoice_last_payment_transid}<br />Total Paid: {$invoice_amount_paid}<br />Remaining Balance: {$invoice_balance}<br />Status: {$invoice_status}</p>\r\n<p>You may review your invoice history at any time by logging in to your client area.</p>\r\n<p>Note: This email will serve as an official receipt for this payment.</p>\r\n<p>{$signature}</p>','','','',0,0,'','','',0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(14,'invoice','Invoice Created','Customer Invoice','<p>\r\nDear {$client_name}, \r\n</p>\r\n<p>\r\nThis is a notice that an invoice has been generated on {$invoice_date_created}. \r\n</p>\r\n<p>\r\nYour payment method is: {$invoice_payment_method} \r\n</p>\r\n<p>\r\nInvoice #{$invoice_num}<br />\r\nAmount Due: {$invoice_total}<br />\r\nDue Date: {$invoice_date_due} \r\n</p>\r\n<p>\r\n<strong>Invoice Items</strong> \r\n</p>\r\n<p>\r\n{$invoice_html_contents} <br />\r\n------------------------------------------------------ \r\n</p>\r\n<p>\r\nYou can login to your client area to view and pay the invoice at {$invoice_link} \r\n</p>\r\n<p>\r\n{$signature} \r\n</p>\r\n','','','',0,0,'','','',0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(15,'invoice','Invoice Payment Reminder','Invoice Payment Reminder','<p>\r\nDear {$client_name},\r\n</p>\r\n<p>\r\nThis is a billing reminder that your invoice no. {$invoice_num} which was generated on {$invoice_date_created} is due on {$invoice_date_due}.\r\n</p>\r\n<p>\r\nYour payment method is: {$invoice_payment_method}\r\n</p>\r\n<p>\r\nInvoice: {$invoice_num}<br />\r\nBalance Due: {$invoice_balance}<br />\r\nDue Date: {$invoice_date_due}\r\n</p>\r\n<p>\r\nYou can login to your client area to view and pay the invoice at {$invoice_link}\r\n</p>\r\n<p>\r\n{$signature}\r\n</p>\r\n','','','',0,0,'','','',0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(16,'general','Order Confirmation','Order Confirmation','<p>\r\nDear {$client_name}, \r\n</p>\r\n<p>\r\nWe have received your order and will be processing it shortly. The details of the order are below: \r\n</p>\r\n<p>\r\nOrder Number: <b>{$order_number}</b></p>\r\n<p>\r\n{$order_details} \r\n</p>\r\n<p>\r\nYou will receive an email from us shortly once your account has been setup. Please quote your order reference number if you wish to contact us about this order. \r\n</p>\r\n<p>\r\n{$signature}\r\n</p>\r\n','','','',0,0,'','','',0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(17,'product','Dedicated/VPS Server Welcome Email','New Dedicated Server Information','<p>\r\nDear {$client_name},<br />\r\n<br />\r\n<strong>PLEASE PRINT THIS MESSAGE FOR YOUR RECORDS - PLEASE READ THIS EMAIL IN FULL.</strong>\r\n</p>\r\n<p>\r\nWe are pleased to tell you that the server you ordered has now been set up and is operational.\r\n</p>\r\n<p>\r\n<strong>Server Details<br />\r\n</strong>=============================\r\n</p>\r\n<p>\r\n{$service_product_name}\r\n</p>\r\n<p>\r\nMain IP: {$service_dedicated_ip}<br />\r\nRoot pass: {$service_password}\r\n</p>\r\n<p>\r\nIP address allocation: <br />\r\n{$service_assigned_ips}\r\n</p>\r\n<p>\r\nServerName: {$service_domain}\r\n</p>\r\n<p>\r\n<strong>WHM Access<br />\r\n</strong>=============================<br />\r\n<a href=\"http://xxxxx:2086/\">http://xxxxx:2086</a><br />\r\nUsername: root<br />\r\nPassword: {$service_password}\r\n</p>\r\n<p>\r\n<strong>Custom DNS Server Addresses</strong><br />\r\n=============================<br />\r\nThe custom DNS addresses you should set for your domain to use are: <br />\r\nPrimary DNS: {$service_ns1}<br />\r\nSecondary DNS: {$service_ns2}\r\n</p>\r\n<p>\r\nYou will have to login to your registrar and find the area where you can specify both of your custom name server addresses.\r\n</p>\r\n<p>\r\nAfter adding these custom nameservers to your domain registrar control panel, it will take 24 to 48 hours for your domain to delegate authority to your DNS server. Once this has taken effect, your DNS server has control over the DNS records for the domains which use your custom name server addresses. \r\n</p>\r\n<p>\r\n<strong>SSH Access Information<br />\r\n</strong>=============================<br />\r\nMain IP Address: xxxxxxxx<br />\r\nServer Name: {$service_domain}<br />\r\nRoot Password: xxxxxxxx\r\n</p>\r\n<p>\r\nYou can access your server using a free simple SSH client program called Putty located at:<br />\r\n<a href=\"http://www.securitytools.net/mirrors/putty/\">http://www.securitytools.net/mirrors/putty/</a>\r\n</p>\r\n<p>\r\n<strong>Support</strong><br />\r\n=============================<br />\r\nFor any support needs, please open a ticket at <a href=\"{$whmcs_url}\">{$whmcs_url}</a>\r\n</p>\r\n<p>\r\nPlease include any necessary information to provide you with faster service, such as root password, domain names, and a description of the problem / or assistance needed. This will speed up the support time by allowing our administrators to immediately begin diagnosing the problem.\r\n</p>\r\n<p>\r\nThe manual for cPanel can be found here: <a href=\"http://www.cpanel.net/docs/cp/\">http://www.cpanel.net/docs/cp/</a> <br />\r\nFor documentation on using WHM please see the following link: <a href=\"http://www.cpanel.net/docs/whm/index.html\">http://www.cpanel.net/docs/whm/index.html</a>\r\n</p>\r\n<p>\r\n=============================\r\n</p>\r\n<p>\r\nIf you need to move accounts to the server use: Transfers Copy an account from another server with account password\r\n</p>\r\n<p>\r\n<a href=\"http://xxxxxxx:2086/scripts2/norootcopy\">http://xxxxxxx:2086/scripts2/norootcopy</a>\r\n</p>\r\n<p>\r\nNote the other server must use cpanel to move it.\r\n</p>\r\n<p>\r\n=============================\r\n</p>\r\n<p>\r\n{$signature}\r\n</p>\r\n','','','',0,0,'','','',0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(18,'product','Other Product/Service Welcome Email','New Product Information','<p>\r\nDear {$client_name},\r\n</p>\r\n<p>\r\nYour order for {$service_product_name} has now been activated. Please keep this message for your records.\r\n</p>\r\n<p>\r\nProduct/Service: {$service_product_name}<br />\r\nPayment Method: {$service_payment_method}<br />\r\nAmount: {$service_recurring_amount}<br />\r\nBilling Cycle: {$service_billing_cycle}<br />\r\nNext Due Date: {$service_next_due_date}\r\n</p>\r\n<p>\r\nThank you for choosing us.\r\n</p>\r\n<p>\r\n{$signature}\r\n</p>\r\n','','','',0,0,'','','',0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(19,'invoice','Credit Card Payment Confirmation','Credit Card Payment Confirmation','<p>Dear {$client_name},</p>\r\n<p>This is a payment receipt for Invoice {$invoice_num} sent on {$invoice_date_created}</p>\r\n<p>{$invoice_html_contents}</p>\r\n<p>Amount: {$invoice_last_payment_amount}<br />Pay Method: {$invoice_payment_method} ({$invoice_pay_method_display_name})<br />Transaction #: {$invoice_last_payment_transid}<br />Total Paid: {$invoice_amount_paid}<br />Remaining Balance: {$invoice_balance}<br />Status: {$invoice_status}</p>\r\n<p>You may review your invoice history at any time by logging in to your client area.</p>\r\n<p>Note: This email will serve as an official receipt for this payment.</p>\r\n<p>{$signature}</p>','','','',0,0,'','','',0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(20,'invoice','Credit Card Payment Failed','Credit Card Payment Failed','<p>\r\nDear {$client_name}, \r\n</p>\r\n<p>\r\nThis is a notice that a recent credit card payment we attempted on the card we have registered for you failed. \r\n</p>\r\n<p>\r\nInvoice Date: {$invoice_date_created}<br />\r\nInvoice No: {$invoice_num}<br />\r\nAmount: {$invoice_total}<br />\r\nStatus: {$invoice_status} \r\n</p>\r\n<p>\r\nYou now need to login to your client area to pay the invoice manually. During the payment process you will be given the opportunity to change the card on record with us.<br />\r\n{$invoice_link} \r\n</p>\r\n<p>\r\nNote: This email will serve as an official receipt for this payment. \r\n</p>\r\n<p>\r\n{$signature}\r\n</p>\r\n','','','',0,0,'','','',0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(21,'invoice','Credit Card Invoice Created','Customer Invoice','<p> Dear {$client_name}, </p> <p> This is a notice that an invoice has been generated on {$invoice_date_created}. </p> <p> Your payment method is: {$invoice_payment_method} </p> <p> Invoice #{$invoice_num}<br /> Amount Due: {$invoice_total}<br /> Due Date: {$invoice_date_due} </p> <p> <strong>Invoice Items</strong> </p> <p> {$invoice_html_contents} <br /> ------------------------------------------------------ </p> <p> {if $invoice_auto_capture_available}\r\n    Payment will be taken automatically from the {if $invoice_pay_method_type == \"bankaccount\"}bank account{else}credit card{/if} {$invoice_pay_method_display_name} on {$invoice_next_payment_attempt_date}. To change or pay with a different payment method, please login at {$invoice_link} and click Pay Now, then follow the instructions on screen.\r\n{else}\r\n    Payment will not be taken automatically. To pay your invoice, please login at {$invoice_link} and click Pay Now, then follow the instructions on screen.\r\n{/if}\r\n </p> <p> {$signature} </p>','','','',0,0,'','','',0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(22,'affiliate','Affiliate Monthly Referrals Report','Affiliate Monthly Referrals Report','<p>\r\nDear {$client_name}, \r\n</p>\r\n<p>\r\nThis is your monthly affiliate referrals report. You can view your referral statistics at any time by logging in to the client area. \r\n</p>\r\n<p>\r\nTotal Visitors Referred: {$affiliate_total_visits}<br />\r\nCurrent Earnings: {$affiliate_balance}<br />\r\nAmount Withdrawn: {$affiliate_withdrawn} \r\n</p>\r\n<p>\r\n<strong>Your New Signups this Month</strong> \r\n</p>\r\n<p>\r\n{$affiliate_referrals_table} \r\n</p>\r\n<p>\r\nRemember, you can refer new customers using your unique affiliate link: {$affiliate_referral_url} \r\n</p>\r\n<p>\r\n{$signature}\r\n</p>\r\n','','','',0,0,'','','',0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(23,'support','Support Ticket Opened by Admin','{$ticket_subject}','{$ticket_message}','','','',0,0,'','','',0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(24,'invoice','First Invoice Overdue Notice','First Invoice Overdue Notice','<p> Dear {$client_name}, </p> <p> This is a billing notice that your invoice no. {$invoice_num} which was generated on {$invoice_date_created} is now overdue. </p> <p> Your payment method is: {$invoice_payment_method} </p> <p> Invoice: {$invoice_num}<br /> Balance Due: {$invoice_balance}<br /> Due Date: {$invoice_date_due} </p> <p> You can login to your client area to view and pay the invoice at {$invoice_link} </p> <p> {$signature} </p>','','','',0,0,'','','',0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(25,'product','SHOUTcast Welcome Email','SHOUTcast New Account Information','<p align=\"center\">\r\n<strong>PLEASE READ THIS EMAIL IN FULL AND PRINT IT FOR YOUR RECORDS</strong> \r\n</p>\r\n<p>\r\nDear {$client_name}, \r\n</p>\r\n<p>\r\nThank you for your order from us! Your shoutcast account has now been setup and this email contains all the information you will need in order to begin using your account. \r\n</p>\r\n<p>\r\n<strong>New Account Information</strong> \r\n</p>\r\n<p>\r\nDomain: {$service_domain}<br />\r\nUsername: {$service_username}<br />\r\nPassword: {$service_password} \r\n</p>\r\n<p>\r\n<strong>Server Information</strong> \r\n</p>\r\n<p>\r\nServer Name: {$service_server_name}<br />\r\nServer IP: {$service_server_ip}<br />\r\nNameserver 1: {$service_ns1}<br />\r\nNameserver 1 IP: {$service_ns1_ip}<br />\r\nNameserver 2: {$service_ns2} <br />\r\nNameserver 2 IP: {$service_ns2_ip} \r\n</p>\r\n<p>\r\nThank you for choosing us. \r\n</p>\r\n<p>\r\n{$signature}\r\n</p>\r\n','','','',0,0,'','','',0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(26,'invoice','Second Invoice Overdue Notice','Second Invoice Overdue Notice','<p> Dear {$client_name}, </p> <p> This is the second billing notice that your invoice no. {$invoice_num} which was generated on {$invoice_date_created} is now overdue. </p> <p> Your payment method is: {$invoice_payment_method} </p> <p> Invoice: {$invoice_num}<br /> Balance Due: {$invoice_balance}<br /> Due Date: {$invoice_date_due} </p> <p> You can login to your client area to view and pay the invoice at {$invoice_link} </p> <p> {$signature} </p>','','','',0,0,'','','',0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(27,'invoice','Third Invoice Overdue Notice','Third Invoice Overdue Notice','<p> Dear {$client_name}, </p> <p> This is the third and final billing notice that your invoice no. {$invoice_num} which was generated on {$invoice_date_created} is now overdue. Failure to make payment will result in account suspension.</p> <p> Your payment method is: {$invoice_payment_method} </p> <p> Invoice: {$invoice_num}<br /> Balance Due: {$invoice_balance}<br /> Due Date: {$invoice_date_due} </p> <p> You can login to your client area to view and pay the invoice at {$invoice_link} </p> <p> {$signature} </p>','','','',0,0,'','','',0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(28,'domain','Domain Transfer Initiated','Domain Transfer Initiated','<p>Dear {$client_name}, </p><p>Thank you for your domain transfer order. Your order has been received and we have now initiated the transfer process. The details of the domain purchase are below: </p><p>Domain: {$domain_name}<br />Registration Length: {$domain_reg_period}<br />Transfer Price: {$domain_first_payment_amount}<br />Renewal Price: {$domain_recurring_amount}<br />Next Due Date: {$domain_next_due_date} </p><p>You may login to your client area at <a href=\"{$whmcs_url}\">{$whmcs_url}</a> to manage your domain. </p><p>{$signature} </p>','','','',0,0,'','','',0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(29,'domain','Domain Renewal Confirmation','Domain Renewal Confirmation','<p>Dear {$client_name}, </p><p>Thank you for your domain renewal order. Your domain renewal request for the domain listed below has now been completed.</p><p>Domain: {$domain_name}<br />Renewal Length: {$domain_reg_period}<br />Renewal Price: {$domain_recurring_amount}<br />Next Due Date: {$domain_next_due_date} </p><p>You may login to your client area at <a href=\"{$whmcs_url}\">{$whmcs_url}</a> to manage your domain. </p><p>{$signature} </p>','','','',0,0,'','','',0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(30,'domain','Upcoming Domain Renewal Notice','Upcoming Domain Renewal Notice','<p>Dear {$client_name},</p>\r\n<p>This is a reminder that the domain listed below is scheduled to expire soon.</p>\r\n<p>Domain Name - Expiry Date - Description</p>\r\n<p>--------------------------------------------------------------</p> \r\n<p>{$domain_name} - {$domain_next_due_date} - Expires in {$domain_days_until_nextdue} Days</p>\r\n<p>Please be aware that if your domain name expires, any web site or email services associated with it will stop working.</p>\r\n<p>Renew it now to avoid interruption in service.</p>\r\n<p>To renew your domain, <a href=\"{$domain_renewal_url}\">click here</a>.</p>\r\n<p>To view and manage your domains, you can login to our client area here: <a href=\"{$domains_manage_url}\">Client Area</a></p>\r\n<p>If you have any questions, please reply to this email. Thank you for using our domain name services.</p>\r\n<p>{$signature}</p>','','','',0,0,'','','',0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(31,'support','Clients Only Bounce Message','Support Ticket Not Opened','<p>{$client_name},</p><p>Your email to our support system could not be accepted because it was not recognized as coming from an email address belonging to one of our customers.  If you need assistance, please email from the address you registered with us that you use to login to our client area.</p><p>{$signature}</p>','','','',0,0,'','','',0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(32,'general','Credit Card Expiring Soon','Credit Card Expiring Soon','<p>Dear {$client_name}, </p><p>This is a notice to inform you that your {$client_cc_type} credit card ending with {$client_cc_number} will be expiring next month on {$client_cc_expiry}. Please login to update your credit card information as soon as possible and prevent any interruptions in service at <a href=\"{$whmcs_url}\">{$whmcs_url}</a><br /><br />If you have any questions regarding your account, please open a support ticket from the client area.</p><p>{$signature}</p>','','','',0,0,'','','',0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(33,'support','Support Ticket Auto Close Notification','Support Ticket Resolved','<p>{$client_name},</p><p>This is a notification to let you know that we are changing the status of your ticket #{$ticket_id} to Closed as we have not received a response from you in over {$ticket_auto_close_time} hours.</p><p>Subject: {$ticket_subject}<br>Department: {$ticket_department}<br>Priority: {$ticket_priority}<br>Status: {$ticket_status}</p><p>If you have any further questions then please just reply to re-open the ticket.</p><p>{$signature}</p>','','','',0,0,'','','',0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(34,'invoice','Credit Card Payment Due','Credit Card Payment Due','<p>Dear {$client_name},</p><p>This is a notice to remind you that you have an invoice due on {$invoice_date_due}. We tried to bill you automatically but were unable to because we don\'t have your credit card details on file.</p><p>Invoice Date: {$invoice_date_created}<br>Invoice #{$invoice_num}<br>Amount Due: {$invoice_total}<br>Due Date: {$invoice_date_due}</p><p>Please login to our client area at the link below to submit your card details or make payment using a different method.</p><p>{$invoice_link}</p><p>{$signature}</p>','','','',0,0,'','','',0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(35,'product','Cancellation Request Confirmation','Cancellation Request Confirmation','<p>Dear {$client_name},</p><p>This email is to confirm that we have received your cancellation request for the service listed below.</p><p>Product/Service: {$service_product_name}<br />Domain: {$service_domain}</p><p>{if $service_cancellation_type==\"Immediate\"}The service will be terminated within the next 24 hours.{else}The service will be cancelled at the end of your current billing period on {$service_next_due_date}.{/if}</p><p>Thank you for using {$company_name} and we hope to see you again in the future.</p><p>{$signature}</p>','','','',0,0,'','','',0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(36,'general','Quote Delivery with PDF','Quote #{$quote_number} - {$quote_subject}','<p>Dear {$client_name},</p><p>Here is the quote you requested for {$quote_subject}. The quote is valid until {$quote_valid_until}. You may {if $client_id}view the quote at any time at {$quote_link} and {/if}simply reply to this email with any further questions or requirement.</p><p>{$signature}</p>','','','',0,0,'','','',0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(39,'admin','Automatic Setup Failed','WHMCS Automatic Setup Failed','<p>An order has received its first payment but the automatic provisioning has failed and requires you to manually check & resolve.</p>\r\n<p>Client ID: {$client_id}<br />{if $service_id}Service ID: {$service_id}<br />Product/Service: {$service_product}<br />Domain: {$service_domain}{else}Domain ID: {$domain_id}<br />Registration Type: {$domain_type}<br />Domain: {$domain_name}{/if}<br />Error: {$error_msg}</p>\r\n<p>{$whmcs_admin_link}</p>','','','',0,0,'','','',0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(40,'admin','Automatic Setup Successful','WHMCS Automatic Setup Successful','<p>An order has received its first payment and the product/service has been automatically provisioned successfully.</p>\r\n<p>Client ID: {$client_id}<br />{if $service_id}Service ID: {$service_id}<br />Product/Service: {$service_product}<br />Domain: {$service_domain}{else}Domain ID: {$domain_id}<br />Registration Type: {$domain_type}<br />Domain: {$domain_name}{/if}</p>\r\n<p>{$whmcs_admin_link}</p>','','','',0,0,'','','',0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(41,'admin','Domain Renewal Failed','WHMCS Automatic Domain Renewal Failed','<p>An invoice for the renewal of a domain has been paid but the renewal request submitted to the registrar failed.</p>\r\n<p>Client ID: {$client_id}<br />Domain ID: {$domain_id}<br />Domain Name: {$domain_name}<br />Error: {$error_msg}</p>\r\n<p>{$whmcs_admin_link}</p>','','','',0,0,'','','',0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(42,'admin','Domain Renewal Successful','WHMCS Automatic Domain Renewal Successful','<p>An invoice for the renewal of a domain has been paid and the renewal request was submitted to the registrar successfully.</p>\r\n<p>Client ID: {$client_id}<br />Domain ID: {$domain_id}<br />Domain Name: {$domain_name}</p>\r\n<p>{$whmcs_admin_link}</p>','','','',0,0,'','','',0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(43,'admin','New Order Notification','WHMCS New Order Notification','{assign \"displayTotalToday\" true}\n<p><strong>Order Information</strong></p>\r\n<p>Order ID: {$order_id}<br />\r\nOrder Number: {$order_number}<br />\r\nDate/Time: {$order_date}<br />\r\nInvoice Number: {if $custom_invoice_number}{$custom_invoice_number}{else}{$invoice_id}{/if}<br />\r\nPayment Method: {$order_payment_method}</p>\r\n<p><strong>Customer Information</strong></p>\r\n<p>Customer ID: {$client_id}<br />\r\nName: {$client_first_name} {$client_last_name}<br />\r\nEmail: {$client_email}<br />\r\nCompany: {$client_company_name}<br />\r\nAddress 1: {$client_address1}<br />\r\nAddress 2: {$client_address2}<br />\r\nCity: {$client_city}<br />\r\nState: {$client_state}<br />\r\nPostcode: {$client_postcode}<br />\r\nCountry: {$client_country}<br />\r\nPhone Number: {$client_phonenumber}</p>\r\n<p><strong>Order Items</strong></p>\r\n<p>{foreach $order_items_array as $key => $value}\n    {if $value.service}\n        Product/Service: {$value.service}<br>\n        {if $value.domain}Domain: {$value.domain}<br>{/if}\n        {foreach $value.extra as $extra}{$extra}<br>{/foreach}\n        First Payment Amount: {$value.firstPayment}<br>\n        {if $value.recurringPayment}Recurring Amount: {$value.recurringPayment}<br>{/if}\n        Billing Cycle: {$value.cycle}<br>\n        {if $value.qty}\n            Quantity: {$value.qty}<br>\n            Total: {$value.totalDue}<br>\n        {/if}<br>\n    {elseif $value.domain}\n        Domain Action: {$value.type}<br>\n        Domain: {$value.domain}<br>\n        {if $value.firstPayment}First Payment Amount: {$value.firstPayment}<br>{/if}\n        {if $value.recurringPayment}Recurring Amount: {$value.recurringPayment}<br>{/if}\n        Registration Period: {$value.registrationPeriod}<br>\n        {if $value.dnsManagement}DNS Management<br>{/if}\n        {if $value.emailForwarding}Email Forwarding<br>{/if}\n        {if $value.idProtection}ID Protection<br>{/if}\n    {elseif $value.addon}\n        {if $value.qty}{$value.qty} x {/if}Addon: {$value.addon}<br>\n        Setup Fee: {$value.setupFee}<br>\n        {if $value.recurringPayment}Recurring Amount: {$value.recurringPayment}<br>{/if}\n        Billing Cycle: {$value.cycle}<br>\n    {elseif $value.upgrade}\n{$value.upgrade}\n{$displayTotalToday = false}\n{/if}<br>\n{/foreach}\n{if $displayTotalToday eq true}Total Due Today: {$total_due_today}{/if}</p>\r\n{if $order_notes}<p><strong>Order Notes</strong></p>\r\n<p>{$order_notes}</p>{/if}\r\n<p><strong>ISP Information</strong></p>\r\n<p>IP: {$client_ip}<br />\r\nHost: {$client_hostname}</p><p><a href=\"{$whmcs_admin_url}orders.php?action=view&id={$order_id}\">{$whmcs_admin_url}orders.php?action=view&id={$order_id}</a></p>','','','',0,0,'','','',0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(44,'admin','Service Unsuspension Failed','WHMCS Service Unsuspension Failed','<p>This product/service has received its next payment but the automatic reactivation has failed.</p>\r\n<p>Client ID: {$client_id}<br />Service ID: {$service_id}<br />Product/Service: {$service_product}<br />Domain: {$service_domain}<br />Error: {$error_msg}</p>\r\n<p>{$whmcs_admin_link}</p>','','','',0,0,'','','',0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(45,'admin','Service Unsuspension Successful','WHMCS Service Unsuspension Successful','<p>This product/service has received its next payment and has been reactivated successfully.</p>\r\n<p>Client ID: {$client_id}<br />Service ID: {$service_id}<br />Product/Service: {$service_product}<br />Domain: {$service_domain}</p>\r\n<p>{$whmcs_admin_link}</p>','','','',0,0,'','','',0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(48,'admin','Escalation Rule Notification','[Ticket ID: {$ticket_tid}] Escalation Rule Notification','<p>The escalation rule {$rule_name} has just been applied to this ticket.</p><p>Client: {$client_name}{if $client_id} #{$client_id}{/if} <br />Department: {$ticket_department} <br />Subject: {$ticket_subject} <br />Priority: {$ticket_priority}</p><p>---<br />{$ticket_message}<br />---</p><p>You can respond to this ticket by simply replying to this email or through the admin area at the url below.</p><p><a href=\"{$whmcs_admin_url}supporttickets.php?action=viewticket&id={$ticket_id}\">{$whmcs_admin_url}supporttickets.php?action=viewticket&id={$ticket_id}</a></p>','','','',0,0,'','','',0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(50,'invoice','Invoice Refund Confirmation','Invoice Refund Confirmation','<p>Dear {$client_name},</p>\r\n<p>This is confirmation that a {if $invoice_status eq \"Refunded\"}full{else}partial{/if} refund has been processed for Invoice #{$invoice_num}</p>\r\n<p>The refund has been {if $invoice_refund_type eq \"credit\"}credited to your account balance with us{else}returned via the payment method you originally paid with{/if}.</p>\r\n<p>{$invoice_html_contents}</p>\r\n<p>Amount Refunded: {$invoice_last_payment_amount}{if $invoice_last_payment_transid}<br />Transaction #: {$invoice_last_payment_transid}{/if}</p>\r\n<p>You may review your invoice history at any time by logging in to your client area.</p>\r\n<p>{$signature}</p>','','','',0,0,'','','',0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(51,'admin','New Cancellation Request','New Cancellation Request','<p>A new cancellation request has been submitted.</p><p>Client ID: {$client_id}<br>Client Name: {$clientname}<br>Service ID: {$service_id}<br>Product Name: {$product_name}<br>Cancellation Type: {$service_cancellation_type}<br>Cancellation Reason: {$service_cancellation_reason}</p><p>{$whmcs_admin_link}</p>','','','',0,0,'','','',0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(53,'domain','Domain Transfer Failed','Domain Transfer Failed: {$domain_name}','<p>Dear {$client_name},</p><p>Recently you placed a domain transfer order with us but unfortunately it has failed. The reason for the failure if available is shown below so once this has been resolved, please contact us to re-attempt the transfer.</p><p>Domain: {$domain_name}<br>Failure Reason: {$domain_transfer_failure_reason}</p><p>If you have any questions, please open a support ticket from our client area @ {$whmcs_link}</p><p>{$signature}</p>','','','',0,0,'','','',0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(54,'general','Quote Accepted','Quote #{$quote_number} Accepted - {$quote_subject}','<p>\r\nDear {$client_name}, \r\n</p>\r\n<p>\r\nThis is a confirmation that quote generated on {$quote_date_created} has been accepted by you and invoice # {$invoice_num} is generated.\r\n<p>\r\n{$signature} \r\n</p>','','','',0,0,'','','',0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(55,'admin','Quote Accepted Notification','Quote #{$quote_number} Accepted - {$quote_subject}','<p>A quote has been accepted by the following customer.</p><p><strong>Customer Information</strong></p>\r\n<p>Customer ID: {$client_id}<br />\r\nName: {$clientname}<br />\r\nEmail: {$client_email}<br />\r\nCompany: {$client_company_name}<br />\r\nAddress 1: {$client_address1}<br />\r\nAddress 2: {$client_address2}<br />\r\nCity: {$client_city}<br />\r\nState: {$client_state}<br />\r\nPostcode: {$client_postcode}<br />\r\nCountry: {$client_country}<br />\r\nPhone Number: {$client_phonenumber}</p>\r\n<p><strong>Quote Information</strong></p>\r\n<p>Quote #: {$quote_number}<br />\r\nQuote Subject: {$quote_subject}</p><p><a href=\"{$whmcs_admin_url}quotes.php?action=manage&id={$quote_number}\">{$whmcs_admin_url}quotes.php?action=manage&id={$quote_number}</a></p>','','','',0,0,'','','',0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(57,'support','Support Ticket Feedback Request','Your Feedback is Requested for Ticket #{$ticket_id}','<p>This support request has been marked as completed.</p><p>We would really appreciate it if you would just take a moment to let us know about the quality of your experience.</p><p><a href=\"{$ticket_url}&feedback=1\">{$ticket_url}&feedback=1</a></p><p>Your feedback is very important to us.</p><p>Thank you for your business.</p><p>{$signature}</p>','','','',0,0,'','','',0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(58,'support','Replies Only Bounce Message','Online Submission Required','<p>{$client_name},</p><p>Your email to our support system could not be accepted because we require you to submit all tickets via our online client support portal. You can do this at the URL below.</p><p><a href=\"{$whmcs_url}/submitticket.php\">{$whmcs_url}/submitticket.php</a></p><p>{$signature}</p>','','','',0,0,'','','',0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(59,'general','Unsubscribe Confirmation','Unsubscribe Confirmation','Dear {$client_name},<br /><br />We have now removed your email address from our mailing list.<br /><br />If this was a mistake or you change your mind, you can re-subscribe at any time from the My Details section of our client area.<br /><br /><a href=\"{$whmcs_url}/clientarea.php?action=details\">{$whmcs_url}/clientarea.php?action=details</a><br /><br />{$signature}','','','',0,0,'','','',0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(60,'support','Closed Ticket Bounce Message','Closed Ticket Bounce Message','<p>{$client_name},</p>\n<p>Your email to our ticket system could not be accepted because the ticket being responded to has already been closed.</p>\n<p>{if $client_id}If you wish to reopen this ticket, you can do so from our client area:\n{$ticket_link}{else}To open a new ticket, please visit:</p>\n<p><a href=\"{$whmcs_url}/submitticket.php\">{$whmcs_url}/submitticket.php</a>{/if}</p>\n<p>This is an automated response from our support system.</p>\n<p>{$signature}</p>','','','',0,0,'','','',0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(61,'domain','Expired Domain Notice','Expired Domain Notice','<p>Dear {$client_name},</p>\n<p>The domain name listed below expired {$domain_days_after_expiry} days ago.</p>\n<p>{$domain_name}</p>\n<p>To ensure that the domain isn\'t registered by someone else, you should renew it now. To renew the domain, please visit the following page and follow the steps shown: <a title=\"{$whmcs_url}/cart.php?gid=renewals\" href=\"{$whmcs_url}/cart.php?gid=renewals\">{$whmcs_url}/cart.php?gid=renewals</a></p>\n<p>Due to the domain expiring, the domain will not be accessible so any web site or email services associated with it will stop working. You may be able to renew it for up to 30 days after the renewal date.</p>\n<p>{$signature}</p>','','','',0,0,'','','',0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(62,'product','Service Unsuspension Notification','Service Unsuspension Notification','<p>Dear {$client_name},</p>\n<p>This is a notification that your service has now been unsuspended. The details of this unsuspension are below:</p>\n<p>Product/Service: {$service_product_name}<br />{if $service_domain}Domain: {$service_domain}<br />{/if}Amount: {$service_recurring_amount}<br />Due Date: {$service_next_due_date}</p>\n<p>{$signature}</p>','','','',0,0,'','','',0,'2016-02-24 15:27:00','2016-02-24 15:27:00'),(63,'admin','Manual Upgrade Required','Manual Upgrade Required','<p>An upgrade order has received its payment, but does not support automatic upgrades and requires manually processing.</p>\n<p>Client ID: {$client_id}<br />Service ID: {$service_id}<br />Order ID: {$order_id}</p>\n<p>{if $upgrade_type eq \'package\'}New Package ID: {$new_package_id}<br />Existing Billing Cycle: {$billing_cycle}<br />New Billing Cycle: {$new_billing_cycle}{else}Configurable Option: {$config_id}<br />Option Type: {$option_type}<br />Current Value: {$current_value}<br />New Value: {$new_value}{/if}</p>\n<p><a href=\"{$whmcs_admin_url}orders.php?action=view&id={$order_id}\">\n{$whmcs_admin_url}orders.php?action=view&id={$order_id}</a></p>','','','',0,0,'','','',0,'2016-02-24 15:27:00','2016-02-24 15:27:00'),(65,'admin','Support Ticket Change Notification','[Ticket ID: {$ticket_tid}] {$ticket_subject}','{if $newTicket}\r\n    <p>Ticket #<a href=\"{$whmcs_admin_url}supporttickets.php?action=viewticket&id={$ticket_id}\"><strong>{$ticket_tid}</strong></a> has been opened by <strong>{$changer}</strong>.</p>\r\n    <p>\r\n        Client: {$client_name}{if $client_id} #{$client_id}{/if}<br />\r\n        Department: {$ticket_department}<br />\r\n        Subject: {$ticket_subject}<br />\r\n        Priority: {$ticket_priority}\r\n    </p>\r\n    <div class=\"quoted-content\">\r\n        {$newTicket}\r\n    </div>\r\n{else}\r\n    <p>Ticket #<a href=\"{$whmcs_admin_url}supporttickets.php?action=viewticket&id={$ticket_id}\"><strong>{$ticket_tid}</strong></a> {if $newReply || $newNote}has had a new {if $newReply}reply{else}note{/if} posted by{else}has been updated by{/if} <strong>{$changer}</strong>.</p>\r\n\r\n    {if $changes}\r\n        <table class=\"keyvalue-table\" style=\"border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt;\">\r\n            <tbody>\r\n                {foreach $changes as $change}\r\n                    <tr>\r\n                        <td>{$change@key}:</td>\r\n                        <td>\r\n                            <span style=\"background-color:#ffe7e7;text-decoration:line-through;\">{$change.old}</span>\r\n                            &nbsp;\r\n                            <span style=\"background-color:#ddfade;\">{$change.new}</span>\r\n                        </td>\r\n                    </tr>\r\n                {/foreach}\r\n            </tbody>\r\n        </table>\r\n    {/if}\r\n\r\n    {if $newReply}\r\n        <div class=\"quoted-content\">\r\n            {$newReply}\r\n        </div>\r\n    {/if}\r\n\r\n    {if $newNote}\r\n        <div class=\"quoted-content\">\r\n            {$newNote}\r\n        </div>\r\n    {/if}\r\n\r\n    {if $newAttachments}{$newAttachments}{/if}\r\n{/if}\r\n<p>\r\n    You can respond to this ticket by simply replying to this email or through the admin area at the url below.\r\n</p>\r\n<p>\r\n    <a href=\"{$whmcs_admin_url}supporttickets.php?action=viewticket&id={$ticket_id}\">\r\n        {$whmcs_admin_url}supporttickets.php?action=viewticket&id={$ticket_id}\r\n    </a>\r\n</p>','','','',0,0,'','','',0,'2016-02-24 15:27:04','2016-02-24 15:27:04'),(66,'admin','Admin Password Reset Validation','WHMCS Password Reset','<p>Hi {$firstname},</p>\r\n<p>Recently a request was submitted to reset your admin password. Follow the link below to reset it.</p>\r\n<p><a href=\"{$pw_reset_url}\">{$pw_reset_url}</a></p>\r\n<p>If you did not request a password reset, please ignore this email. The password reset link will expire in 2 hours.</p>\r\n<p>{$whmcs_admin_link}</p>','','','',0,0,'','','',0,'2016-09-07 15:57:57','2016-09-07 15:57:57'),(67,'admin','Admin Password Reset Confirmation','WHMCS Password Reset Confirmation','<p>Hi {$firstname},</p>\r\n<p>This is a confirmation that your admin password has now been reset.</p>\r\n<p>If you did not initiate this password reset, please notify your system administrator immediately.</p>\r\n<p>{$whmcs_admin_link}</p>','','','',0,0,'','','',0,'2016-09-07 15:57:57','2016-09-07 15:57:57'),(68,'product','SpamExperts Welcome Email','Welcome to Spam Free Email','<p>Congratulations!</p>\r\n<p>Your service has been setup and is ready for you to begin using.</p>\r\n{if $configuration_required}\r\n<p><strong>Required Action</strong></p>\r\n<p>To begin using SpamExperts mail services, you must modify the MX records for your domain to the following:</p>\r\n<p>\r\n{foreach from=$required_mx_records key=mx_host item=mx_priority}\r\n    {$mx_host} with a recommended priority of {$mx_priority}<br />\r\n{/foreach}\r\n</p>\r\n<p>We have guides available for this at <a href=\"https://documentation.solarwindsmsp.com/spamexperts/documentation/Content/B_Admin%20Level/domains/mx-records.htm\" target=\"_blank\">https://documentation.solarwindsmsp.com/spamexperts/documentation/Content/B_Admin%20Level/domains/mx-records.htm</a></p>\r\n{/if}\r\n{if $outgoing_service}\r\n<p><strong>Outgoing Email Filtering</strong></p>\r\n<p>Outgoing Email Filtering protects your reputation by preventing spam & viruses from leaving \r\nyour network and working to ensure your IPs are protected from being blacklisted.<br>\r\nTo begin using it, you will need to login to the SpamExperts Control Panel to create \r\nthe outgoing user accounts you will use to send email.<br>\r\nOnce the user accounts are created, you will need to update your email clients to use \r\nthe new hostname and credentials provided via the SpamExperts Control Panel.<br>\r\nMore information on how to do this can be found at <a href=\"https://kb.spamexperts.com/36678-getting-started/227750-getting-started-with-outbound\" target=\"_blank\">https://kb.spamexperts.com/36678-getting-started/227750-getting-started-with-outbound</a>\r\n</p>\r\n{/if}\r\n{if $archiving_service}\r\n<p><strong>Email Archiving</strong></p>\r\n<p>Your purchase included Email Archiving which helps to ensure you will never lose an email again.<br>\r\nEmail archiving has been automatically enabled and you can review and access your email archives \r\nvia the SpamExperts Control Panel at any time.\r\n</p>\r\n{/if}\r\n<p><strong>Managing your Service</strong></p>\r\n<p>You can access and manage your email filtering at any time from our client area at {$whmcs_link}</p>\r\n<p>Simply login and look for the SpamExperts Manage link on the homepage.</p>\r\n<p>If you need any further assistance, please contact our <a href=\"{$whmcs_url}submitticket.php\">support team</a></p>\r\n<p>{$signature}</p>','','','',0,0,'','','',0,'2018-04-18 10:21:40','2018-04-18 10:21:40'),(69,'product','Weebly Welcome Email','Welcome to your Beautiful Website','<p>Dear {$client_name},</p>\r\n<p>Congratulations!</p>\r\n<p>Your account has been setup and you are ready to begin building your site with Weebly.</p>\r\n{if $configuration_required}\n<p>To allow automatic publishing of your site, Weebly require an FTP account to be created and provided to them in their settings.</p>\r\n{/if}\n<p>Guides for how to get started with Weebly can be found at <a href=\"https://www.weebly.com/app/help/us/en/topics/first-steps\">https://www.weebly.com/app/help/us/en/topics/first-steps</a></p>\r\n<p>To access the Weebly site builder and begin building your website, please <a href=\"{$whmcs_url}clientarea.php?action=productdetails&id={$service_id}\">click here</a></p>\r\n<p>If you need any further assistance, please contact our <a href=\"{$whmcs_url}submitticket.php\">support team</a></p>\r\n<p>{$signature}</p>','','','',0,0,'','','',0,'2018-04-18 10:21:40','2018-04-18 10:21:40'),(70,'invoice','Direct Debit Payment Failed','Direct Debit Payment Failed','<p>Dear {$client_name},</p>\n<p>This is a notice that a recent direct debit payment for you failed.</p>\n<p>Invoice Date: {$invoice_date_created}<br />Invoice No: {$invoice_num}<br />Amount: {$invoice_total}<br />Status: {$invoice_status}</p>\n<p>You now need to login to your client area to pay the invoice manually.<br />{$invoice_link}</p>\n<p>{$signature}</p>','','','',0,0,'','','',0,'2017-02-21 09:48:41','2017-02-21 09:48:41'),(71,'invoice','Direct Debit Payment Confirmation','Direct Debit Payment Confirmation','<p>Dear {$client_name},</p>\n<p>This is a payment receipt for Invoice {$invoice_num} generated on {$invoice_date_created}. The payment has been taken automatically via direct debit.</p>\n<p>Amount: {$invoice_total}<br />Status: {$invoice_status}</p>\n<p>You may review your invoice history at any time by logging in to your client area.<br />{$invoice_link}</p>\n<p>Note: This email will serve as an official receipt for this payment.</p>\n<p>{$signature}</p>','','','',0,0,'','','',0,'2017-02-21 09:48:42','2017-02-21 09:48:42'),(72,'invoice','Direct Debit Payment Pending','Direct Debit Payment Pending','<p>Dear {$client_name},</p>\n<p>This is a notification that a payment has been requested for Invoice {$invoice_num}. The payment has been taken automatically via direct debit on or around {$invoice_date_due}.</p>\n<p>Amount: {$invoice_total}<br />Status: {$invoice_status}</p>\n<p>You may review your invoice history at any time by logging in to your client area.<br />{$invoice_link}</p>\n<p>Note: This email will serve as an official notification for this payment.</p>\n<p>{$signature}</p>','','','',0,0,'','','',0,'2017-02-21 09:48:42','2017-02-21 09:48:42'),(73,'invoice','Credit Card Payment Pending','Credit Card Payment Pending','<p>Dear {$client_name},</p>\n<p>This is a payment pending notification for Invoice {$invoice_num} generated on {$invoice_date_created}. The payment will be taken from your card on record with us automatically.</p>\n<p>Amount: {$invoice_total}<br />Status: {$invoice_status}</p>\n<p>You may review your invoice history at any time by logging in to your client area.<br />{$invoice_link}</p>\n<p>{$signature}</p>','','','',0,0,'','','',0,'2017-02-21 09:48:42','2017-02-21 09:48:42'),(74,'admin','Payment Reversed Notification','Payment Reversed Notification','<p>This is a notification that a transaction has been reversed and follow up may be required.</p>\n<p>\n    Transaction ID: {$transaction_id}<br />\n    Transaction Date: {$transaction_date}<br />\n    Transaction Amount: {$transaction_amount}<br />\n    Payment Method: {$payment_method}<br />\n    Invoice ID: {$invoice_id}<br />\n</p>\n<p>{$whmcs_admin_link}</p>','','','',0,0,'','','',0,'2017-03-13 17:32:42','2017-03-13 17:32:42'),(75,'product','SSL Certificate Configuration Required','SSL Certificate Configuration Required','<p>Dear {$client_name},</p>\r\n<p>Thank you for your order for an SSL Certificate. Before you can use your certificate, it requires configuration which can be done at the URL below.</p>\r\n<p>{$ssl_configuration_link}</p>\r\n<p>Instructions are provided throughout the process but if you experience any problems or have any questions, please open a ticket for assistance.</p>\r\n<p>{$signature}</p>','','','',0,0,'','','',0,'2017-04-01 09:00:00','2017-04-01 09:00:00'),(76,'product','Upgrade Order Cancelled','Pending Upgrade Order Cancelled','<p>Dear {$client_name},</p>\r\n<p>Re: {$service_product_name}{if $service_domain} ({$service_domain}){/if}</p>\r\n<p>\r\n    Recently you placed an upgrade order with us.<br>\r\n    Today your automated renewal invoice has been generated for the product/service listed above which has invalidated the upgrade quote and invoice.<br>\r\n    As a result, your upgrade order has now been cancelled.\r\n</p>\r\n<p>Should you wish to continue with the upgrade, we ask that you please first pay the renewal invoice, after which you will be able to order the upgrade again and simply pay the difference.</p>\r\n<p>We thank you for your business.</p>\r\n<p>{$signature}</p>\r\n','','','',0,0,'','','',0,'2017-07-21 09:00:00','2017-07-21 09:00:00'),(77,'notification','Default Notification Message','Notification Message','<h2><a href=\"{$notification_url}\">{$notification_title}</a></h2>\r\n<div>{$notification_message}</div>\r\n{foreach from=$notification_attributes item=$attribute}\r\n<div>\r\n<div>{$attribute.label}: {if $attribute.icon}<img src=\"{$attribute.icon}\" alt=\"\" />{/if}{if $attribute.style}<span class=\"{$attribute.style}\">{/if}{if $attribute.url}<a href=\"{$attribute.url}\">{$attribute.value}</a>\r\n{else}{$attribute.value}{/if}{if $attribute.style}</span>{/if}</div>\r\n</div>\r\n{/foreach}','','','',0,0,'','','',0,'2017-10-31 12:08:18','2017-10-31 12:08:18'),(78,'admin','Mention Notification','{$mention_admin_name} mentioned you in a {$mention_entity}','<p>{$mention_admin_name} mentioned you in {$mention_entity_description}:</p>\r\n<blockquote>\r\n{$message}\r\n</blockquote>\r\n<p><a href=\"{$mention_view_url}\" target=\"_blank\">{$mention_entity_action}</a></p>','','','',0,0,'','','',0,'2018-01-29 16:21:18','2018-01-29 16:21:18'),(79,'product','SiteLock Welcome Email','Getting Started with SiteLock','<p>Dear {$client_name},</p>\n<p>Thank you for purchasing the SiteLock service. You are just a few steps away from securing your website.</p>\n<p>Below are the details you will need to administer and use the SiteLock service.</p>\n{if ($sitelock_requires_ftp && !$sitelock_ftp_auto_provisioned) || ($sitelock_requires_dns && !$sitelock_dns_auto_provisioned)}\n    <p><b>Additional Setup Required</b></p>\n{/if}\n{if $sitelock_requires_ftp && !$sitelock_ftp_auto_provisioned}\n    <p>To allow SiteLock to automatically fix issues that are discovered with your website, SiteLock requires FTP access to your website.</p>\n    <p>Unfortunately we were unable to provision these automatically and so you must supply FTP credentials to SiteLock via the SiteLock Control Panel.</p>\n    <p>To do this, please login to our <a href=\"{$whmcs_url}\">client area</a> and click the Login button found under the SiteLock service. Then navigate to Sites > FTP Credentials within the SiteLock control panel.</p>\n{/if}\n{if $sitelock_requires_dns && !$sitelock_dns_auto_provisioned}\n    <p>To allow SiteLock to provide WAF and CDN services for your website, SiteLock requires some DNS changes.</p>\n    <p>Unfortunately we were unable to provision these automatically and so you must make these changes manually.</p>\n    <p>To do this, please modify your domain DNS host records as follows:</p>\n    <p>{$sitelock_dns_host_record_info}</p>\n{/if}\n<p><b>Using SiteLock</b></p>\n<p>To use the SiteLock service, login to our <a href=\"{$whmcs_url}\">client area</a> and click the Login button found under the SiteLock service.</p>\n<p>If you have any questions, please reply to this email. Thank you for choosing our services.</p>\n<p>{$signature}</p>','','','',0,0,'','','',0,'2018-02-15 16:07:49','2018-02-15 16:07:49'),(80,'invoice','Invoice Modified','Invoice #{$invoice_num} Updated','<p>Dear {$client_name},</p>\r\n<p>This is a notice that invoice #{$invoice_num} which was originally generated on {$invoice_date_created} has been updated.</p>\r\n<p>Your payment method is: {$invoice_payment_method}</p>\r\n<p>\r\n    Invoice #{$invoice_num}<br>\r\n    Amount Due: {$invoice_balance}<br>\r\n    Due Date: {$invoice_date_due}\r\n</p>\r\n<p>Invoice Items</p>\r\n<p>\r\n    {$invoice_html_contents}<br>\r\n    ------------------------------------------------------\r\n</p>\r\n<p>You can login to our client area to view and pay the invoice at {$invoice_link}</p>\r\n<p>{$signature}</p>','','','',0,0,'','','',0,'2018-03-16 10:20:00','2018-03-16 10:20:00'),(81,'admin','Service Renewal Failed','WHMCS Service Renewal Failed','<p>\r\n    An automatic renewal attempt was triggered for this service but failed. The renewal will not be attempted again automatically. Please resolve the error and try again.\r\n</p>\r\n<p>\r\n    Client ID: {$client_id}<br />\r\n    Service ID: {$service_id}<br />\r\n    Product/Service: {$service_product}<br />\r\n    Domain: {$service_domain}<br />{if $addon_id}\r\n    Addon ID: {$addon_id}<br />\r\n    Addon: {$addon_name}<br />\r\n    {/if}Error: {$error_msg}\r\n</p>\r\n<p>\r\n    <a href=\"{$whmcs_admin_url}/clientsservices.php?userid={$client_id}&id={$service_id}{if $addon_id}&aid={$addon_id}{/if}\">\r\n        Go to {if $addon_id}addon{else}service{/if}\r\n    </a>\r\n</p>','','','',0,0,'','','',0,'2018-06-05 04:37:38','2018-06-05 04:37:38'),(82,'domain','Domain Transfer Completed','Transfer Completed for {$domain_name}','<p>Dear {$client_name},</p>\n<p>We are pleased to confirm that your recent domain transfer has now been completed.</p>\n<p>Order Date: {$domain_reg_date}<br />\nDomain: {$domain_name}<br />\nStatus: {$domain_status}</p>\n<p>You may now login to your client area at {$whmcs_link} to manage your domain.</p>\n<p>{$signature}</p>','','','',0,0,'','','',0,'2018-06-15 15:10:21','2018-06-15 15:10:21'),(83,'product','CodeGuard Welcome Email','Welcome to Website Protection','<p>Congratulations!</p>\r\n<p>Your CodeGuard website backup service has been provisioned successfully and is now ready for use!</p>\r\n{if $configuration_required}\r\n<p>To begin using the service, you will need to login and provide the SFTP or SSH credentials required to access your website. Our guide that demonstrates how to do this can be found at <a href=\"https://codeguard.zendesk.com/hc/en-us/articles/115000610543-How-do-I-back-up-my-website\" target=\"_blank\">https://codeguard.zendesk.com/hc/en-us/articles/115000610543-How-do-I-back-up-my-website</a></p>\r\n{else}\r\n<p>We have successfully configured daily backups for your website files and the first backup will be performed shortly. Once that has been performed, backups will be performed daily. If at any time a backup encounters problems, we will notify you by email.</p>\r\n<p>If you have databases that need to be backed up, CodeGuard will attempt to add them automatically after you have configured your website backup. Alternatively, database backups can be added manually. Our guide for how to do this can be found at <a href=\"https://codeguard.zendesk.com/hc/en-us/articles/115000604663-CodeGuard-Database-Backup-Walkthrough\" target=\"_blank\">https://codeguard.zendesk.com/hc/en-us/articles/115000604663-CodeGuard-Database-Backup-Walkthrough</a></p>\r\n{/if}\r\n<p>You can access and manage your website backups at any time from our <a href=\"{$whmcs_url}\">client area</a>. Simply login and look for the CodeGuard Manage link on the homepage.</p>\r\n<p>If you need any further assistance, you may contact our <a href=\"{$whmcs_url}submitticket.php\">support team</a> at any time.</p>\r\n<p>{$signature}</p>','','','',0,0,'','','',0,'2018-12-12 05:15:53','2018-12-12 05:15:53'),(84,'product','SiteLock VPN Welcome Email','Getting Started with SiteLock VPN','<p>Dear {$client_name},</p>\r\n<p>Thank you for your purchase to secure your personal and business data. You now ready to have a secure end-to-end connection for browsing and transmitting data through the internet via SiteLock VPN.</p>\r\n<p>Below are a few simple steps to setup your VPN credentials and begin securely browsing the web.</p>\r\n<p><strong>Step 1 – Login and Setup VPN Credentials</strong></p>\r\n<p>To set up your account you must first access the SiteLock dashboard.  Login to our <a href=\"{$whmcs_url}\">client area</a> and click the Login button found under the SiteLock VPN service to access the dashboard.</p>\r\n<p>Once you’re logged in click on ‘VPN’ to be directed to the Sitelock VPN configuration screen.</p>\r\n<p>Next, setup your user ID and set your password for accessing VPN.</p>\r\n<p><strong>Step 2 – Download and Install VPN client appStep 2 – Download and Install VPN client app</strong></p>\r\n<p>Once your VPN login and password has been set, you can download the VPN clients for your preferred devices.</p>\r\n<p>Apple iOS - <a href=\"https://itunes.apple.com/us/app/sitelock-vpn/id1446325257?ls=1&mt=8\">Download the iOS app</a></p>\r\n<p>Android - <a href=\"https://play.google.com/store/apps/details?id=com.sitelock.vpn.android\">Download the Android app</a></p>\r\n<p>macOS - <a href=\"https://s3.us-east-2.amazonaws.com/sitelock-vpn/mac/SiteLock+VPN.dmg\">Download the macOS app</a></p>\r\n<p>Windows - <a href=\"https://s3.us-east-2.amazonaws.com/sitelock-vpn/app/Setup_1.0.1.0.exe\">Download the Windows app</a></p>\r\n<p><strong>Step 3 – Login and Begin Browsing Securely</strong></p>\r\n<p>Once the VPN client installation is complete, log in with your user ID and password that was just setup to connect to any of the 1,100+ secure servers worldwide.</p>\r\n<p>Complete instructions can also be downloaded on the upper right-hand corner of your VPN configuration screen.</p>\r\n<p>If you have any questions, please contact us or reply to this email. Thank you for choosing our services.</p>\r\n<p>{$signature}</p>','','','',0,0,'','','',0,'2019-11-06 09:00:00','2019-11-06 09:00:00'),(85,'product','Marketgoo Welcome Email','Getting Started with Marketgoo','<p>Hi {$client_first_name},</p>\r\n<p>Thank you for your purchase. Your website is now being analyzed by marketgoo. You’re now ready to take the next steps to improve your search engine ranking.</p>\r\n<p>To login and get started straight away, or check your SEO progress at any time, simply login to our client area and follow the link to access the marketgoo dashboard.</p><p><a href=\"{$whmcs_url}clientarea.php\">{$whmcs_url}clientarea.php</a></p>\r\n<p>If you have any questions or need help, please contact us by opening a <a href=\"{$whmcs_url}submitticket.php\">support ticket</a></p>\r\n<p>{$signature}</p>','','','',0,0,'','','',0,'2020-03-02 09:00:00','2020-03-02 09:00:00'),(86,'user','Email Address Verification','Email Address Verification','<p>Welcome to {$company_name}</p>\r\n<p>Please click on the link below to verify your email address. This is required to confirm ownership of the email address.</p>\r\n<p><a href=\"{$verification_url}\">Verify your email address</a></p>\r\n<p>If you\'re having trouble, try copying and pasting the following URL into your browser:<br>{$verification_url}</p>\r\n<p>This link is valid for 60 minutes only. If it has expired, login to our <a href=\"{$whmcs_url}\">client area</a> to request a new link.</p>\r\n<p>{$signature}</p>','','','',0,0,'','','',0,'2020-07-08 09:22:00','2020-07-08 09:22:00'),(87,'user','Password Reset Validation','Password Reset Validation','<p>To reset your password, please click on the link below.</p>\r\n<p><a href=\"{$reset_password_url}\">Reset your password</a></p>\r\n<p>If you\'re having trouble, try copying and pasting the following URL into your browser:<br>{$reset_password_url}</p>\r\n<p>If you did not request this reset, you can ignore this email. It will expire in 2 hours time.</p>\r\n<p>{$signature}</p>','','','',0,0,'','','',0,'2020-07-08 09:22:00','2020-07-08 09:22:00'),(88,'user','Password Reset Confirmation','Your password has been reset','<p>Your password has been reset.</p>\r\n<p>If you did not request this reset, please <a href=\"{$whmcs_url}\">contact us</a>.</p>\r\n<p>{$signature}</p>','','','',0,0,'','','',0,'2020-07-08 09:22:00','2020-07-08 09:22:00'),(89,'invite','Account Access Invitation','{if $invite_sent_by_admin}An agent of {$company_name} has sent you an invite{else}{$invite_sender_name} has invited you to their account{/if}','\r\n<h2>You\'ve been given access to {$invite_account_name}.</h2>\r\n<p>{if $invite_sent_by_admin}An agent of {$company_name}{else}{$invite_sender_name}{/if} has given you access to the {$invite_account_name} account with {$company_name}.</p>\r\n<p>To accept the invite, please click on the link below.</p>\r\n<p><a href=\"{$invite_accept_url}\">Accept invitation</a></p>\r\n<p>Invitations are valid for 7 days from the time of issue. After that time, you will need to request a new invite from the account administrator.</p>\r\n<p>{$signature}</p>','','','',0,0,'','','',0,'2020-07-08 09:22:00','2020-07-08 09:22:00'),(90,'product','Open-Xchange Welcome Email','Your new professional email','<p>Dear {$client_name},</p>\n<p>\n    Thank you for purchasing {$service_product_name} from Open-Xchange.<br>\n    Your email service has been set up and is ready for you to begin creating email accounts.\n</p>\n{if $configuration_required}\n<p>\n    <strong>Required Action</strong><br>\n    To begin using Open-Xchange mail services, you must modify the MX records for your domain to the following:<br>\n<pre>{foreach from=$required_mx_records key=mx_host item=mx_priority}\n{$mx_host} with a recommended priority of {$mx_priority}\n{/foreach}</pre>\n    The following SPF record is also recommended:\n    <pre>{$required_spf_record}</pre>\n</p>\n{/if}\n<p>\n    To create, edit and administer your email addresses and passwords, please visit the \"Email User Management\" pages in your\n    <a href=\"{$whmcs_url}clientarea.php?action=productdetails&id={$service_id}\">client area</a>.\n</p>\n<p><a href=\"{$webmail_link}\">Webmail Access</a></p>\n<p>\n    <strong>Mobile Access</strong><br>\n    To configure and sync email and PIM data on your mobile device, please refer to the \"Connect Your Device\" Wizard in App Suite.\n    You can find it under your profile icon in the top right-hand corner of your App Suite Webmail interface.<br>\n    You can also download the App Suite Mobile App here: <br>\n    <a href=\"https://apps.apple.com/us/app/ox-mail-by-open-xchange/id1385582725\">iOS</a> or\n    <a href=\"https://play.google.com/store/apps/details?id=com.openxchange.mobile.oxmail\">Android</a>\n</p>\n{if $migration_tool_url}\n<p>\n    <strong>Migrations</strong><br>\n    OX App Suite has a quick and easy self-service migration tool to help you move your users.\n    You can find it here: <a href=\"{$migration_tool_url}\">Migration Tool</a><br>\n</p>\n{/if}\n<p>If you have any questions, please contact our <a href=\"{$whmcs_url}submitticket.php\">support team</a>.</p>\n<p>Thank you for choosing us as your trusted service provider.</p>\n<p>{$signature}</p>','','','',0,0,'','','',0,'2020-08-26 12:36:45','2021-04-12 10:32:47'),(91,'user','User Identity Verification','Identity Verification Required','<p>Dear {$user_first_name},</p>\r\n<p>You have been requested to provide additional verification for your user account {$user_email} at {$company_name}.</p>\r\n<p>Log in to your account, and then locate and click the Submit Documents button to follow the steps for the secure submission process.</p>\r\n<p>Please complete this verification process to avoid possible interruptions with your account.</p>\r\n<p>Click on the link below to be taken to the Client Area:</p>\r\n<p><a href=\"{$whmcs_url}\">{$whmcs_url}</a></p>\r\n<p>{$signature}</p>','','','',0,0,'','','',0,'2021-04-13 04:12:11','2021-04-23 18:37:59'),(92,'domain','Upcoming Free Domain Renewal Notice','Upcoming Domain Renewal Notice','<p>Dear {$client_name},</p>\r\n<p>This is a reminder that the domain listed below is scheduled to expire soon.</p>\r\n<p>Domain Name - Expiry Date - Description</p>\r\n<p>--------------------------------------------------------------</p>\r\n<p>{$domain_name} - {$domain_next_due_date} - Expires in {$domain_days_until_nextdue} Days</p>\r\n{if $autoRenewalDisabled || (!$freeDomainWithService && $freeDomainAutoRenewRequiresProduct)}\r\n<p>Please be aware that if your domain name expires, any website or email services associated with it will stop working.</p>\r\n<p><a href=\"{$domain_renewal_url}\">Renew your domain now</a> to avoid an interruption in service.</p>\r\n{elseif $freeDomainWithService}\r\n<p><strong>This is an informational notice</strong>. Because this domain name is associated with a service including a free domain renewal, no action is needed to renew this domain automatically.</p>\r\n{else}\r\n<p><strong>This is an informational notice</strong>. This domain will automatically renew and you do not need to take any further action.</p>\r\n{/if}\r\n<p>To view and manage your domains, you can log in to our client area here: <a href=\"{$domains_manage_url}\">Client Area</a></p>\r\n<p>If you have any questions, please reply to this email. Thank you for using our domain name services.</p>\r\n<p>{$signature}</p>','','','',0,0,'','','',0,'2021-04-09 09:00:00','2021-04-09 09:00:00'),(93,'product','Site Builder Welcome Email','Welcome to Your New Website Builder','<p>Dear {$client_name},</p>\r\n<p>Congratulations!</p>\r\n<p>Your account has been set up and you are ready to begin building your website.</p>\r\n<p>{if $configuration_required}</p>\r\n<p>To allow automatic publishing of your site, an FTP account is required. You can provide FTP details in the client area.</p>\r\n<p>{/if}</p>\r\n<p>To access the site builder and begin building your website, please <a href=\"{$whmcs_url}clientarea.php?action=productdetails&amp;id={$service_id}\">click here</a>.</p>\r\n<p>If you need any further assistance, please contact our <a href=\"{$whmcs_url}submitticket.php\">support team</a>.</p>\r\n<p>{$signature}</p>','','','',0,0,'','','',0,'2020-08-26 07:36:45','2020-08-26 07:36:45'),(94,'product','WP Toolkit Welcome Email','{$service_product_name}','<p>Dear {$client_name},</p>\n<p>Thank you for purchasing {$service_product_name}!</p>\n<p>{$service_product_name} has now been activated for your account with domain {$service_domain} and you can begin using the advanced features of {$service_product_name} immediately.</p>\n<p>You can access {$service_product_name} via your hosting service or by logging in to your client area using the link below.</p>\n<p>{$whmcs_link}</p>\n<p>{$signature}</p>','','','',0,0,'','','',0,'2021-05-21 10:19:28','2021-05-21 10:19:28'),(95,'product','WordPress Installation Welcome Email','Welcome to WordPress','<p>Dear {$client_name},</p>\n<p>Your new WordPress® blog is ready. This email contains all of the important information to get you started.</p>\n<p>You and your visitors can find your new WordPress installation at: {$instance_url}</p>\n<p>To configure your blog and add content, use the WordPress Administration Area: {$instance_admin_url}</p>\n<p>You can use these details to log in:<br>\nUsername: {$admin_username}<br>\nPassword: {$admin_password}</p>\n<p>{$signature}</p>','','','',0,0,'','','',0,'2021-08-26 10:21:20','2021-08-26 10:21:20');
/*!40000 ALTER TABLE `tblemailtemplates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblerrorlog`
--

DROP TABLE IF EXISTS `tblerrorlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblerrorlog` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `severity` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `exception_class` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `line` int(10) unsigned DEFAULT NULL,
  `details` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblerrorlog`
--

LOCK TABLES `tblerrorlog` WRITE;
/*!40000 ALTER TABLE `tblerrorlog` DISABLE KEYS */;
INSERT INTO `tblerrorlog` VALUES (1,'warning',NULL,'file_exists(): open_basedir restriction in effect. File(/usr/bin/php-cli) is not within the allowed path(s): (/var/www/vhosts/lchcloud.de/:/tmp/)','vendor/whmcs/whmcs-foundation/lib/Environment/Php.php',0,NULL,'2022-02-19 05:02:03','2022-02-19 05:02:03'),(2,'warning',NULL,'file_exists(): open_basedir restriction in effect. File(/usr/local/bin/php-cli) is not within the allowed path(s): (/var/www/vhosts/lchcloud.de/:/tmp/)','vendor/whmcs/whmcs-foundation/lib/Environment/Php.php',0,NULL,'2022-02-19 05:02:03','2022-02-19 05:02:03'),(3,'warning',NULL,'file_exists(): open_basedir restriction in effect. File(/usr/bin/php) is not within the allowed path(s): (/var/www/vhosts/lchcloud.de/:/tmp/)','vendor/whmcs/whmcs-foundation/lib/Environment/Php.php',0,NULL,'2022-02-19 05:02:03','2022-02-19 05:02:03'),(4,'warning',NULL,'file_exists(): open_basedir restriction in effect. File(/usr/local/bin/php) is not within the allowed path(s): (/var/www/vhosts/lchcloud.de/:/tmp/)','vendor/whmcs/whmcs-foundation/lib/Environment/Php.php',0,NULL,'2022-02-19 05:02:03','2022-02-19 05:02:03'),(5,'warning',NULL,'file_exists(): open_basedir restriction in effect. File(/usr/local/cpanel) is not within the allowed path(s): (/var/www/vhosts/lchcloud.de/:/tmp/)','vendor/whmcs/whmcs-foundation/lib/Environment/WebServer.php',0,NULL,'2022-02-19 05:02:25','2022-02-19 05:02:25'),(6,'warning',NULL,'file_exists(): open_basedir restriction in effect. File(/usr/local/psa) is not within the allowed path(s): (/var/www/vhosts/lchcloud.de/:/tmp/)','vendor/whmcs/whmcs-foundation/lib/Environment/WebServer.php',0,NULL,'2022-02-19 05:02:25','2022-02-19 05:02:25'),(7,'warning',NULL,'file_exists(): open_basedir restriction in effect. File(/usr/local/directadmin) is not within the allowed path(s): (/var/www/vhosts/lchcloud.de/:/tmp/)','vendor/whmcs/whmcs-foundation/lib/Environment/WebServer.php',0,NULL,'2022-02-19 05:02:25','2022-02-19 05:02:25'),(8,'warning',NULL,'file_exists(): open_basedir restriction in effect. File(/usr/local/cpanel) is not within the allowed path(s): (/var/www/vhosts/lchcloud.de/:/tmp/)','vendor/whmcs/whmcs-foundation/lib/Environment/WebServer.php',0,NULL,'2022-02-19 05:02:25','2022-02-19 05:02:25'),(9,'warning',NULL,'file_exists(): open_basedir restriction in effect. File(/usr/local/psa) is not within the allowed path(s): (/var/www/vhosts/lchcloud.de/:/tmp/)','vendor/whmcs/whmcs-foundation/lib/Environment/WebServer.php',0,NULL,'2022-02-19 05:02:25','2022-02-19 05:02:25'),(10,'warning',NULL,'file_exists(): open_basedir restriction in effect. File(/usr/local/directadmin) is not within the allowed path(s): (/var/www/vhosts/lchcloud.de/:/tmp/)','vendor/whmcs/whmcs-foundation/lib/Environment/WebServer.php',0,NULL,'2022-02-19 05:02:25','2022-02-19 05:02:25'),(11,'warning',NULL,'is_writable(): open_basedir restriction in effect. File(/var/lib/php/sessions) is not within the allowed path(s): (/var/www/vhosts/lchcloud.de/:/tmp/)','vendor/whmcs/whmcs-foundation/lib/Environment/Php.php',0,NULL,'2022-02-19 05:02:33','2022-02-19 05:02:33'),(12,'warning',NULL,'is_file(): open_basedir restriction in effect. File(/var/www/vhosts/lchcloud.de/scp.lchcloud.de/modules/servers/index.php/index.php.php) is not within the allowed path(s): (/var/www/vhosts/lchcloud.de/:/tmp/)','vendor/whmcs/whmcs-foundation/lib/Module/AbstractModule.php',0,NULL,'2022-02-19 05:02:34','2022-02-19 05:02:34'),(13,'warning',NULL,'is_file(): open_basedir restriction in effect. File(/var/www/vhosts/lchcloud.de/scp.lchcloud.de/modules/servers/index.php/index.php.php) is not within the allowed path(s): (/var/www/vhosts/lchcloud.de/:/tmp/)','vendor/whmcs/whmcs-foundation/lib/Module/AbstractModule.php',0,NULL,'2022-02-19 05:03:45','2022-02-19 05:03:45');
/*!40000 ALTER TABLE `tblerrorlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblfileassetmigrationprogress`
--

DROP TABLE IF EXISTS `tblfileassetmigrationprogress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblfileassetmigrationprogress` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `asset_type` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `migrated_objects` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `num_objects_migrated` int(10) unsigned DEFAULT 0,
  `num_objects_total` int(10) unsigned DEFAULT 0,
  `active` tinyint(1) unsigned DEFAULT 1,
  `num_failures` int(10) unsigned DEFAULT 0,
  `last_failure_reason` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `asset_type` (`asset_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblfileassetmigrationprogress`
--

LOCK TABLES `tblfileassetmigrationprogress` WRITE;
/*!40000 ALTER TABLE `tblfileassetmigrationprogress` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblfileassetmigrationprogress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblfileassetsettings`
--

DROP TABLE IF EXISTS `tblfileassetsettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblfileassetsettings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `asset_type` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `storageconfiguration_id` int(10) unsigned NOT NULL,
  `migratetoconfiguration_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `asset_type` (`asset_type`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblfileassetsettings`
--

LOCK TABLES `tblfileassetsettings` WRITE;
/*!40000 ALTER TABLE `tblfileassetsettings` DISABLE KEYS */;
INSERT INTO `tblfileassetsettings` VALUES (1,'client_files',2,NULL,'2022-02-19 05:02:03','2022-02-19 05:02:03'),(2,'downloads',1,NULL,'2022-02-19 05:02:03','2022-02-19 05:02:03'),(3,'email_attachments',2,NULL,'2022-02-19 05:02:03','2022-02-19 05:02:03'),(4,'email_images',1,NULL,'2022-02-19 05:02:03','2022-02-19 05:02:03'),(5,'email_template_attachments',1,NULL,'2022-02-19 05:02:03','2022-02-19 05:02:03'),(6,'kb_images',2,NULL,'2022-02-19 05:02:03','2022-02-19 05:02:03'),(7,'pm_files',3,NULL,'2022-02-19 05:02:03','2022-02-19 05:02:03'),(8,'ticket_attachments',2,NULL,'2022-02-19 05:02:03','2022-02-19 05:02:03');
/*!40000 ALTER TABLE `tblfileassetsettings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblfraud`
--

DROP TABLE IF EXISTS `tblfraud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblfraud` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `fraud` text COLLATE utf8_unicode_ci NOT NULL,
  `setting` text COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fraud` (`fraud`(32))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblfraud`
--

LOCK TABLES `tblfraud` WRITE;
/*!40000 ALTER TABLE `tblfraud` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblfraud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblgatewaylog`
--

DROP TABLE IF EXISTS `tblgatewaylog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblgatewaylog` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gateway` text COLLATE utf8_unicode_ci NOT NULL,
  `data` text COLLATE utf8_unicode_ci NOT NULL,
  `transaction_history_id` int(10) unsigned NOT NULL DEFAULT 0,
  `result` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblgatewaylog`
--

LOCK TABLES `tblgatewaylog` WRITE;
/*!40000 ALTER TABLE `tblgatewaylog` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblgatewaylog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblhosting`
--

DROP TABLE IF EXISTS `tblhosting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblhosting` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `userid` int(10) NOT NULL,
  `orderid` int(10) NOT NULL,
  `packageid` int(10) NOT NULL,
  `server` int(10) NOT NULL,
  `regdate` date NOT NULL,
  `domain` text COLLATE utf8_unicode_ci NOT NULL,
  `paymentmethod` text COLLATE utf8_unicode_ci NOT NULL,
  `qty` int(10) unsigned NOT NULL DEFAULT 1,
  `firstpaymentamount` decimal(16,2) NOT NULL DEFAULT 0.00,
  `amount` decimal(16,2) NOT NULL DEFAULT 0.00,
  `billingcycle` text COLLATE utf8_unicode_ci NOT NULL,
  `nextduedate` date DEFAULT NULL,
  `nextinvoicedate` date NOT NULL,
  `termination_date` date NOT NULL DEFAULT '0000-00-00',
  `completed_date` date NOT NULL DEFAULT '0000-00-00',
  `domainstatus` enum('Pending','Active','Suspended','Terminated','Cancelled','Fraud','Completed') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Pending',
  `username` text COLLATE utf8_unicode_ci NOT NULL,
  `password` text COLLATE utf8_unicode_ci NOT NULL,
  `notes` text COLLATE utf8_unicode_ci NOT NULL,
  `subscriptionid` text COLLATE utf8_unicode_ci NOT NULL,
  `promoid` int(10) NOT NULL,
  `promocount` int(10) DEFAULT 0,
  `suspendreason` text COLLATE utf8_unicode_ci NOT NULL,
  `overideautosuspend` tinyint(1) NOT NULL,
  `overidesuspenduntil` date NOT NULL,
  `dedicatedip` text COLLATE utf8_unicode_ci NOT NULL,
  `assignedips` text COLLATE utf8_unicode_ci NOT NULL,
  `ns1` text COLLATE utf8_unicode_ci NOT NULL,
  `ns2` text COLLATE utf8_unicode_ci NOT NULL,
  `diskusage` int(10) NOT NULL DEFAULT 0,
  `disklimit` int(10) NOT NULL DEFAULT 0,
  `bwusage` int(10) NOT NULL DEFAULT 0,
  `bwlimit` int(10) NOT NULL DEFAULT 0,
  `lastupdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `serviceid` (`id`),
  KEY `userid` (`userid`),
  KEY `orderid` (`orderid`),
  KEY `productid` (`packageid`),
  KEY `serverid` (`server`),
  KEY `domain` (`domain`(64)),
  KEY `domainstatus` (`domainstatus`),
  KEY `username` (`username`(8))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblhosting`
--

LOCK TABLES `tblhosting` WRITE;
/*!40000 ALTER TABLE `tblhosting` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblhosting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblhostingaddons`
--

DROP TABLE IF EXISTS `tblhostingaddons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblhostingaddons` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `orderid` int(10) NOT NULL,
  `hostingid` int(10) NOT NULL,
  `addonid` int(10) NOT NULL,
  `userid` int(10) NOT NULL DEFAULT 0,
  `server` int(10) NOT NULL DEFAULT 0,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `qty` int(10) unsigned NOT NULL DEFAULT 1,
  `firstpaymentamount` decimal(16,2) NOT NULL DEFAULT 0.00,
  `setupfee` decimal(16,2) NOT NULL DEFAULT 0.00,
  `recurring` decimal(16,2) NOT NULL DEFAULT 0.00,
  `billingcycle` text COLLATE utf8_unicode_ci NOT NULL,
  `tax` text COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('Pending','Active','Suspended','Terminated','Cancelled','Fraud','Completed') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Pending',
  `regdate` date NOT NULL DEFAULT '0000-00-00',
  `nextduedate` date DEFAULT NULL,
  `nextinvoicedate` date NOT NULL,
  `termination_date` date NOT NULL DEFAULT '0000-00-00',
  `proratadate` date NOT NULL DEFAULT '0000-00-00',
  `paymentmethod` text COLLATE utf8_unicode_ci NOT NULL,
  `notes` text COLLATE utf8_unicode_ci NOT NULL,
  `subscriptionid` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `orderid` (`orderid`),
  KEY `serviceid` (`hostingid`),
  KEY `name` (`name`(32)),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblhostingaddons`
--

LOCK TABLES `tblhostingaddons` WRITE;
/*!40000 ALTER TABLE `tblhostingaddons` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblhostingaddons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblhostingconfigoptions`
--

DROP TABLE IF EXISTS `tblhostingconfigoptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblhostingconfigoptions` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `relid` int(10) NOT NULL,
  `configid` int(10) NOT NULL,
  `optionid` int(10) NOT NULL,
  `qty` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `relid_configid` (`relid`,`configid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblhostingconfigoptions`
--

LOCK TABLES `tblhostingconfigoptions` WRITE;
/*!40000 ALTER TABLE `tblhostingconfigoptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblhostingconfigoptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblinvoicedata`
--

DROP TABLE IF EXISTS `tblinvoicedata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblinvoicedata` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `invoice_id` int(10) unsigned NOT NULL DEFAULT 0,
  `country` varchar(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `tblinvoicedata_invoice_id_unique` (`invoice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblinvoicedata`
--

LOCK TABLES `tblinvoicedata` WRITE;
/*!40000 ALTER TABLE `tblinvoicedata` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblinvoicedata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblinvoiceitems`
--

DROP TABLE IF EXISTS `tblinvoiceitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblinvoiceitems` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `invoiceid` int(10) NOT NULL DEFAULT 0,
  `userid` int(10) NOT NULL,
  `type` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `relid` int(10) NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `amount` decimal(16,2) NOT NULL DEFAULT 0.00,
  `taxed` int(1) NOT NULL,
  `duedate` date DEFAULT NULL,
  `paymentmethod` text COLLATE utf8_unicode_ci NOT NULL,
  `notes` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `invoiceid` (`invoiceid`),
  KEY `userid` (`userid`,`type`,`relid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblinvoiceitems`
--

LOCK TABLES `tblinvoiceitems` WRITE;
/*!40000 ALTER TABLE `tblinvoiceitems` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblinvoiceitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblinvoices`
--

DROP TABLE IF EXISTS `tblinvoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblinvoices` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `userid` int(10) NOT NULL,
  `invoicenum` text COLLATE utf8_unicode_ci NOT NULL,
  `date` date DEFAULT NULL,
  `duedate` date DEFAULT NULL,
  `datepaid` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_capture_attempt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_refunded` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_cancelled` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `subtotal` decimal(16,2) NOT NULL,
  `credit` decimal(16,2) NOT NULL,
  `tax` decimal(16,2) NOT NULL,
  `tax2` decimal(16,2) NOT NULL,
  `total` decimal(16,2) NOT NULL DEFAULT 0.00,
  `taxrate` decimal(10,3) NOT NULL DEFAULT 0.000,
  `taxrate2` decimal(10,3) NOT NULL DEFAULT 0.000,
  `status` text COLLATE utf8_unicode_ci NOT NULL,
  `paymentmethod` text COLLATE utf8_unicode_ci NOT NULL,
  `paymethodid` int(10) unsigned DEFAULT NULL,
  `notes` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `status` (`status`(3))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblinvoices`
--

LOCK TABLES `tblinvoices` WRITE;
/*!40000 ALTER TABLE `tblinvoices` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblinvoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblioncube_file_log`
--

DROP TABLE IF EXISTS `tblioncube_file_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblioncube_file_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `filename` text COLLATE utf8_unicode_ci NOT NULL,
  `content_hash` varchar(512) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `encoder_version` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `bundled_php_versions` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `loaded_in_php` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `target_php_version` char(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblioncube_file_log`
--

LOCK TABLES `tblioncube_file_log` WRITE;
/*!40000 ALTER TABLE `tblioncube_file_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblioncube_file_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbljobs_queue`
--

DROP TABLE IF EXISTS `tbljobs_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbljobs_queue` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `class_name` varchar(255) NOT NULL DEFAULT '',
  `method_name` varchar(255) NOT NULL DEFAULT '',
  `input_parameters` text NOT NULL,
  `available_at` datetime NOT NULL,
  `started_at` datetime DEFAULT NULL,
  `digest_hash` varchar(255) NOT NULL DEFAULT '',
  `async` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbljobs_queue`
--

LOCK TABLES `tbljobs_queue` WRITE;
/*!40000 ALTER TABLE `tbljobs_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbljobs_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblknowledgebase`
--

DROP TABLE IF EXISTS `tblknowledgebase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblknowledgebase` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `article` text COLLATE utf8_unicode_ci NOT NULL,
  `views` int(10) NOT NULL DEFAULT 0,
  `useful` int(10) NOT NULL DEFAULT 0,
  `votes` int(10) NOT NULL DEFAULT 0,
  `private` text COLLATE utf8_unicode_ci NOT NULL,
  `order` int(3) NOT NULL,
  `parentid` int(10) NOT NULL,
  `language` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblknowledgebase`
--

LOCK TABLES `tblknowledgebase` WRITE;
/*!40000 ALTER TABLE `tblknowledgebase` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblknowledgebase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblknowledgebase_images`
--

DROP TABLE IF EXISTS `tblknowledgebase_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblknowledgebase_images` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `filename` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `original_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblknowledgebase_images`
--

LOCK TABLES `tblknowledgebase_images` WRITE;
/*!40000 ALTER TABLE `tblknowledgebase_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblknowledgebase_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblknowledgebasecats`
--

DROP TABLE IF EXISTS `tblknowledgebasecats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblknowledgebasecats` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `parentid` int(10) NOT NULL DEFAULT 0,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `hidden` text COLLATE utf8_unicode_ci NOT NULL,
  `catid` int(10) NOT NULL,
  `language` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `parentid` (`parentid`),
  KEY `name` (`name`(64))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblknowledgebasecats`
--

LOCK TABLES `tblknowledgebasecats` WRITE;
/*!40000 ALTER TABLE `tblknowledgebasecats` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblknowledgebasecats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblknowledgebaselinks`
--

DROP TABLE IF EXISTS `tblknowledgebaselinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblknowledgebaselinks` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `categoryid` int(10) NOT NULL,
  `articleid` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblknowledgebaselinks`
--

LOCK TABLES `tblknowledgebaselinks` WRITE;
/*!40000 ALTER TABLE `tblknowledgebaselinks` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblknowledgebaselinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblknowledgebasetags`
--

DROP TABLE IF EXISTS `tblknowledgebasetags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblknowledgebasetags` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `articleid` int(10) NOT NULL,
  `tag` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblknowledgebasetags`
--

LOCK TABLES `tblknowledgebasetags` WRITE;
/*!40000 ALTER TABLE `tblknowledgebasetags` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblknowledgebasetags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbllinks`
--

DROP TABLE IF EXISTS `tbllinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbllinks` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `link` text COLLATE utf8_unicode_ci NOT NULL,
  `clicks` int(10) NOT NULL,
  `conversions` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`(64))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbllinks`
--

LOCK TABLES `tbllinks` WRITE;
/*!40000 ALTER TABLE `tbllinks` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbllinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbllog_register`
--

DROP TABLE IF EXISTS `tbllog_register`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbllog_register` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `namespace_id` int(10) unsigned DEFAULT NULL,
  `namespace` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `namespace_value` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `tbllog_register_namespace_id_index` (`namespace_id`),
  KEY `tbllog_register_namespace_index` (`namespace`(32)),
  KEY `tbllog_register_created_at_index` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbllog_register`
--

LOCK TABLES `tbllog_register` WRITE;
/*!40000 ALTER TABLE `tbllog_register` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbllog_register` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblmarketconnect_services`
--

DROP TABLE IF EXISTS `tblmarketconnect_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblmarketconnect_services` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `product_ids` text NOT NULL,
  `settings` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblmarketconnect_services`
--

LOCK TABLES `tblmarketconnect_services` WRITE;
/*!40000 ALTER TABLE `tblmarketconnect_services` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblmarketconnect_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblmarketing_consent`
--

DROP TABLE IF EXISTS `tblmarketing_consent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblmarketing_consent` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(10) unsigned NOT NULL DEFAULT 0,
  `opt_in` tinyint(1) NOT NULL DEFAULT 0,
  `admin` tinyint(1) NOT NULL DEFAULT 0,
  `ip_address` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblmarketing_consent`
--

LOCK TABLES `tblmarketing_consent` WRITE;
/*!40000 ALTER TABLE `tblmarketing_consent` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblmarketing_consent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblmetric_usage`
--

DROP TABLE IF EXISTS `tblmetric_usage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblmetric_usage` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rel_type` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `rel_id` int(10) NOT NULL DEFAULT 0,
  `module_type` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `module` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `metric` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `tblmetric_usage_rel_type_id` (`rel_type`,`rel_id`),
  KEY `tblmetric_usage_module_type` (`module_type`),
  KEY `tblmetric_usage_module` (`module`),
  KEY `tblmetric_usage_metric` (`metric`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblmetric_usage`
--

LOCK TABLES `tblmetric_usage` WRITE;
/*!40000 ALTER TABLE `tblmetric_usage` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblmetric_usage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblmodule_configuration`
--

DROP TABLE IF EXISTS `tblmodule_configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblmodule_configuration` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_type` varchar(8) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `entity_id` int(10) unsigned NOT NULL DEFAULT 0,
  `setting_name` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `friendly_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_constraint` (`entity_type`,`entity_id`,`setting_name`),
  KEY `tblmodule_configuration_entity_type_index` (`entity_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblmodule_configuration`
--

LOCK TABLES `tblmodule_configuration` WRITE;
/*!40000 ALTER TABLE `tblmodule_configuration` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblmodule_configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblmodulelog`
--

DROP TABLE IF EXISTS `tblmodulelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblmodulelog` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `module` text COLLATE utf8_unicode_ci NOT NULL,
  `action` text COLLATE utf8_unicode_ci NOT NULL,
  `request` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `response` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `arrdata` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblmodulelog`
--

LOCK TABLES `tblmodulelog` WRITE;
/*!40000 ALTER TABLE `tblmodulelog` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblmodulelog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblmodulequeue`
--

DROP TABLE IF EXISTS `tblmodulequeue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblmodulequeue` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `service_type` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `service_id` int(10) unsigned NOT NULL DEFAULT 0,
  `module_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `module_action` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `last_attempt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_attempt_error` text COLLATE utf8_unicode_ci NOT NULL,
  `num_retries` smallint(5) unsigned NOT NULL DEFAULT 0,
  `completed` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblmodulequeue`
--

LOCK TABLES `tblmodulequeue` WRITE;
/*!40000 ALTER TABLE `tblmodulequeue` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblmodulequeue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblnetworkissues`
--

DROP TABLE IF EXISTS `tblnetworkissues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblnetworkissues` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `type` enum('Server','System','Other') COLLATE utf8_unicode_ci NOT NULL,
  `affecting` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `server` int(10) unsigned DEFAULT NULL,
  `priority` enum('Critical','Low','Medium','High') COLLATE utf8_unicode_ci NOT NULL,
  `startdate` datetime NOT NULL,
  `enddate` datetime DEFAULT NULL,
  `status` enum('Reported','Investigating','In Progress','Outage','Scheduled','Resolved') COLLATE utf8_unicode_ci NOT NULL,
  `lastupdate` datetime NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblnetworkissues`
--

LOCK TABLES `tblnetworkissues` WRITE;
/*!40000 ALTER TABLE `tblnetworkissues` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblnetworkissues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblnotes`
--

DROP TABLE IF EXISTS `tblnotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblnotes` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `userid` int(10) NOT NULL,
  `adminid` int(10) NOT NULL DEFAULT 0,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `note` text COLLATE utf8_unicode_ci NOT NULL,
  `sticky` int(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblnotes`
--

LOCK TABLES `tblnotes` WRITE;
/*!40000 ALTER TABLE `tblnotes` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblnotes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblnotificationproviders`
--

DROP TABLE IF EXISTS `tblnotificationproviders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblnotificationproviders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `settings` text COLLATE utf8_unicode_ci NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblnotificationproviders`
--

LOCK TABLES `tblnotificationproviders` WRITE;
/*!40000 ALTER TABLE `tblnotificationproviders` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblnotificationproviders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblnotificationrules`
--

DROP TABLE IF EXISTS `tblnotificationrules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblnotificationrules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `event_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `events` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `conditions` text COLLATE utf8_unicode_ci NOT NULL,
  `provider` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `provider_config` text COLLATE utf8_unicode_ci NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 0,
  `can_delete` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblnotificationrules`
--

LOCK TABLES `tblnotificationrules` WRITE;
/*!40000 ALTER TABLE `tblnotificationrules` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblnotificationrules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbloauthserver_access_token_scopes`
--

DROP TABLE IF EXISTS `tbloauthserver_access_token_scopes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbloauthserver_access_token_scopes` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `access_token_id` int(10) unsigned NOT NULL DEFAULT 0,
  `scope_id` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `tbloauthserver_access_token_scopes_scope_id_index` (`access_token_id`,`scope_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbloauthserver_access_token_scopes`
--

LOCK TABLES `tbloauthserver_access_token_scopes` WRITE;
/*!40000 ALTER TABLE `tbloauthserver_access_token_scopes` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbloauthserver_access_token_scopes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbloauthserver_access_tokens`
--

DROP TABLE IF EXISTS `tbloauthserver_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbloauthserver_access_tokens` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `access_token` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `client_id` varchar(80) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `user_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `redirect_uri` varchar(2000) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `expires` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `tbloauthserver_access_tokens_access_token_unique` (`access_token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbloauthserver_access_tokens`
--

LOCK TABLES `tbloauthserver_access_tokens` WRITE;
/*!40000 ALTER TABLE `tbloauthserver_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbloauthserver_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbloauthserver_auth_codes`
--

DROP TABLE IF EXISTS `tbloauthserver_auth_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbloauthserver_auth_codes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `authorization_code` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `client_id` varchar(80) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `user_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `redirect_uri` varchar(2000) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `id_token` varchar(2000) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `expires` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `tbloauthserver_auth_codes_authorization_code_unique` (`authorization_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbloauthserver_auth_codes`
--

LOCK TABLES `tbloauthserver_auth_codes` WRITE;
/*!40000 ALTER TABLE `tbloauthserver_auth_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbloauthserver_auth_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbloauthserver_authcode_scopes`
--

DROP TABLE IF EXISTS `tbloauthserver_authcode_scopes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbloauthserver_authcode_scopes` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `authorization_code_id` int(10) unsigned NOT NULL DEFAULT 0,
  `scope_id` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `tbloauthserver_authcode_scopes_scope_id_index` (`authorization_code_id`,`scope_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbloauthserver_authcode_scopes`
--

LOCK TABLES `tbloauthserver_authcode_scopes` WRITE;
/*!40000 ALTER TABLE `tbloauthserver_authcode_scopes` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbloauthserver_authcode_scopes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbloauthserver_client_scopes`
--

DROP TABLE IF EXISTS `tbloauthserver_client_scopes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbloauthserver_client_scopes` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `client_id` int(10) unsigned NOT NULL DEFAULT 0,
  `scope_id` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `tbloauthserver_client_scopes_scope_id_index` (`client_id`,`scope_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbloauthserver_client_scopes`
--

LOCK TABLES `tbloauthserver_client_scopes` WRITE;
/*!40000 ALTER TABLE `tbloauthserver_client_scopes` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbloauthserver_client_scopes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbloauthserver_clients`
--

DROP TABLE IF EXISTS `tbloauthserver_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbloauthserver_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `secret` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `redirect_uri` varchar(2000) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `grant_types` varchar(80) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `user_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `service_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `logo_uri` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `rsa_key_pair_id` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `tbloauthserver_clients_identifier_unique` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbloauthserver_clients`
--

LOCK TABLES `tbloauthserver_clients` WRITE;
/*!40000 ALTER TABLE `tbloauthserver_clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbloauthserver_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbloauthserver_scopes`
--

DROP TABLE IF EXISTS `tbloauthserver_scopes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbloauthserver_scopes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `scope` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `is_default` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `tbloauthserver_scopes_scope_unique` (`scope`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbloauthserver_scopes`
--

LOCK TABLES `tbloauthserver_scopes` WRITE;
/*!40000 ALTER TABLE `tbloauthserver_scopes` DISABLE KEYS */;
INSERT INTO `tbloauthserver_scopes` VALUES (1,'clientarea:sso','Single Sign-on for Client Area',1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2,'clientarea:profile','Account Profile',0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(3,'clientarea:billing_info','Manage Billing Information',0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(4,'clientarea:emails','Email History',0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(5,'clientarea:announcements','Announcements',0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(6,'clientarea:downloads','Downloads',0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(7,'clientarea:knowledgebase','Knowledgebase',0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(8,'clientarea:network_status','Network Status',0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(9,'clientarea:services','Products/Services',0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(10,'clientarea:product_details','Product Info/Details (requires associated serviceId)',0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(11,'clientarea:domains','Domains',0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(12,'clientarea:domain_details','Domain Info/Details (requires associated domainId)',0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(13,'clientarea:invoices','Invoices',0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(14,'clientarea:tickets','Support Tickets',0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(15,'clientarea:submit_ticket','Submit New Ticket',0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(16,'clientarea:shopping_cart','Shopping Cart Default Product Group',0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(17,'clientarea:shopping_cart_addons','Shopping Cart Product Addons',0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(18,'clientarea:shopping_cart_domain_register','Shopping Cart Register New Domain',0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(19,'clientarea:shopping_cart_domain_transfer','Shopping Cart Transfer Existing Domain',0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(20,'openid','Scope required for OpenID Connect ID tokens',0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(21,'email','Scope used for Email Claim',0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(22,'profile','Scope used for Profile Claim',0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(23,'clientarea:upgrade','Upgrade/Downgrade',0,'2018-04-18 10:21:42','2018-04-18 10:21:42'),(24,'sso:custom_redirect','Scope required for arbitrary path redirect on token creation',0,'0000-00-00 00:00:00','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `tbloauthserver_scopes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbloauthserver_user_authz`
--

DROP TABLE IF EXISTS `tbloauthserver_user_authz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbloauthserver_user_authz` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `client_id` int(10) unsigned NOT NULL DEFAULT 0,
  `expires` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbloauthserver_user_authz`
--

LOCK TABLES `tbloauthserver_user_authz` WRITE;
/*!40000 ALTER TABLE `tbloauthserver_user_authz` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbloauthserver_user_authz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbloauthserver_user_authz_scopes`
--

DROP TABLE IF EXISTS `tbloauthserver_user_authz_scopes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbloauthserver_user_authz_scopes` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_authz_id` int(10) unsigned NOT NULL DEFAULT 0,
  `scope_id` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `tbloauthserver_user_authz_scopes_scope_id_index` (`user_authz_id`,`scope_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbloauthserver_user_authz_scopes`
--

LOCK TABLES `tbloauthserver_user_authz_scopes` WRITE;
/*!40000 ALTER TABLE `tbloauthserver_user_authz_scopes` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbloauthserver_user_authz_scopes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblorders`
--

DROP TABLE IF EXISTS `tblorders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblorders` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `ordernum` bigint(10) NOT NULL,
  `userid` int(10) NOT NULL,
  `contactid` int(10) NOT NULL,
  `requestor_id` int(10) unsigned NOT NULL DEFAULT 0,
  `admin_requestor_id` int(10) unsigned NOT NULL DEFAULT 0,
  `date` datetime NOT NULL,
  `nameservers` text COLLATE utf8_unicode_ci NOT NULL,
  `transfersecret` text COLLATE utf8_unicode_ci NOT NULL,
  `renewals` text COLLATE utf8_unicode_ci NOT NULL,
  `promocode` text COLLATE utf8_unicode_ci NOT NULL,
  `promotype` text COLLATE utf8_unicode_ci NOT NULL,
  `promovalue` text COLLATE utf8_unicode_ci NOT NULL,
  `orderdata` text COLLATE utf8_unicode_ci NOT NULL,
  `amount` decimal(16,2) NOT NULL,
  `paymentmethod` text COLLATE utf8_unicode_ci NOT NULL,
  `invoiceid` int(10) NOT NULL DEFAULT 0,
  `status` text COLLATE utf8_unicode_ci NOT NULL,
  `ipaddress` text COLLATE utf8_unicode_ci NOT NULL,
  `fraudmodule` text COLLATE utf8_unicode_ci NOT NULL,
  `fraudoutput` text COLLATE utf8_unicode_ci NOT NULL,
  `notes` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ordernum` (`ordernum`),
  KEY `userid` (`userid`),
  KEY `contactid` (`contactid`),
  KEY `date` (`date`),
  KEY `requestor_id` (`requestor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblorders`
--

LOCK TABLES `tblorders` WRITE;
/*!40000 ALTER TABLE `tblorders` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblorders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblorderstatuses`
--

DROP TABLE IF EXISTS `tblorderstatuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblorderstatuses` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `color` text COLLATE utf8_unicode_ci NOT NULL,
  `showpending` int(1) NOT NULL,
  `showactive` int(1) NOT NULL,
  `showcancelled` int(1) NOT NULL,
  `sortorder` int(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblorderstatuses`
--

LOCK TABLES `tblorderstatuses` WRITE;
/*!40000 ALTER TABLE `tblorderstatuses` DISABLE KEYS */;
INSERT INTO `tblorderstatuses` VALUES (1,'Pending','#cc0000',1,0,0,10),(2,'Active','#779500',0,1,0,20),(3,'Cancelled','#888888',0,0,1,30),(4,'Fraud','#000000',0,0,0,40);
/*!40000 ALTER TABLE `tblorderstatuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblpaymentgateways`
--

DROP TABLE IF EXISTS `tblpaymentgateways`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblpaymentgateways` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `gateway` text COLLATE utf8_unicode_ci NOT NULL,
  `setting` text COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  `order` int(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `gateway_setting` (`gateway`(32),`setting`(32)),
  KEY `setting_value` (`setting`(32),`value`(32))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblpaymentgateways`
--

LOCK TABLES `tblpaymentgateways` WRITE;
/*!40000 ALTER TABLE `tblpaymentgateways` DISABLE KEYS */;
INSERT INTO `tblpaymentgateways` VALUES (1,'paypal','forcesubscriptions','',0),(2,'paypal','forceonetime','',0);
/*!40000 ALTER TABLE `tblpaymentgateways` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblpaymentgateways_product_mapping`
--

DROP TABLE IF EXISTS `tblpaymentgateways_product_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblpaymentgateways_product_mapping` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `gateway` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `account_identifier` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `product_identifier` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `remote_identifier` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblpaymentgateways_product_mapping`
--

LOCK TABLES `tblpaymentgateways_product_mapping` WRITE;
/*!40000 ALTER TABLE `tblpaymentgateways_product_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblpaymentgateways_product_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblpaymethods`
--

DROP TABLE IF EXISTS `tblpaymethods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblpaymethods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL DEFAULT 0,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `contact_id` int(11) NOT NULL DEFAULT 0,
  `contact_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `payment_id` int(11) NOT NULL DEFAULT 0,
  `payment_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `gateway_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `order_preference` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tblpaymethods_userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblpaymethods`
--

LOCK TABLES `tblpaymethods` WRITE;
/*!40000 ALTER TABLE `tblpaymethods` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblpaymethods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblpricing`
--

DROP TABLE IF EXISTS `tblpricing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblpricing` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type` enum('product','addon','configoptions','domainregister','domaintransfer','domainrenew','domainaddons','usage') COLLATE utf8_unicode_ci NOT NULL,
  `currency` int(10) NOT NULL,
  `relid` int(10) NOT NULL,
  `msetupfee` decimal(16,2) NOT NULL,
  `qsetupfee` decimal(16,2) NOT NULL,
  `ssetupfee` decimal(16,2) NOT NULL,
  `asetupfee` decimal(16,2) NOT NULL,
  `bsetupfee` decimal(16,2) NOT NULL,
  `tsetupfee` decimal(16,2) NOT NULL,
  `monthly` decimal(16,2) NOT NULL,
  `quarterly` decimal(16,2) NOT NULL,
  `semiannually` decimal(16,2) NOT NULL,
  `annually` decimal(16,2) NOT NULL,
  `biennially` decimal(16,2) NOT NULL,
  `triennially` decimal(16,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pricing_relid_idx` (`relid`),
  KEY `pricing_currency_idx` (`currency`),
  KEY `pricing_type_idx` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblpricing`
--

LOCK TABLES `tblpricing` WRITE;
/*!40000 ALTER TABLE `tblpricing` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblpricing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblpricing_bracket`
--

DROP TABLE IF EXISTS `tblpricing_bracket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblpricing_bracket` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `floor` decimal(19,6) NOT NULL DEFAULT 0.000000,
  `ceiling` decimal(19,6) NOT NULL DEFAULT 0.000000,
  `rel_type` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `rel_id` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `schema_type` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'flat',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblpricing_bracket`
--

LOCK TABLES `tblpricing_bracket` WRITE;
/*!40000 ALTER TABLE `tblpricing_bracket` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblpricing_bracket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblproduct_downloads`
--

DROP TABLE IF EXISTS `tblproduct_downloads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblproduct_downloads` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) NOT NULL,
  `download_id` int(10) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `tblproduct_downloads_product_id_index` (`product_id`),
  KEY `tblproduct_downloads_download_id_index` (`download_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblproduct_downloads`
--

LOCK TABLES `tblproduct_downloads` WRITE;
/*!40000 ALTER TABLE `tblproduct_downloads` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblproduct_downloads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblproduct_group_features`
--

DROP TABLE IF EXISTS `tblproduct_group_features`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblproduct_group_features` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_group_id` int(10) NOT NULL,
  `feature` text COLLATE utf8_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `tblproduct_group_features_product_group_id_index` (`product_group_id`),
  KEY `tblproduct_group_features_id_product_group_id_index` (`id`,`product_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblproduct_group_features`
--

LOCK TABLES `tblproduct_group_features` WRITE;
/*!40000 ALTER TABLE `tblproduct_group_features` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblproduct_group_features` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblproduct_upgrade_products`
--

DROP TABLE IF EXISTS `tblproduct_upgrade_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblproduct_upgrade_products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) NOT NULL,
  `upgrade_product_id` int(10) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `tblproduct_upgrade_products_product_id_index` (`product_id`),
  KEY `tblproduct_upgrade_products_upgrade_product_id_index` (`upgrade_product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblproduct_upgrade_products`
--

LOCK TABLES `tblproduct_upgrade_products` WRITE;
/*!40000 ALTER TABLE `tblproduct_upgrade_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblproduct_upgrade_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblproductconfiggroups`
--

DROP TABLE IF EXISTS `tblproductconfiggroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblproductconfiggroups` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblproductconfiggroups`
--

LOCK TABLES `tblproductconfiggroups` WRITE;
/*!40000 ALTER TABLE `tblproductconfiggroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblproductconfiggroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblproductconfiglinks`
--

DROP TABLE IF EXISTS `tblproductconfiglinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblproductconfiglinks` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `gid` int(10) NOT NULL,
  `pid` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblproductconfiglinks`
--

LOCK TABLES `tblproductconfiglinks` WRITE;
/*!40000 ALTER TABLE `tblproductconfiglinks` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblproductconfiglinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblproductconfigoptions`
--

DROP TABLE IF EXISTS `tblproductconfigoptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblproductconfigoptions` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `gid` int(10) NOT NULL DEFAULT 0,
  `optionname` text COLLATE utf8_unicode_ci NOT NULL,
  `optiontype` text COLLATE utf8_unicode_ci NOT NULL,
  `qtyminimum` int(10) NOT NULL,
  `qtymaximum` int(10) NOT NULL,
  `order` int(1) NOT NULL DEFAULT 0,
  `hidden` int(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `productid` (`gid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblproductconfigoptions`
--

LOCK TABLES `tblproductconfigoptions` WRITE;
/*!40000 ALTER TABLE `tblproductconfigoptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblproductconfigoptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblproductconfigoptionssub`
--

DROP TABLE IF EXISTS `tblproductconfigoptionssub`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblproductconfigoptionssub` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `configid` int(10) NOT NULL,
  `optionname` text COLLATE utf8_unicode_ci NOT NULL,
  `sortorder` int(10) NOT NULL DEFAULT 0,
  `hidden` int(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `configid` (`configid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblproductconfigoptionssub`
--

LOCK TABLES `tblproductconfigoptionssub` WRITE;
/*!40000 ALTER TABLE `tblproductconfigoptionssub` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblproductconfigoptionssub` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblproducteventactions`
--

DROP TABLE IF EXISTS `tblproducteventactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblproducteventactions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_type` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `entity_id` int(11) NOT NULL,
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `event_name` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `action` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `params` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblproducteventactions`
--

LOCK TABLES `tblproducteventactions` WRITE;
/*!40000 ALTER TABLE `tblproducteventactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblproducteventactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblproductgroups`
--

DROP TABLE IF EXISTS `tblproductgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblproductgroups` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `headline` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `tagline` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `orderfrmtpl` text COLLATE utf8_unicode_ci NOT NULL,
  `disabledgateways` text COLLATE utf8_unicode_ci NOT NULL,
  `hidden` tinyint(1) NOT NULL,
  `order` int(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `order` (`order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblproductgroups`
--

LOCK TABLES `tblproductgroups` WRITE;
/*!40000 ALTER TABLE `tblproductgroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblproductgroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblproducts`
--

DROP TABLE IF EXISTS `tblproducts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblproducts` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type` text COLLATE utf8_unicode_ci NOT NULL,
  `gid` int(10) NOT NULL,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `hidden` tinyint(1) NOT NULL,
  `showdomainoptions` tinyint(1) NOT NULL,
  `welcomeemail` int(10) NOT NULL DEFAULT 0,
  `stockcontrol` tinyint(1) NOT NULL,
  `qty` int(10) NOT NULL DEFAULT 0,
  `proratabilling` tinyint(1) NOT NULL,
  `proratadate` int(2) NOT NULL,
  `proratachargenextmonth` int(2) NOT NULL,
  `paytype` text COLLATE utf8_unicode_ci NOT NULL,
  `allowqty` int(1) NOT NULL,
  `subdomain` text COLLATE utf8_unicode_ci NOT NULL,
  `autosetup` text COLLATE utf8_unicode_ci NOT NULL,
  `servertype` text COLLATE utf8_unicode_ci NOT NULL,
  `servergroup` int(10) NOT NULL,
  `configoption1` text COLLATE utf8_unicode_ci NOT NULL,
  `configoption2` text COLLATE utf8_unicode_ci NOT NULL,
  `configoption3` text COLLATE utf8_unicode_ci NOT NULL,
  `configoption4` text COLLATE utf8_unicode_ci NOT NULL,
  `configoption5` text COLLATE utf8_unicode_ci NOT NULL,
  `configoption6` text COLLATE utf8_unicode_ci NOT NULL,
  `configoption7` text COLLATE utf8_unicode_ci NOT NULL,
  `configoption8` text COLLATE utf8_unicode_ci NOT NULL,
  `configoption9` text COLLATE utf8_unicode_ci NOT NULL,
  `configoption10` text COLLATE utf8_unicode_ci NOT NULL,
  `configoption11` text COLLATE utf8_unicode_ci NOT NULL,
  `configoption12` text COLLATE utf8_unicode_ci NOT NULL,
  `configoption13` text COLLATE utf8_unicode_ci NOT NULL,
  `configoption14` text COLLATE utf8_unicode_ci NOT NULL,
  `configoption15` text COLLATE utf8_unicode_ci NOT NULL,
  `configoption16` text COLLATE utf8_unicode_ci NOT NULL,
  `configoption17` text COLLATE utf8_unicode_ci NOT NULL,
  `configoption18` text COLLATE utf8_unicode_ci NOT NULL,
  `configoption19` text COLLATE utf8_unicode_ci NOT NULL,
  `configoption20` text COLLATE utf8_unicode_ci NOT NULL,
  `configoption21` text COLLATE utf8_unicode_ci NOT NULL,
  `configoption22` text COLLATE utf8_unicode_ci NOT NULL,
  `configoption23` text COLLATE utf8_unicode_ci NOT NULL,
  `configoption24` text COLLATE utf8_unicode_ci NOT NULL,
  `freedomain` text COLLATE utf8_unicode_ci NOT NULL,
  `freedomainpaymentterms` text COLLATE utf8_unicode_ci NOT NULL,
  `freedomaintlds` text COLLATE utf8_unicode_ci NOT NULL,
  `recurringcycles` int(2) NOT NULL,
  `autoterminatedays` int(4) NOT NULL,
  `autoterminateemail` int(10) NOT NULL DEFAULT 0,
  `configoptionsupgrade` tinyint(1) NOT NULL,
  `billingcycleupgrade` text COLLATE utf8_unicode_ci NOT NULL,
  `upgradeemail` int(10) NOT NULL DEFAULT 0,
  `overagesenabled` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `overagesdisklimit` int(10) NOT NULL,
  `overagesbwlimit` int(10) NOT NULL,
  `overagesdiskprice` decimal(6,4) NOT NULL,
  `overagesbwprice` decimal(6,4) NOT NULL,
  `tax` tinyint(1) NOT NULL,
  `affiliateonetime` tinyint(1) NOT NULL,
  `affiliatepaytype` text COLLATE utf8_unicode_ci NOT NULL,
  `affiliatepayamount` decimal(16,2) NOT NULL,
  `order` int(10) NOT NULL DEFAULT 0,
  `retired` tinyint(1) NOT NULL,
  `is_featured` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `gid` (`gid`),
  KEY `name` (`name`(64))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblproducts`
--

LOCK TABLES `tblproducts` WRITE;
/*!40000 ALTER TABLE `tblproducts` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblproducts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblproducts_slugs`
--

DROP TABLE IF EXISTS `tblproducts_slugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblproducts_slugs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `group_id` int(10) unsigned NOT NULL,
  `group_slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `active` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `clicks` int(10) unsigned NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tblproducts_slugs_product_id_index` (`product_id`),
  KEY `tblproducts_slugs_group_id_index` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblproducts_slugs`
--

LOCK TABLES `tblproducts_slugs` WRITE;
/*!40000 ALTER TABLE `tblproducts_slugs` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblproducts_slugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblproducts_slugs_tracking`
--

DROP TABLE IF EXISTS `tblproducts_slugs_tracking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblproducts_slugs_tracking` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `slug_id` int(10) unsigned NOT NULL,
  `date` date NOT NULL DEFAULT '0000-00-00',
  `clicks` int(10) unsigned NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tblproducts_slugs_tracking_slug_id_index` (`slug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblproducts_slugs_tracking`
--

LOCK TABLES `tblproducts_slugs_tracking` WRITE;
/*!40000 ALTER TABLE `tblproducts_slugs_tracking` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblproducts_slugs_tracking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblpromotions`
--

DROP TABLE IF EXISTS `tblpromotions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblpromotions` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `code` text COLLATE utf8_unicode_ci NOT NULL,
  `type` text COLLATE utf8_unicode_ci NOT NULL,
  `recurring` int(1) DEFAULT NULL,
  `value` decimal(16,2) NOT NULL DEFAULT 0.00,
  `cycles` text COLLATE utf8_unicode_ci NOT NULL,
  `appliesto` text COLLATE utf8_unicode_ci NOT NULL,
  `requires` text COLLATE utf8_unicode_ci NOT NULL,
  `requiresexisting` int(1) NOT NULL,
  `startdate` date NOT NULL,
  `expirationdate` date DEFAULT NULL,
  `maxuses` int(10) NOT NULL DEFAULT 0,
  `uses` int(10) NOT NULL DEFAULT 0,
  `lifetimepromo` int(1) NOT NULL,
  `applyonce` int(1) NOT NULL,
  `newsignups` int(1) NOT NULL,
  `existingclient` int(11) NOT NULL,
  `onceperclient` int(11) NOT NULL,
  `recurfor` int(3) NOT NULL,
  `upgrades` int(1) NOT NULL,
  `upgradeconfig` text COLLATE utf8_unicode_ci NOT NULL,
  `notes` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `code` (`code`(32))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblpromotions`
--

LOCK TABLES `tblpromotions` WRITE;
/*!40000 ALTER TABLE `tblpromotions` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblpromotions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblquoteitems`
--

DROP TABLE IF EXISTS `tblquoteitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblquoteitems` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `quoteid` int(10) NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `quantity` text COLLATE utf8_unicode_ci NOT NULL,
  `unitprice` decimal(16,2) NOT NULL,
  `discount` decimal(16,2) NOT NULL,
  `taxable` int(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblquoteitems`
--

LOCK TABLES `tblquoteitems` WRITE;
/*!40000 ALTER TABLE `tblquoteitems` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblquoteitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblquotes`
--

DROP TABLE IF EXISTS `tblquotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblquotes` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `subject` text COLLATE utf8_unicode_ci NOT NULL,
  `stage` enum('Draft','Delivered','On Hold','Accepted','Lost','Dead') COLLATE utf8_unicode_ci NOT NULL,
  `validuntil` date NOT NULL,
  `userid` int(10) NOT NULL,
  `firstname` text COLLATE utf8_unicode_ci NOT NULL,
  `lastname` text COLLATE utf8_unicode_ci NOT NULL,
  `companyname` text COLLATE utf8_unicode_ci NOT NULL,
  `email` text COLLATE utf8_unicode_ci NOT NULL,
  `address1` text COLLATE utf8_unicode_ci NOT NULL,
  `address2` text COLLATE utf8_unicode_ci NOT NULL,
  `city` text COLLATE utf8_unicode_ci NOT NULL,
  `state` text COLLATE utf8_unicode_ci NOT NULL,
  `postcode` text COLLATE utf8_unicode_ci NOT NULL,
  `country` text COLLATE utf8_unicode_ci NOT NULL,
  `phonenumber` text COLLATE utf8_unicode_ci NOT NULL,
  `tax_id` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `currency` int(10) NOT NULL,
  `subtotal` decimal(16,2) NOT NULL,
  `tax1` decimal(16,2) NOT NULL,
  `tax2` decimal(16,2) NOT NULL,
  `total` decimal(16,2) NOT NULL,
  `proposal` text COLLATE utf8_unicode_ci NOT NULL,
  `customernotes` text COLLATE utf8_unicode_ci NOT NULL,
  `adminnotes` text COLLATE utf8_unicode_ci NOT NULL,
  `datecreated` date NOT NULL,
  `lastmodified` date NOT NULL,
  `datesent` date NOT NULL,
  `dateaccepted` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblquotes`
--

LOCK TABLES `tblquotes` WRITE;
/*!40000 ALTER TABLE `tblquotes` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblquotes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblregistrars`
--

DROP TABLE IF EXISTS `tblregistrars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblregistrars` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `registrar` text COLLATE utf8_unicode_ci NOT NULL,
  `setting` text COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `registrar_setting` (`registrar`(32),`setting`(32))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblregistrars`
--

LOCK TABLES `tblregistrars` WRITE;
/*!40000 ALTER TABLE `tblregistrars` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblregistrars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblrsakeypairs`
--

DROP TABLE IF EXISTS `tblrsakeypairs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblrsakeypairs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(96) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `private_key` text COLLATE utf8_unicode_ci NOT NULL,
  `public_key` text COLLATE utf8_unicode_ci NOT NULL,
  `algorithm` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'RS256',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblrsakeypairs`
--

LOCK TABLES `tblrsakeypairs` WRITE;
/*!40000 ALTER TABLE `tblrsakeypairs` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblrsakeypairs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblserver_tenants`
--

DROP TABLE IF EXISTS `tblserver_tenants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblserver_tenants` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `server_id` int(11) NOT NULL DEFAULT 0,
  `tenant` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `server_tenant` (`tenant`,`server_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblserver_tenants`
--

LOCK TABLES `tblserver_tenants` WRITE;
/*!40000 ALTER TABLE `tblserver_tenants` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblserver_tenants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblservergroups`
--

DROP TABLE IF EXISTS `tblservergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblservergroups` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `filltype` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblservergroups`
--

LOCK TABLES `tblservergroups` WRITE;
/*!40000 ALTER TABLE `tblservergroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblservergroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblservergroupsrel`
--

DROP TABLE IF EXISTS `tblservergroupsrel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblservergroupsrel` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `groupid` int(10) NOT NULL,
  `serverid` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblservergroupsrel`
--

LOCK TABLES `tblservergroupsrel` WRITE;
/*!40000 ALTER TABLE `tblservergroupsrel` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblservergroupsrel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblservers`
--

DROP TABLE IF EXISTS `tblservers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblservers` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `ipaddress` text COLLATE utf8_unicode_ci NOT NULL,
  `assignedips` text COLLATE utf8_unicode_ci NOT NULL,
  `hostname` text COLLATE utf8_unicode_ci NOT NULL,
  `monthlycost` decimal(16,2) NOT NULL DEFAULT 0.00,
  `noc` text COLLATE utf8_unicode_ci NOT NULL,
  `statusaddress` text COLLATE utf8_unicode_ci NOT NULL,
  `nameserver1` text COLLATE utf8_unicode_ci NOT NULL,
  `nameserver1ip` text COLLATE utf8_unicode_ci NOT NULL,
  `nameserver2` text COLLATE utf8_unicode_ci NOT NULL,
  `nameserver2ip` text COLLATE utf8_unicode_ci NOT NULL,
  `nameserver3` text COLLATE utf8_unicode_ci NOT NULL,
  `nameserver3ip` text COLLATE utf8_unicode_ci NOT NULL,
  `nameserver4` text COLLATE utf8_unicode_ci NOT NULL,
  `nameserver4ip` text COLLATE utf8_unicode_ci NOT NULL,
  `nameserver5` text COLLATE utf8_unicode_ci NOT NULL,
  `nameserver5ip` text COLLATE utf8_unicode_ci NOT NULL,
  `maxaccounts` int(10) NOT NULL DEFAULT 0,
  `type` text COLLATE utf8_unicode_ci NOT NULL,
  `username` text COLLATE utf8_unicode_ci NOT NULL,
  `password` text COLLATE utf8_unicode_ci NOT NULL,
  `accesshash` text COLLATE utf8_unicode_ci NOT NULL,
  `secure` text COLLATE utf8_unicode_ci NOT NULL,
  `port` int(8) DEFAULT NULL,
  `active` int(1) NOT NULL,
  `disabled` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblservers`
--

LOCK TABLES `tblservers` WRITE;
/*!40000 ALTER TABLE `tblservers` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblservers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblservers_remote`
--

DROP TABLE IF EXISTS `tblservers_remote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblservers_remote` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `server_id` int(10) NOT NULL DEFAULT 0,
  `num_accounts` int(10) NOT NULL DEFAULT 0,
  `meta_data` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `tblservers_remote_server_id` (`server_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblservers_remote`
--

LOCK TABLES `tblservers_remote` WRITE;
/*!40000 ALTER TABLE `tblservers_remote` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblservers_remote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblserversssoperms`
--

DROP TABLE IF EXISTS `tblserversssoperms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblserversssoperms` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `server_id` int(10) NOT NULL,
  `role_id` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblserversssoperms`
--

LOCK TABLES `tblserversssoperms` WRITE;
/*!40000 ALTER TABLE `tblserversssoperms` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblserversssoperms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblsessions`
--

DROP TABLE IF EXISTS `tblsessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblsessions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `session_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payload` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `last_activity` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sessions_id_unique` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblsessions`
--

LOCK TABLES `tblsessions` WRITE;
/*!40000 ALTER TABLE `tblsessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblsessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblsslorders`
--

DROP TABLE IF EXISTS `tblsslorders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblsslorders` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `userid` int(10) NOT NULL,
  `serviceid` int(10) NOT NULL,
  `addon_id` int(10) NOT NULL DEFAULT 0,
  `remoteid` text COLLATE utf8_unicode_ci NOT NULL,
  `module` text COLLATE utf8_unicode_ci NOT NULL,
  `certtype` text COLLATE utf8_unicode_ci NOT NULL,
  `configdata` text COLLATE utf8_unicode_ci NOT NULL,
  `authdata` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `completiondate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblsslorders`
--

LOCK TABLES `tblsslorders` WRITE;
/*!40000 ALTER TABLE `tblsslorders` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblsslorders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblsslstatus`
--

DROP TABLE IF EXISTS `tblsslstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblsslstatus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT 0,
  `domain_name` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `subject_name` varchar(128) COLLATE utf8_unicode_ci DEFAULT '',
  `subject_org` varchar(128) COLLATE utf8_unicode_ci DEFAULT '',
  `issuer_name` varchar(128) COLLATE utf8_unicode_ci DEFAULT '',
  `issuer_org` varchar(128) COLLATE utf8_unicode_ci DEFAULT '',
  `start_date` datetime DEFAULT NULL,
  `expiry_date` datetime DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `last_synced_date` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `domain_name` (`domain_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblsslstatus`
--

LOCK TABLES `tblsslstatus` WRITE;
/*!40000 ALTER TABLE `tblsslstatus` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblsslstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblstorageconfigurations`
--

DROP TABLE IF EXISTS `tblstorageconfigurations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblstorageconfigurations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handler` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci NOT NULL,
  `last_error` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_local` tinyint(1) unsigned NOT NULL,
  `sort_order` int(1) unsigned NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblstorageconfigurations`
--

LOCK TABLES `tblstorageconfigurations` WRITE;
/*!40000 ALTER TABLE `tblstorageconfigurations` DISABLE KEYS */;
INSERT INTO `tblstorageconfigurations` VALUES (1,'Local Storage: /var/www/vhosts/lchcloud.de/scp.lchcloud.de/downloads','WHMCS\\File\\Provider\\LocalStorageProvider','{\"local_path\":\"\\/var\\/www\\/vhosts\\/lchcloud.de\\/scp.lchcloud.de\\/downloads\"}',NULL,1,1,'2022-02-19 05:02:03','2022-02-19 05:02:03'),(2,'Local Storage: /var/www/vhosts/lchcloud.de/scp.lchcloud.de/attachments','WHMCS\\File\\Provider\\LocalStorageProvider','{\"local_path\":\"\\/var\\/www\\/vhosts\\/lchcloud.de\\/scp.lchcloud.de\\/attachments\"}',NULL,1,2,'2022-02-19 05:02:03','2022-02-19 05:02:03'),(3,'Local Storage: /var/www/vhosts/lchcloud.de/scp.lchcloud.de/attachments/projects','WHMCS\\File\\Provider\\LocalStorageProvider','{\"local_path\":\"\\/var\\/www\\/vhosts\\/lchcloud.de\\/scp.lchcloud.de\\/attachments\\/projects\"}',NULL,1,3,'2022-02-19 05:02:03','2022-02-19 05:02:03');
/*!40000 ALTER TABLE `tblstorageconfigurations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbltask`
--

DROP TABLE IF EXISTS `tbltask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbltask` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `priority` int(11) NOT NULL DEFAULT 0,
  `class_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `is_enabled` tinyint(4) NOT NULL DEFAULT 1,
  `is_periodic` tinyint(4) NOT NULL DEFAULT 1,
  `frequency` int(10) unsigned NOT NULL DEFAULT 0,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbltask`
--

LOCK TABLES `tbltask` WRITE;
/*!40000 ALTER TABLE `tbltask` DISABLE KEYS */;
INSERT INTO `tbltask` VALUES (1,1530,'WHMCS\\Cron\\Task\\AddLateFees',1,1,1440,'Late Fees','Apply Late Fees','2016-11-02 16:59:20','2016-11-02 16:59:20'),(2,1620,'WHMCS\\Cron\\Task\\AffiliateCommissions',1,1,1440,'Delayed Affiliate Commissions','Process Delayed Affiliate Commissions','2016-11-02 16:59:20','2016-11-02 16:59:20'),(3,1630,'WHMCS\\Cron\\Task\\AffiliateReports',1,1,43200,'Affiliate Reports','Send Monthly Affiliate Reports','2016-11-02 16:59:20','2016-11-02 16:59:20'),(4,1680,'WHMCS\\Cron\\Task\\AutoClientStatusSync',1,1,1440,'Client Status Update','Synchronise Client Status','2016-11-02 16:59:20','2016-11-02 16:59:20'),(5,1590,'WHMCS\\Cron\\Task\\AutoTerminations',1,1,1440,'Overdue Terminations','Process Overdue Terminations','2016-11-02 16:59:20','2016-11-02 16:59:20'),(6,1570,'WHMCS\\Cron\\Task\\CancellationRequests',1,1,1440,'Cancellation Requests','Process Cancellation Requests','2016-11-02 16:59:20','2016-11-02 16:59:20'),(7,2000,'WHMCS\\Cron\\Task\\CheckForWhmcsUpdate',1,1,480,'WHMCS Updates','Check for WHMCS Software Updates','2016-11-02 16:59:20','2016-11-02 16:59:20'),(8,1610,'WHMCS\\Cron\\Task\\CloseInactiveTickets',1,1,1440,'Inactive Tickets','Auto Close Inactive Tickets','2016-11-02 16:59:20','2016-11-02 16:59:20'),(9,1520,'WHMCS\\Cron\\Task\\CreateInvoices',1,1,1440,'Invoices','Generate Invoices','2016-11-02 16:59:20','2016-11-02 16:59:20'),(10,1650,'WHMCS\\Cron\\Task\\CreditCardExpiryNotices',1,1,43200,'Credit Card Expiry Notices','Sending Credit Card Expiry Reminders','2016-11-02 16:59:20','2016-11-02 16:59:20'),(11,1500,'WHMCS\\Cron\\Task\\CurrencyUpdateExchangeRates',1,1,1440,'Currency Exchange Rates','Update Currency Exchange Rates','2016-11-02 16:59:20','2016-11-02 16:59:20'),(12,1510,'WHMCS\\Cron\\Task\\CurrencyUpdateProductPricing',1,1,1440,'Product Pricing Updates','Update Product Prices for Current Rates','2016-11-02 16:59:20','2016-11-02 16:59:20'),(13,1560,'WHMCS\\Cron\\Task\\DomainRenewalNotices',1,1,1440,'Domain Renewal Notices','Processing Domain Renewal Notices','2016-11-02 16:59:20','2016-11-02 16:59:20'),(14,1640,'WHMCS\\Cron\\Task\\EmailMarketer',1,1,1440,'Email Marketer Rules','Process Email Marketer Rules','2016-11-02 16:59:20','2016-11-02 16:59:20'),(15,1600,'WHMCS\\Cron\\Task\\FixedTermTerminations',1,1,1440,'Fixed Term Terminations','Process Fixed Term Terminations','2016-11-02 16:59:20','2016-11-02 16:59:20'),(16,1550,'WHMCS\\Cron\\Task\\InvoiceReminders',1,1,1440,'Invoice & Overdue Reminders','Generate daily reminders for unpaid and overdue invoice','2016-11-02 16:59:20','2016-11-02 16:59:20'),(17,1670,'WHMCS\\Cron\\Task\\OverageBilling',1,1,43200,'Overage Billing Charges','Process Overage Billing Charges','2016-11-02 16:59:20','2016-11-02 16:59:20'),(18,1540,'WHMCS\\Cron\\Task\\ProcessCreditCardPayments',1,1,1440,'Credit Card Charges','Process Credit Card Charges','2016-11-02 16:59:20','2016-11-02 16:59:20'),(19,1580,'WHMCS\\Cron\\Task\\AutoSuspensions',1,1,1440,'Overdue Suspensions','Process Overdue Suspensions','2016-11-02 16:59:21','2016-11-02 16:59:21'),(20,1700,'WHMCS\\Cron\\Task\\TicketEscalations',1,1,3,'Ticket Escalation Rules','Process and escalate tickets per any Escalation Rules','2016-11-02 16:59:21','2016-11-02 16:59:21'),(21,1690,'WHMCS\\Cron\\Task\\UpdateDomainExpiryStatus',1,1,1440,'Domain Expiry','Update Domain Expiry Status','2016-11-02 16:59:21','2016-11-02 16:59:21'),(22,1660,'WHMCS\\Cron\\Task\\UpdateServerUsage',1,1,1440,'Server Usage Stats','Updating Disk & Bandwidth Usage Stats','2016-11-02 16:59:21','2016-11-02 16:59:21'),(23,2000,'WHMCS\\Cron\\Task\\RunJobsQueue',1,1,5,'Run Jobs Queue','Execute queued jobs that are due for execution.','2018-04-18 10:21:42','2018-04-18 10:21:42'),(24,1800,'WHMCS\\Cron\\Task\\DataRetentionPruning',1,1,1440,'Data Retention Pruning','Perform data retention pruning operations.','2018-04-18 10:21:43','2018-04-18 10:21:43'),(25,2100,'WHMCS\\Cron\\Task\\DomainTransferSync',1,1,240,'Domain Transfer Status Synchronisation','Syncing Domain Pending Transfer Status','2018-04-18 10:21:43','2018-04-18 10:21:43'),(26,2150,'WHMCS\\Cron\\Task\\DomainStatusSync',1,1,240,'Domain Status Synchronisation','Domain Status Syncing','2018-04-18 10:21:43','2018-04-18 10:21:43'),(27,1650,'WHMCS\\Cron\\Task\\SslStatusSync',1,1,1440,'SSL Sync','SSL Status Sync','2019-01-01 15:49:13','2019-01-01 15:49:13'),(28,1615,'WHMCS\\Cron\\Task\\AutoPruneTicketAttachments',1,1,60,'Prune Ticket Attachments','Auto Remove Inactive Ticket Attachments','2019-04-01 09:00:00','2019-04-01 09:00:00'),(29,1900,'WHMCS\\Cron\\Task\\ServerUsageCount',1,1,60,'Update Server Usage','Auto Update Server Usage Count','2019-07-29 09:00:00','2019-07-29 09:00:00'),(30,1910,'WHMCS\\Cron\\Task\\ServerRemoteMetaData',1,1,60,'Update Server Meta Data','Auto Update Server Meta Data','2019-07-29 09:00:00','2019-07-29 09:00:00'),(31,1519,'WHMCS\\Cron\\Task\\TenantUsageMetrics',1,1,720,'Tenant Usage Metrics','Collect tenant usage metrics from servers','2019-11-01 01:00:00','2019-11-01 01:00:00'),(32,1640,'WHMCS\\Cron\\Task\\EmailCampaigns',1,1,5,'Process Email Campaigns','Process Scheduled Email Campaigns','2020-07-17 11:42:30','2020-07-17 11:42:30'),(33,1636,'WHMCS\\Cron\\Task\\ProcessEmailQueue',1,1,1,'Process Email Queue','Process Queued Emails','2020-07-17 11:42:30','2020-07-17 11:42:30');
/*!40000 ALTER TABLE `tbltask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbltask_status`
--

DROP TABLE IF EXISTS `tbltask_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbltask_status` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `task_id` int(10) unsigned NOT NULL,
  `in_progress` tinyint(4) NOT NULL DEFAULT 0,
  `last_run` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `next_due` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbltask_status`
--

LOCK TABLES `tbltask_status` WRITE;
/*!40000 ALTER TABLE `tbltask_status` DISABLE KEYS */;
INSERT INTO `tbltask_status` VALUES (1,1,0,'2018-04-18 10:21:39','2016-11-02 16:59:23','2016-11-02 16:59:20','2018-04-18 10:21:39'),(2,2,0,'2018-04-18 10:21:39','2016-11-02 16:59:23','2016-11-02 16:59:20','2018-04-18 10:21:39'),(3,3,0,'2018-04-18 10:21:39','2016-11-02 16:59:23','2016-11-02 16:59:20','2018-04-18 10:21:39'),(4,4,0,'2018-04-18 10:21:39','2016-11-02 16:59:23','2016-11-02 16:59:20','2018-04-18 10:21:39'),(5,5,0,'2018-04-18 10:21:39','2016-11-02 16:59:23','2016-11-02 16:59:20','2018-04-18 10:21:39'),(6,6,0,'2018-04-18 10:21:39','2016-11-02 16:59:23','2016-11-02 16:59:20','2018-04-18 10:21:39'),(7,7,0,'2018-04-18 10:21:39','2016-11-02 16:59:23','2016-11-02 16:59:20','2018-04-18 10:21:39'),(8,8,0,'2018-04-18 10:21:39','2016-11-02 16:59:23','2016-11-02 16:59:20','2018-04-18 10:21:39'),(9,9,0,'2018-04-18 10:21:39','2016-11-02 16:59:23','2016-11-02 16:59:20','2018-04-18 10:21:39'),(10,10,0,'2018-04-18 10:21:39','2016-11-02 16:59:23','2016-11-02 16:59:20','2018-04-18 10:21:39'),(11,11,0,'2018-04-18 10:21:39','2016-11-02 16:59:23','2016-11-02 16:59:20','2018-04-18 10:21:39'),(12,12,0,'2018-04-18 10:21:39','2016-11-02 16:59:23','2016-11-02 16:59:20','2018-04-18 10:21:39'),(13,13,0,'2018-04-18 10:21:39','2016-11-02 16:59:23','2016-11-02 16:59:20','2018-04-18 10:21:39'),(14,14,0,'2018-04-18 10:21:39','2016-11-02 16:59:23','2016-11-02 16:59:20','2018-04-18 10:21:39'),(15,15,0,'2018-04-18 10:21:39','2016-11-02 16:59:23','2016-11-02 16:59:20','2018-04-18 10:21:39'),(16,16,0,'2018-04-18 10:21:39','2016-11-02 16:59:23','2016-11-02 16:59:20','2018-04-18 10:21:39'),(17,17,0,'2018-04-18 10:21:39','2016-11-02 16:59:23','2016-11-02 16:59:20','2018-04-18 10:21:39'),(18,18,0,'2018-04-18 10:21:39','2016-11-02 16:59:23','2016-11-02 16:59:20','2018-04-18 10:21:39'),(19,19,0,'2018-04-18 10:21:39','2016-11-02 16:59:23','2016-11-02 16:59:21','2018-04-18 10:21:39'),(20,20,0,'2018-04-18 10:21:39','2016-11-02 16:59:23','2016-11-02 16:59:21','2018-04-18 10:21:39'),(21,21,0,'2018-04-18 10:21:39','2016-11-02 16:59:23','2016-11-02 16:59:21','2018-04-18 10:21:39'),(22,22,0,'2018-04-18 10:21:39','2016-11-02 16:59:23','2016-11-02 16:59:21','2018-04-18 10:21:39'),(23,23,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','2018-04-18 10:21:42','2018-04-18 10:21:42'),(24,24,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','2018-04-18 10:21:43','2018-04-18 10:21:43'),(25,25,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','2018-04-18 10:21:43','2018-04-18 10:21:43'),(26,26,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','2018-04-18 10:21:43','2018-04-18 10:21:43'),(27,27,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','2019-01-01 15:49:13','2019-01-01 15:49:13'),(28,28,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','2019-04-01 09:00:00','2019-04-01 09:00:00'),(32,32,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','2020-07-17 11:42:36','2020-07-17 11:42:36'),(33,33,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','2020-07-17 11:42:36','2020-07-17 11:42:36');
/*!40000 ALTER TABLE `tbltask_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbltax`
--

DROP TABLE IF EXISTS `tbltax`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbltax` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `level` int(1) NOT NULL,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `state` text COLLATE utf8_unicode_ci NOT NULL,
  `country` text COLLATE utf8_unicode_ci NOT NULL,
  `taxrate` decimal(10,3) NOT NULL DEFAULT 0.000,
  PRIMARY KEY (`id`),
  KEY `state_country` (`state`(32),`country`(2))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbltax`
--

LOCK TABLES `tbltax` WRITE;
/*!40000 ALTER TABLE `tbltax` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbltax` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbltenant_stats`
--

DROP TABLE IF EXISTS `tbltenant_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbltenant_stats` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tenant_id` int(11) NOT NULL DEFAULT 0,
  `metric` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` decimal(19,6) NOT NULL DEFAULT 0.000000,
  `measured_at` decimal(18,6) NOT NULL DEFAULT 0.000000,
  `invoice_id` int(11) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbltenant_stats`
--

LOCK TABLES `tbltenant_stats` WRITE;
/*!40000 ALTER TABLE `tbltenant_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbltenant_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblticket_watchers`
--

DROP TABLE IF EXISTS `tblticket_watchers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblticket_watchers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ticket_id` int(10) unsigned NOT NULL DEFAULT 0,
  `admin_id` int(10) unsigned NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_ticket_unique` (`ticket_id`,`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblticket_watchers`
--

LOCK TABLES `tblticket_watchers` WRITE;
/*!40000 ALTER TABLE `tblticket_watchers` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblticket_watchers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblticketbreaklines`
--

DROP TABLE IF EXISTS `tblticketbreaklines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblticketbreaklines` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `breakline` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblticketbreaklines`
--

LOCK TABLES `tblticketbreaklines` WRITE;
/*!40000 ALTER TABLE `tblticketbreaklines` DISABLE KEYS */;
INSERT INTO `tblticketbreaklines` VALUES (1,'> -----Original Message-----'),(2,'----- Original Message -----'),(3,'-----Original Message-----'),(4,'<!-- Break Line -->'),(5,'====== Please reply above this line ======'),(6,'_____');
/*!40000 ALTER TABLE `tblticketbreaklines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblticketdepartments`
--

DROP TABLE IF EXISTS `tblticketdepartments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblticketdepartments` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `email` text COLLATE utf8_unicode_ci NOT NULL,
  `clientsonly` text COLLATE utf8_unicode_ci NOT NULL,
  `piperepliesonly` text COLLATE utf8_unicode_ci NOT NULL,
  `noautoresponder` text COLLATE utf8_unicode_ci NOT NULL,
  `hidden` text COLLATE utf8_unicode_ci NOT NULL,
  `order` int(1) NOT NULL,
  `host` text COLLATE utf8_unicode_ci NOT NULL,
  `port` text COLLATE utf8_unicode_ci NOT NULL,
  `login` text COLLATE utf8_unicode_ci NOT NULL,
  `password` text COLLATE utf8_unicode_ci NOT NULL,
  `mail_auth_config` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `feedback_request` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `name` (`name`(64))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblticketdepartments`
--

LOCK TABLES `tblticketdepartments` WRITE;
/*!40000 ALTER TABLE `tblticketdepartments` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblticketdepartments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblticketescalations`
--

DROP TABLE IF EXISTS `tblticketescalations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblticketescalations` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `departments` text COLLATE utf8_unicode_ci NOT NULL,
  `statuses` text COLLATE utf8_unicode_ci NOT NULL,
  `priorities` text COLLATE utf8_unicode_ci NOT NULL,
  `timeelapsed` int(5) NOT NULL,
  `newdepartment` text COLLATE utf8_unicode_ci NOT NULL,
  `newpriority` text COLLATE utf8_unicode_ci NOT NULL,
  `newstatus` text COLLATE utf8_unicode_ci NOT NULL,
  `flagto` text COLLATE utf8_unicode_ci NOT NULL,
  `notify` text COLLATE utf8_unicode_ci NOT NULL,
  `addreply` text COLLATE utf8_unicode_ci NOT NULL,
  `editor` enum('plain','markdown') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'plain',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblticketescalations`
--

LOCK TABLES `tblticketescalations` WRITE;
/*!40000 ALTER TABLE `tblticketescalations` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblticketescalations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblticketfeedback`
--

DROP TABLE IF EXISTS `tblticketfeedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblticketfeedback` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `ticketid` int(10) NOT NULL,
  `adminid` int(10) NOT NULL,
  `rating` int(2) NOT NULL,
  `comments` text COLLATE utf8_unicode_ci NOT NULL,
  `datetime` datetime NOT NULL,
  `ip` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblticketfeedback`
--

LOCK TABLES `tblticketfeedback` WRITE;
/*!40000 ALTER TABLE `tblticketfeedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblticketfeedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblticketlog`
--

DROP TABLE IF EXISTS `tblticketlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblticketlog` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `tid` int(10) NOT NULL,
  `action` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tid` (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblticketlog`
--

LOCK TABLES `tblticketlog` WRITE;
/*!40000 ALTER TABLE `tblticketlog` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblticketlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblticketmaillog`
--

DROP TABLE IF EXISTS `tblticketmaillog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblticketmaillog` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `to` text COLLATE utf8_unicode_ci NOT NULL,
  `cc` text COLLATE utf8_unicode_ci NOT NULL,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `email` text COLLATE utf8_unicode_ci NOT NULL,
  `subject` text COLLATE utf8_unicode_ci NOT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `status` text COLLATE utf8_unicode_ci NOT NULL,
  `attachment` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `date` (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblticketmaillog`
--

LOCK TABLES `tblticketmaillog` WRITE;
/*!40000 ALTER TABLE `tblticketmaillog` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblticketmaillog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblticketnotes`
--

DROP TABLE IF EXISTS `tblticketnotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblticketnotes` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `ticketid` int(10) NOT NULL,
  `admin` text COLLATE utf8_unicode_ci NOT NULL,
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `attachments` text COLLATE utf8_unicode_ci NOT NULL,
  `attachments_removed` tinyint(1) NOT NULL DEFAULT 0,
  `editor` enum('plain','markdown') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'plain',
  PRIMARY KEY (`id`),
  KEY `ticketid_date` (`ticketid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblticketnotes`
--

LOCK TABLES `tblticketnotes` WRITE;
/*!40000 ALTER TABLE `tblticketnotes` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblticketnotes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblticketpredefinedcats`
--

DROP TABLE IF EXISTS `tblticketpredefinedcats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblticketpredefinedcats` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `parentid` int(10) NOT NULL DEFAULT 0,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `parentid_name` (`parentid`,`name`(64))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblticketpredefinedcats`
--

LOCK TABLES `tblticketpredefinedcats` WRITE;
/*!40000 ALTER TABLE `tblticketpredefinedcats` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblticketpredefinedcats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblticketpredefinedreplies`
--

DROP TABLE IF EXISTS `tblticketpredefinedreplies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblticketpredefinedreplies` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `catid` int(10) NOT NULL,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `reply` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblticketpredefinedreplies`
--

LOCK TABLES `tblticketpredefinedreplies` WRITE;
/*!40000 ALTER TABLE `tblticketpredefinedreplies` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblticketpredefinedreplies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblticketreplies`
--

DROP TABLE IF EXISTS `tblticketreplies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblticketreplies` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `tid` int(10) NOT NULL,
  `userid` int(10) NOT NULL,
  `contactid` int(10) NOT NULL,
  `requestor_id` int(10) unsigned NOT NULL DEFAULT 0,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `email` text COLLATE utf8_unicode_ci NOT NULL,
  `date` datetime NOT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `admin` text COLLATE utf8_unicode_ci NOT NULL,
  `attachment` text COLLATE utf8_unicode_ci NOT NULL,
  `attachments_removed` tinyint(1) NOT NULL DEFAULT 0,
  `rating` int(5) NOT NULL,
  `editor` enum('plain','markdown') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'plain',
  PRIMARY KEY (`id`),
  KEY `tid_date` (`tid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblticketreplies`
--

LOCK TABLES `tblticketreplies` WRITE;
/*!40000 ALTER TABLE `tblticketreplies` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblticketreplies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbltickets`
--

DROP TABLE IF EXISTS `tbltickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbltickets` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `tid` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `did` int(10) NOT NULL,
  `userid` int(10) NOT NULL,
  `contactid` int(10) NOT NULL,
  `requestor_id` int(10) unsigned NOT NULL DEFAULT 0,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `email` text COLLATE utf8_unicode_ci NOT NULL,
  `cc` text COLLATE utf8_unicode_ci NOT NULL,
  `c` text COLLATE utf8_unicode_ci NOT NULL,
  `ipaddress` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `urgency` text COLLATE utf8_unicode_ci NOT NULL,
  `admin` text COLLATE utf8_unicode_ci NOT NULL,
  `attachment` text COLLATE utf8_unicode_ci NOT NULL,
  `attachments_removed` tinyint(1) NOT NULL DEFAULT 0,
  `lastreply` datetime NOT NULL,
  `flag` int(1) NOT NULL,
  `clientunread` int(1) NOT NULL,
  `adminunread` text COLLATE utf8_unicode_ci NOT NULL,
  `replyingadmin` int(1) NOT NULL,
  `replyingtime` datetime NOT NULL,
  `service` text COLLATE utf8_unicode_ci NOT NULL,
  `merged_ticket_id` int(11) NOT NULL DEFAULT 0,
  `editor` enum('plain','markdown','bbcode') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'plain',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `tid_c` (`tid`,`c`(64)),
  KEY `userid` (`userid`),
  KEY `date` (`date`),
  KEY `did` (`did`),
  KEY `merged_ticket_id` (`merged_ticket_id`,`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbltickets`
--

LOCK TABLES `tbltickets` WRITE;
/*!40000 ALTER TABLE `tbltickets` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbltickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblticketspamfilters`
--

DROP TABLE IF EXISTS `tblticketspamfilters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblticketspamfilters` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type` enum('sender','subject','phrase') COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblticketspamfilters`
--

LOCK TABLES `tblticketspamfilters` WRITE;
/*!40000 ALTER TABLE `tblticketspamfilters` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblticketspamfilters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblticketstatuses`
--

DROP TABLE IF EXISTS `tblticketstatuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblticketstatuses` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `color` text COLLATE utf8_unicode_ci NOT NULL,
  `sortorder` int(2) NOT NULL,
  `showactive` int(1) NOT NULL,
  `showawaiting` int(1) NOT NULL,
  `autoclose` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblticketstatuses`
--

LOCK TABLES `tblticketstatuses` WRITE;
/*!40000 ALTER TABLE `tblticketstatuses` DISABLE KEYS */;
INSERT INTO `tblticketstatuses` VALUES (1,'Open','#779500',1,1,1,0),(2,'Answered','#000000',2,1,0,1),(3,'Customer-Reply','#ff6600',3,1,1,1),(4,'Closed','#888888',10,0,0,0),(5,'On Hold','#224488',5,1,0,0),(6,'In Progress','#cc0000',6,1,0,0);
/*!40000 ALTER TABLE `tblticketstatuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbltickettags`
--

DROP TABLE IF EXISTS `tbltickettags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbltickettags` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `ticketid` int(10) NOT NULL,
  `tag` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbltickettags`
--

LOCK TABLES `tbltickettags` WRITE;
/*!40000 ALTER TABLE `tbltickettags` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbltickettags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbltodolist`
--

DROP TABLE IF EXISTS `tbltodolist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbltodolist` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `admin` int(10) NOT NULL DEFAULT 0,
  `status` text COLLATE utf8_unicode_ci NOT NULL,
  `duedate` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `duedate` (`duedate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbltodolist`
--

LOCK TABLES `tbltodolist` WRITE;
/*!40000 ALTER TABLE `tbltodolist` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbltodolist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbltransaction_history`
--

DROP TABLE IF EXISTS `tbltransaction_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbltransaction_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `invoice_id` int(10) unsigned NOT NULL,
  `gateway` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `transaction_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `remote_status` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `completed` tinyint(1) NOT NULL DEFAULT 0,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `additional_information` text COLLATE utf8_unicode_ci NOT NULL,
  `amount` decimal(16,2) NOT NULL DEFAULT 0.00,
  `currency_id` int(10) unsigned NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `transaction_id` (`transaction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbltransaction_history`
--

LOCK TABLES `tbltransaction_history` WRITE;
/*!40000 ALTER TABLE `tbltransaction_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbltransaction_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbltransientdata`
--

DROP TABLE IF EXISTS `tbltransientdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbltransientdata` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  `data` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `expires` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`(255))
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbltransientdata`
--

LOCK TABLES `tbltransientdata` WRITE;
/*!40000 ALTER TABLE `tbltransientdata` DISABLE KEYS */;
INSERT INTO `tbltransientdata` VALUES (1,'RewriteBackup','[{\"before\":[],\"whmcs\":[],\"after\":[]}]',1676005323),(2,'detect-route-environment','ItylM',1645246983),(3,'TemplateCompatCache','{\"sig\":\"9459f58161387b8b47c70ee172a1207e3636b80c\",\"cache\":{\"cloud_slider\":{\"six\":{\"status\":\"compatible\",\"reason\":\"ok\"},\"twenty-one\":{\"status\":\"compatible\",\"reason\":\"ok\"}},\"legacy_boxes\":{\"six\":{\"status\":\"compatible\",\"reason\":\"ok\"},\"twenty-one\":{\"status\":\"compatible\",\"reason\":\"ok\"}},\"legacy_modern\":{\"six\":{\"status\":\"compatible\",\"reason\":\"ok\"},\"twenty-one\":{\"status\":\"compatible\",\"reason\":\"ok\"}},\"premium_comparison\":{\"six\":{\"status\":\"compatible\",\"reason\":\"ok\"},\"twenty-one\":{\"status\":\"compatible\",\"reason\":\"ok\"}},\"pure_comparison\":{\"six\":{\"status\":\"compatible\",\"reason\":\"ok\"},\"twenty-one\":{\"status\":\"compatible\",\"reason\":\"ok\"}},\"standard_cart\":{\"six\":{\"status\":\"compatible\",\"reason\":\"ok\"},\"twenty-one\":{\"status\":\"compatible\",\"reason\":\"ok\"}},\"supreme_comparison\":{\"six\":{\"status\":\"compatible\",\"reason\":\"ok\"},\"twenty-one\":{\"status\":\"compatible\",\"reason\":\"ok\"}},\"universal_slider\":{\"six\":{\"status\":\"compatible\",\"reason\":\"ok\"},\"twenty-one\":{\"status\":\"compatible\",\"reason\":\"ok\"}}}}',1676804526),(4,'WHMCS\\Language\\AdminLanguageLocales','{\"hash\":\"970fe64adcf9422b37d3349731b9c332\",\"locales\":[{\"locale\":\"ar_AR\",\"language\":\"arabic\",\"languageCode\":\"ar\",\"countryCode\":\"AR\",\"localisedName\":\"\\u0627\\u0644\\u0639\\u0631\\u0628\\u064a\\u0629\"},{\"locale\":\"cs_CZ\",\"language\":\"czech\",\"languageCode\":\"cs\",\"countryCode\":\"CZ\",\"localisedName\":\"\\u010ce\\u0161tina\"},{\"locale\":\"nl_NL\",\"language\":\"dutch\",\"languageCode\":\"nl\",\"countryCode\":\"NL\",\"localisedName\":\"Nederlands\"},{\"locale\":\"en_GB\",\"language\":\"english\",\"languageCode\":\"en\",\"countryCode\":\"GB\",\"localisedName\":\"English\"},{\"locale\":\"fa_IR\",\"language\":\"farsi\",\"languageCode\":\"fa\",\"countryCode\":\"IR\",\"localisedName\":\"Persian\"},{\"locale\":\"fr_FR\",\"language\":\"french\",\"languageCode\":\"fr\",\"countryCode\":\"FR\",\"localisedName\":\"Fran\\u00e7ais\"},{\"locale\":\"he_IL\",\"language\":\"hebrew\",\"languageCode\":\"he\",\"countryCode\":\"IL\",\"localisedName\":\"\\u05e2\\u05d1\\u05e8\\u05d9\\u05ea\"},{\"locale\":\"hu_HU\",\"language\":\"hungarian\",\"languageCode\":\"hu\",\"countryCode\":\"HU\",\"localisedName\":\"Magyar\"},{\"locale\":\"it_IT\",\"language\":\"italian\",\"languageCode\":\"it\",\"countryCode\":\"IT\",\"localisedName\":\"Italiano\"},{\"locale\":\"pt_BR\",\"language\":\"portugues-br\",\"languageCode\":\"pt\",\"countryCode\":\"BR\",\"localisedName\":\"Portugu\\u00eas\"},{\"locale\":\"pt_PT\",\"language\":\"portugues\",\"languageCode\":\"pt\",\"countryCode\":\"PT\",\"localisedName\":\"Portugu\\u00eas\"},{\"locale\":\"ru_RU\",\"language\":\"russian\",\"languageCode\":\"ru\",\"countryCode\":\"RU\",\"localisedName\":\"\\u0420\\u0443\\u0441\\u0441\\u043a\\u0438\\u0439\"},{\"locale\":\"es_ES\",\"language\":\"spanish\",\"languageCode\":\"es\",\"countryCode\":\"ES\",\"localisedName\":\"Espa\\u00f1ol\"},{\"locale\":\"tr_TR\",\"language\":\"turkish\",\"languageCode\":\"tr\",\"countryCode\":\"TR\",\"localisedName\":\"T\\u00fcrk\\u00e7e\"}]}',1645333347),(5,'DatePickerVars_english','{\"today\":\"2022-02-19\",\"minYear\":2000,\"maxYear\":2060,\"dateRangeFormat\":\"DD\\/MM\\/YYYY\",\"dateTimeRangeFormat\":\"DD\\/MM\\/YYYY HH:mm\",\"dateRangePicker\":{\"months\":[\"January\",\"February\",\"March\",\"April\",\"May\",\"June\",\"July\",\"August\",\"September\",\"October\",\"November\",\"December\"],\"daysOfWeek\":[\"Su\",\"Mo\",\"Tu\",\"We\",\"Th\",\"Fr\",\"Sa\"],\"cancelLabel\":\"Clear\",\"applyLabel\":\"Apply\",\"customRangeLabel\":\"Custom\",\"defaultRanges\":{\"Today\":[\"19\\/02\\/2022 00:00\",\"19\\/02\\/2022 00:00\"],\"Yesterday\":[\"18\\/02\\/2022 00:00\",\"18\\/02\\/2022 00:00\"],\"Last 7 Days\":[\"13\\/02\\/2022 00:00\",\"19\\/02\\/2022 00:00\"],\"Last 30 Days\":[\"21\\/01\\/2022 00:00\",\"19\\/02\\/2022 00:00\"],\"This Month\":[\"01\\/02\\/2022 00:00\",\"28\\/02\\/2022 23:59\"],\"1 Month Ago\":[\"01\\/01\\/2022 00:00\",\"31\\/01\\/2022 23:59\"],\"This Year\":[\"01\\/01\\/2022 00:00\",\"31\\/12\\/2022 23:59\"],\"1 Year Ago\":[\"01\\/01\\/2021 00:00\",\"31\\/12\\/2021 23:59\"]},\"futureRanges\":{\"Today\":[\"19\\/02\\/2022 00:00\",\"19\\/02\\/2022 00:00\"],\"Tomorrow\":[\"20\\/02\\/2022 00:00\",\"20\\/02\\/2022 00:00\"],\"Next 7 Days\":[\"25\\/02\\/2022 00:00\",\"19\\/02\\/2022 00:00\"],\"Next 30 Days\":[\"20\\/03\\/2022 00:00\",\"19\\/02\\/2022 00:00\"],\"This Month\":[\"01\\/02\\/2022 00:00\",\"28\\/02\\/2022 23:59\"],\"1 Month From Now\":[\"01\\/03\\/2022 00:00\",\"31\\/03\\/2022 23:59\"],\"1 Year From Now\":[\"01\\/01\\/2022 00:00\",\"31\\/12\\/2022 23:59\"]},\"futureRangesTime\":{\"Today\":[\"19\\/02\\/2022 00:00\",\"19\\/02\\/2022 23:59\"],\"Tomorrow\":[\"20\\/02\\/2022 00:00\",\"20\\/02\\/2022 23:59\"],\"Next 7 Days\":[\"25\\/02\\/2022 00:00\",\"19\\/02\\/2022 23:59\"],\"Next 30 Days\":[\"20\\/03\\/2022 00:00\",\"19\\/02\\/2022 23:59\"],\"This Month\":[\"01\\/02\\/2022 00:00\",\"28\\/02\\/2022 23:59\"],\"1 Month From Now\":[\"01\\/03\\/2022 00:00\",\"31\\/03\\/2022 23:59\"],\"This Year\":[\"01\\/01\\/2022 00:00\",\"31\\/12\\/2022 23:59\"]},\"defaultSingleRanges\":{\"Today\":[\"19\\/02\\/2022 23:59\",\"19\\/02\\/2022 23:59\"],\"Yesterday\":[\"18\\/02\\/2022 23:59\",\"18\\/02\\/2022 23:59\"],\"7 Days Ago\":[\"12\\/02\\/2022 23:59\",\"12\\/02\\/2022 23:59\"],\"1 Month Ago\":[\"19\\/01\\/2022 23:59\",\"19\\/01\\/2022 23:59\"],\"1 Year Ago\":[\"19\\/02\\/2021 23:59\",\"19\\/02\\/2021 23:59\"]},\"futureSingleRanges\":{\"Today\":[\"19\\/02\\/2022 23:59\",\"19\\/02\\/2022 23:59\"],\"Tomorrow\":[\"20\\/02\\/2022 23:59\",\"20\\/02\\/2022 23:59\"],\"In 7 Days\":[\"26\\/02\\/2022 23:59\",\"26\\/02\\/2022 23:59\"],\"1 Month From Now\":[\"19\\/03\\/2022 23:59\",\"19\\/03\\/2022 23:59\"],\"1 Year From Now\":[\"19\\/02\\/2023 23:59\",\"19\\/02\\/2023 23:59\"]},\"futureTimeSingleRanges\":{\"Today\":[\"19\\/02\\/2022 00:00\",\"19\\/02\\/2022 00:00\"],\"Tomorrow\":[\"20\\/02\\/2022 00:00\",\"20\\/02\\/2022 00:00\"],\"In 7 Days\":[\"26\\/02\\/2022 00:00\",\"26\\/02\\/2022 00:00\"],\"1 Month From Now\":[\"19\\/03\\/2022 00:00\",\"19\\/03\\/2022 00:00\"],\"1 Year From Now\":[\"19\\/02\\/2023 00:00\",\"19\\/02\\/2023 00:00\"]}}}',1645333354),(6,'widget.Badges','{\"pendingOrders\":0,\"ticketsAwaitingReply\":0,\"cancellations\":0,\"moduleQueueCount\":0}',1645247073),(7,'widget.Automation','{\"result\":\"success\",\"currentDatetime\":\"2022-02-19 05:02:33\",\"lastDailyCronInvocationTime\":null,\"startdate\":\"2022-02-12 00:00:00\",\"enddate\":\"2022-02-19 23:59:59\",\"statistics\":[]}',1645250553),(8,'widget.Activity','{\"result\":\"success\",\"totalresults\":3,\"startnumber\":0,\"activity\":{\"entry\":[{\"id\":3,\"clientId\":0,\"userId\":0,\"adminId\":0,\"date\":\"2022-02-19 05:02:03\",\"description\":\"Updated URI Path Mode to: basic\",\"username\":\"System\",\"ipaddress\":\"\",\"userid\":0},{\"id\":2,\"clientId\":0,\"userId\":0,\"adminId\":0,\"date\":\"2022-02-19 05:02:03\",\"description\":\"URI Path Management Setting &quot;Rewrite Auto Management&quot; Enabled\",\"username\":\"System\",\"ipaddress\":\"\",\"userid\":0},{\"id\":1,\"clientId\":0,\"userId\":0,\"adminId\":0,\"date\":\"2022-02-19 05:02:03\",\"description\":\"Updated WHMCS Rewrite Rules: new rules applied.\",\"username\":\"System\",\"ipaddress\":\"\",\"userid\":0}]}}',1645250553),(9,'widget.Billing','{\"income\":{\"today\":\"$0.00\",\"thismonth\":\"$0.00\",\"thisyear\":\"$0.00\",\"alltime\":\"$0.00\"}}',1645250553),(10,'widget.MarketConnect','{\"isConfigured\":false,\"activeServices\":[]}',1645247313),(11,'widget.Staff','[{\"id\":1,\"adminusername\":\"admin\",\"logintime\":\"2022-02-19 05:02:33\",\"logouttime\":\"0000-00-00 00:00:00\",\"ipaddress\":\"91.96.93.36\",\"sessionid\":\"aov4mluaj8rnvlndurg2lpn179\",\"lastvisit\":\"2022-02-19 05:02:33\",\"admin\":{\"id\":1,\"uuid\":\"d6280735-f9bc-4769-b73d-761dde537595\",\"roleid\":1,\"username\":\"admin\",\"authmodule\":\"\",\"firstname\":\"Pascal\",\"lastname\":\"Leenders\",\"email\":\"p.leenders@lchcloud.de\",\"signature\":\"\",\"notes\":\"Welcome to WHMCS!  Please ensure you have setup the cron job to automate tasks\",\"template\":\"blend\",\"language\":\"\",\"disabled\":0,\"loginattempts\":0,\"supportdepts\":\",\",\"ticketnotifications\":\"\",\"homewidgets\":\"getting_started:true,orders_overview:true,supporttickets_overview:true,my_notes:true,client_activity:true,open_invoices:true,activity_log:true|income_overview:true,system_overview:true,whmcs_news:true,sysinfo:true,admin_activity:true,todo_list:true,network_status:true,income_forecast:true|\",\"hidden_widgets\":\"\",\"widget_order\":\"\",\"user_preferences\":null,\"created_at\":\"0000-00-00 00:00:00\",\"updated_at\":\"0000-00-00 00:00:00\",\"fullName\":\"Pascal Leenders\",\"gravatarHash\":\"b1b515df3fe1cfb19e24620a40e90a2c\"}}]',1645247082),(12,'widget.ClientActivity','{\"activeCount\":0,\"onlineCount\":0,\"recentActiveClients\":[]}',1645247253),(13,'widget.NetworkStatus','{\"result\":\"success\",\"servers\":[],\"fetchStatus\":\"\"}',1645250553),(14,'widget.Health','{\"result\":\"success\",\"checks\":{\"success\":[{\"name\":\"version\",\"type\":\"WHMCS\",\"severityLevel\":\"notice\",\"body\":\"You are up to date!\"},{\"name\":\"webserverSupportCheck\",\"type\":\"WHMCS\",\"severityLevel\":\"notice\",\"body\":\"Your system is running \\\"Apache\\\" web server.\"},{\"name\":\"checkTicketMask\",\"type\":\"WHMCS\",\"severityLevel\":\"notice\",\"body\":\"Your support ticket mask can create approximately 17576000000 possible ticket numbers, of which 0% are in use. \"},{\"name\":\"dbVersion\",\"type\":\"DB\",\"severityLevel\":\"notice\",\"body\":\"You are running MariaDB version 10.3.3200.20.04.1. This version supports all features required for full compatibility with WHMCS.\"},{\"name\":\"curlSecureTLS\",\"type\":\"WHMCS\",\"severityLevel\":\"notice\",\"body\":\"<p>cURL reports that it does support Secure TLS 1.1 and 1.2<\\/p>\"},{\"name\":\"curlSSL\",\"type\":\"WHMCS\",\"severityLevel\":\"notice\",\"body\":\"<p>cURL reports that it does support SSL<\\/p>\"},{\"name\":\"installedCurlVersion\",\"type\":\"PHP\",\"severityLevel\":\"notice\",\"body\":\"You currently have version <strong>7.68.0<\\/strong> of cURL installed. This version uses a secure cipher list.\"},{\"name\":\"requiredPhpFunctions\",\"type\":\"PHP\",\"severityLevel\":\"notice\",\"body\":\"<p>Your PHP installation has all required functions enabled for WHMCS to operate.<\\/p>\"},{\"name\":\"phpMemoryLimit\",\"type\":\"PHP\",\"severityLevel\":\"notice\",\"body\":\"Your PHP memory_limit value <strong>128M<\\/strong> meets the recommended value of 128M.\"},{\"name\":\"directoryConfigurationsCheck\",\"type\":\"WHMCS\",\"severityLevel\":\"notice\",\"body\":\"All local application storage paths are configured properly and are accessible.\"},{\"name\":\"recommendedPhpExtensions\",\"type\":\"PHP\",\"severityLevel\":\"notice\",\"body\":\"<p>Your PHP installation has all recommended extensions loaded and enabled required by certain modules and addons of WHMCS.<\\/p>\"},{\"name\":\"requiredPhpExtensions\",\"type\":\"PHP\",\"severityLevel\":\"notice\",\"body\":\"<p>Your PHP installation has all extensions loaded and enabled required for WHMCS to operate.<\\/p>\"},{\"name\":\"errorLevels\",\"type\":\"PHP\",\"severityLevel\":\"notice\",\"body\":\"Your system is setup to not log unnecessary error levels.\"},{\"name\":\"errorDisplay\",\"type\":\"PHP\",\"severityLevel\":\"notice\",\"body\":\"Your system is not currently set to display errors.\"},{\"name\":\"sensitiveDirsCheck\",\"type\":\"WHMCS\",\"severityLevel\":\"notice\",\"body\":\"Sensitive directories cannot be accessed from the web.\"},{\"name\":\"checkMissedAsyncJobs\",\"type\":\"WHMCS\",\"severityLevel\":\"notice\",\"body\":\"Event handling is functioning normally.\"}],\"warning\":[{\"name\":\"checkCustomFields\",\"type\":\"WHMCS\",\"severityLevel\":\"warning\",\"body\":\"<p>Customising the default directory paths for some parts of WHMCS makes it more difficult for malicious users to find them. Your installation is currently using the following default paths:<\\/p><ul><li><strong>attachments<\\/strong><\\/li><li><strong>downloads<\\/strong><\\/li><li><strong>templates_c<\\/strong><\\/li><li><strong>crons<\\/strong><\\/li><\\/ul><p>Please refer to our <a href=\\\"https:\\/\\/docs.whmcs.com\\/Further_Security_Steps\\\">Further Security Steps<\\/a> for information on how to change these.<\\/p>\"},{\"name\":\"CheckUpdaterRequirements\",\"type\":\"WHMCS\",\"severityLevel\":\"warning\",\"body\":\"<ul><li>Automatic Updates require a writeable directory for staging files during an update. You must provide a directory via the Updater Configuration before you can update.<\\/li><\\/ul>\"},{\"name\":\"usingCustomTemplates\",\"type\":\"WHMCS\",\"severityLevel\":\"warning\",\"body\":\"<p>We have detected that your WHMCS installation is currently using the default template names for one or more of the active templates. If you have made any customisations, we strongly recommend creating a custom template directory to avoid losing your customisations the next time you upgrade.<br \\/><br \\/>You are currently using a default template in the following locations:<\\/p><ul><li><strong>Cart<\\/strong><\\/li><\\/ul><p>Please review our <a href=\\\"https:\\/\\/docs.whmcs.com\\/Client_Area_Template_Files#Creating_a_Custom_Template\\\">documentation<\\/a> on making a custom theme for help doing this.<\\/p>\"},{\"name\":\"phpVersion\",\"type\":\"PHP\",\"severityLevel\":\"warning\",\"body\":\"<p>Your PHP version <strong>7.4.27<\\/strong> is supported by WHMCS. <\\/p><p>The PHP 7.4 branch no longer receives regular bug fixes and will only receive critical security updates until it reaches its end of life. Please see <a href=\\\"https:\\/\\/docs.whmcs.com\\/System_Environment_Guide#PHP_Version\\\">our documentation<\\/a> for more information.<\\/p>\"},{\"name\":\"siteSslSupport\",\"type\":\"HTTP\",\"severityLevel\":\"warning\",\"body\":\"A Certificate Authority verified SSL certificate was not detected on https:\\/\\/scp.lchcloud.de\\/.  This will prevent some features, such as OpenID Connect, from functioning.  This may also affect your ability to receive PCI or other accreditation. <a class=\\\"autoLinked\\\" href=\\\"https:\\/\\/go.whmcs.com\\/1341\\/get-ssl-certificate\\\">Purchase an SSL Certificate here.<\\/a>\"}],\"danger\":[{\"name\":\"sessionSupport\",\"type\":\"PHP\",\"severityLevel\":\"error\",\"body\":\"<p>PHP session support is enabled.<\\/p><p>Session autostart is disabled.<\\/p><p>The PHP session save path <strong>\\/var\\/lib\\/php\\/sessions<\\/strong> is not writable. Please investigate the <strong>session.save_path<\\/strong> PHP setting or contact your system administrator<\\/p>\"},{\"name\":\"permissionCheck\",\"type\":\"WHMCS\",\"severityLevel\":\"error\",\"body\":\"<p>Your configuration file is writable. This can be a security risk. We recommend setting the permissions to read only.<\\/p>You can learn more about this in our <a href=\\\"https:\\/\\/docs.whmcs.com\\/Further_Security_Steps#Secure_the_Writeable_Directories\\\">documentation<\\/a>.\"},{\"name\":\"phpSettings\",\"type\":\"PHP\",\"severityLevel\":\"error\",\"body\":\"Your PHP environment does not have a valid timezone setting. Please set date.timezone in php.ini to ensure correct date and time processing. If date.timezone is set in php.ini and this warning is still shown, please check the spelling of the timezone identifier. Please refer to our <a href=\\\"https:\\/\\/docs.whmcs.com\\/Changing_Timezone\\\" class=\\\"autoLinked\\\">documentation<\\/a> for more information.\"}]}}',1645250553),(15,'widget.Support:1','{\"tickets\":{\"counts\":{\"result\":\"success\",\"filteredDepartments\":[],\"allActive\":0,\"awaitingReply\":0,\"flaggedTickets\":0},\"recent\":[]}}',1645247073),(16,'WHMCS\\Language\\ClientLanguageLocales','{\"hash\":\"1a5852cff3a5895f4137334d4a3d1b93\",\"locales\":[{\"locale\":\"ar_AR\",\"language\":\"arabic\",\"languageCode\":\"ar\",\"countryCode\":\"AR\",\"localisedName\":\"\\u0627\\u0644\\u0639\\u0631\\u0628\\u064a\\u0629\"},{\"locale\":\"az_AZ\",\"language\":\"azerbaijani\",\"languageCode\":\"az\",\"countryCode\":\"AZ\",\"localisedName\":\"Azerbaijani\"},{\"locale\":\"ca_AD\",\"language\":\"catalan\",\"languageCode\":\"ca\",\"countryCode\":\"AD\",\"localisedName\":\"Catal\\u00e0\"},{\"locale\":\"zh_TW\",\"language\":\"chinese\",\"languageCode\":\"zh\",\"countryCode\":\"TW\",\"localisedName\":\"\\u4e2d\\u6587\"},{\"locale\":\"hr_HR\",\"language\":\"croatian\",\"languageCode\":\"hr\",\"countryCode\":\"HR\",\"localisedName\":\"Hrvatski\"},{\"locale\":\"cs_CZ\",\"language\":\"czech\",\"languageCode\":\"cs\",\"countryCode\":\"CZ\",\"localisedName\":\"\\u010ce\\u0161tina\"},{\"locale\":\"da_DK\",\"language\":\"danish\",\"languageCode\":\"da\",\"countryCode\":\"DK\",\"localisedName\":\"Dansk\"},{\"locale\":\"nl_NL\",\"language\":\"dutch\",\"languageCode\":\"nl\",\"countryCode\":\"NL\",\"localisedName\":\"Nederlands\"},{\"locale\":\"en_GB\",\"language\":\"english\",\"languageCode\":\"en\",\"countryCode\":\"GB\",\"localisedName\":\"English\"},{\"locale\":\"et_EE\",\"language\":\"estonian\",\"languageCode\":\"et\",\"countryCode\":\"EE\",\"localisedName\":\"Estonian\"},{\"locale\":\"fa_IR\",\"language\":\"farsi\",\"languageCode\":\"fa\",\"countryCode\":\"IR\",\"localisedName\":\"Persian\"},{\"locale\":\"fr_FR\",\"language\":\"french\",\"languageCode\":\"fr\",\"countryCode\":\"FR\",\"localisedName\":\"Fran\\u00e7ais\"},{\"locale\":\"de_DE\",\"language\":\"german\",\"languageCode\":\"de\",\"countryCode\":\"DE\",\"localisedName\":\"Deutsch\"},{\"locale\":\"he_IL\",\"language\":\"hebrew\",\"languageCode\":\"he\",\"countryCode\":\"IL\",\"localisedName\":\"\\u05e2\\u05d1\\u05e8\\u05d9\\u05ea\"},{\"locale\":\"hu_HU\",\"language\":\"hungarian\",\"languageCode\":\"hu\",\"countryCode\":\"HU\",\"localisedName\":\"Magyar\"},{\"locale\":\"it_IT\",\"language\":\"italian\",\"languageCode\":\"it\",\"countryCode\":\"IT\",\"localisedName\":\"Italiano\"},{\"locale\":\"mk_MK\",\"language\":\"macedonian\",\"languageCode\":\"mk\",\"countryCode\":\"MK\",\"localisedName\":\"Macedonian\"},{\"locale\":\"no_NO\",\"language\":\"norwegian\",\"languageCode\":\"no\",\"countryCode\":\"NO\",\"localisedName\":\"Norwegian\"},{\"locale\":\"pt_BR\",\"language\":\"portuguese-br\",\"languageCode\":\"pt\",\"countryCode\":\"BR\",\"localisedName\":\"Portugu\\u00eas\"},{\"locale\":\"pt_PT\",\"language\":\"portuguese-pt\",\"languageCode\":\"pt\",\"countryCode\":\"PT\",\"localisedName\":\"Portugu\\u00eas\"},{\"locale\":\"ro_RO\",\"language\":\"romanian\",\"languageCode\":\"ro\",\"countryCode\":\"RO\",\"localisedName\":\"Rom\\u00e2n\\u0103\"},{\"locale\":\"ru_RU\",\"language\":\"russian\",\"languageCode\":\"ru\",\"countryCode\":\"RU\",\"localisedName\":\"\\u0420\\u0443\\u0441\\u0441\\u043a\\u0438\\u0439\"},{\"locale\":\"es_ES\",\"language\":\"spanish\",\"languageCode\":\"es\",\"countryCode\":\"ES\",\"localisedName\":\"Espa\\u00f1ol\"},{\"locale\":\"sv_SE\",\"language\":\"swedish\",\"languageCode\":\"sv\",\"countryCode\":\"SE\",\"localisedName\":\"Svenska\"},{\"locale\":\"tr_TR\",\"language\":\"turkish\",\"languageCode\":\"tr\",\"countryCode\":\"TR\",\"localisedName\":\"T\\u00fcrk\\u00e7e\"},{\"locale\":\"uk_UA\",\"language\":\"ukranian\",\"languageCode\":\"uk\",\"countryCode\":\"UA\",\"localisedName\":\"\\u0423\\u043a\\u0440\\u0430\\u0457\\u043d\\u0441\\u044c\\u043a\\u0430\"}]}',1645333414);
/*!40000 ALTER TABLE `tbltransientdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblupdatehistory`
--

DROP TABLE IF EXISTS `tblupdatehistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblupdatehistory` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) NOT NULL,
  `original_version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `new_version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `success` tinyint(1) NOT NULL,
  `message` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblupdatehistory`
--

LOCK TABLES `tblupdatehistory` WRITE;
/*!40000 ALTER TABLE `tblupdatehistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblupdatehistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblupdatelog`
--

DROP TABLE IF EXISTS `tblupdatelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblupdatelog` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `instance_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `level` int(10) unsigned NOT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `extra` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblupdatelog`
--

LOCK TABLES `tblupdatelog` WRITE;
/*!40000 ALTER TABLE `tblupdatelog` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblupdatelog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblupgrades`
--

DROP TABLE IF EXISTS `tblupgrades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblupgrades` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `userid` int(10) NOT NULL,
  `orderid` int(10) NOT NULL,
  `type` enum('service','addon','package','configoptions') COLLATE utf8_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `relid` int(10) NOT NULL,
  `originalvalue` text COLLATE utf8_unicode_ci NOT NULL,
  `newvalue` text COLLATE utf8_unicode_ci NOT NULL,
  `new_cycle` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `amount` decimal(16,2) NOT NULL,
  `credit_amount` decimal(16,2) NOT NULL,
  `days_remaining` int(4) NOT NULL,
  `total_days_in_cycle` int(4) NOT NULL,
  `new_recurring_amount` decimal(16,2) NOT NULL,
  `recurringchange` decimal(16,2) NOT NULL,
  `status` enum('Pending','Completed') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Pending',
  `paid` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`id`),
  KEY `orderid` (`orderid`),
  KEY `serviceid` (`relid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblupgrades`
--

LOCK TABLES `tblupgrades` WRITE;
/*!40000 ALTER TABLE `tblupgrades` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblupgrades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblusage_items`
--

DROP TABLE IF EXISTS `tblusage_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblusage_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rel_type` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `rel_id` int(11) NOT NULL DEFAULT 0,
  `module_type` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `module` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `metric` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `included` decimal(19,6) NOT NULL DEFAULT 0.000000,
  `is_hidden` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tblusage_items_rel_type_id` (`rel_type`,`rel_id`),
  KEY `tblusage_items_module_type` (`module_type`),
  KEY `tblusage_items_module` (`module`),
  KEY `tblusage_items_metric` (`metric`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblusage_items`
--

LOCK TABLES `tblusage_items` WRITE;
/*!40000 ALTER TABLE `tblusage_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblusage_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbluser_invites`
--

DROP TABLE IF EXISTS `tbluser_invites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbluser_invites` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `token` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `client_id` int(10) unsigned NOT NULL DEFAULT 0,
  `invited_by` int(10) unsigned NOT NULL DEFAULT 0,
  `invited_by_admin` tinyint(4) NOT NULL DEFAULT 0,
  `permissions` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `accepted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbluser_invites`
--

LOCK TABLES `tbluser_invites` WRITE;
/*!40000 ALTER TABLE `tbluser_invites` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbluser_invites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbluser_validation`
--

DROP TABLE IF EXISTS `tbluser_validation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbluser_validation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `requestor_id` int(10) unsigned DEFAULT NULL,
  `token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `submitted_at` timestamp NULL DEFAULT NULL,
  `reviewed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbluser_validation`
--

LOCK TABLES `tbluser_validation` WRITE;
/*!40000 ALTER TABLE `tbluser_validation` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbluser_validation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblusers`
--

DROP TABLE IF EXISTS `tblusers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblusers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `last_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `language` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `second_factor` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `second_factor_config` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `reset_token` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `security_question_id` int(10) unsigned NOT NULL DEFAULT 0,
  `security_question_answer` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `last_ip` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `last_hostname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `last_login` timestamp NULL DEFAULT NULL,
  `email_verification_token` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `email_verification_token_expiry` timestamp NULL DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `reset_token_expiry` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tblusers_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblusers`
--

LOCK TABLES `tblusers` WRITE;
/*!40000 ALTER TABLE `tblusers` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblusers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblusers_clients`
--

DROP TABLE IF EXISTS `tblusers_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblusers_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `auth_user_id` int(10) unsigned NOT NULL DEFAULT 0,
  `client_id` int(10) unsigned NOT NULL DEFAULT 0,
  `invite_id` int(10) unsigned NOT NULL DEFAULT 0,
  `owner` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `permissions` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id_client_id` (`auth_user_id`,`client_id`),
  KEY `client_id_owner_idx` (`client_id`,`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblusers_clients`
--

LOCK TABLES `tblusers_clients` WRITE;
/*!40000 ALTER TABLE `tblusers_clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblusers_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblwhoislog`
--

DROP TABLE IF EXISTS `tblwhoislog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblwhoislog` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `domain` text COLLATE utf8_unicode_ci NOT NULL,
  `ip` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblwhoislog`
--

LOCK TABLES `tblwhoislog` WRITE;
/*!40000 ALTER TABLE `tblwhoislog` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblwhoislog` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-19  5:03:51
