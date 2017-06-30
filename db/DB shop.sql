CREATE DATABASE  IF NOT EXISTS `hnashop` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
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
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand`
--

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
INSERT INTO `brand` VALUES (1,'Apple','2'),(2,'aaa','1'),(3,'samsung','1');
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,0,'Computer','https://cdn.filestackcontent.com/eSpEBJonRNafaM27CmLX',1),(2,0,'Clothes','https://cdn.filestackcontent.com/8MddtImQEeT3H00ygm9w',1),(3,1,'Laptop','',1),(4,1,'Desktop','https://cdn.filestackcontent.com/ytUn6y1fQLa1W0KW7rW9',1),(8,2,'Men','https://cdn.filestackcontent.com/sKGePBJXS9KikD73oFtp',1),(9,2,'Women','',1);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoryproperty`
--

DROP TABLE IF EXISTS `categoryproperty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoryproperty` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `catId` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `catId` (`catId`),
  CONSTRAINT `categoryproperty_ibfk_1` FOREIGN KEY (`catId`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoryproperty`
--

LOCK TABLES `categoryproperty` WRITE;
/*!40000 ALTER TABLE `categoryproperty` DISABLE KEYS */;
INSERT INTO `categoryproperty` VALUES (1,3,'Battery','1'),(2,1,'color','2'),(3,1,'size','1');
/*!40000 ALTER TABLE `categoryproperty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productId` int(11) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `productId` (`productId`),
  CONSTRAINT `image_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `status` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(5) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (16,5,'2017-06-12 16:32:15','2017-06-12 16:32:15','','','hieu','1','sadsad',NULL),(18,5,'2017-06-13 18:23:16','2017-06-13 18:23:16','','safsags','hieu','','sadsad','1'),(19,5,'2017-06-13 18:23:48','2017-06-13 18:23:48','','safsags','hieu','','sadsad','1'),(20,4,'2017-06-15 14:20:44','2017-06-15 14:20:44','','hhhh','nguy?n trung hi?u','','fuk@123','1');
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderdetail`
--

DROP TABLE IF EXISTS `orderdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orderdetail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderId` int(11) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orderId` (`orderId`),
  KEY `productId` (`productId`),
  CONSTRAINT `orderdetail_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `order` (`id`),
  CONSTRAINT `orderdetail_ibfk_2` FOREIGN KEY (`productId`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderdetail`
--

LOCK TABLES `orderdetail` WRITE;
/*!40000 ALTER TABLE `orderdetail` DISABLE KEYS */;
INSERT INTO `orderdetail` VALUES (1,16,5,NULL,10,'1'),(2,16,7,NULL,1,NULL),(4,18,9,NULL,1,NULL),(5,19,9,NULL,1,NULL),(6,20,6,NULL,1,'1');
/*!40000 ALTER TABLE `orderdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(10) CHARACTER SET latin1 DEFAULT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` float DEFAULT NULL,
  `shopId` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `createdAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `brandId` int(11) DEFAULT NULL,
  `categoryId` int(11) DEFAULT NULL,
  `outOfStock` tinyint(1) DEFAULT NULL,
  `description` text CHARACTER SET latin1,
  `image` varchar(250) CHARACTER SET latin1 DEFAULT NULL,
  `property` text CHARACTER SET latin1,
  PRIMARY KEY (`id`),
  KEY `categoryId` (`categoryId`),
  KEY `categoryId_2` (`categoryId`),
  KEY `brandId` (`brandId`),
  KEY `shopId` (`shopId`),
  KEY `shopId_2` (`shopId`),
  KEY `brandId_2` (`brandId`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`categoryId`) REFERENCES `category` (`id`),
  CONSTRAINT `product_ibfk_2` FOREIGN KEY (`shopId`) REFERENCES `shop` (`id`),
  CONSTRAINT `product_ibfk_3` FOREIGN KEY (`brandId`) REFERENCES `brand` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (5,'0','iphone1',55555,2,5,'2017-06-28 15:54:32',1,1,1,'<p>sadsadsads</p>','https://cdn.filestackcontent.com/ZGAoVaKDQPScz5zqNkls','{\"size\":\"\"}'),(6,'0','iphone 2',1223,2,6,'2017-06-28 15:54:35',1,1,0,'','https://cdn.filestackcontent.com/Dd154sPLT9KNbvpbUB1E','{\"size\":\"\"}'),(7,'0','sadsadsad',10000000,2,7,'2016-11-01 22:22:29',1,8,0,'<p>what that fuck</p>','https://cdn.filestackcontent.com/cmkmhD8WRP2ar6wx8lPY',''),(8,'1','sadsadsa',211232000,4,8,'2017-06-28 16:29:54',1,2,0,'','https://cdn.filestackcontent.com/ETTvTnRiTKCR4ZEvrs0M','{}'),(9,'1','sadsadsadsa',1000000,4,9,'2017-06-28 16:02:12',1,8,0,'<p><img src=\"https://cdn.filestackcontent.com/CLiGp1eMSeyquiipUqvr\" />ssadsadsadsadsadsa</p>','https://cdn.filestackcontent.com/dBcoCXsCTDOWHkFvTuF3','{}'),(10,'0',' nguyễn trung hiếu',12312300,2,10,'2017-06-28 22:49:07',1,1,0,'','https://cdn.filestackcontent.com/33bn5DQECzDg8vqnWcRA','{\"size\":\"\"}'),(11,'0',' nguyễn trung hiếu',213123000,5,11,'2017-06-28 23:28:30',1,2,0,'','https://cdn.filestackcontent.com/mXHe5uAjQ62lIGZy0OFq','{}'),(12,'0','nguyễn trung hiếu',213124000,6,0,'2017-06-29 00:55:23',2,1,0,'','https://cdn.filestackcontent.com/rXXLrFWLSRCwkmjxLeXF','{\"size\":\"\"}'),(18,'0','Mèo',21312400000,6,0,'2017-06-29 00:57:30',1,1,0,'','https://cdn.filestackcontent.com/NXXUbSVRWGgkIKEgKFON','{\"size\":\"\"}');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rate`
--

DROP TABLE IF EXISTS `rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productId` int(11) DEFAULT NULL,
  `rate` int(11) DEFAULT NULL,
  `content` text,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `productId` (`productId`),
  CONSTRAINT `rate_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rate`
--

LOCK TABLES `rate` WRITE;
/*!40000 ALTER TABLE `rate` DISABLE KEYS */;
INSERT INTO `rate` VALUES (5,5,4,'dsadsad',4),(6,5,1,'',4),(7,5,1,'',4),(8,5,1,'',4),(9,5,1,'',4);
/*!40000 ALTER TABLE `rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop`
--

DROP TABLE IF EXISTS `shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `address` varchar(300) CHARACTER SET latin1 DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `email` varchar(200) CHARACTER SET latin1 DEFAULT NULL,
  `status` varchar(10) CHARACTER SET latin1 DEFAULT NULL,
  `name` varchar(200) CHARACTER SET latin1 DEFAULT NULL,
  `facebook` varchar(250) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  CONSTRAINT `shop_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop`
--

LOCK TABLES `shop` WRITE;
/*!40000 ALTER TABLE `shop` DISABLE KEYS */;
INSERT INTO `shop` VALUES (2,4,'32 ngõ 288 hoang mai','1234567','trunghieuhp2000@gmail.com','2','hieu123','https://www.facebook.com/Hieufanpace-571269996241306/'),(3,1,'19 nguyen trai','12321321321321','daudau@123123','1','daudau',NULL),(4,5,'safsafgsaf','123412421','sadsads','1','mobile 123',''),(5,11,'32 ngõ 288 hoàng mai','1236955196','trunghieuhp2000@gmail.com22','1',' mèo ',''),(6,12,'32 ngõ 288 hoàng mai','1236955196','trunghieuhp2000@gmail.com2','1',' trung ','');
/*!40000 ALTER TABLE `shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `password` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `name` varchar(300) CHARACTER SET utf8 DEFAULT NULL,
  `address` varchar(300) CHARACTER SET utf8 DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `email` varchar(150) CHARACTER SET latin1 DEFAULT NULL,
  `status` varchar(10) CHARACTER SET latin1 DEFAULT NULL,
  `userGroup` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'daudau','202cb962ac59075b964b07152d234b70','Nguyen Viet','19 Nguyen Trai','0987654321','bangnokia@gmail.com','1',0),(3,'bangnokia','48fa431741c268ec44ac08859407348f','Nguyen Viet','19 Nguyen Trai','','bangnguyenviet@admicro.vn','1',1),(4,'bimbimsweet','202cb962ac59075b964b07152d234b70','nguy?n trung hi?u tt','hhhh','21321421421','fuk@123','1',1),(5,'hieu','202cb962ac59075b964b07152d234b70','hieu','safsags','','sadsad','1',1),(6,'admin','21232f297a57a5a743894a0e4a801fc3','admin','19 nguy&#7877;n trãi','','hna@gmail.com','1',0),(7,'cccccc132','202cb962ac59075b964b07152d234b70','hi?u','hiếu tiếng việt','12321','sasdadsacccccc132@aa','1',1),(8,'bimbimsweet1','202cb962ac59075b964b07152d234b70','nguy?n trung hi?u','123','','cccccc1322','1',1),(9,'bimbimsweet2','202cb962ac59075b964b07152d234b70','nguy?n trung hi?u','123','','cccccc1321','1',1),(10,'bimbimsweet3','202cb962ac59075b964b07152d234b70','nguy?n trung hi?u','32 ngõ 288 hoàng mai hà n?i','1236955196','trunghieuhp2000@gmail.com','1',1),(11,'bimbimsweet4','202cb962ac59075b964b07152d234b70','nguyễn trung hiếu','32 ngõ 288 hoàng mai','1236955196','trunghieuhp2000@gmail.com','1',1),(12,'bimbimsweet10','202cb962ac59075b964b07152d234b70','nguyễn trung hiếu',' Hà nội','12312421421','bimbimsweet41','1',1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-06-29 15:13:15
