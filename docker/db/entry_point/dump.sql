-- MySQL dump 10.13  Distrib 5.7.29, for osx10.15 (x86_64)
--
-- Host: 127.0.0.1    Database: badgr
-- ------------------------------------------------------
-- Server version	5.7.28

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
-- Current Database: `badgr`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `badgr` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `badgr`;

--
-- Table structure for table `account_emailaddress`
--

DROP TABLE IF EXISTS `account_emailaddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_emailaddress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `account_emailaddress_user_id_2c513194_fk_users_id` (`user_id`),
  CONSTRAINT `account_emailaddress_user_id_2c513194_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_emailaddress`
--

LOCK TABLES `account_emailaddress` WRITE;
/*!40000 ALTER TABLE `account_emailaddress` DISABLE KEYS */;
INSERT INTO `account_emailaddress` VALUES (1,'badgradmin@localhost',1,1,1),(4,'badgruser@localhost.local',1,1,4);
/*!40000 ALTER TABLE `account_emailaddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_emailconfirmation`
--

DROP TABLE IF EXISTS `account_emailconfirmation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_emailconfirmation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `sent` datetime(6) DEFAULT NULL,
  `key` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `email_address_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`),
  KEY `account_emailconfirm_email_address_id_5b7f8c58_fk_account_e` (`email_address_id`),
  CONSTRAINT `account_emailconfirm_email_address_id_5b7f8c58_fk_account_e` FOREIGN KEY (`email_address_id`) REFERENCES `account_emailaddress` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_emailconfirmation`
--

LOCK TABLES `account_emailconfirmation` WRITE;
/*!40000 ALTER TABLE `account_emailconfirmation` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_emailconfirmation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=172 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add Blacklisted email',1,'add_emailblacklist'),(2,'Can change Blacklisted email',1,'change_emailblacklist'),(3,'Can delete Blacklisted email',1,'delete_emailblacklist'),(4,'Can add application info',2,'add_applicationinfo'),(5,'Can change application info',2,'change_applicationinfo'),(6,'Can delete application info',2,'delete_applicationinfo'),(7,'Can add Legacy token',3,'add_legacytokenproxy'),(8,'Can change Legacy token',3,'change_legacytokenproxy'),(9,'Can delete Legacy token',3,'delete_legacytokenproxy'),(10,'Can add access token',4,'add_accesstokenproxy'),(11,'Can change access token',4,'change_accesstokenproxy'),(12,'Can delete access token',4,'delete_accesstokenproxy'),(13,'Can add badgr app',5,'add_badgrapp'),(14,'Can change badgr app',5,'change_badgrapp'),(15,'Can delete badgr app',5,'delete_badgrapp'),(16,'Can add access token scope',6,'add_accesstokenscope'),(17,'Can change access token scope',6,'change_accesstokenscope'),(18,'Can delete access token scope',6,'delete_accesstokenscope'),(19,'Can add group',9,'add_group'),(20,'Can change group',9,'change_group'),(21,'Can delete group',9,'delete_group'),(22,'Can add permission',10,'add_permission'),(23,'Can change permission',10,'change_permission'),(24,'Can delete permission',10,'delete_permission'),(25,'Can add content type',11,'add_contenttype'),(26,'Can change content type',11,'change_contenttype'),(27,'Can delete content type',11,'delete_contenttype'),(28,'Can add session',12,'add_session'),(29,'Can change session',12,'change_session'),(30,'Can delete session',12,'delete_session'),(31,'Can add site',13,'add_site'),(32,'Can change site',13,'change_site'),(33,'Can delete site',13,'delete_site'),(34,'Can add log entry',14,'add_logentry'),(35,'Can change log entry',14,'change_logentry'),(36,'Can delete log entry',14,'delete_logentry'),(37,'Can add email confirmation',15,'add_proxyemailconfirmation'),(38,'Can change email confirmation',15,'change_proxyemailconfirmation'),(39,'Can delete email confirmation',15,'delete_proxyemailconfirmation'),(40,'Can add email address variant',16,'add_emailaddressvariant'),(41,'Can change email address variant',16,'change_emailaddressvariant'),(42,'Can delete email address variant',16,'delete_emailaddressvariant'),(43,'Can add terms agreement',17,'add_termsagreement'),(44,'Can change terms agreement',17,'change_termsagreement'),(45,'Can delete terms agreement',17,'delete_termsagreement'),(46,'Can add user recipient identifier',18,'add_userrecipientidentifier'),(47,'Can change user recipient identifier',18,'change_userrecipientidentifier'),(48,'Can delete user recipient identifier',18,'delete_userrecipientidentifier'),(49,'Can add badge user',19,'add_badgeuser'),(50,'Can change badge user',19,'change_badgeuser'),(51,'Can delete badge user',19,'delete_badgeuser'),(52,'Can add terms version',20,'add_termsversion'),(53,'Can change terms version',20,'change_termsversion'),(54,'Can delete terms version',20,'delete_termsversion'),(55,'Can add email address',21,'add_cachedemailaddress'),(56,'Can change email address',21,'change_cachedemailaddress'),(57,'Can delete email address',21,'delete_cachedemailaddress'),(58,'Can add email confirmation',15,'add_emailconfirmation'),(59,'Can change email confirmation',15,'change_emailconfirmation'),(60,'Can delete email confirmation',15,'delete_emailconfirmation'),(61,'Can add email address',21,'add_emailaddress'),(62,'Can change email address',21,'change_emailaddress'),(63,'Can delete email address',21,'delete_emailaddress'),(64,'Can add social application',24,'add_socialapp'),(65,'Can change social application',24,'change_socialapp'),(66,'Can delete social application',24,'delete_socialapp'),(67,'Can add social application token',25,'add_socialtoken'),(68,'Can change social application token',25,'change_socialtoken'),(69,'Can delete social application token',25,'delete_socialtoken'),(70,'Can add social account',26,'add_socialaccount'),(71,'Can change social account',26,'change_socialaccount'),(72,'Can delete social account',26,'delete_socialaccount'),(73,'Can add saml2 configuration',27,'add_saml2configuration'),(74,'Can change saml2 configuration',27,'change_saml2configuration'),(75,'Can delete saml2 configuration',27,'delete_saml2configuration'),(76,'Can add saml2 account',28,'add_saml2account'),(77,'Can change saml2 account',28,'change_saml2account'),(78,'Can delete saml2 account',28,'delete_saml2account'),(79,'Can add cors model',29,'add_corsmodel'),(80,'Can change cors model',29,'change_corsmodel'),(81,'Can delete cors model',29,'delete_corsmodel'),(82,'Can add Token',3,'add_token'),(83,'Can change Token',3,'change_token'),(84,'Can delete Token',3,'delete_token'),(85,'Can add task result',30,'add_taskresult'),(86,'Can change task result',30,'change_taskresult'),(87,'Can delete task result',30,'delete_taskresult'),(88,'Can add grant',31,'add_grant'),(89,'Can change grant',31,'change_grant'),(90,'Can delete grant',31,'delete_grant'),(91,'Can add access token',4,'add_accesstoken'),(92,'Can change access token',4,'change_accesstoken'),(93,'Can delete access token',4,'delete_accesstoken'),(94,'Can add application',32,'add_application'),(95,'Can change application',32,'change_application'),(96,'Can delete application',32,'delete_application'),(97,'Can add refresh token',33,'add_refreshtoken'),(98,'Can change refresh token',33,'change_refreshtoken'),(99,'Can delete refresh token',33,'delete_refreshtoken'),(100,'Can add issuer staff',34,'add_issuerstaff'),(101,'Can change issuer staff',34,'change_issuerstaff'),(102,'Can delete issuer staff',34,'delete_issuerstaff'),(103,'Can add badge instance baked image',35,'add_badgeinstancebakedimage'),(104,'Can change badge instance baked image',35,'change_badgeinstancebakedimage'),(105,'Can delete badge instance baked image',35,'delete_badgeinstancebakedimage'),(106,'Can add badge class tag',36,'add_badgeclasstag'),(107,'Can change badge class tag',36,'change_badgeclasstag'),(108,'Can delete badge class tag',36,'delete_badgeclasstag'),(109,'Can add badge instance',37,'add_badgeinstance'),(110,'Can change badge instance',37,'change_badgeinstance'),(111,'Can delete badge instance',37,'delete_badgeinstance'),(112,'Can add badge instance evidence',38,'add_badgeinstanceevidence'),(113,'Can change badge instance evidence',38,'change_badgeinstanceevidence'),(114,'Can delete badge instance evidence',38,'delete_badgeinstanceevidence'),(115,'Can add issuer',39,'add_issuer'),(116,'Can change issuer',39,'change_issuer'),(117,'Can delete issuer',39,'delete_issuer'),(118,'Can add issuer extension',40,'add_issuerextension'),(119,'Can change issuer extension',40,'change_issuerextension'),(120,'Can delete issuer extension',40,'delete_issuerextension'),(121,'Can add badge class extension',41,'add_badgeclassextension'),(122,'Can change badge class extension',41,'change_badgeclassextension'),(123,'Can delete badge class extension',41,'delete_badgeclassextension'),(124,'Can add badge instance extension',42,'add_badgeinstanceextension'),(125,'Can change badge instance extension',42,'change_badgeinstanceextension'),(126,'Can delete badge instance extension',42,'delete_badgeinstanceextension'),(127,'Can add badge class',43,'add_badgeclass'),(128,'Can change badge class',43,'change_badgeclass'),(129,'Can delete badge class',43,'delete_badgeclass'),(130,'Can add badge class alignment',44,'add_badgeclassalignment'),(131,'Can change badge class alignment',44,'change_badgeclassalignment'),(132,'Can delete badge class alignment',44,'delete_badgeclassalignment'),(133,'Can add backpack collection',45,'add_backpackcollection'),(134,'Can change backpack collection',45,'change_backpackcollection'),(135,'Can delete backpack collection',45,'delete_backpackcollection'),(136,'Can add backpack badge share',46,'add_backpackbadgeshare'),(137,'Can change backpack badge share',46,'change_backpackbadgeshare'),(138,'Can delete backpack badge share',46,'delete_backpackbadgeshare'),(139,'Can add backpack collection share',47,'add_backpackcollectionshare'),(140,'Can change backpack collection share',47,'change_backpackcollectionshare'),(141,'Can delete backpack collection share',47,'delete_backpackcollectionshare'),(142,'Can add backpack collection badge instance',48,'add_backpackcollectionbadgeinstance'),(143,'Can change backpack collection badge instance',48,'change_backpackcollectionbadgeinstance'),(144,'Can delete backpack collection badge instance',48,'delete_backpackcollectionbadgeinstance'),(145,'Can add pathway element',49,'add_pathwayelement'),(146,'Can change pathway element',49,'change_pathwayelement'),(147,'Can delete pathway element',49,'delete_pathwayelement'),(148,'Can add pathway',50,'add_pathway'),(149,'Can change pathway',50,'change_pathway'),(150,'Can delete pathway',50,'delete_pathway'),(151,'Can add pathway element badge',51,'add_pathwayelementbadge'),(152,'Can change pathway element badge',51,'change_pathwayelementbadge'),(153,'Can delete pathway element badge',51,'delete_pathwayelementbadge'),(154,'Can add recipient profile',52,'add_recipientprofile'),(155,'Can change recipient profile',52,'change_recipientprofile'),(156,'Can delete recipient profile',52,'delete_recipientprofile'),(157,'Can add recipient group',53,'add_recipientgroup'),(158,'Can change recipient group',53,'change_recipientgroup'),(159,'Can delete recipient group',53,'delete_recipientgroup'),(160,'Can add recipient group membership',54,'add_recipientgroupmembership'),(161,'Can change recipient group membership',54,'change_recipientgroupmembership'),(162,'Can delete recipient group membership',54,'delete_recipientgroupmembership'),(163,'Can add external tool launchpoint',55,'add_externaltoollaunchpoint'),(164,'Can change external tool launchpoint',55,'change_externaltoollaunchpoint'),(165,'Can delete external tool launchpoint',55,'delete_externaltoollaunchpoint'),(166,'Can add external tool',56,'add_externaltool'),(167,'Can change external tool',56,'change_externaltool'),(168,'Can delete external tool',56,'delete_externaltool'),(169,'Can add external tool user activation',57,'add_externaltooluseractivation'),(170,'Can change external tool user activation',57,'change_externaltooluseractivation'),(171,'Can delete external tool user activation',57,'delete_externaltooluseractivation');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authtoken_token`
--

