CREATE DATABASE  IF NOT EXISTS `hnashop` /*!40100 DEFAULT CHARACTER SET utf8mb4 collate utf8mb4_unicode_ci */;
USE `hnashop`;
-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: hnashop
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.16-MariaDB

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
-- Table structure for table `Brand`
--

DROP TABLE IF EXISTS `Brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Brand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Brand`
--

LOCK TABLES `Brand` WRITE;
/*!40000 ALTER TABLE `Brand` DISABLE KEYS */;
INSERT INTO `Brand` VALUES (1,'Apple','1'),(2,'aaa','1'),(3,'samsung','1');
/*!40000 ALTER TABLE `Brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Category`
--

DROP TABLE IF EXISTS `Category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Category`
--

LOCK TABLES `Category` WRITE;
/*!40000 ALTER TABLE `Category` DISABLE KEYS */;
INSERT INTO `Category` VALUES (1,0,'Computer','https://cdn.filestackcontent.com/eSpEBJonRNafaM27CmLX',1),(2,0,'Clothes','https://cdn.filestackcontent.com/8MddtImQEeT3H00ygm9w',1),(3,1,'Laptop','',1),(4,1,'Desktop','https://cdn.filestackcontent.com/ytUn6y1fQLa1W0KW7rW9',1),(5,3,'Laptop HP','',1),(6,3,'Laptop Dell','',1),(7,3,'Macbook','',1),(8,2,'Men','https://cdn.filestackcontent.com/sKGePBJXS9KikD73oFtp',1),(9,2,'Women','',1);
/*!40000 ALTER TABLE `Category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CategoryProperty`
--

DROP TABLE IF EXISTS `CategoryProperty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CategoryProperty` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `catId` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CategoryProperty`
--

LOCK TABLES `CategoryProperty` WRITE;
/*!40000 ALTER TABLE `CategoryProperty` DISABLE KEYS */;
INSERT INTO `CategoryProperty` VALUES (1,3,'Battery','1'),(2,1,'color','1'),(3,1,'size','1');
/*!40000 ALTER TABLE `CategoryProperty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Image`
--

DROP TABLE IF EXISTS `Image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ProductId` int(11) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Image`
--

LOCK TABLES `Image` WRITE;
/*!40000 ALTER TABLE `Image` DISABLE KEYS */;
/*!40000 ALTER TABLE `Image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Order`
--

DROP TABLE IF EXISTS `Order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `status` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Order`
--

LOCK TABLES `Order` WRITE;
/*!40000 ALTER TABLE `Order` DISABLE KEYS */;
INSERT INTO `Order` VALUES (27,5,'2017-06-13 21:37:40','2017-06-13 21:37:40','','safsags','hieu','','sadsad','1'),(28,5,'2017-06-13 22:17:02','2017-06-13 22:17:02','','safsags','hieu','','sadsad','1'),(29,5,'2017-06-13 22:55:14','2017-06-13 22:55:14','','126 ??i c?n ba ?ình hà n?i','Nguy?n Trung Hi?u','12312321242142','trunghieuhp2000@gmail.com','1'),(34,7,'2017-06-14 09:06:21','2017-06-14 09:06:21','','32 ngõ 288 hoàng mai','nguy?n trung hi?u','','hieu','1'),(35,7,'2017-06-14 09:15:23','2017-06-14 09:15:34','','32 ngõ 288 hoàng mai','nguy?n trung hi?u','21421421','hieu','1'),(36,NULL,NULL,NULL,NULL,'hoàng mai','Nguyễn trung hiếu',NULL,NULL,NULL),(37,7,'2017-06-14 09:39:49','2017-06-14 09:39:49','','32 ngõ 288 hoàng mai','nguy?n trung hi?u','','hieu','1'),(38,8,'2017-06-14 11:47:08','2017-06-14 11:47:08','','dsadsadsad','nguy?n trung hi?u','','bimbimsweet213213','1'),(39,8,'2017-06-14 11:48:38','2017-06-14 11:48:38','','dsadsadsad','nguy?n trung hi?u hoàng mai','','bimbimsweet213213','1');
/*!40000 ALTER TABLE `Order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrderDetail`
--

DROP TABLE IF EXISTS `OrderDetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OrderDetail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `OrderId` int(11) DEFAULT NULL,
  `ProductId` int(11) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrderDetail`
--

LOCK TABLES `OrderDetail` WRITE;
/*!40000 ALTER TABLE `OrderDetail` DISABLE KEYS */;
INSERT INTO `OrderDetail` VALUES (1,16,5,NULL,10,'1'),(2,16,7,NULL,1,'1'),(3,17,5,NULL,1,'1'),(4,18,9,NULL,1,'1'),(5,19,9,NULL,1,'1'),(7,20,7,NULL,1,NULL),(8,20,10,NULL,2,'1'),(9,21,7,NULL,1,NULL),(10,21,10,NULL,1,NULL),(11,22,7,NULL,1,NULL),(12,22,10,NULL,1,NULL),(13,25,10,NULL,5,'1'),(15,27,10,NULL,10,'1'),(16,29,6,NULL,81,NULL),(21,34,7,NULL,1,NULL),(22,35,7,NULL,1,NULL),(23,35,5,NULL,1,NULL),(24,37,6,NULL,1,NULL),(25,38,5,NULL,1,NULL),(26,39,5,NULL,1,NULL);
/*!40000 ALTER TABLE `OrderDetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Product`
--

DROP TABLE IF EXISTS `Product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` float DEFAULT NULL,
  `shopId` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `createdAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `BrandId` int(11) DEFAULT NULL,
  `status` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CategoryId` int(11) DEFAULT NULL,
  `outOfStock` tinyint(1) DEFAULT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci,
  `Image` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `property` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Product`
--

LOCK TABLES `Product` WRITE;
/*!40000 ALTER TABLE `Product` DISABLE KEYS */;
INSERT INTO `Product` VALUES (5,'iphone1',55555,2,5,'2017-03-30 19:00:39',1,'1',1,NULL,'<p>sadsadsads</p>','https://cdn.filestackcontent.com/ZGAoVaKDQPScz5zqNkls',''),(6,'iphone 2',1223,2,6,'2017-06-13 11:44:15',0,'1',1,NULL,'','https://cdn.filestackcontent.com/Dd154sPLT9KNbvpbUB1E',''),(7,'sadsadsad',10000000,2,7,'2016-11-01 22:22:29',2,'1',8,NULL,'<p>what that fuck</p>','https://cdn.filestackcontent.com/cmkmhD8WRP2ar6wx8lPY',''),(8,'sadsadsa',211232000,4,8,'2017-06-13 11:44:14',1,'1',2,NULL,'','https://cdn.filestackcontent.com/ETTvTnRiTKCR4ZEvrs0M','{}'),(9,'sadsadsadsa',1000000,4,9,'2017-06-13 11:44:13',2,'1',8,NULL,'<p><img src=\"https://cdn.filestackcontent.com/CLiGp1eMSeyquiipUqvr\" />ssadsadsadsadsadsa</p>','https://cdn.filestackcontent.com/dBcoCXsCTDOWHkFvTuF3','{}'),(10,'iphone tau',10000000,4,10,'2017-06-13 20:46:59',2,'1',8,NULL,'','https://cdn.filestackcontent.com/uYBO2omAQ3qscIYsb1lA','{}'),(11,' áo tàu ?',123123000,5,0,'2017-06-14 09:49:56',1,'0',8,NULL,'','https://cdn.filestackcontent.com/Tun7DIU5Quu1vJJmAouB','{}'),(12,'nguy?n trung hi?u',NULL,NULL,NULL,'2017-06-14 11:34:54',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(13,'nguy?n trung hi?u',NULL,NULL,NULL,'2017-06-14 11:34:58',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(14,'nguyễn trung hiếu',NULL,NULL,NULL,'2017-06-14 11:37:34',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(15,'nguy?n trung hi?u',21421400000,6,0,'2017-06-14 11:42:48',1,'0',2,NULL,'','https://cdn.filestackcontent.com/hKsiGQUQRsqhQRiwhHlA','{}');
/*!40000 ALTER TABLE `Product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProductPropertyDetail`
--

DROP TABLE IF EXISTS `ProductPropertyDetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProductPropertyDetail` (
  `propertyId` int(11) NOT NULL DEFAULT '0',
  `ProductId` int(11) NOT NULL DEFAULT '0',
  `value` varchar(100) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`propertyId`,`ProductId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProductPropertyDetail`
--

LOCK TABLES `ProductPropertyDetail` WRITE;
/*!40000 ALTER TABLE `ProductPropertyDetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `ProductPropertyDetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Rate`
--

DROP TABLE IF EXISTS `Rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Rate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ProductId` int(11) DEFAULT NULL,
  `Rate` int(11) DEFAULT NULL,
  `content` text,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Rate`
--

LOCK TABLES `Rate` WRITE;
/*!40000 ALTER TABLE `Rate` DISABLE KEYS */;
INSERT INTO `Rate` VALUES (5,5,4,'dsadsad',4),(6,5,1,'',4),(7,5,1,'',4),(8,5,1,'',4),(9,5,1,'',4),(10,5,1,'',4),(11,7,5,'',4),(12,7,1,'',4),(13,7,4,'sad',4),(14,6,4,'',4),(15,12,5,'sadsdsa',1);
/*!40000 ALTER TABLE `Rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Shop`
--

DROP TABLE IF EXISTS `Shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Shop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `address` varchar(300) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `facebook` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Shop`
--

LOCK TABLES `Shop` WRITE;
/*!40000 ALTER TABLE `Shop` DISABLE KEYS */;
INSERT INTO `Shop` VALUES (1,0,'dsadsa','43214321','dsadsa','1','hieu',NULL),(2,4,'32 ngõ 288 hoang mai','1234567','trunghieuhp2000@gmail.com','1','hieu123','https://www.facebook.com/Hieufanpace-571269996241306/'),(3,1,'19 nguyen trai','12321321321321','daudau@123123','1','daudau',NULL),(4,5,'safsafgsaf','123412421','sadsads','1','mobile 123',''),(5,7,'32 ngõ 288 hoàng mai','1236955196','t1runghieuhp2000@gmail.com','1','nguy?n trung hi?u',''),(6,8,'32 ngõ 288 hoàng mai','01236955196','trunghieu6hp2000@gmail.com','1','nguy?n trung hi?u','');
/*!40000 ALTER TABLE `Shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `name` varchar(300) DEFAULT NULL,
  `address` varchar(300) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `userGroup` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES (1,'daudau','202cb962ac59075b964b07152d234b70','Nguyen Viet','19 Nguyen Trai','0987654321','bangnokia@gmail.com','1',0),(3,'bangnokia','48fa431741c268ec44ac08859407348f','Nguyen Viet','19 Nguyen Trai','','bangnguyenviet@admicro.vn','1',1),(4,'bimbimsweet','202cb962ac59075b964b07152d234b70','nguy&#7877;n trung hi&#7871;u','hhhh','','fuk@123','1',1),(5,'hieu','202cb962ac59075b964b07152d234b70','hieu','safsags','','sadsad','1',1),(6,'admin','21232f297a57a5a743894a0e4a801fc3','admin','19 nguy&#7877;n trãi','','hna@gmail.com','1',0),(7,'bimbimsweet123','202cb962ac59075b964b07152d234b70','nguy&#7877;n trung hi&#7871;u','32 ngõ 288 hoàng mai','','hieu','1',1),(8,'12312321421','202cb962ac59075b964b07152d234b70','nguy&#7877;n trung hi&#7871;u','dsadsadsad','','bimbimsweet213213','1',1),(9,'3213','202cb962ac59075b964b07152d234b70','21','123','','12312321421','1',1);
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-06-14 14:04:30
