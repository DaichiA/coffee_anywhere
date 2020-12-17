-- MySQL dump 10.13  Distrib 8.0.22, for osx10.15 (x86_64)
--
-- Host: us-cdbr-east-02.cleardb.com    Database: heroku_71c22a96d8af520
-- ------------------------------------------------------
-- Server version	5.5.62-log

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
-- Table structure for table `active_storage_attachments`
--

DROP TABLE IF EXISTS `active_storage_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `active_storage_attachments` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `record_type` varchar(255) NOT NULL,
  `record_id` bigint(20) NOT NULL,
  `blob_id` bigint(20) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_active_storage_attachments_uniqueness` (`record_type`,`record_id`,`name`,`blob_id`),
  KEY `index_active_storage_attachments_on_blob_id` (`blob_id`),
  CONSTRAINT `fk_rails_c3b3935057` FOREIGN KEY (`blob_id`) REFERENCES `active_storage_blobs` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=251 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `active_storage_attachments`
--

LOCK TABLES `active_storage_attachments` WRITE;
/*!40000 ALTER TABLE `active_storage_attachments` DISABLE KEYS */;
INSERT INTO `active_storage_attachments` VALUES (31,'image','User',11,31,'2020-11-11 11:12:40'),(61,'image','Shop',1,61,'2020-11-29 09:40:46'),(71,'image','Shop',11,71,'2020-11-29 09:56:01'),(81,'image','Shop',31,81,'2020-11-29 11:27:19'),(91,'image','Shop',41,91,'2020-11-29 11:36:42'),(101,'image','Shop',51,101,'2020-11-29 11:46:12'),(111,'image','Shop',61,111,'2020-11-29 12:36:49'),(121,'image','Shop',71,121,'2020-11-29 12:41:19'),(131,'image','Shop',81,131,'2020-11-29 12:46:09'),(141,'image','Shop',91,141,'2020-11-29 12:50:09'),(151,'image','Shop',101,151,'2020-11-29 12:54:42'),(161,'image','Shop',111,161,'2020-11-30 01:35:01'),(171,'image','Shop',121,171,'2020-11-30 02:02:49'),(181,'image','Shop',131,181,'2020-11-30 02:43:25'),(191,'image','Shop',141,191,'2020-11-30 02:47:52'),(201,'image','Shop',151,201,'2020-11-30 02:55:58'),(211,'image','Shop',161,211,'2020-11-30 03:00:52'),(221,'image','Shop',171,221,'2020-11-30 03:08:50'),(231,'image','Shop',181,231,'2020-11-30 03:13:31'),(241,'image','User',371,241,'2020-11-30 10:04:50');
/*!40000 ALTER TABLE `active_storage_attachments` ENABLE KEYS */;
UNLOCK TABLES;