DROP TABLE IF EXISTS `authtoken_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authtoken_token` (
  `key` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `authtoken_token_user_id_35299eff_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authtoken_token`
--

LOCK TABLES `authtoken_token` WRITE;
/*!40000 ALTER TABLE `authtoken_token` DISABLE KEYS */;
INSERT INTO `authtoken_token` VALUES ('32ab788caef92326dc26cf602ec7869163a0fd52','2020-01-21 03:17:01.093007',1),('7af3aacfd9192adc8b08ebe7d65c2558314ebd26','2020-01-21 04:02:15.743065',4);
/*!40000 ALTER TABLE `authtoken_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `backpack_backpackbadgeshare`
--

DROP TABLE IF EXISTS `backpack_backpackbadgeshare`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backpack_backpackbadgeshare` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `provider` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  `badgeinstance_id` int(11) DEFAULT NULL,
  `source` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `backpack_backpackbad_badgeinstance_id_5e56649d_fk_issuer_ba` (`badgeinstance_id`),
  CONSTRAINT `backpack_backpackbad_badgeinstance_id_5e56649d_fk_issuer_ba` FOREIGN KEY (`badgeinstance_id`) REFERENCES `issuer_badgeinstance` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backpack_backpackbadgeshare`
--

LOCK TABLES `backpack_backpackbadgeshare` WRITE;
/*!40000 ALTER TABLE `backpack_backpackbadgeshare` DISABLE KEYS */;
/*!40000 ALTER TABLE `backpack_backpackbadgeshare` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `backpack_backpackcollection`
--

DROP TABLE IF EXISTS `backpack_backpackcollection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backpack_backpackcollection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_version` int(10) unsigned NOT NULL,
  `entity_id` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `name` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `share_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(254) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `updated_at` datetime(6) NOT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entity_id` (`entity_id`),
  KEY `backpack_backpackcollection_created_by_id_a2fe4371_fk_users_id` (`created_by_id`),
  KEY `backpack_backpackcollection_updated_by_id_d52c73c8_fk_users_id` (`updated_by_id`),
  KEY `backpack_backpackcollection_created_at_c482fc1d` (`created_at`),
  KEY `backpack_backpackcollection_updated_at_c0a96721` (`updated_at`),
  CONSTRAINT `backpack_backpackcollection_created_by_id_a2fe4371_fk_users_id` FOREIGN KEY (`created_by_id`) REFERENCES `users` (`id`),
  CONSTRAINT `backpack_backpackcollection_updated_by_id_d52c73c8_fk_users_id` FOREIGN KEY (`updated_by_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backpack_backpackcollection`
--

LOCK TABLES `backpack_backpackcollection` WRITE;
/*!40000 ALTER TABLE `backpack_backpackcollection` DISABLE KEYS */;
/*!40000 ALTER TABLE `backpack_backpackcollection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `backpack_backpackcollectionbadgeinstance`
--

DROP TABLE IF EXISTS `backpack_backpackcollectionbadgeinstance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backpack_backpackcollectionbadgeinstance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `badgeinstance_id` int(11) NOT NULL,
  `collection_id` int(11) NOT NULL,
  `badgeuser_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `backpack_backpackcol_badgeinstance_id_2a57e7ce_fk_issuer_ba` (`badgeinstance_id`),
  KEY `backpack_backpackcol_collection_id_f0688dcb_fk_backpack_` (`collection_id`),
  KEY `backpack_backpackcoll_badgeuser_id_fb515765_fk_users_id` (`badgeuser_id`),
  CONSTRAINT `backpack_backpackcol_badgeinstance_id_2a57e7ce_fk_issuer_ba` FOREIGN KEY (`badgeinstance_id`) REFERENCES `issuer_badgeinstance` (`id`),
  CONSTRAINT `backpack_backpackcol_collection_id_f0688dcb_fk_backpack_` FOREIGN KEY (`collection_id`) REFERENCES `backpack_backpackcollection` (`id`),
  CONSTRAINT `backpack_backpackcoll_badgeuser_id_fb515765_fk_users_id` FOREIGN KEY (`badgeuser_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backpack_backpackcollectionbadgeinstance`
--

LOCK TABLES `backpack_backpackcollectionbadgeinstance` WRITE;
/*!40000 ALTER TABLE `backpack_backpackcollectionbadgeinstance` DISABLE KEYS */;
/*!40000 ALTER TABLE `backpack_backpackcollectionbadgeinstance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `backpack_backpackcollectionshare`
--

DROP TABLE IF EXISTS `backpack_backpackcollectionshare`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backpack_backpackcollectionshare` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `provider` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  `collection_id` int(11) NOT NULL,
  `source` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `backpack_backpackcol_collection_id_f176f658_fk_backpack_` (`collection_id`),
  CONSTRAINT `backpack_backpackcol_collection_id_f176f658_fk_backpack_` FOREIGN KEY (`collection_id`) REFERENCES `backpack_backpackcollection` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backpack_backpackcollectionshare`
--

LOCK TABLES `backpack_backpackcollectionshare` WRITE;
/*!40000 ALTER TABLE `backpack_backpackcollectionshare` DISABLE KEYS */;
/*!40000 ALTER TABLE `backpack_backpackcollectionshare` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `badgeuser_emailaddressvariant`
--

DROP TABLE IF EXISTS `badgeuser_emailaddressvariant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `badgeuser_emailaddressvariant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  `canonical_email_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `badgeuser_emailaddre_canonical_email_id_f40216ad_fk_account_e` (`canonical_email_id`),
  CONSTRAINT `badgeuser_emailaddre_canonical_email_id_f40216ad_fk_account_e` FOREIGN KEY (`canonical_email_id`) REFERENCES `account_emailaddress` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `badgeuser_emailaddressvariant`
--

LOCK TABLES `badgeuser_emailaddressvariant` WRITE;
/*!40000 ALTER TABLE `badgeuser_emailaddressvariant` DISABLE KEYS */;
/*!40000 ALTER TABLE `badgeuser_emailaddressvariant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `badgeuser_termsagreement`
--

DROP TABLE IF EXISTS `badgeuser_termsagreement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `badgeuser_termsagreement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `terms_version` int(10) unsigned NOT NULL,
  `agreed` tinyint(1) NOT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `badgeuser_termsagreement_user_id_terms_version_947581e5_uniq` (`user_id`,`terms_version`),
  KEY `badgeuser_termsagreement_created_by_id_2777f65e_fk_users_id` (`created_by_id`),
  KEY `badgeuser_termsagreement_updated_by_id_68d57a4c_fk_users_id` (`updated_by_id`),
  KEY `badgeuser_termsagreement_created_at_de32c00a` (`created_at`),
  KEY `badgeuser_termsagreement_updated_at_cc3271ab` (`updated_at`),
  CONSTRAINT `badgeuser_termsagreement_created_by_id_2777f65e_fk_users_id` FOREIGN KEY (`created_by_id`) REFERENCES `users` (`id`),
  CONSTRAINT `badgeuser_termsagreement_updated_by_id_68d57a4c_fk_users_id` FOREIGN KEY (`updated_by_id`) REFERENCES `users` (`id`),
  CONSTRAINT `badgeuser_termsagreement_user_id_56d75cec_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `badgeuser_termsagreement`
--

LOCK TABLES `badgeuser_termsagreement` WRITE;
/*!40000 ALTER TABLE `badgeuser_termsagreement` DISABLE KEYS */;
/*!40000 ALTER TABLE `badgeuser_termsagreement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `badgeuser_termsversion`
--

DROP TABLE IF EXISTS `badgeuser_termsversion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `badgeuser_termsversion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `version` int(10) unsigned NOT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `short_description` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `version` (`version`),
  KEY `badgeuser_termsversion_created_by_id_15ae278b_fk_users_id` (`created_by_id`),
  KEY `badgeuser_termsversion_updated_by_id_b0d20e86_fk_users_id` (`updated_by_id`),
  KEY `badgeuser_termsversion_created_at_ec76c289` (`created_at`),
  KEY `badgeuser_termsversion_updated_at_ed99b7ee` (`updated_at`),
  CONSTRAINT `badgeuser_termsversion_created_by_id_15ae278b_fk_users_id` FOREIGN KEY (`created_by_id`) REFERENCES `users` (`id`),
  CONSTRAINT `badgeuser_termsversion_updated_by_id_b0d20e86_fk_users_id` FOREIGN KEY (`updated_by_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `badgeuser_termsversion`
--

LOCK TABLES `badgeuser_termsversion` WRITE;
/*!40000 ALTER TABLE `badgeuser_termsversion` DISABLE KEYS */;
/*!40000 ALTER TABLE `badgeuser_termsversion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `badgeuser_userrecipientidentifier`
--

DROP TABLE IF EXISTS `badgeuser_userrecipientidentifier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `badgeuser_userrecipientidentifier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(9) COLLATE utf8_unicode_ci NOT NULL,
  `identifier` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `badgeuser_userrecipienti_user_id_format_identifie_a8f1003d_uniq` (`user_id`,`type`,`identifier`),
  CONSTRAINT `badgeuser_userrecipientidentifier_user_id_f0281a30_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `badgeuser_userrecipientidentifier`
--

LOCK TABLES `badgeuser_userrecipientidentifier` WRITE;
/*!40000 ALTER TABLE `badgeuser_userrecipientidentifier` DISABLE KEYS */;
/*!40000 ALTER TABLE `badgeuser_userrecipientidentifier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `badgrsocialauth_saml2account`
--

DROP TABLE IF EXISTS `badgrsocialauth_saml2account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `badgrsocialauth_saml2account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `config_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `badgrsocialauth_saml_config_id_9bbb7f0c_fk_badgrsoci` (`config_id`),
  KEY `badgrsocialauth_saml2account_user_id_e73207e9_fk_users_id` (`user_id`),
  CONSTRAINT `badgrsocialauth_saml2account_user_id_e73207e9_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `badgrsocialauth_saml_config_id_9bbb7f0c_fk_badgrsoci` FOREIGN KEY (`config_id`) REFERENCES `badgrsocialauth_saml2configuration` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `badgrsocialauth_saml2account`
--

LOCK TABLES `badgrsocialauth_saml2account` WRITE;
/*!40000 ALTER TABLE `badgrsocialauth_saml2account` DISABLE KEYS */;
/*!40000 ALTER TABLE `badgrsocialauth_saml2account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `badgrsocialauth_saml2configuration`
--

DROP TABLE IF EXISTS `badgrsocialauth_saml2configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `badgrsocialauth_saml2configuration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `metadata_conf_url` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `cached_metadata` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `badgrsocialauth_saml2configuration`
--

LOCK TABLES `badgrsocialauth_saml2configuration` WRITE;
/*!40000 ALTER TABLE `badgrsocialauth_saml2configuration` DISABLE KEYS */;
/*!40000 ALTER TABLE `badgrsocialauth_saml2configuration` ENABLE KEYS */;
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
  `object_id` longtext COLLATE utf8_unicode_ci,
  `object_repr` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_users_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `django_celery_results_taskresult`
--

DROP TABLE IF EXISTS `django_celery_results_taskresult`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_celery_results_taskresult` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `content_type` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `content_encoding` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `result` longtext COLLATE utf8_unicode_ci,
  `date_done` datetime(6) NOT NULL,
  `traceback` longtext COLLATE utf8_unicode_ci,
  `hidden` tinyint(1) NOT NULL,
  `meta` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `task_id` (`task_id`),
  KEY `django_celery_results_taskresult_hidden_cd77412f` (`hidden`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_celery_results_taskresult`
--

LOCK TABLES `django_celery_results_taskresult` WRITE;
/*!40000 ALTER TABLE `django_celery_results_taskresult` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_celery_results_taskresult` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (21,'account','emailaddress'),(15,'account','emailconfirmation'),(14,'admin','logentry'),(9,'auth','group'),(10,'auth','permission'),(3,'authtoken','token'),(46,'backpack','backpackbadgeshare'),(45,'backpack','backpackcollection'),(48,'backpack','backpackcollectionbadgeinstance'),(47,'backpack','backpackcollectionshare'),(19,'badgeuser','badgeuser'),(23,'badgeuser','cachedemailaddress'),(16,'badgeuser','emailaddressvariant'),(22,'badgeuser','proxyemailconfirmation'),(17,'badgeuser','termsagreement'),(20,'badgeuser','termsversion'),(18,'badgeuser','userrecipientidentifier'),(28,'badgrsocialauth','saml2account'),(27,'badgrsocialauth','saml2configuration'),(11,'contenttypes','contenttype'),(29,'corsheaders','corsmodel'),(30,'django_celery_results','taskresult'),(56,'externaltools','externaltool'),(55,'externaltools','externaltoollaunchpoint'),(57,'externaltools','externaltooluseractivation'),(43,'issuer','badgeclass'),(44,'issuer','badgeclassalignment'),(41,'issuer','badgeclassextension'),(36,'issuer','badgeclasstag'),(37,'issuer','badgeinstance'),(35,'issuer','badgeinstancebakedimage'),(38,'issuer','badgeinstanceevidence'),(42,'issuer','badgeinstanceextension'),(39,'issuer','issuer'),(40,'issuer','issuerextension'),(34,'issuer','issuerstaff'),(7,'mainsite','accesstokenproxy'),(6,'mainsite','accesstokenscope'),(2,'mainsite','applicationinfo'),(5,'mainsite','badgrapp'),(1,'mainsite','emailblacklist'),(8,'mainsite','legacytokenproxy'),(4,'oauth2_provider','accesstoken'),(32,'oauth2_provider','application'),(31,'oauth2_provider','grant'),(33,'oauth2_provider','refreshtoken'),(50,'pathway','pathway'),(49,'pathway','pathwayelement'),(51,'pathway','pathwayelementbadge'),(53,'recipient','recipientgroup'),(54,'recipient','recipientgroupmembership'),(52,'recipient','recipientprofile'),(12,'sessions','session'),(13,'sites','site'),(26,'socialaccount','socialaccount'),(24,'socialaccount','socialapp'),(25,'socialaccount','socialtoken');
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
  `app` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=194 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2020-01-21 03:11:14.243542'),(2,'auth','0001_initial','2020-01-21 03:11:14.616670'),(3,'badgeuser','0001_initial','2020-01-21 03:11:15.117085'),(4,'account','0001_initial','2020-01-21 03:11:15.406842'),(5,'account','0002_email_max_length','2020-01-21 03:11:15.482712'),(6,'admin','0001_initial','2020-01-21 03:11:15.687638'),(7,'admin','0002_logentry_remove_auto_add','2020-01-21 03:11:15.754244'),(8,'contenttypes','0002_remove_content_type_name','2020-01-21 03:11:15.877145'),(9,'auth','0002_alter_permission_name_max_length','2020-01-21 03:11:15.943004'),(10,'auth','0003_alter_user_email_max_length','2020-01-21 03:11:15.975362'),(11,'auth','0004_alter_user_username_opts','2020-01-21 03:11:16.013781'),(12,'auth','0005_alter_user_last_login_null','2020-01-21 03:11:16.048783'),(13,'auth','0006_require_contenttypes_0002','2020-01-21 03:11:16.067886'),(14,'auth','0007_alter_validators_add_error_messages','2020-01-21 03:11:16.097788'),(15,'auth','0008_alter_user_username_max_length','2020-01-21 03:11:16.126465'),(16,'authtoken','0001_initial','2020-01-21 03:11:16.241676'),(17,'authtoken','0002_auto_20160226_1747','2020-01-21 03:11:16.381525'),(18,'issuer','0001_initial','2020-01-21 03:11:17.350012'),(19,'issuer','0002_auto_20150409_1200','2020-01-21 03:11:17.503986'),(20,'issuer','0003_auto_20150512_0657','2020-01-21 03:11:17.565261'),(21,'issuer','0004_auto_20150915_1722','2020-01-21 03:11:18.277335'),(22,'issuer','0005_auto_20150915_1723','2020-01-21 03:11:18.329749'),(23,'issuer','0006_remove_badgeinstance_email','2020-01-21 03:11:18.413118'),(24,'issuer','0007_auto_20151117_1555','2020-01-21 03:11:18.489932'),(25,'issuer','0008_auto_20160322_1404','2020-01-21 03:11:18.689356'),(26,'issuer','0009_badgeinstance_acceptance','2020-01-21 03:11:18.802029'),(27,'issuer','0010_auto_20170120_1724','2020-01-21 03:11:18.874775'),(28,'issuer','0011_auto_20170213_1531','2020-01-21 03:11:19.709193'),(29,'issuer','0012_auto_20170213_1531','2020-01-21 03:11:19.844167'),(30,'issuer','0013_auto_20170214_0711','2020-01-21 03:11:20.182526'),(31,'issuer','0014_issuerstaff_role','2020-01-21 03:11:20.286097'),(32,'issuer','0015_auto_20170214_0738','2020-01-21 03:11:20.339648'),(33,'issuer','0016_auto_20170214_0749','2020-01-21 03:11:20.493470'),(34,'issuer','0017_auto_20170227_1334','2020-01-21 03:11:20.691937'),(35,'issuer','0018_auto_20170413_1054','2020-01-21 03:11:20.735228'),(36,'issuer','0019_auto_20170420_0810','2020-01-21 03:11:20.957397'),(37,'issuer','0020_auto_20170420_0811','2020-01-21 03:11:21.012420'),(38,'issuer','0021_remove_badgeinstance_evidence_url','2020-01-21 03:11:21.101533'),(39,'issuer','0019_auto_20170413_1136','2020-01-21 03:11:22.000457'),(40,'composition','0001_initial','2020-01-21 03:11:24.458982'),(41,'composition','0002_auto_20150914_1421','2020-01-21 03:11:24.846631'),(42,'composition','0003_auto_20150914_1447','2020-01-21 03:11:25.096103'),(43,'composition','0004_auto_20150915_1057','2020-01-21 03:11:25.197741'),(44,'composition','0005_auto_20151117_1555','2020-01-21 03:11:25.299805'),(45,'composition','0006_auto_20160928_0648','2020-01-21 03:11:25.496057'),(46,'composition','0007_auto_20160930_0733','2020-01-21 03:11:26.009639'),(47,'composition','0008_collectionshare_localbadgeinstanceshare','2020-01-21 03:11:26.408333'),(48,'composition','0009_auto_20161007_1358','2020-01-21 03:11:26.599902'),(49,'composition','0010_auto_20170214_0712','2020-01-21 03:11:26.704908'),(50,'issuer','0020_auto_20170413_1139','2020-01-21 03:11:26.853396'),(51,'issuer','0021_auto_20170424_1427','2020-01-21 03:11:27.208164'),(52,'issuer','0022_merge','2020-01-21 03:11:27.242184'),(53,'issuer','0023_auto_20170531_1044','2020-01-21 03:11:27.487472'),(54,'composition','0011_auto_20170227_0847','2020-01-21 03:11:27.802027'),(55,'composition','0012_localbadgeinstance_badgeclass','2020-01-21 03:11:28.009487'),(56,'composition','0013_auto_20170227_0847','2020-01-21 03:11:28.084720'),(57,'composition','0014_auto_20170413_1054','2020-01-21 03:11:28.213440'),(58,'composition','0015_auto_20170420_0649','2020-01-21 03:11:28.789577'),(59,'backpack','0001_initial','2020-01-21 03:11:29.671377'),(60,'backpack','0002_auto_20170531_1101','2020-01-21 03:11:29.757304'),(61,'backpack','0003_backpackcollection_assertions','2020-01-21 03:11:29.823651'),(62,'backpack','0004_auto_20170711_1326','2020-01-21 03:11:29.888935'),(63,'backpack','0005_auto_20171025_1020','2020-01-21 03:11:30.234302'),(64,'backpack','0006_backpackcollectionbadgeinstance_badgeuser','2020-01-21 03:11:30.430659'),(65,'backpack','0007_auto_20171027_0837','2020-01-21 03:11:30.514359'),(66,'backpack','0008_auto_20171204_1236','2020-01-21 03:11:30.591748'),(67,'backpack','0009_auto_20180119_0711','2020-01-21 03:11:30.861854'),(68,'backpack','0010_auto_20180802_1026','2020-01-21 03:11:30.935044'),(69,'backpack','0011_auto_20181102_1438','2020-01-21 03:11:31.080447'),(70,'backpack','0012_auto_20200106_1621','2020-01-21 03:11:31.218337'),(71,'oauth2_provider','0001_initial','2020-01-21 03:11:32.355871'),(72,'oauth2_provider','0002_08_updates','2020-01-21 03:11:32.829848'),(73,'oauth2_provider','0003_auto_20160316_1503','2020-01-21 03:11:33.165400'),(74,'oauth2_provider','0004_auto_20160525_1623','2020-01-21 03:11:33.426542'),(75,'oauth2_provider','0005_auto_20170514_1141','2020-01-21 03:11:35.956663'),(76,'mainsite','0001_initial','2020-01-21 03:11:36.056150'),(77,'mainsite','0002_badgrapp','2020-01-21 03:11:36.419603'),(78,'mainsite','0003_auto_20160901_1537','2020-01-21 03:11:36.474561'),(79,'mainsite','0004_auto_20170120_1724','2020-01-21 03:11:36.769965'),(80,'mainsite','0005_auto_20170616_1406','2020-01-21 03:11:37.145727'),(81,'mainsite','0005_auto_20170427_0724','2020-01-21 03:11:37.247626'),(82,'mainsite','0006_merge','2020-01-21 03:11:37.293648'),(83,'mainsite','0007_badgrapp_ui_connect_success_redirect','2020-01-21 03:11:37.438492'),(84,'mainsite','0008_auto_20170711_1326','2020-01-21 03:11:37.804751'),(85,'mainsite','0009_applicationinfo','2020-01-21 03:11:38.017222'),(86,'mainsite','0010_auto_20171004_1510','2020-01-21 03:11:38.250148'),(87,'mainsite','0011_auto_20171019_0634','2020-01-21 03:11:38.313276'),(88,'mainsite','0012_badgrapp_public_pages_redirect','2020-01-21 03:11:38.452416'),(89,'badgeuser','0002_cachedemailaddress','2020-01-21 03:11:38.505869'),(90,'badgeuser','0003_auto_20160309_0820','2020-01-21 03:11:38.571835'),(91,'badgeuser','0003_auto_20160210_0313','2020-01-21 03:11:38.641666'),(92,'badgeuser','0004_merge','2020-01-21 03:11:38.687276'),(93,'badgeuser','0005_auto_20160901_1537','2020-01-21 03:11:38.895198'),(94,'badgeuser','0006_auto_20161128_0938','2020-01-21 03:11:38.991781'),(95,'badgeuser','0007_auto_20170427_0957','2020-01-21 03:11:39.262038'),(96,'badgeuser','0008_auto_20170427_1508','2020-01-21 03:11:39.356467'),(97,'badgeuser','0009_auto_20170427_1509','2020-01-21 03:11:39.490815'),(98,'badgeuser','0007_auto_20170427_0724','2020-01-21 03:11:39.926559'),(99,'badgeuser','0010_merge','2020-01-21 03:11:39.978694'),(100,'badgeuser','0011_auto_20170619_2301','2020-01-21 03:11:40.034874'),(101,'badgeuser','0012_auto_20170711_1326','2020-01-21 03:11:40.094190'),(102,'badgeuser','0013_auto_20170725_1305','2020-01-21 03:11:40.217666'),(103,'badgeuser','0014_badgraccesstoken','2020-01-21 03:11:40.272628'),(104,'badgeuser','0015_badgeuser_badgrapp','2020-01-21 03:11:40.475739'),(105,'badgeuser','0016_auto_20180611_0802','2020-01-21 03:11:41.774620'),(106,'badgeuser','0017_auto_20180611_0819','2020-01-21 03:11:41.949547'),(107,'badgeuser','0018_termsversion_short_description','2020-01-21 03:11:42.073059'),(108,'badgeuser','0019_auto_20181102_1438','2020-01-21 03:11:42.270267'),(109,'badgeuser','0020_userrecipientidentifier','2020-01-21 03:11:42.482680'),(110,'badgeuser','0021_auto_20190405_0921','2020-01-21 03:11:42.598245'),(111,'badgeuser','0022_auto_20190405_1344','2020-01-21 03:11:42.694533'),(112,'badgeuser','0023_delete_badgraccesstoken','2020-01-21 03:11:42.749694'),(113,'badgeuser','0024_auto_20200106_1621','2020-01-21 03:11:42.948850'),(114,'badgrsocialauth','0001_initial','2020-01-21 03:11:43.355647'),(115,'badgrsocialauth','0002_saml2configuration_cached_metadata','2020-01-21 03:11:43.479638'),(116,'composition','0016_auto_20170619_2301','2020-01-21 03:11:45.022047'),(117,'django_celery_results','0001_initial','2020-01-21 03:11:45.193625'),(118,'externaltools','0001_initial','2020-01-21 03:11:45.618297'),(119,'externaltools','0002_externaltooluseractivation','2020-01-21 03:11:46.001007'),(120,'externaltools','0003_auto_20180411_0650','2020-01-21 03:11:46.241036'),(121,'externaltools','0004_auto_20180411_0653','2020-01-21 03:11:46.356444'),(122,'externaltools','0005_auto_20180802_1026','2020-01-21 03:11:46.427628'),(123,'externaltools','0006_auto_20181102_1438','2020-01-21 03:11:46.642623'),(124,'externaltools','0007_auto_20190319_1111','2020-01-21 03:11:46.733593'),(125,'externaltools','0008_auto_20200106_1621','2020-01-21 03:11:46.930578'),(126,'issuer','0024_auto_20170609_0845','2020-01-21 03:11:47.125029'),(127,'issuer','0025_badgeinstance_issued_on','2020-01-21 03:11:47.250580'),(128,'issuer','0026_auto_20170726_1409','2020-01-21 03:11:47.426271'),(129,'issuer','0027_auto_20170801_1636','2020-01-21 03:11:47.685711'),(130,'issuer','0028_auto_20170802_1035','2020-01-21 03:11:47.806202'),(131,'issuer','0029_badgeinstance_recipient_type','2020-01-21 03:11:47.974221'),(132,'issuer','0030_badgeclassalignment','2020-01-21 03:11:48.177934'),(133,'issuer','0031_auto_20170918_0735','2020-01-21 03:11:48.248968'),(134,'issuer','0032_badgeclasstag','2020-01-21 03:11:48.432298'),(135,'issuer','0033_auto_20171002_1413','2020-01-21 03:11:48.505181'),(136,'issuer','0034_auto_20171025_1020','2020-01-21 03:11:49.283062'),(137,'issuer','0035_issuer_badgrapp','2020-01-21 03:11:49.490654'),(138,'issuer','0034_badgeinstance_hashed','2020-01-21 03:11:49.666428'),(139,'issuer','0036_merge_20171101_0815','2020-01-21 03:11:49.716020'),(140,'issuer','0037_auto_20171113_1015','2020-01-21 03:11:49.822644'),(141,'issuer','0038_badgeinstance_expires_at','2020-01-21 03:11:49.972909'),(142,'issuer','0039_badgeclassextension','2020-01-21 03:11:50.164765'),(143,'issuer','0040_badgeinstanceextension_issuerextension','2020-01-21 03:11:50.497479'),(144,'issuer','0041_badgeinstancebakedimage','2020-01-21 03:11:50.695820'),(145,'issuer','0042_auto_20180220_1150','2020-01-21 03:11:50.813863'),(146,'issuer','0043_auto_20180614_0949','2020-01-21 03:11:51.021197'),(147,'issuer','0044_auto_20180713_0658','2020-01-21 03:11:51.107766'),(148,'issuer','0045_auto_20181104_1847','2020-01-21 03:11:51.355525'),(149,'issuer','0046_auto_20181114_1517','2020-01-21 03:11:51.743921'),(150,'issuer','0047_badgeinstance_user','2020-01-21 03:11:51.987535'),(151,'issuer','0048_auto_20190812_1229','2020-01-21 03:11:52.247251'),(152,'issuer','0049_auto_20190812_1232','2020-01-21 03:11:52.361540'),(153,'issuer','0050_auto_20190813_1945','2020-01-21 03:11:52.536767'),(154,'issuer','0051_auto_20190826_1604','2020-01-21 03:11:52.612483'),(155,'issuer','0052_auto_20200106_1621','2020-01-21 03:11:52.962869'),(156,'oauth2_provider','0006_auto_20171214_2232','2020-01-21 03:11:53.518908'),(157,'mainsite','0013_badgrapp_oauth_authorization_redirect','2020-01-21 03:11:53.668805'),(158,'mainsite','0014_applicationinfo_trust_email_verification','2020-01-21 03:11:53.820235'),(159,'mainsite','0015_badgrapp_use_auth_code_exchange','2020-01-21 03:11:53.998880'),(160,'mainsite','0016_auto_20181003_0903','2020-01-21 03:11:54.259637'),(161,'mainsite','0017_accesstokenscope','2020-01-21 03:11:54.521055'),(162,'mainsite','0018_auto_20190723_1532','2020-01-21 03:11:54.670610'),(163,'mainsite','0019_auto_20190710_0805','2020-01-21 03:11:54.794841'),(164,'mainsite','0020_auto_20191114_1056','2020-01-21 03:11:55.030505'),(165,'mainsite','0021_auto_20191230_1752','2020-01-21 03:11:55.116379'),(166,'mainsite','0022_badgrapp_is_default','2020-01-21 03:11:55.293567'),(167,'pathway','0001_initial','2020-01-21 03:11:56.754587'),(168,'pathway','0002_auto_20160331_1443','2020-01-21 03:11:57.214092'),(169,'pathway','0003_auto_20160415_1030','2020-01-21 03:11:57.400735'),(170,'pathway','0004_pathway_is_active','2020-01-21 03:11:57.593955'),(171,'pathway','0005_auto_20170217_1104','2020-01-21 03:11:57.807284'),(172,'pathway','0006_auto_20170413_1054','2020-01-21 03:11:57.964108'),(173,'pathway','0007_fix_children_of_deleted','2020-01-21 03:11:58.104780'),(174,'pathway','0008_auto_20170711_1326','2020-01-21 03:11:58.699157'),(175,'recipient','0001_initial','2020-01-21 03:11:59.938960'),(176,'recipient','0002_auto_20160331_1418','2020-01-21 03:12:00.296303'),(177,'recipient','0003_recipientgroup_pathways','2020-01-21 03:12:00.603539'),(178,'recipient','0004_auto_20160511_1024','2020-01-21 03:12:01.463948'),(179,'recipient','0005_auto_20170413_1054','2020-01-21 03:12:01.617872'),(180,'recipient','0006_auto_20170509_1529','2020-01-21 03:12:02.828805'),(181,'recipient','0007_auto_20170509_1529','2020-01-21 03:12:03.125127'),(182,'recipient','0008_auto_20170509_1531','2020-01-21 03:12:03.558061'),(183,'recipient','0009_auto_20170509_1937','2020-01-21 03:12:04.015802'),(184,'recipient','0010_auto_20170711_1326','2020-01-21 03:12:04.757963'),(185,'recipient','0011_auto_20171025_1020','2020-01-21 03:12:05.125766'),(186,'recipient','0012_auto_20181102_1438','2020-01-21 03:12:05.308550'),(187,'recipient','0013_auto_20200106_1621','2020-01-21 03:12:05.498042'),(188,'sessions','0001_initial','2020-01-21 03:12:05.649217'),(189,'sites','0001_initial','2020-01-21 03:12:05.777739'),(190,'sites','0002_alter_domain_unique','2020-01-21 03:12:05.882582'),(191,'socialaccount','0001_initial','2020-01-21 03:12:06.790941'),(192,'socialaccount','0002_token_max_lengths','2020-01-21 03:12:06.998177'),(193,'socialaccount','0003_extra_data_default_dict','2020-01-21 03:12:07.093802');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('dkz16wmnfn85w52g27kiq0ciospmiptm','MzNmYTM5YjI0OTRjM2MzYWMwODdmODMxOWJkOTc4ODVjZmNkOWMxMTp7Il9hdXRoX3VzZXJfaGFzaCI6IjFhZTViODJiNzNiNGE4NTY4YmQ1YTBkOThhN2FmMzY2ZDNmZTQ3MGEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJiYWRnZXVzZXIuYmFja2VuZHMuQ2FjaGVkTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==','2020-02-04 03:17:24.185586'),('f46jkroqacsbpsg2lf8ahmckp66pf8os','MzNmYTM5YjI0OTRjM2MzYWMwODdmODMxOWJkOTc4ODVjZmNkOWMxMTp7Il9hdXRoX3VzZXJfaGFzaCI6IjFhZTViODJiNzNiNGE4NTY4YmQ1YTBkOThhN2FmMzY2ZDNmZTQ3MGEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJiYWRnZXVzZXIuYmFja2VuZHMuQ2FjaGVkTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==','2020-02-04 03:58:51.627174');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_site_domain_a2e37b91_uniq` (`domain`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES (1,'example.com','example.com');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `externaltools_externaltool`
--

DROP TABLE IF EXISTS `externaltools_externaltool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `externaltools_externaltool` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_version` int(10) unsigned NOT NULL,
  `entity_id` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `name` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(254) COLLATE utf8_unicode_ci DEFAULT NULL,
  `xml_config` longtext COLLATE utf8_unicode_ci,
  `config_url` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `client_id` varchar(254) COLLATE utf8_unicode_ci DEFAULT NULL,
  `client_secret` varchar(254) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `requires_user_activation` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entity_id` (`entity_id`),
  KEY `externaltools_externaltool_created_by_id_85a92209_fk_users_id` (`created_by_id`),
  KEY `externaltools_externaltool_updated_by_id_9308dd52_fk_users_id` (`updated_by_id`),
  KEY `externaltools_externaltool_created_at_6c00cb97` (`created_at`),
  KEY `externaltools_externaltool_updated_at_c83f33e3` (`updated_at`),
  CONSTRAINT `externaltools_externaltool_created_by_id_85a92209_fk_users_id` FOREIGN KEY (`created_by_id`) REFERENCES `users` (`id`),
  CONSTRAINT `externaltools_externaltool_updated_by_id_9308dd52_fk_users_id` FOREIGN KEY (`updated_by_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `externaltools_externaltool`
--

LOCK TABLES `externaltools_externaltool` WRITE;
/*!40000 ALTER TABLE `externaltools_externaltool` DISABLE KEYS */;
/*!40000 ALTER TABLE `externaltools_externaltool` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `externaltools_externaltoollaunchpoint`
--

DROP TABLE IF EXISTS `externaltools_externaltoollaunchpoint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `externaltools_externaltoollaunchpoint` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `launchpoint` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  `launch_url` varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  `icon_url` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `externaltool_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `externaltools_extern_externaltool_id_7df04614_fk_externalt` (`externaltool_id`),
  CONSTRAINT `externaltools_extern_externaltool_id_7df04614_fk_externalt` FOREIGN KEY (`externaltool_id`) REFERENCES `externaltools_externaltool` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `externaltools_externaltoollaunchpoint`
--

LOCK TABLES `externaltools_externaltoollaunchpoint` WRITE;
/*!40000 ALTER TABLE `externaltools_externaltoollaunchpoint` DISABLE KEYS */;
/*!40000 ALTER TABLE `externaltools_externaltoollaunchpoint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `externaltools_externaltooluseractivation`
--

DROP TABLE IF EXISTS `externaltools_externaltooluseractivation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `externaltools_externaltooluseractivation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `externaltool_id` int(11) NOT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `externaltools_externa_created_by_id_26cd81ef_fk_users_id` (`created_by_id`),
  KEY `externaltools_extern_externaltool_id_06b559ab_fk_externalt` (`externaltool_id`),
  KEY `externaltools_externa_updated_by_id_e9af1786_fk_users_id` (`updated_by_id`),
  KEY `externaltools_externa_user_id_15eb67d6_fk_users_id` (`user_id`),
  KEY `externaltools_externaltooluseractivation_is_active_c4a44480` (`is_active`),
  KEY `externaltools_externaltooluseractivation_created_at_127d8b17` (`created_at`),
  KEY `externaltools_externaltooluseractivation_updated_at_d6d115bc` (`updated_at`),
  CONSTRAINT `externaltools_extern_externaltool_id_06b559ab_fk_externalt` FOREIGN KEY (`externaltool_id`) REFERENCES `externaltools_externaltool` (`id`),
  CONSTRAINT `externaltools_externa_created_by_id_26cd81ef_fk_users_id` FOREIGN KEY (`created_by_id`) REFERENCES `users` (`id`),
  CONSTRAINT `externaltools_externa_updated_by_id_e9af1786_fk_users_id` FOREIGN KEY (`updated_by_id`) REFERENCES `users` (`id`),
  CONSTRAINT `externaltools_externa_user_id_15eb67d6_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `externaltools_externaltooluseractivation`
--

LOCK TABLES `externaltools_externaltooluseractivation` WRITE;
/*!40000 ALTER TABLE `externaltools_externaltooluseractivation` DISABLE KEYS */;
/*!40000 ALTER TABLE `externaltools_externaltooluseractivation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issuer_badgeclass`
--

DROP TABLE IF EXISTS `issuer_badgeclass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issuer_badgeclass` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `old_json` longtext COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `criteria_text` longtext COLLATE utf8_unicode_ci,
  `image` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `issuer_id` int(11) NOT NULL,
  `criteria_url` varchar(254) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `source` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  `source_url` varchar(254) COLLATE utf8_unicode_ci DEFAULT NULL,
  `original_json` longtext COLLATE utf8_unicode_ci,
  `entity_id` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  `entity_version` int(10) unsigned NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  `expires_amount` int(11) DEFAULT NULL,
  `expires_duration` varchar(254) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `issuer_badgeclass_entity_id_9d80ac6c_uniq` (`entity_id`),
  UNIQUE KEY `issuer_badgeclass_source_url_e8aef860_uniq` (`source_url`),
  KEY `issuer_badgeclass_created_by_id_46b30d08_fk_users_id` (`created_by_id`),
  KEY `issuer_badgeclass_issuer_id_0b4cacb8_fk_issuer_issuer_id` (`issuer_id`),
  KEY `issuer_badgeclass_updated_by_id_3768fe0a_fk_users_id` (`updated_by_id`),
  KEY `issuer_badgeclass_created_at_a3948a29` (`created_at`),
  KEY `issuer_badgeclass_updated_at_410d20b3` (`updated_at`),
  CONSTRAINT `issuer_badgeclass_created_by_id_46b30d08_fk_users_id` FOREIGN KEY (`created_by_id`) REFERENCES `users` (`id`),
  CONSTRAINT `issuer_badgeclass_issuer_id_0b4cacb8_fk_issuer_issuer_id` FOREIGN KEY (`issuer_id`) REFERENCES `issuer_issuer` (`id`),
  CONSTRAINT `issuer_badgeclass_updated_by_id_3768fe0a_fk_users_id` FOREIGN KEY (`updated_by_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issuer_badgeclass`
--

LOCK TABLES `issuer_badgeclass` WRITE;
/*!40000 ALTER TABLE `issuer_badgeclass` DISABLE KEYS */;
/*!40000 ALTER TABLE `issuer_badgeclass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issuer_badgeclassalignment`
--

DROP TABLE IF EXISTS `issuer_badgeclassalignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issuer_badgeclassalignment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `original_json` longtext COLLATE utf8_unicode_ci,
  `target_name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `target_url` varchar(2083) COLLATE utf8_unicode_ci NOT NULL,
  `target_description` longtext COLLATE utf8_unicode_ci,
  `target_framework` longtext COLLATE utf8_unicode_ci,
  `target_code` longtext COLLATE utf8_unicode_ci,
  `badgeclass_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `issuer_badgeclassali_badgeclass_id_5b4369c9_fk_issuer_ba` (`badgeclass_id`),
  CONSTRAINT `issuer_badgeclassali_badgeclass_id_5b4369c9_fk_issuer_ba` FOREIGN KEY (`badgeclass_id`) REFERENCES `issuer_badgeclass` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issuer_badgeclassalignment`
--

LOCK TABLES `issuer_badgeclassalignment` WRITE;
/*!40000 ALTER TABLE `issuer_badgeclassalignment` DISABLE KEYS */;
/*!40000 ALTER TABLE `issuer_badgeclassalignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issuer_badgeclassextension`
--

DROP TABLE IF EXISTS `issuer_badgeclassextension`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issuer_badgeclassextension` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  `original_json` longtext COLLATE utf8_unicode_ci,
  `badgeclass_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `issuer_badgeclassext_badgeclass_id_24af13d9_fk_issuer_ba` (`badgeclass_id`),
  CONSTRAINT `issuer_badgeclassext_badgeclass_id_24af13d9_fk_issuer_ba` FOREIGN KEY (`badgeclass_id`) REFERENCES `issuer_badgeclass` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issuer_badgeclassextension`
--

LOCK TABLES `issuer_badgeclassextension` WRITE;
/*!40000 ALTER TABLE `issuer_badgeclassextension` DISABLE KEYS */;
/*!40000 ALTER TABLE `issuer_badgeclassextension` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issuer_badgeclasstag`
--

DROP TABLE IF EXISTS `issuer_badgeclasstag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issuer_badgeclasstag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  `badgeclass_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `issuer_badgeclasstag_badgeclass_id_6b0b400f_fk_issuer_ba` (`badgeclass_id`),
  KEY `issuer_badgeclasstag_name_0e94f356` (`name`),
  CONSTRAINT `issuer_badgeclasstag_badgeclass_id_6b0b400f_fk_issuer_ba` FOREIGN KEY (`badgeclass_id`) REFERENCES `issuer_badgeclass` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issuer_badgeclasstag`
--

LOCK TABLES `issuer_badgeclasstag` WRITE;
/*!40000 ALTER TABLE `issuer_badgeclasstag` DISABLE KEYS */;
/*!40000 ALTER TABLE `issuer_badgeclasstag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issuer_badgeinstance`
--

DROP TABLE IF EXISTS `issuer_badgeinstance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issuer_badgeinstance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `old_json` longtext COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `revocation_reason` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `badgeclass_id` int(11) NOT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `issuer_id` int(11) NOT NULL,
  `recipient_identifier` varchar(768) COLLATE utf8_unicode_ci NOT NULL,
  `acceptance` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  `salt` varchar(254) COLLATE utf8_unicode_ci DEFAULT NULL,
  `narrative` longtext COLLATE utf8_unicode_ci,
  `entity_id` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  `entity_version` int(10) unsigned NOT NULL,
  `source` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  `source_url` varchar(254) COLLATE utf8_unicode_ci DEFAULT NULL,
  `original_json` longtext COLLATE utf8_unicode_ci,
  `issued_on` datetime(6) NOT NULL,
  `recipient_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  `hashed` tinyint(1) NOT NULL,
  `expires_at` datetime(6) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `issuer_badgeinstance_entity_id_b466e05e_uniq` (`entity_id`),
  UNIQUE KEY `issuer_badgeinstance_source_url_80c93e84_uniq` (`source_url`),
  KEY `issuer_badgeinstance_created_by_id_8ca41a27_fk_users_id` (`created_by_id`),
  KEY `issuer_badgeinstance_issuer_id_436ecba7_fk_issuer_issuer_id` (`issuer_id`),
  KEY `issuer_badgeinstance_badgeclass_id_62fb47fa_fk_issuer_ba` (`badgeclass_id`),
  KEY `issuer_badgeinstance_updated_by_id_c3cf1592_fk_users_id` (`updated_by_id`),
  KEY `issuer_badgeinstance_recipient_identifier_2c3f0867` (`recipient_identifier`),
  KEY `issuer_badgeinstance_recipient_identifier_badg_c259765f_idx` (`recipient_identifier`,`badgeclass_id`,`revoked`),
  KEY `issuer_badgeinstance_created_at_c76642cf` (`created_at`),
  KEY `issuer_badgeinstance_user_id_0369d8d6_fk_users_id` (`user_id`),
  KEY `issuer_badgeinstance_updated_at_4706552c` (`updated_at`),
  CONSTRAINT `issuer_badgeinstance_badgeclass_id_62fb47fa_fk_issuer_ba` FOREIGN KEY (`badgeclass_id`) REFERENCES `issuer_badgeclass` (`id`),
  CONSTRAINT `issuer_badgeinstance_created_by_id_8ca41a27_fk_users_id` FOREIGN KEY (`created_by_id`) REFERENCES `users` (`id`),
  CONSTRAINT `issuer_badgeinstance_issuer_id_436ecba7_fk_issuer_issuer_id` FOREIGN KEY (`issuer_id`) REFERENCES `issuer_issuer` (`id`),
  CONSTRAINT `issuer_badgeinstance_updated_by_id_c3cf1592_fk_users_id` FOREIGN KEY (`updated_by_id`) REFERENCES `users` (`id`),
  CONSTRAINT `issuer_badgeinstance_user_id_0369d8d6_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issuer_badgeinstance`
--

LOCK TABLES `issuer_badgeinstance` WRITE;
/*!40000 ALTER TABLE `issuer_badgeinstance` DISABLE KEYS */;
/*!40000 ALTER TABLE `issuer_badgeinstance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issuer_badgeinstancebakedimage`
--

DROP TABLE IF EXISTS `issuer_badgeinstancebakedimage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issuer_badgeinstancebakedimage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `obi_version` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `badgeinstance_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `issuer_badgeinstance_badgeinstance_id_5eb8b7c2_fk_issuer_ba` (`badgeinstance_id`),
  CONSTRAINT `issuer_badgeinstance_badgeinstance_id_5eb8b7c2_fk_issuer_ba` FOREIGN KEY (`badgeinstance_id`) REFERENCES `issuer_badgeinstance` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issuer_badgeinstancebakedimage`
--

LOCK TABLES `issuer_badgeinstancebakedimage` WRITE;
/*!40000 ALTER TABLE `issuer_badgeinstancebakedimage` DISABLE KEYS */;
/*!40000 ALTER TABLE `issuer_badgeinstancebakedimage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issuer_badgeinstanceevidence`
--

DROP TABLE IF EXISTS `issuer_badgeinstanceevidence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issuer_badgeinstanceevidence` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `evidence_url` varchar(2083) COLLATE utf8_unicode_ci DEFAULT NULL,
  `narrative` longtext COLLATE utf8_unicode_ci,
  `badgeinstance_id` int(11) NOT NULL,
  `original_json` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `issuer_badgeinstance_badgeinstance_id_5d069298_fk_issuer_ba` (`badgeinstance_id`),
  CONSTRAINT `issuer_badgeinstance_badgeinstance_id_5d069298_fk_issuer_ba` FOREIGN KEY (`badgeinstance_id`) REFERENCES `issuer_badgeinstance` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issuer_badgeinstanceevidence`
--

LOCK TABLES `issuer_badgeinstanceevidence` WRITE;
/*!40000 ALTER TABLE `issuer_badgeinstanceevidence` DISABLE KEYS */;
/*!40000 ALTER TABLE `issuer_badgeinstanceevidence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issuer_badgeinstanceextension`
--

DROP TABLE IF EXISTS `issuer_badgeinstanceextension`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issuer_badgeinstanceextension` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  `original_json` longtext COLLATE utf8_unicode_ci,
  `badgeinstance_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `issuer_badgeinstance_badgeinstance_id_fe985303_fk_issuer_ba` (`badgeinstance_id`),
  CONSTRAINT `issuer_badgeinstance_badgeinstance_id_fe985303_fk_issuer_ba` FOREIGN KEY (`badgeinstance_id`) REFERENCES `issuer_badgeinstance` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issuer_badgeinstanceextension`
--

LOCK TABLES `issuer_badgeinstanceextension` WRITE;
/*!40000 ALTER TABLE `issuer_badgeinstanceextension` DISABLE KEYS */;
/*!40000 ALTER TABLE `issuer_badgeinstanceextension` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issuer_issuer`
--

DROP TABLE IF EXISTS `issuer_issuer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issuer_issuer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `old_json` longtext COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `email` varchar(254) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(254) COLLATE utf8_unicode_ci DEFAULT NULL,
  `source` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  `source_url` varchar(254) COLLATE utf8_unicode_ci DEFAULT NULL,
  `original_json` longtext COLLATE utf8_unicode_ci,
  `entity_id` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  `entity_version` int(10) unsigned NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  `badgrapp_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `issuer_issuer_entity_id_ab6df147_uniq` (`entity_id`),
  UNIQUE KEY `issuer_issuer_source_url_adc66e1b_uniq` (`source_url`),
  KEY `issuer_issuer_created_by_id_1423f4f0_fk_users_id` (`created_by_id`),
  KEY `issuer_issuer_updated_by_id_9842bff8_fk_users_id` (`updated_by_id`),
  KEY `issuer_issuer_badgrapp_id_b1674645_fk_mainsite_badgrapp_id` (`badgrapp_id`),
  KEY `issuer_issuer_created_at_b405217d` (`created_at`),
  KEY `issuer_issuer_updated_at_0ec2a4e8` (`updated_at`),
  CONSTRAINT `issuer_issuer_badgrapp_id_b1674645_fk_mainsite_badgrapp_id` FOREIGN KEY (`badgrapp_id`) REFERENCES `mainsite_badgrapp` (`id`),
  CONSTRAINT `issuer_issuer_created_by_id_1423f4f0_fk_users_id` FOREIGN KEY (`created_by_id`) REFERENCES `users` (`id`),
  CONSTRAINT `issuer_issuer_updated_by_id_9842bff8_fk_users_id` FOREIGN KEY (`updated_by_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issuer_issuer`
--

LOCK TABLES `issuer_issuer` WRITE;
/*!40000 ALTER TABLE `issuer_issuer` DISABLE KEYS */;
/*!40000 ALTER TABLE `issuer_issuer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issuer_issuerextension`
--

DROP TABLE IF EXISTS `issuer_issuerextension`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issuer_issuerextension` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  `original_json` longtext COLLATE utf8_unicode_ci,
  `issuer_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `issuer_issuerextension_issuer_id_a9d4633e_fk_issuer_issuer_id` (`issuer_id`),
  CONSTRAINT `issuer_issuerextension_issuer_id_a9d4633e_fk_issuer_issuer_id` FOREIGN KEY (`issuer_id`) REFERENCES `issuer_issuer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issuer_issuerextension`
--

LOCK TABLES `issuer_issuerextension` WRITE;
/*!40000 ALTER TABLE `issuer_issuerextension` DISABLE KEYS */;
/*!40000 ALTER TABLE `issuer_issuerextension` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issuer_issuerstaff`
--

DROP TABLE IF EXISTS `issuer_issuerstaff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issuer_issuerstaff` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `issuer_id` int(11) NOT NULL,
  `role` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `issuer_issuerstaff_issuer_id_user_id_8ab3a821_uniq` (`issuer_id`,`user_id`),
  KEY `issuer_issuerstaff_user_id_572af7a6_fk_users_id` (`user_id`),
  CONSTRAINT `issuer_issuerstaff_issuer_id_e6586d0f_fk_issuer_issuer_id` FOREIGN KEY (`issuer_id`) REFERENCES `issuer_issuer` (`id`),
  CONSTRAINT `issuer_issuerstaff_user_id_572af7a6_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issuer_issuerstaff`
--

LOCK TABLES `issuer_issuerstaff` WRITE;
/*!40000 ALTER TABLE `issuer_issuerstaff` DISABLE KEYS */;
/*!40000 ALTER TABLE `issuer_issuerstaff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mainsite_accesstokenscope`
--

DROP TABLE IF EXISTS `mainsite_accesstokenscope`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mainsite_accesstokenscope` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `scope` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mainsite_accesstokenscope_token_id_scope_03e6b75b_uniq` (`token_id`,`scope`),
  CONSTRAINT `mainsite_accesstoken_token_id_004f9c3e_fk_oauth2_pr` FOREIGN KEY (`token_id`) REFERENCES `oauth2_provider_accesstoken` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mainsite_accesstokenscope`
--

LOCK TABLES `mainsite_accesstokenscope` WRITE;
/*!40000 ALTER TABLE `mainsite_accesstokenscope` DISABLE KEYS */;
INSERT INTO `mainsite_accesstokenscope` VALUES (3,'rw:backpack',1),(2,'rw:issuer',1),(1,'rw:profile',1);
/*!40000 ALTER TABLE `mainsite_accesstokenscope` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mainsite_applicationinfo`
--

DROP TABLE IF EXISTS `mainsite_applicationinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mainsite_applicationinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `icon` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(254) COLLATE utf8_unicode_ci DEFAULT NULL,
  `application_id` bigint(20) NOT NULL,
  `allowed_scopes` longtext COLLATE utf8_unicode_ci NOT NULL,
  `website_url` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `trust_email_verification` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `application_id` (`application_id`),
  CONSTRAINT `mainsite_application_application_id_4b340aa9_fk_oauth2_pr` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mainsite_applicationinfo`
--

LOCK TABLES `mainsite_applicationinfo` WRITE;
/*!40000 ALTER TABLE `mainsite_applicationinfo` DISABLE KEYS */;
INSERT INTO `mainsite_applicationinfo` VALUES (1,'','localdev',1,'rw:profile rw:issuer rw:backpack',NULL,0);
/*!40000 ALTER TABLE `mainsite_applicationinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mainsite_badgrapp`
--

DROP TABLE IF EXISTS `mainsite_badgrapp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mainsite_badgrapp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_active` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `cors` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  `email_confirmation_redirect` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `forgot_password_redirect` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  `name` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  `signup_redirect` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `ui_login_redirect` varchar(200) COLLATE utf8_unicode_ci,
  `ui_signup_success_redirect` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ui_connect_success_redirect` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `public_pages_redirect` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `oauth_authorization_redirect` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `use_auth_code_exchange` tinyint(1) NOT NULL,
  `oauth_application_id` bigint(20) DEFAULT NULL,
  `ui_signup_failure_redirect` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cors` (`cors`),
  KEY `mainsite_badgrapp_created_by_id_984371c7_fk_users_id` (`created_by_id`),
  KEY `mainsite_badgrapp_updated_by_id_dad2bffc_fk_users_id` (`updated_by_id`),
  KEY `mainsite_badgrapp_oauth_application_id_e240e350_fk_oauth2_pr` (`oauth_application_id`),
  CONSTRAINT `mainsite_badgrapp_created_by_id_984371c7_fk_users_id` FOREIGN KEY (`created_by_id`) REFERENCES `users` (`id`),
  CONSTRAINT `mainsite_badgrapp_oauth_application_id_e240e350_fk_oauth2_pr` FOREIGN KEY (`oauth_application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `mainsite_badgrapp_updated_by_id_dad2bffc_fk_users_id` FOREIGN KEY (`updated_by_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mainsite_badgrapp`
--

LOCK TABLES `mainsite_badgrapp` WRITE;
/*!40000 ALTER TABLE `mainsite_badgrapp` DISABLE KEYS */;
INSERT INTO `mainsite_badgrapp` VALUES (1,1,'2020-01-21 03:23:23.410862','2020-01-21 03:23:23.410910','http://34.67.163.193:4200','http://34.67.163.193:4200/auth/login/','http://34.67.163.193:4200/change-password/',NULL,NULL,'BadgrApp','http://34.67.163.193:4200/signup/','http://34.67.163.193:4200/auth/login','http://34.67.163.193:4200/signup/success/','http://34.67.163.193:4200/profile/','http://34.67.163.193:4200/public/','http://34.67.163.193:4200',0,NULL,'http://34.67.163.193:4200/signup/',1);
/*!40000 ALTER TABLE `mainsite_badgrapp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mainsite_emailblacklist`
--

DROP TABLE IF EXISTS `mainsite_emailblacklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mainsite_emailblacklist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mainsite_emailblacklist`
--

LOCK TABLES `mainsite_emailblacklist` WRITE;
/*!40000 ALTER TABLE `mainsite_emailblacklist` DISABLE KEYS */;
/*!40000 ALTER TABLE `mainsite_emailblacklist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_accesstoken`
--

DROP TABLE IF EXISTS `oauth2_provider_accesstoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth2_provider_accesstoken` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `expires` datetime(6) NOT NULL,
  `scope` longtext COLLATE utf8_unicode_ci NOT NULL,
  `application_id` bigint(20) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `source_refresh_token_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `oauth2_provider_accesstoken_token_8af090f8_uniq` (`token`),
  UNIQUE KEY `source_refresh_token_id` (`source_refresh_token_id`),
  KEY `oauth2_provider_accesstoken_user_id_6e4c9a65_fk_users_id` (`user_id`),
  KEY `oauth2_provider_accesstoken_application_id_b22886e1_fk` (`application_id`),
  CONSTRAINT `oauth2_provider_acce_source_refresh_token_e66fbc72_fk_oauth2_pr` FOREIGN KEY (`source_refresh_token_id`) REFERENCES `oauth2_provider_refreshtoken` (`id`),
  CONSTRAINT `oauth2_provider_accesstoken_application_id_b22886e1_fk` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth2_provider_accesstoken_user_id_6e4c9a65_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_accesstoken`
--

LOCK TABLES `oauth2_provider_accesstoken` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_accesstoken` DISABLE KEYS */;
INSERT INTO `oauth2_provider_accesstoken` VALUES (1,'dtXnqEpZJRsNtRKh2Xi0ZSVPnz6ym9','2020-01-22 04:03:31.785812','rw:profile rw:issuer rw:backpack',1,4,'2020-01-21 04:03:31.786572','2020-01-21 04:03:31.786604',NULL);
/*!40000 ALTER TABLE `oauth2_provider_accesstoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_application`
--

DROP TABLE IF EXISTS `oauth2_provider_application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth2_provider_application` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `client_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `redirect_uris` longtext COLLATE utf8_unicode_ci NOT NULL,
  `client_type` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `authorization_grant_type` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `client_secret` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `skip_authorization` tinyint(1) NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `client_id` (`client_id`),
  KEY `oauth2_provider_application_client_secret_53133678` (`client_secret`),
  KEY `oauth2_provider_application_user_id_79829054_fk_users_id` (`user_id`),
  CONSTRAINT `oauth2_provider_application_user_id_79829054_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_application`
--

LOCK TABLES `oauth2_provider_application` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_application` DISABLE KEYS */;
INSERT INTO `oauth2_provider_application` VALUES (1,'public','http://34.67.163.193:4200','public','password','qHdtBvlCL1GAELkF8N7cUci9sJk84IDkOEgzJWoeZi99QPWYLD3asxy831DOTM8Y8Kt5lYlLWysLfUr3e4JgqJmTGc434o1533bH4jKZU4SsTjYHrwzHh2TH1pNnc9ld','',NULL,0,'2020-01-21 03:25:24.088505','2020-01-21 03:25:24.088556');
/*!40000 ALTER TABLE `oauth2_provider_application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_grant`
--

DROP TABLE IF EXISTS `oauth2_provider_grant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth2_provider_grant` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `expires` datetime(6) NOT NULL,
  `redirect_uri` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `scope` longtext COLLATE utf8_unicode_ci NOT NULL,
  `application_id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `oauth2_provider_grant_code_49ab4ddf_uniq` (`code`),
  KEY `oauth2_provider_grant_application_id_81923564_fk` (`application_id`),
  KEY `oauth2_provider_grant_user_id_e8f62af8_fk_users_id` (`user_id`),
  CONSTRAINT `oauth2_provider_grant_application_id_81923564_fk` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth2_provider_grant_user_id_e8f62af8_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_grant`
--

LOCK TABLES `oauth2_provider_grant` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_grant` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth2_provider_grant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_refreshtoken`
--

DROP TABLE IF EXISTS `oauth2_provider_refreshtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth2_provider_refreshtoken` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `access_token_id` bigint(20) DEFAULT NULL,
  `application_id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `revoked` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `access_token_id` (`access_token_id`),
  UNIQUE KEY `oauth2_provider_refreshtoken_token_revoked_af8a5134_uniq` (`token`,`revoked`),
  KEY `oauth2_provider_refreshtoken_application_id_2d1c311b_fk` (`application_id`),
  KEY `oauth2_provider_refreshtoken_user_id_da837fce_fk_users_id` (`user_id`),
  CONSTRAINT `oauth2_provider_refr_access_token_id_775e84e8_fk_oauth2_pr` FOREIGN KEY (`access_token_id`) REFERENCES `oauth2_provider_accesstoken` (`id`),
  CONSTRAINT `oauth2_provider_refreshtoken_application_id_2d1c311b_fk` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth2_provider_refreshtoken_user_id_da837fce_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_refreshtoken`
--

LOCK TABLES `oauth2_provider_refreshtoken` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_refreshtoken` DISABLE KEYS */;
INSERT INTO `oauth2_provider_refreshtoken` VALUES (1,'mbFGb26qoxerOcogwjrTg1e6oI8uoS',1,1,4,'2020-01-21 04:03:31.809668','2020-01-21 04:03:31.809717',NULL);
/*!40000 ALTER TABLE `oauth2_provider_refreshtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pathway_pathway`
--

DROP TABLE IF EXISTS `pathway_pathway`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pathway_pathway` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `issuer_id` int(11) NOT NULL,
  `root_element_id` int(11) DEFAULT NULL,
  `slug` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  UNIQUE KEY `root_element_id` (`root_element_id`),
  KEY `pathway_pathway_issuer_id_ca54168b_fk_issuer_issuer_id` (`issuer_id`),
  CONSTRAINT `pathway_pathway_issuer_id_ca54168b_fk_issuer_issuer_id` FOREIGN KEY (`issuer_id`) REFERENCES `issuer_issuer` (`id`),
  CONSTRAINT `pathway_pathway_root_element_id_896ebbce_fk_pathway_p` FOREIGN KEY (`root_element_id`) REFERENCES `pathway_pathwayelement` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pathway_pathway`
--

LOCK TABLES `pathway_pathway` WRITE;
/*!40000 ALTER TABLE `pathway_pathway` DISABLE KEYS */;
/*!40000 ALTER TABLE `pathway_pathway` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pathway_pathwayelement`
--

DROP TABLE IF EXISTS `pathway_pathwayelement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pathway_pathwayelement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_active` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `name` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `alignment_url` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `completion_requirements` longtext COLLATE utf8_unicode_ci,
  `completion_badgeclass_id` int(11) DEFAULT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `parent_element_id` int(11) DEFAULT NULL,
  `pathway_id` int(11) NOT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  `ordering` int(11) NOT NULL,
  `slug` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `pathway_pathwayeleme_parent_element_id_25ab52f8_fk_pathway_p` (`parent_element_id`),
  KEY `pathway_pathwayelement_pathway_id_060c97be_fk_pathway_pathway_id` (`pathway_id`),
  KEY `pathway_pathwayeleme_completion_badgeclas_68491f9d_fk_issuer_ba` (`completion_badgeclass_id`),
  KEY `pathway_pathwayelement_created_by_id_edcfd66e_fk_users_id` (`created_by_id`),
  KEY `pathway_pathwayelement_updated_by_id_2ec9c8b9_fk_users_id` (`updated_by_id`),
  CONSTRAINT `pathway_pathwayeleme_completion_badgeclas_68491f9d_fk_issuer_ba` FOREIGN KEY (`completion_badgeclass_id`) REFERENCES `issuer_badgeclass` (`id`),
  CONSTRAINT `pathway_pathwayeleme_parent_element_id_25ab52f8_fk_pathway_p` FOREIGN KEY (`parent_element_id`) REFERENCES `pathway_pathwayelement` (`id`),
  CONSTRAINT `pathway_pathwayelement_created_by_id_edcfd66e_fk_users_id` FOREIGN KEY (`created_by_id`) REFERENCES `users` (`id`),
  CONSTRAINT `pathway_pathwayelement_pathway_id_060c97be_fk_pathway_pathway_id` FOREIGN KEY (`pathway_id`) REFERENCES `pathway_pathway` (`id`),
  CONSTRAINT `pathway_pathwayelement_updated_by_id_2ec9c8b9_fk_users_id` FOREIGN KEY (`updated_by_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pathway_pathwayelement`
--

LOCK TABLES `pathway_pathwayelement` WRITE;
/*!40000 ALTER TABLE `pathway_pathwayelement` DISABLE KEYS */;
/*!40000 ALTER TABLE `pathway_pathwayelement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pathway_pathwayelementbadge`
--

DROP TABLE IF EXISTS `pathway_pathwayelementbadge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pathway_pathwayelementbadge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `badgeclass_id` int(11) NOT NULL,
  `element_id` int(11) NOT NULL,
  `pathway_id` int(11) NOT NULL,
  `ordering` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pathway_pathwayeleme_badgeclass_id_7bad540d_fk_issuer_ba` (`badgeclass_id`),
  KEY `pathway_pathwayeleme_element_id_3c4ed4d8_fk_pathway_p` (`element_id`),
  KEY `pathway_pathwayeleme_pathway_id_fe9cf5c1_fk_pathway_p` (`pathway_id`),
  CONSTRAINT `pathway_pathwayeleme_badgeclass_id_7bad540d_fk_issuer_ba` FOREIGN KEY (`badgeclass_id`) REFERENCES `issuer_badgeclass` (`id`),
  CONSTRAINT `pathway_pathwayeleme_element_id_3c4ed4d8_fk_pathway_p` FOREIGN KEY (`element_id`) REFERENCES `pathway_pathwayelement` (`id`),
  CONSTRAINT `pathway_pathwayeleme_pathway_id_fe9cf5c1_fk_pathway_p` FOREIGN KEY (`pathway_id`) REFERENCES `pathway_pathway` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pathway_pathwayelementbadge`
--

LOCK TABLES `pathway_pathwayelementbadge` WRITE;
/*!40000 ALTER TABLE `pathway_pathwayelementbadge` DISABLE KEYS */;
/*!40000 ALTER TABLE `pathway_pathwayelementbadge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipient_recipientgroup`
--

DROP TABLE IF EXISTS `recipient_recipientgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipient_recipientgroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_active` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `name` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `created_by_id` int(11) DEFAULT NULL,
  `issuer_id` int(11) NOT NULL,
  `slug` varchar(254) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entity_id` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  `entity_version` int(10) unsigned NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `recipient_recipientgroup_entity_id_cdffaec5_uniq` (`entity_id`),
  KEY `recipient_recipientgroup_issuer_id_7f3cfcdd_fk_issuer_issuer_id` (`issuer_id`),
  KEY `recipient_recipientgroup_created_by_id_a08ec00b_fk_users_id` (`created_by_id`),
  KEY `recipient_recipientgroup_updated_by_id_2a951505_fk_users_id` (`updated_by_id`),
  KEY `recipient_recipientgroup_created_at_6b5e7f38` (`created_at`),
  KEY `recipient_recipientgroup_updated_at_e9e5a959` (`updated_at`),
  CONSTRAINT `recipient_recipientgroup_created_by_id_a08ec00b_fk_users_id` FOREIGN KEY (`created_by_id`) REFERENCES `users` (`id`),
  CONSTRAINT `recipient_recipientgroup_issuer_id_7f3cfcdd_fk_issuer_issuer_id` FOREIGN KEY (`issuer_id`) REFERENCES `issuer_issuer` (`id`),
  CONSTRAINT `recipient_recipientgroup_updated_by_id_2a951505_fk_users_id` FOREIGN KEY (`updated_by_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipient_recipientgroup`
--

LOCK TABLES `recipient_recipientgroup` WRITE;
/*!40000 ALTER TABLE `recipient_recipientgroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `recipient_recipientgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipient_recipientgroup_pathways`
--

DROP TABLE IF EXISTS `recipient_recipientgroup_pathways`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipient_recipientgroup_pathways` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `recipientgroup_id` int(11) NOT NULL,
  `pathway_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `recipient_recipientgroup_recipientgroup_id_pathwa_999aa21d_uniq` (`recipientgroup_id`,`pathway_id`),
  KEY `recipient_recipientg_pathway_id_ea5bf45f_fk_pathway_p` (`pathway_id`),
  CONSTRAINT `recipient_recipientg_pathway_id_ea5bf45f_fk_pathway_p` FOREIGN KEY (`pathway_id`) REFERENCES `pathway_pathway` (`id`),
  CONSTRAINT `recipient_recipientg_recipientgroup_id_bfbeeb43_fk_recipient` FOREIGN KEY (`recipientgroup_id`) REFERENCES `recipient_recipientgroup` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipient_recipientgroup_pathways`
--

LOCK TABLES `recipient_recipientgroup_pathways` WRITE;
/*!40000 ALTER TABLE `recipient_recipientgroup_pathways` DISABLE KEYS */;
/*!40000 ALTER TABLE `recipient_recipientgroup_pathways` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipient_recipientgroupmembership`
--

DROP TABLE IF EXISTS `recipient_recipientgroupmembership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipient_recipientgroupmembership` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `membership_name` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  `recipient_group_id` int(11) NOT NULL,
  `recipient_profile_id` int(11) NOT NULL,
  `slug` varchar(254) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entity_id` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  `entity_version` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `recipient_recipientgroupmembership_entity_id_6a565410_uniq` (`entity_id`),
  KEY `recipient_recipientg_recipient_group_id_74cc491a_fk_recipient` (`recipient_group_id`),
  KEY `recipient_recipientg_recipient_profile_id_bb1b50c3_fk_recipient` (`recipient_profile_id`),
  CONSTRAINT `recipient_recipientg_recipient_group_id_74cc491a_fk_recipient` FOREIGN KEY (`recipient_group_id`) REFERENCES `recipient_recipientgroup` (`id`),
  CONSTRAINT `recipient_recipientg_recipient_profile_id_bb1b50c3_fk_recipient` FOREIGN KEY (`recipient_profile_id`) REFERENCES `recipient_recipientprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipient_recipientgroupmembership`
--

LOCK TABLES `recipient_recipientgroupmembership` WRITE;
/*!40000 ALTER TABLE `recipient_recipientgroupmembership` DISABLE KEYS */;
/*!40000 ALTER TABLE `recipient_recipientgroupmembership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipient_recipientprofile`
--

DROP TABLE IF EXISTS `recipient_recipientprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipient_recipientprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `recipient_identifier` varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  `public` tinyint(1) NOT NULL,
  `display_name` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  `badge_user_id` int(11) DEFAULT NULL,
  `slug` varchar(254) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  `entity_id` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  `entity_version` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `recipient_recipientprofile_entity_id_44a2b728_uniq` (`entity_id`),
  KEY `recipient_recipientprofile_badge_user_id_e82bd738_fk_users_id` (`badge_user_id`),
  KEY `recipient_recipientprofile_created_by_id_d592d4c2_fk_users_id` (`created_by_id`),
  KEY `recipient_recipientprofile_updated_by_id_b083f232_fk_users_id` (`updated_by_id`),
  CONSTRAINT `recipient_recipientprofile_badge_user_id_e82bd738_fk_users_id` FOREIGN KEY (`badge_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `recipient_recipientprofile_created_by_id_d592d4c2_fk_users_id` FOREIGN KEY (`created_by_id`) REFERENCES `users` (`id`),
  CONSTRAINT `recipient_recipientprofile_updated_by_id_b083f232_fk_users_id` FOREIGN KEY (`updated_by_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipient_recipientprofile`
--

LOCK TABLES `recipient_recipientprofile` WRITE;
/*!40000 ALTER TABLE `recipient_recipientprofile` DISABLE KEYS */;
/*!40000 ALTER TABLE `recipient_recipientprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialaccount`
--

DROP TABLE IF EXISTS `socialaccount_socialaccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socialaccount_socialaccount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `uid` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime(6) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `extra_data` longtext COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialaccount_provider_uid_fc810c6e_uniq` (`provider`,`uid`),
  KEY `socialaccount_socialaccount_user_id_8146e70c_fk_users_id` (`user_id`),
  CONSTRAINT `socialaccount_socialaccount_user_id_8146e70c_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialaccount`
--

LOCK TABLES `socialaccount_socialaccount` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialaccount` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialaccount_socialaccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialapp`
--

DROP TABLE IF EXISTS `socialaccount_socialapp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socialaccount_socialapp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `client_id` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `secret` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `key` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialapp`
--

LOCK TABLES `socialaccount_socialapp` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialapp` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialaccount_socialapp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialapp_sites`
--

DROP TABLE IF EXISTS `socialaccount_socialapp_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socialaccount_socialapp_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `socialapp_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialapp_sites_socialapp_id_site_id_71a9a768_uniq` (`socialapp_id`,`site_id`),
  KEY `socialaccount_socialapp_sites_site_id_2579dee5_fk_django_site_id` (`site_id`),
  CONSTRAINT `socialaccount_social_socialapp_id_97fb6e7d_fk_socialacc` FOREIGN KEY (`socialapp_id`) REFERENCES `socialaccount_socialapp` (`id`),
  CONSTRAINT `socialaccount_socialapp_sites_site_id_2579dee5_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialapp_sites`
--

LOCK TABLES `socialaccount_socialapp_sites` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialapp_sites` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialaccount_socialapp_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialtoken`
--

DROP TABLE IF EXISTS `socialaccount_socialtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socialaccount_socialtoken` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` longtext COLLATE utf8_unicode_ci NOT NULL,
  `token_secret` longtext COLLATE utf8_unicode_ci NOT NULL,
  `expires_at` datetime(6) DEFAULT NULL,
  `account_id` int(11) NOT NULL,
  `app_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq` (`app_id`,`account_id`),
  KEY `socialaccount_social_account_id_951f210e_fk_socialacc` (`account_id`),
  CONSTRAINT `socialaccount_social_account_id_951f210e_fk_socialacc` FOREIGN KEY (`account_id`) REFERENCES `socialaccount_socialaccount` (`id`),
  CONSTRAINT `socialaccount_social_app_id_636a42d7_fk_socialacc` FOREIGN KEY (`app_id`) REFERENCES `socialaccount_socialapp` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialtoken`
--

LOCK TABLES `socialaccount_socialtoken` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialtoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialaccount_socialtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `entity_id` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  `entity_version` int(10) unsigned NOT NULL,
  `badgrapp_id` int(11) DEFAULT NULL,
  `marketing_opt_in` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `users_entity_id_7c2ce66e_uniq` (`entity_id`),
  KEY `users_badgrapp_id_ccdc67a0_fk_mainsite_badgrapp_id` (`badgrapp_id`),
  CONSTRAINT `users_badgrapp_id_ccdc67a0_fk_mainsite_badgrapp_id` FOREIGN KEY (`badgrapp_id`) REFERENCES `mainsite_badgrapp` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'pbkdf2_sha256$36000$E2CnfgMhQBxz$6BkW//PLzIixdUSIVsMftj/k8Y+rEzAJm3RPcaRV62Y=',NULL,1,'badgradmin','','','badgradmin@localhost',1,1,'2020-01-21 03:17:00.997663','aTr57sJeRRylRhdO_AJwhA',3,NULL,0),(4,'pbkdf2_sha256$36000$34LmykdVdOsW$Wee9AMBlLtFD8kRqpDmUvyzbgZdOEFFVP/zRTw8TNFk=',NULL,0,'badgrVs5qcK75EA9/9UB6qxXlMg==','badgr','user','badgruser@localhost.local',0,1,'2020-01-21 04:02:15.689568','U_P3eNqsQB6jHZpJC_Onag',4,1,0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_groups`
--

DROP TABLE IF EXISTS `users_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `badgeuser_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_groups_badgeuser_id_group_id_5ee546fb_uniq` (`badgeuser_id`,`group_id`),
  KEY `users_groups_group_id_2f3517aa_fk_auth_group_id` (`group_id`),
  CONSTRAINT `users_groups_badgeuser_id_2fa1cae5_fk_users_id` FOREIGN KEY (`badgeuser_id`) REFERENCES `users` (`id`),
  CONSTRAINT `users_groups_group_id_2f3517aa_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_groups`
--

LOCK TABLES `users_groups` WRITE;
/*!40000 ALTER TABLE `users_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_user_permissions`
--

DROP TABLE IF EXISTS `users_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `badgeuser_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_user_permissions_badgeuser_id_permission_id_3492fb2d_uniq` (`badgeuser_id`,`permission_id`),
  KEY `users_user_permissio_permission_id_6d08dcd2_fk_auth_perm` (`permission_id`),
  CONSTRAINT `users_user_permissio_permission_id_6d08dcd2_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `users_user_permissions_badgeuser_id_3e8a9166_fk_users_id` FOREIGN KEY (`badgeuser_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_user_permissions`
--

LOCK TABLES `users_user_permissions` WRITE;
/*!40000 ALTER TABLE `users_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-21 13:04:32
