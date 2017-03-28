CREATE DATABASE  IF NOT EXISTS `social_network` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `social_network`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: social_network
-- ------------------------------------------------------
-- Server version	5.6.20

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
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `CommentId` int(11) NOT NULL AUTO_INCREMENT,
  `Comment` varchar(255) DEFAULT NULL,
  `DateOfComment` datetime DEFAULT NULL,
  `PersonId` int(11) DEFAULT NULL,
  `PostId` int(11) DEFAULT NULL,
  PRIMARY KEY (`CommentId`),
  KEY `FK_10ii3r4u2gwbfsjjlhtygnvfy` (`PersonId`),
  KEY `FK_djpx7uaxaibph6mccuishxp4w` (`PostId`),
  CONSTRAINT `FK_10ii3r4u2gwbfsjjlhtygnvfy` FOREIGN KEY (`PersonId`) REFERENCES `person` (`PersonId`),
  CONSTRAINT `FK_djpx7uaxaibph6mccuishxp4w` FOREIGN KEY (`PostId`) REFERENCES `posts` (`PostId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,'nothing','2015-04-24 16:42:51',3,6),(2,'hello','2015-04-24 16:51:16',1,8),(3,'hello','2015-04-24 16:51:22',1,9),(4,'hello','2015-04-24 16:51:24',1,9),(5,'hello','2015-04-24 16:51:26',1,9);
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friends`
--

DROP TABLE IF EXISTS `friends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `friends` (
  `relationId` int(11) NOT NULL AUTO_INCREMENT,
  `fromUser` int(11) DEFAULT NULL,
  `isAccepted` bit(1) DEFAULT NULL,
  `toUser` int(11) DEFAULT NULL,
  PRIMARY KEY (`relationId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friends`
--

LOCK TABLES `friends` WRITE;
/*!40000 ALTER TABLE `friends` DISABLE KEYS */;
INSERT INTO `friends` VALUES (1,1,'',2),(2,1,'',3),(3,3,'',2),(4,5,'\0',3),(5,5,'',4),(6,3,'\0',4);
/*!40000 ALTER TABLE `friends` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inbox`
--

DROP TABLE IF EXISTS `inbox`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inbox` (
  `InboxId` int(11) NOT NULL AUTO_INCREMENT,
  `DateOfMessage` datetime DEFAULT NULL,
  `isRead` bit(1) DEFAULT NULL,
  `Message` varchar(255) DEFAULT NULL,
  `fromUser` int(11) DEFAULT NULL,
  `toUser` int(11) DEFAULT NULL,
  PRIMARY KEY (`InboxId`),
  KEY `FK_lj4w0gopttxes8nwyce20xxil` (`fromUser`),
  KEY `FK_m92n679tpdxbau56cdbr9cva7` (`toUser`),
  CONSTRAINT `FK_lj4w0gopttxes8nwyce20xxil` FOREIGN KEY (`fromUser`) REFERENCES `person` (`PersonId`),
  CONSTRAINT `FK_m92n679tpdxbau56cdbr9cva7` FOREIGN KEY (`toUser`) REFERENCES `person` (`PersonId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inbox`
--

LOCK TABLES `inbox` WRITE;
/*!40000 ALTER TABLE `inbox` DISABLE KEYS */;
INSERT INTO `inbox` VALUES (1,'2015-04-24 16:31:39','','hi',3,1),(2,'2015-04-24 17:00:54','\0','hello',4,5),(3,'2015-04-24 17:02:36','','hey',2,1),(4,'2015-04-24 18:44:09','','Hello',3,1),(5,'2017-03-26 10:41:40','','Hey How are you?',1,2);
/*!40000 ALTER TABLE `inbox` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification` (
  `nId` int(11) NOT NULL AUTO_INCREMENT,
  `isSeen` bit(1) DEFAULT NULL,
  `Notification` varchar(255) DEFAULT NULL,
  `fromUser` int(11) DEFAULT NULL,
  `PostId` int(11) DEFAULT NULL,
  `toUser` int(11) DEFAULT NULL,
  PRIMARY KEY (`nId`),
  KEY `FK_82i7yn73uqf5h5pl21h7lcobs` (`fromUser`),
  KEY `FK_r6hlisjbfeijfkovd4pbc9h21` (`PostId`),
  KEY `FK_gt2ayfsad7u4uncrxkj0gnwop` (`toUser`),
  CONSTRAINT `FK_82i7yn73uqf5h5pl21h7lcobs` FOREIGN KEY (`fromUser`) REFERENCES `person` (`PersonId`),
  CONSTRAINT `FK_gt2ayfsad7u4uncrxkj0gnwop` FOREIGN KEY (`toUser`) REFERENCES `person` (`PersonId`),
  CONSTRAINT `FK_r6hlisjbfeijfkovd4pbc9h21` FOREIGN KEY (`PostId`) REFERENCES `posts` (`PostId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
INSERT INTO `notification` VALUES (1,'','Harshit Shah liked your post',3,1,3),(2,'','Harshit Shah liked your post',3,2,1),(3,'','Harshit Shah liked your post',3,2,1),(4,'','Abhinav Punj liked your post',1,3,2),(5,'\0','Harshit Shah commented on your post',3,6,3),(6,'','Abhinav Punj commented on your post',1,8,1),(7,'','Abhinav Punj commented on your post',1,9,1),(8,'','Abhinav Punj commented on your post',1,9,1),(9,'','Abhinav Punj commented on your post',1,9,1),(10,'','Apoorva Joshi liked your post',2,13,2);
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person` (
  `PersonId` int(11) NOT NULL AUTO_INCREMENT,
  `DateOfBirth` date DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `FirstName` varchar(255) DEFAULT NULL,
  `Gender` varchar(255) DEFAULT NULL,
  `LastName` varchar(255) DEFAULT NULL,
  `profilePic` tinyblob,
  `ProfilePicPath` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`PersonId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES (1,'1989-08-08','shrutipatankar8@gmail.com','Shruti','Female','Patankar',NULL,NULL),(2,'1991-04-12','apoorvajoshi@yahoo.com','Apoorva','Female','Joshi',NULL,NULL),(3,'1991-02-25','harshitshah@gmail.com','Harshit','Male','Shah',NULL,'resources/assets/img/profile/tiger.jpg'),(4,'1988-12-31','johnbing@yahoo.com','John','Male','Bing',NULL,'resources/assets/img/profile/surf.jpg'),(5,'1969-12-31','emilyperry@yahoo.com','Emily','Female','Perry',NULL,'resources/assets/img/profile/butterfly.jpg');
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts` (
  `PostId` int(11) NOT NULL AUTO_INCREMENT,
  `DateOfPost` datetime DEFAULT NULL,
  `Likes` int(11) DEFAULT NULL,
  `Status` varchar(255) DEFAULT NULL,
  `PersonId` int(11) DEFAULT NULL,
  PRIMARY KEY (`PostId`),
  KEY `FK_6uaurswulhyik5328v9tc8naf` (`PersonId`),
  CONSTRAINT `FK_6uaurswulhyik5328v9tc8naf` FOREIGN KEY (`PersonId`) REFERENCES `person` (`PersonId`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'2015-04-24 16:24:50',1,'Whats up.....',3),(2,'2015-04-24 16:27:37',2,'This is my first post.',1),(3,'2015-04-24 16:37:52',1,'I am new here\r\n',2),(4,'2015-04-24 16:40:54',0,'How do you like this?',1),(5,'2015-04-24 16:42:17',0,'I am liking this',3),(6,'2015-04-24 16:42:28',0,'So whats new',3),(7,'2015-04-24 16:43:26',0,'Calm...',1),(8,'2015-04-24 16:44:06',0,'Keep On!',1),(9,'2015-04-24 16:50:55',0,'hey',1),(10,'2015-04-24 17:01:19',0,'hi',4),(11,'2015-04-24 17:01:23',0,'hi',4),(12,'2015-04-24 17:01:25',0,'ji',4),(13,'2015-04-24 17:12:33',1,'he',2),(14,'2015-04-24 18:46:27',0,'',2);
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts_comments`
--

DROP TABLE IF EXISTS `posts_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts_comments` (
  `Posts_PostId` int(11) NOT NULL,
  `comments_CommentId` int(11) NOT NULL,
  UNIQUE KEY `UK_spo96yj5j91etdvchxb8tjlio` (`comments_CommentId`),
  KEY `FK_mpxj2r32bdeo0js8w9eh3pp9k` (`Posts_PostId`),
  CONSTRAINT `FK_mpxj2r32bdeo0js8w9eh3pp9k` FOREIGN KEY (`Posts_PostId`) REFERENCES `posts` (`PostId`),
  CONSTRAINT `FK_spo96yj5j91etdvchxb8tjlio` FOREIGN KEY (`comments_CommentId`) REFERENCES `comments` (`CommentId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts_comments`
--

LOCK TABLES `posts_comments` WRITE;
/*!40000 ALTER TABLE `posts_comments` DISABLE KEYS */;
INSERT INTO `posts_comments` VALUES (6,1),(8,2),(9,3),(9,4),(9,5);
/*!40000 ALTER TABLE `posts_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts_notification`
--

DROP TABLE IF EXISTS `posts_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts_notification` (
  `Posts_PostId` int(11) NOT NULL,
  `notifications_nId` int(11) NOT NULL,
  UNIQUE KEY `UK_hceexa4s4sldnoyovnj7c50gm` (`notifications_nId`),
  KEY `FK_qtmldj9sxnypk30gmljnj5wmk` (`Posts_PostId`),
  CONSTRAINT `FK_hceexa4s4sldnoyovnj7c50gm` FOREIGN KEY (`notifications_nId`) REFERENCES `notification` (`nId`),
  CONSTRAINT `FK_qtmldj9sxnypk30gmljnj5wmk` FOREIGN KEY (`Posts_PostId`) REFERENCES `posts` (`PostId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts_notification`
--

LOCK TABLES `posts_notification` WRITE;
/*!40000 ALTER TABLE `posts_notification` DISABLE KEYS */;
INSERT INTO `posts_notification` VALUES (1,1),(2,2),(2,3),(3,4),(6,5),(8,6),(9,7),(9,8),(9,9),(13,10);
/*!40000 ALTER TABLE `posts_notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `useraccount`
--

DROP TABLE IF EXISTS `useraccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `useraccount` (
  `PersonId` int(11) NOT NULL,
  `password` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `role_role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`PersonId`),
  KEY `FK_aog2rahvi0s4mcs7f2cq9qc2n` (`role_role_id`),
  CONSTRAINT `FK_aog2rahvi0s4mcs7f2cq9qc2n` FOREIGN KEY (`role_role_id`) REFERENCES `userrole` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `useraccount`
--

LOCK TABLES `useraccount` WRITE;
/*!40000 ALTER TABLE `useraccount` DISABLE KEYS */;
INSERT INTO `useraccount` VALUES (1,'123','shrutip',1),(2,'123','apoorvajoshi',1),(3,'123','harshitshah',1),(4,'123','johnbing',1),(5,'123','emilyperry',1);
/*!40000 ALTER TABLE `useraccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userrole`
--

DROP TABLE IF EXISTS `userrole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userrole` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userrole`
--

LOCK TABLES `userrole` WRITE;
/*!40000 ALTER TABLE `userrole` DISABLE KEYS */;
INSERT INTO `userrole` VALUES (1,'user');
/*!40000 ALTER TABLE `userrole` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-03-28  3:02:46
