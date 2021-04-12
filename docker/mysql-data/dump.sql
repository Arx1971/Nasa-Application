CREATE DATABASE  IF NOT EXISTS `nasa_space_exploration_database` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `nasa_space_exploration_database`;
-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: nasa_space_exploration_database
-- ------------------------------------------------------
-- Server version	8.0.22

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `astronaut_child_info`
--

DROP TABLE IF EXISTS `astronaut_child_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `astronaut_child_info` (
  `astronaut_child_id` int NOT NULL,
  `astronaut_child_name` varchar(30) NOT NULL,
  `astronaut_id` int DEFAULT NULL,
  PRIMARY KEY (`astronaut_child_id`),
  KEY `astronaut_id` (`astronaut_id`),
  CONSTRAINT `astronaut_child_info_ibfk_1` FOREIGN KEY (`astronaut_id`) REFERENCES `astronaut_info` (`astronaut_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `astronaut_child_info`
--

LOCK TABLES `astronaut_child_info` WRITE;
/*!40000 ALTER TABLE `astronaut_child_info` DISABLE KEYS */;
INSERT INTO `astronaut_child_info` VALUES (1,'Joseph Bacaba',1),(2,'Joseph Cacaba',1),(3,'Loren Acton',2),(4,'Aleksandr Bleeksandrov Jr',5),(5,'Aleksandr Cleeksandrov Jr',5),(6,'Valentina Pareshkova',7),(7,'Eileen Farel',9);
/*!40000 ALTER TABLE `astronaut_child_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `astronaut_education_info`
--

DROP TABLE IF EXISTS `astronaut_education_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `astronaut_education_info` (
  `astronaut_education_id` int NOT NULL,
  `university_id` int DEFAULT NULL,
  `degree_id` int DEFAULT NULL,
  `astronaut_id` int DEFAULT NULL,
  PRIMARY KEY (`astronaut_education_id`),
  KEY `astronaut_id` (`astronaut_id`),
  KEY `degree_id` (`degree_id`),
  KEY `university_id` (`university_id`),
  CONSTRAINT `astronaut_education_info_ibfk_1` FOREIGN KEY (`astronaut_id`) REFERENCES `astronaut_info` (`astronaut_id`),
  CONSTRAINT `astronaut_education_info_ibfk_2` FOREIGN KEY (`degree_id`) REFERENCES `degree_info` (`degree_id`) ON DELETE CASCADE,
  CONSTRAINT `astronaut_education_info_ibfk_3` FOREIGN KEY (`university_id`) REFERENCES `university_info` (`university_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `astronaut_education_info`
--

LOCK TABLES `astronaut_education_info` WRITE;
/*!40000 ALTER TABLE `astronaut_education_info` DISABLE KEYS */;
INSERT INTO `astronaut_education_info` VALUES (1,1,1,2),(2,2,2,1),(3,3,1,6),(4,4,1,5),(5,5,3,4),(6,6,4,3),(7,7,2,10),(8,8,2,9),(9,8,2,7),(10,9,2,8);
/*!40000 ALTER TABLE `astronaut_education_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `astronaut_info`
--

DROP TABLE IF EXISTS `astronaut_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `astronaut_info` (
  `astronaut_id` int NOT NULL AUTO_INCREMENT,
  `astronaut_fname` varchar(20) NOT NULL,
  `astronaut_lname` varchar(20) NOT NULL,
  `astronaut_dob` date NOT NULL,
  `astronaut_country` varchar(20) NOT NULL,
  `astronaut_gender` char(1) DEFAULT NULL,
  PRIMARY KEY (`astronaut_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `astronaut_info`
--

LOCK TABLES `astronaut_info` WRITE;
/*!40000 ALTER TABLE `astronaut_info` DISABLE KEYS */;
INSERT INTO `astronaut_info` VALUES (1,'Joseph','Acaba','1967-12-12','USA','M'),(2,'Loren','Acton','1936-12-09','USA','M'),(3,'Mike','Adams','1948-09-10','USA','M'),(4,'Viktor','Adanasyev','1951-09-07','RUSSIA','M'),(5,'Aleksandr','Aleksandrov','1952-09-07','BULGARIA','M'),(6,'Sally','Ride','1951-12-12','USA','F'),(7,'Valentina','Tereshkova','1951-12-12','Russia','F'),(8,'Eileen','Collins','1956-12-12','USA','F'),(9,'Judith','Resnik','1949-12-12','USA','F'),(10,'Shannon','Lucid','1943-12-02','USA','F'),(11,'Shannon','Lucid','1943-12-02','USA','F');
/*!40000 ALTER TABLE `astronaut_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `astronaut_spouse_info`
--

DROP TABLE IF EXISTS `astronaut_spouse_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `astronaut_spouse_info` (
  `astronaut_spouse_id` int NOT NULL AUTO_INCREMENT,
  `astronaut_spouse_name` varchar(30) NOT NULL,
  `astronaut_id` int DEFAULT NULL,
  PRIMARY KEY (`astronaut_spouse_id`),
  KEY `astronaut_id` (`astronaut_id`),
  CONSTRAINT `astronaut_spouse_info_ibfk_1` FOREIGN KEY (`astronaut_id`) REFERENCES `astronaut_info` (`astronaut_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `astronaut_spouse_info`
--

LOCK TABLES `astronaut_spouse_info` WRITE;
/*!40000 ALTER TABLE `astronaut_spouse_info` DISABLE KEYS */;
INSERT INTO `astronaut_spouse_info` VALUES (1,'Merry Copper',3),(2,'Johanna Smith',4),(3,'Alexendra Chevanov',5),(4,'Mila Kunis',1),(5,'Aston Kutcher',10),(6,'Tom Cruse',8),(7,'Bradly Coper',6);
/*!40000 ALTER TABLE `astronaut_spouse_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `degree_info`
--

DROP TABLE IF EXISTS `degree_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `degree_info` (
  `degree_id` int NOT NULL,
  `degree_name` varchar(30) NOT NULL,
  PRIMARY KEY (`degree_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `degree_info`
--

LOCK TABLES `degree_info` WRITE;
/*!40000 ALTER TABLE `degree_info` DISABLE KEYS */;
INSERT INTO `degree_info` VALUES (1,'Computer Science'),(2,'Physics'),(3,'Mathematics'),(4,'Chemical Engineering');
/*!40000 ALTER TABLE `degree_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mission_details`
--

DROP TABLE IF EXISTS `mission_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mission_details` (
  `mission_details_id` int NOT NULL,
  `mission_id` int DEFAULT NULL,
  `astronaut_id` int DEFAULT NULL,
  PRIMARY KEY (`mission_details_id`),
  KEY `astronaut_id` (`astronaut_id`),
  KEY `mission_id` (`mission_id`),
  CONSTRAINT `mission_details_ibfk_1` FOREIGN KEY (`astronaut_id`) REFERENCES `astronaut_info` (`astronaut_id`),
  CONSTRAINT `mission_details_ibfk_2` FOREIGN KEY (`mission_id`) REFERENCES `mission_info` (`mission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mission_details`
--

LOCK TABLES `mission_details` WRITE;
/*!40000 ALTER TABLE `mission_details` DISABLE KEYS */;
INSERT INTO `mission_details` VALUES (1,3,4),(2,3,6),(3,4,1),(4,5,3),(5,2,5),(6,5,2),(7,1,4),(8,2,7),(9,1,4),(10,3,7);
/*!40000 ALTER TABLE `mission_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mission_info`
--

DROP TABLE IF EXISTS `mission_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mission_info` (
  `mission_id` int NOT NULL,
  `mission_name` varchar(30) NOT NULL,
  `mission_destination` varchar(30) NOT NULL,
  `mission_objective_id` int DEFAULT NULL,
  `mission_distance` float NOT NULL,
  `space_ship_id` int DEFAULT NULL,
  PRIMARY KEY (`mission_id`),
  KEY `space_ship_id` (`space_ship_id`),
  KEY `mission_objective_id` (`mission_objective_id`),
  CONSTRAINT `mission_info_ibfk_1` FOREIGN KEY (`space_ship_id`) REFERENCES `space_ship_info` (`space_ship_id`),
  CONSTRAINT `mission_info_ibfk_2` FOREIGN KEY (`mission_objective_id`) REFERENCES `mission_objective_info` (`mission_objective_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mission_info`
--

LOCK TABLES `mission_info` WRITE;
/*!40000 ALTER TABLE `mission_info` DISABLE KEYS */;
INSERT INTO `mission_info` VALUES (1,'STS-41','PLATO',2,32424,3),(2,'STS-7','MOON',3,238900,3),(3,'STS-23','MARS',1,2382900,3),(4,'STS-132','MOON',3,238900,4),(5,'STS-107','MOON',3,238900,5),(6,'STS-133','MOON',3,238900,1),(7,'STS-13','MOON',3,238900,3),(8,'MEGATRON','CYBERTRON',4,3382900,3);
/*!40000 ALTER TABLE `mission_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mission_land_info`
--

DROP TABLE IF EXISTS `mission_land_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mission_land_info` (
  `mission_land_id` int NOT NULL,
  `mission_id` int DEFAULT NULL,
  `mission_land_date` date NOT NULL,
  `mission_landing_site_id` int DEFAULT NULL,
  PRIMARY KEY (`mission_land_id`),
  KEY `mission_landing_site_id` (`mission_landing_site_id`),
  KEY `mission_id` (`mission_id`),
  CONSTRAINT `mission_land_info_ibfk_1` FOREIGN KEY (`mission_landing_site_id`) REFERENCES `mission_landing_site` (`mission_landing_site_id`),
  CONSTRAINT `mission_land_info_ibfk_2` FOREIGN KEY (`mission_id`) REFERENCES `mission_info` (`mission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mission_land_info`
--

LOCK TABLES `mission_land_info` WRITE;
/*!40000 ALTER TABLE `mission_land_info` DISABLE KEYS */;
INSERT INTO `mission_land_info` VALUES (1,3,'2010-12-03',1),(2,2,'2009-02-03',2),(3,1,'2003-02-03',1),(4,4,'2006-02-03',2),(5,6,'2005-02-03',4),(6,7,'2014-02-03',5),(7,8,'2005-02-03',2),(8,5,'2006-02-03',3);
/*!40000 ALTER TABLE `mission_land_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mission_landing_site`
--

DROP TABLE IF EXISTS `mission_landing_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mission_landing_site` (
  `mission_landing_site_id` int NOT NULL,
  `mission_landing_site_name` varchar(50) NOT NULL,
  `mission_landing_site_city` varchar(50) NOT NULL,
  `mission_landing_site_state` varchar(50) NOT NULL,
  `mission_landing_site_country` varchar(50) NOT NULL,
  PRIMARY KEY (`mission_landing_site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mission_landing_site`
--

LOCK TABLES `mission_landing_site` WRITE;
/*!40000 ALTER TABLE `mission_landing_site` DISABLE KEYS */;
INSERT INTO `mission_landing_site` VALUES (1,'Cape Canaveral Air Force Station','Vrevard County','Florida','USA'),(2,'Vandenberg Air Force Base','Vanderberg','California','USA'),(3,'Wallops Island Flight Facility','Wallops','Virginia','USA'),(4,'OTRAG Lauch Center','Zaire','Zaire','Congo'),(5,'Centre Intermees','Hammaguir','Hammaguir','Algeria');
/*!40000 ALTER TABLE `mission_landing_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mission_launch_info`
--

DROP TABLE IF EXISTS `mission_launch_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mission_launch_info` (
  `mission_launch_id` int NOT NULL,
  `mission_id` int DEFAULT NULL,
  `mission_launch_date` date NOT NULL,
  `mission_site_id` int NOT NULL,
  PRIMARY KEY (`mission_launch_id`),
  KEY `mission_site_id` (`mission_site_id`),
  KEY `mission_id` (`mission_id`),
  CONSTRAINT `mission_launch_info_ibfk_1` FOREIGN KEY (`mission_site_id`) REFERENCES `mission_site_info` (`mission_site_id`),
  CONSTRAINT `mission_launch_info_ibfk_2` FOREIGN KEY (`mission_id`) REFERENCES `mission_info` (`mission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mission_launch_info`
--

LOCK TABLES `mission_launch_info` WRITE;
/*!40000 ALTER TABLE `mission_launch_info` DISABLE KEYS */;
INSERT INTO `mission_launch_info` VALUES (1,3,'2009-01-02',2),(2,2,'2009-12-10',1),(3,1,'2000-01-05',3),(4,4,'2000-11-12',3),(5,6,'2004-01-15',5),(6,7,'2013-12-12',1),(7,8,'2001-09-03',3),(8,5,'2005-05-05',2),(9,8,'2005-08-08',2);
/*!40000 ALTER TABLE `mission_launch_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mission_objective_info`
--

DROP TABLE IF EXISTS `mission_objective_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mission_objective_info` (
  `mission_objective_id` int NOT NULL,
  `mission_objective_name` varchar(30) NOT NULL,
  PRIMARY KEY (`mission_objective_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mission_objective_info`
--

LOCK TABLES `mission_objective_info` WRITE;
/*!40000 ALTER TABLE `mission_objective_info` DISABLE KEYS */;
INSERT INTO `mission_objective_info` VALUES (1,'DISCOVERY'),(2,'RESEARCH'),(3,'SATELLITE INSTALLATION'),(4,'AIRBORNE');
/*!40000 ALTER TABLE `mission_objective_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mission_site_info`
--

DROP TABLE IF EXISTS `mission_site_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mission_site_info` (
  `mission_site_id` int NOT NULL,
  `mission_site_name` varchar(40) NOT NULL,
  `mission_site_city` varchar(40) NOT NULL,
  `mission_site_state` varchar(10) DEFAULT NULL,
  `mission_site_country` varchar(20) NOT NULL,
  PRIMARY KEY (`mission_site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mission_site_info`
--

LOCK TABLES `mission_site_info` WRITE;
/*!40000 ALTER TABLE `mission_site_info` DISABLE KEYS */;
INSERT INTO `mission_site_info` VALUES (1,'Cape Canaveral Air Force Station','Vrevard County','Florida','USA'),(2,'Vandenberg Air Force Base','Vanderberg','California','USA'),(3,'Wallops Island Flight Facility','Wallops','Virginia','USA'),(4,'OTRAG Lauch Center','Zaire','Zaire','Congo'),(5,'Centre Intermees','Hammaguir','Hammaguir','Algeria');
/*!40000 ALTER TABLE `mission_site_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `space_ship_info`
--

DROP TABLE IF EXISTS `space_ship_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `space_ship_info` (
  `space_ship_id` int NOT NULL,
  `space_ship_name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`space_ship_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `space_ship_info`
--

LOCK TABLES `space_ship_info` WRITE;
/*!40000 ALTER TABLE `space_ship_info` DISABLE KEYS */;
INSERT INTO `space_ship_info` VALUES (1,'Orion'),(2,'SpaceX Dragon'),(3,'Falcon Heavy'),(4,'Endeavour'),(5,'Ranger - 1');
/*!40000 ALTER TABLE `space_ship_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `university_info`
--

DROP TABLE IF EXISTS `university_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `university_info` (
  `university_id` int NOT NULL,
  `university_name` varchar(30) NOT NULL,
  PRIMARY KEY (`university_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `university_info`
--

LOCK TABLES `university_info` WRITE;
/*!40000 ALTER TABLE `university_info` DISABLE KEYS */;
INSERT INTO `university_info` VALUES (1,'University of Arizona'),(2,'Binghamton University'),(3,'Harvard University'),(4,'Princeton University'),(5,'Rugers University'),(6,'Stony Brook University'),(7,'Fordam University'),(8,'Wyoming University'),(9,'Stanford University');
/*!40000 ALTER TABLE `university_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'nasa_space_exploration_database'
--

--
-- Dumping routines for database 'nasa_space_exploration_database'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-12 17:44:20
