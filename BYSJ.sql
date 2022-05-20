-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: BYSJ
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `bed`
--

DROP TABLE IF EXISTS `bed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bed` (
  `bedNo` int NOT NULL,
  PRIMARY KEY (`bedNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bed`
--

LOCK TABLES `bed` WRITE;
/*!40000 ALTER TABLE `bed` DISABLE KEYS */;
INSERT INTO `bed` VALUES (1),(2),(3),(4);
/*!40000 ALTER TABLE `bed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `building`
--

DROP TABLE IF EXISTS `building`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `building` (
  `bid` int NOT NULL,
  `bcall` varchar(50) DEFAULT NULL,
  `mid` int DEFAULT NULL,
  PRIMARY KEY (`bid`),
  UNIQUE KEY `buildingcall` (`bcall`),
  KEY `mid` (`mid`),
  CONSTRAINT `building_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `manager` (`mid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `building`
--

LOCK TABLES `building` WRITE;
/*!40000 ALTER TABLE `building` DISABLE KEYS */;
INSERT INTO `building` VALUES (1,'000-0000000',1),(2,'000-0000001',1),(3,'000-0000002',2),(4,'000-0000003',2),(5,'000-0000004',3),(6,'000-0000005',3);
/*!40000 ALTER TABLE `building` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `building_dormitory`
--

DROP TABLE IF EXISTS `building_dormitory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `building_dormitory` (
  `bid` int NOT NULL,
  `did` int NOT NULL,
  `healthScore` int DEFAULT NULL,
  PRIMARY KEY (`bid`,`did`),
  KEY `did` (`did`),
  CONSTRAINT `building_dormitory_ibfk_1` FOREIGN KEY (`bid`) REFERENCES `building` (`bid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `building_dormitory_ibfk_2` FOREIGN KEY (`did`) REFERENCES `dormitory` (`did`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `building_dormitory_chk_1` CHECK (((`healthScore` >= 0) and (`healthScore` <= 100)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `building_dormitory`
--

LOCK TABLES `building_dormitory` WRITE;
/*!40000 ALTER TABLE `building_dormitory` DISABLE KEYS */;
INSERT INTO `building_dormitory` VALUES (1,101,88),(1,102,NULL),(1,103,NULL),(1,104,NULL),(1,105,NULL),(1,106,NULL),(1,107,NULL),(1,108,NULL),(2,101,NULL),(2,102,NULL),(2,103,NULL),(2,104,NULL),(2,105,NULL),(2,106,NULL),(2,107,NULL),(2,108,NULL),(3,101,NULL),(3,102,NULL),(3,103,NULL),(3,104,NULL),(3,105,NULL),(4,101,NULL),(4,102,NULL),(4,103,NULL),(4,104,NULL),(4,105,NULL),(4,106,NULL),(4,107,NULL),(4,108,NULL),(5,101,NULL),(5,102,NULL),(5,103,NULL),(5,104,NULL),(5,105,NULL),(5,106,NULL),(5,107,NULL),(5,108,NULL),(6,101,NULL),(6,102,NULL),(6,103,NULL),(6,104,NULL),(6,105,NULL),(6,106,NULL),(6,107,NULL),(6,108,NULL);
/*!40000 ALTER TABLE `building_dormitory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dormitory`
--

DROP TABLE IF EXISTS `dormitory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dormitory` (
  `did` int NOT NULL,
  PRIMARY KEY (`did`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dormitory`
--

LOCK TABLES `dormitory` WRITE;
/*!40000 ALTER TABLE `dormitory` DISABLE KEYS */;
INSERT INTO `dormitory` VALUES (101),(102),(103),(104),(105),(106),(107),(108),(201),(202),(203),(204),(205),(206),(207),(208);
/*!40000 ALTER TABLE `dormitory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dormitory_bed`
--

DROP TABLE IF EXISTS `dormitory_bed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dormitory_bed` (
  `did` int NOT NULL,
  `bedNo` int NOT NULL,
  PRIMARY KEY (`did`,`bedNo`),
  KEY `bedNo` (`bedNo`),
  CONSTRAINT `dormitory_bed_ibfk_1` FOREIGN KEY (`did`) REFERENCES `dormitory` (`did`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `dormitory_bed_ibfk_2` FOREIGN KEY (`bedNo`) REFERENCES `bed` (`bedNo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dormitory_bed`
--

LOCK TABLES `dormitory_bed` WRITE;
/*!40000 ALTER TABLE `dormitory_bed` DISABLE KEYS */;
INSERT INTO `dormitory_bed` VALUES (101,1),(102,1),(103,1),(104,1),(105,1),(106,1),(107,1),(108,1),(201,1),(202,1),(203,1),(204,1),(205,1),(206,1),(207,1),(208,1),(101,2),(102,2),(103,2),(104,2),(105,2),(106,2),(107,2),(108,2),(201,2),(202,2),(203,2),(204,2),(205,2),(206,2),(207,2),(208,2),(101,3),(102,3),(103,3),(104,3),(105,3),(106,3),(107,3),(108,3),(201,3),(202,3),(203,3),(204,3),(205,3),(206,3),(207,3),(208,3),(101,4),(102,4),(103,4),(104,4),(105,4),(106,4),(107,4),(108,4),(201,4),(202,4),(203,4),(204,4),(205,4),(206,4),(207,4),(208,4);
/*!40000 ALTER TABLE `dormitory_bed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `items` (
  `itemsid` int NOT NULL AUTO_INCREMENT,
  `itemsName` varchar(20) DEFAULT NULL,
  `notes` varchar(50) DEFAULT NULL,
  `sid` int DEFAULT NULL,
  `itemstatus` varchar(20) DEFAULT '未找到',
  PRIMARY KEY (`itemsid`),
  KEY `sid` (`sid`),
  CONSTRAINT `items_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `student` (`sid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (3,'饭盒','红色的',1,'已找到'),(4,'百事可乐','青柠味',2,'已找到'),(6,'拖鞋','跑太快掉了',2,'未找到');
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager`
--

DROP TABLE IF EXISTS `manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manager` (
  `mid` int NOT NULL AUTO_INCREMENT,
  `mname` varchar(20) NOT NULL,
  `pwd` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`mid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager`
--

LOCK TABLES `manager` WRITE;
/*!40000 ALTER TABLE `manager` DISABLE KEYS */;
INSERT INTO `manager` VALUES (1,'admin','000000'),(2,'admin2','000000'),(3,'admin3','000000'),(7,'','');
/*!40000 ALTER TABLE `manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repair`
--

DROP TABLE IF EXISTS `repair`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `repair` (
  `rid` int NOT NULL AUTO_INCREMENT,
  `rname` varchar(20) NOT NULL,
  `pwd` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`rid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repair`
--

LOCK TABLES `repair` WRITE;
/*!40000 ALTER TABLE `repair` DISABLE KEYS */;
INSERT INTO `repair` VALUES (1,'001','000000'),(2,'002','000000'),(3,'003','000000');
/*!40000 ALTER TABLE `repair` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repairinfo`
--

DROP TABLE IF EXISTS `repairinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `repairinfo` (
  `repairid` int NOT NULL AUTO_INCREMENT,
  `repairNote` varchar(50) DEFAULT NULL,
  `bid` int DEFAULT NULL,
  `did` int DEFAULT NULL,
  `rid` int DEFAULT NULL,
  PRIMARY KEY (`repairid`),
  KEY `bid` (`bid`),
  KEY `did` (`did`),
  KEY `rid` (`rid`),
  CONSTRAINT `repairinfo_ibfk_1` FOREIGN KEY (`bid`) REFERENCES `building_dormitory` (`bid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `repairinfo_ibfk_2` FOREIGN KEY (`did`) REFERENCES `building_dormitory` (`did`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `repairinfo_ibfk_3` FOREIGN KEY (`rid`) REFERENCES `repair` (`rid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repairinfo`
--

LOCK TABLES `repairinfo` WRITE;
/*!40000 ALTER TABLE `repairinfo` DISABLE KEYS */;
INSERT INTO `repairinfo` VALUES (2,'墙壁表皮脱落',1,101,2),(4,'门坏了',1,101,1),(6,'发霉',1,101,NULL);
/*!40000 ALTER TABLE `repairinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `sid` int NOT NULL AUTO_INCREMENT,
  `sname` varchar(20) NOT NULL,
  `sclass` varchar(20) NOT NULL,
  `pwd` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'ZhangSan','18软3','000000'),(2,'LiSi','18软3','000000'),(3,'WangWu','18软2','000000'),(4,'ZhaoLiu','18计一','000000');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_live`
--

DROP TABLE IF EXISTS `student_live`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_live` (
  `sid` int NOT NULL,
  `bid` int DEFAULT NULL,
  `did` int DEFAULT NULL,
  `bedNo` int DEFAULT NULL,
  PRIMARY KEY (`sid`),
  UNIQUE KEY `bid` (`bid`,`did`,`bedNo`),
  KEY `did` (`did`),
  KEY `bedNo` (`bedNo`),
  CONSTRAINT `student_live_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `student` (`sid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `student_live_ibfk_2` FOREIGN KEY (`bid`) REFERENCES `building` (`bid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `student_live_ibfk_3` FOREIGN KEY (`did`) REFERENCES `dormitory` (`did`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `student_live_ibfk_4` FOREIGN KEY (`bedNo`) REFERENCES `bed` (`bedNo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_live`
--

LOCK TABLES `student_live` WRITE;
/*!40000 ALTER TABLE `student_live` DISABLE KEYS */;
INSERT INTO `student_live` VALUES (1,1,101,1),(2,1,101,2),(3,1,101,3);
/*!40000 ALTER TABLE `student_live` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-15 16:40:15
