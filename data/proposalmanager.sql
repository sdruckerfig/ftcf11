CREATE DATABASE  IF NOT EXISTS `ProposalManager` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `ProposalManager`;
-- MySQL dump 10.13  Distrib 5.6.19, for osx10.7 (i386)
--
-- Host: localhost    Database: ProposalManager
-- ------------------------------------------------------
-- Server version	5.6.24

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
-- Table structure for table `AppUser`
--

DROP TABLE IF EXISTS `AppUser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AppUser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  `idCompany` int(11) NOT NULL,
  `idRole` int(11) NOT NULL,
  `updateuser` varchar(45) DEFAULT NULL,
  `updatedate` datetime DEFAULT NULL,
  `begintime` datetime DEFAULT NULL,
  `endtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AppUser`
--

LOCK TABLES `AppUser` WRITE;
/*!40000 ALTER TABLE `AppUser` DISABLE KEYS */;
INSERT INTO `AppUser` VALUES (1,'Administrator','password','sdrucker@figleaf.com',1,3,'sdrucker','2015-03-03 15:57:00',NULL,NULL),(2,'Admin','password','sdrucker@figleaf.com',1,2,'sdrucker','2015-03-03 15:57:00',NULL,NULL),(3,'User','password','sdrucker@figleaf.com',1,1,'administrator','2015-03-15 18:25:00',NULL,NULL);
/*!40000 ALTER TABLE `AppUser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Asset`
--

DROP TABLE IF EXISTS `Asset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Asset` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `idAssetType` int(11) DEFAULT NULL,
  `idClient` int(11) DEFAULT NULL,
  `dateDue` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `fullContent` mediumtext,
  `bWin` bit(1) DEFAULT b'0',
  `ownerId` int(11) DEFAULT NULL,
  `idCompany` int(11) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `contentUrl` varchar(255) DEFAULT NULL,
  `updateuser` varchar(45) DEFAULT NULL,
  `updatedate` datetime DEFAULT NULL,
  `begintime` datetime DEFAULT NULL,
  `endtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `idx_Asset_title_description_fullContent` (`title`,`description`,`fullContent`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Asset`
--

LOCK TABLES `Asset` WRITE;
/*!40000 ALTER TABLE `Asset` DISABLE KEYS */;
INSERT INTO `Asset` VALUES (1,'Tester 2',1,NULL,NULL,NULL,NULL,'\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'Tester 2',1,1,NULL,NULL,NULL,'\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,'Tester 2',1,1,NULL,'',NULL,'\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,'Tester 2',1,1,NULL,'',NULL,'\0',1,1,NULL,'','Administrator','2015-03-11 22:38:00','2015-03-11 22:38:00','2015-03-12 19:23:00'),(5,'Tester 2',1,1,NULL,'',NULL,'\0',1,1,NULL,'','Administrator','2015-03-11 22:45:00','2015-03-11 22:45:00','2015-03-12 19:22:00'),(6,'Test',1,1,NULL,'','','\0',1,1,NULL,'','Administrator','2015-03-11 22:56:00','2015-03-11 22:56:00','2015-03-12 19:25:00'),(7,'Test',1,1,NULL,'','','\0',1,1,NULL,'','Administrator','2015-03-11 22:57:00','2015-03-11 22:57:00','2015-03-12 19:32:00'),(8,'Sample Link to Google Doc',1,3,'2015-03-13 00:00:00','Sample link to Google Doc','<p>This is full text</p>','',1,1,NULL,'https://docs.google.com/a/figleaf.com/document/d/1gz4pAhJ6rX-eWBXw2WTGoGDqv4C8yFRJNGKXsbuJoZ8/edit','Administrator','2015-03-15 19:07:00','2015-03-11 23:00:00',NULL),(9,'Sample Image Asset',2,1,'2015-03-03 00:00:00','A sample image asset',NULL,'\0',1,1,'resources/sampledata/Steve1.jpg',NULL,'User','2015-03-15 18:46:00','2015-03-12 17:45:00',NULL),(10,'Sample PDF File Upload',1,1,'2015-03-26 00:00:00','A sample PDF File upload',NULL,'\0',1,1,'resources/sampledata/sampleproposal.pdf',NULL,'Administrator','2015-03-15 18:47:00','2015-03-12 17:45:00',NULL),(11,'Asset 1',1,NULL,NULL,NULL,NULL,'\0',1,1,NULL,NULL,'Administrator','2015-03-12 17:50:00','2015-03-12 17:50:00','2015-03-14 19:39:00'),(12,'Goo',1,3,'2015-03-16 00:00:00','Description',NULL,'\0',1,1,NULL,NULL,'Administrator','2015-03-13 15:37:00','2015-03-12 18:09:00','2015-03-14 19:39:00'),(13,'Hey',2,NULL,NULL,NULL,NULL,'\0',1,1,NULL,NULL,'Administrator','2015-03-12 18:33:00','2015-03-12 18:33:00','2015-03-14 19:39:00'),(14,'Steve Test 1',2,NULL,NULL,NULL,NULL,'\0',1,1,NULL,NULL,'Administrator','2015-03-12 19:40:00','2015-03-12 19:40:00','2015-03-14 19:39:00'),(15,'Hey Now',1,NULL,NULL,NULL,NULL,'\0',1,1,NULL,NULL,'Administrator','2015-03-12 19:53:00','2015-03-12 19:53:00','2015-03-13 19:17:00'),(16,'fugu',2,NULL,NULL,NULL,NULL,'\0',1,1,NULL,NULL,'Administrator','2015-03-13 06:56:00','2015-03-13 06:56:00','2015-03-13 19:17:00'),(17,'Goo',1,NULL,NULL,'Hey',NULL,'\0',1,1,NULL,NULL,'Administrator','2015-03-13 07:06:00','2015-03-13 07:06:00','2015-03-13 19:17:00'),(18,'January Proposal 1',1,1,'2015-01-06 00:00:00','Test Proposal 1','<p>Fig Leaf Software, Inc. is a Service-Disabled, Veteran-Owned Small Business (SDVOSB) and privately held corporation based in Washington, D.C. Since 1992, Fig Leaf has provided expert services in the focus areas of user experience, content strategy, inbound marketing, &nbsp;custom application development, CMS implementation, technical training, mobile application development, and product sales/support. &nbsp;&nbsp;As an award-winning team of imaginative designers, innovative developers, engaging instructors, and insightful strategists, Fig Leaf Software provides consultative guidance and facilitating and implementing a comprehensive communications strategy.</p>\n<p>Over the past 20 years, Fig Leaf has become an expert in redesign projects that focus on maximizing content and images, simplifying navigation and access to content, and involve universally-appealing designs. We are confident in our abilities to deliver this project on-time/on-budget based on our unparalleled experience and track record in delivering quality, highly transactional mobile apps, including:</p>\n<ul>\n<li><strong>State Bar of Georgia</strong><br />A simple html5-based web app that integrates with their membership directory and CommonSpot-based content management system.<br /><br /></li>\n<li><strong>Archdiocese of St. Louis</strong>&nbsp;<br />An HTML5/Cordova based mobile application featuring push notifications and GeoPositioning, available via Apple&rsquo;s App Store and Google Play<br /><br /></li>\n<li><strong>Pella Doors and Windows Employee Engagement<br /></strong>Features push notifications, saving data locally to the user&rsquo;s device, audio (MP3)/video (MP4) storage and playback, as well as integrated PDF viewing. &nbsp;This app is available only to Pella employees and can be downloaded and installed from a url that sits behind their corporate firewall, bypassing the Apple &amp; Android App Stores.</li>\n</ul>\n<p>&nbsp;</p>','',3,1,NULL,'','Administrator','2015-03-15 19:12:00','2015-03-15 18:27:00',NULL),(19,'Sample RFP',3,7,'2015-02-03 00:00:00','A sample RFP in PDF format','','\0',1,1,'resources/sampledata/samplerfp.pdf','','Administrator','2015-03-15 19:26:00','2015-03-15 19:21:00','2015-05-01 15:08:25');
/*!40000 ALTER TABLE `Asset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AssetTag`
--

DROP TABLE IF EXISTS `AssetTag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AssetTag` (
  `assetid` int(11) NOT NULL,
  `tagid` int(11) NOT NULL,
  PRIMARY KEY (`assetid`,`tagid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AssetTag`
--

LOCK TABLES `AssetTag` WRITE;
/*!40000 ALTER TABLE `AssetTag` DISABLE KEYS */;
INSERT INTO `AssetTag` VALUES (8,2);
/*!40000 ALTER TABLE `AssetTag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AssetTerm`
--

DROP TABLE IF EXISTS `AssetTerm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AssetTerm` (
  `assetid` int(11) NOT NULL,
  `termid` int(11) NOT NULL,
  PRIMARY KEY (`assetid`,`termid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AssetTerm`
--

LOCK TABLES `AssetTerm` WRITE;
/*!40000 ALTER TABLE `AssetTerm` DISABLE KEYS */;
INSERT INTO `AssetTerm` VALUES (8,2);
/*!40000 ALTER TABLE `AssetTerm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AssetType`
--

DROP TABLE IF EXISTS `AssetType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AssetType` (
  `id` int(11) NOT NULL,
  `text` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AssetType`
--

LOCK TABLES `AssetType` WRITE;
/*!40000 ALTER TABLE `AssetType` DISABLE KEYS */;
INSERT INTO `AssetType` VALUES (1,'Proposal'),(2,'Stock'),(3,'RFP');
/*!40000 ALTER TABLE `AssetType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Company`
--

DROP TABLE IF EXISTS `Company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `companyName` varchar(45) NOT NULL,
  `updateuser` varchar(45) DEFAULT NULL,
  `updatedate` datetime DEFAULT NULL,
  `begintime` datetime DEFAULT NULL,
  `endtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Company`
--

LOCK TABLES `Company` WRITE;
/*!40000 ALTER TABLE `Company` DISABLE KEYS */;
INSERT INTO `Company` VALUES (1,'Fig Leaf Software','Administrator','2015-03-08 11:36:00',NULL,NULL),(2,'Another','Administrator','2015-03-08 11:31:00','2015-03-08 11:31:00','2015-03-08 11:36:00'),(3,'Another one','Administrator','2015-03-08 11:32:00','2015-03-08 11:32:00','2015-03-08 11:36:00'),(4,'Bogus Software, Inc.','Administrator','2015-03-08 14:08:00','2015-03-08 14:08:00',NULL);
/*!40000 ALTER TABLE `Company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tag`
--

DROP TABLE IF EXISTS `Tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` varchar(45) NOT NULL,
  `idUser` int(11) DEFAULT NULL,
  `updateuser` varchar(45) DEFAULT NULL,
  `updatedate` datetime DEFAULT NULL,
  `begintime` datetime DEFAULT NULL,
  `endtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tag`
--

LOCK TABLES `Tag` WRITE;
/*!40000 ALTER TABLE `Tag` DISABLE KEYS */;
INSERT INTO `Tag` VALUES (1,'Stuff',1,'Administrator','2015-03-14 21:19:00','2015-03-14 21:19:00','2015-03-14 21:19:00'),(2,'More Stuff',1,'Administrator','2015-03-14 21:19:00','2015-03-14 21:19:00',NULL),(3,'Still More',1,'Administrator','2015-03-14 21:27:00','2015-03-14 21:27:00',NULL),(4,'Star Trek',1,'Administrator','2015-03-14 21:27:00','2015-03-14 21:27:00',NULL),(5,'Star Wars',1,'Administrator','2015-03-15 09:36:00','2015-03-15 09:36:00',NULL);
/*!40000 ALTER TABLE `Tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UserRole`
--

DROP TABLE IF EXISTS `UserRole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UserRole` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(45) NOT NULL,
  `updateuser` varchar(45) DEFAULT NULL,
  `updatedate` datetime DEFAULT NULL,
  `begintime` datetime DEFAULT NULL,
  `endtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UserRole`
--

LOCK TABLES `UserRole` WRITE;
/*!40000 ALTER TABLE `UserRole` DISABLE KEYS */;
INSERT INTO `UserRole` VALUES (1,'User',NULL,NULL,NULL,NULL),(2,'Admin',NULL,NULL,NULL,NULL),(3,'SuperAdmin',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `UserRole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'ProposalManager'
--
/*!50003 DROP PROCEDURE IF EXISTS `authenticate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `authenticate`(IN usrname char(30), IN pwd char(30))
BEGIN
  select AppUser.*, UserRole.label as roleName
  from AppUser inner join UserRole
  			 on AppUser.idRole = UserRole.id
  where AppUser.endtime is null
  and username = usrname
  and password = pwd;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-05-07 21:59:10
