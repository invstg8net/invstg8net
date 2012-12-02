CREATE DATABASE  IF NOT EXISTS `mydb` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `mydb`;
-- MySQL dump 10.13  Distrib 5.5.16, for Win32 (x86)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	5.5.28-log

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
-- Table structure for table `region`
--

DROP TABLE IF EXISTS `region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `region` (
  `idRegion` int(11) NOT NULL AUTO_INCREMENT,
  `RegionName` varchar(45) NOT NULL,
  `RegionIsActive` tinyint(1) NOT NULL,
  PRIMARY KEY (`idRegion`),
  UNIQUE KEY `idRegion_UNIQUE` (`idRegion`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `region`
--

LOCK TABLES `region` WRITE;
/*!40000 ALTER TABLE `region` DISABLE KEYS */;
INSERT INTO `region` VALUES (1,'Africa',1),(2,'Asia',1),(3,'South America',1),(4,'Australasia',1),(5,'North America',1),(6,'Europe',1),(7,'Arctic',1),(8,'Antartica',1);
/*!40000 ALTER TABLE `region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `request`
--

DROP TABLE IF EXISTS `request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `request` (
  `idRequest` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `Sensitivity` int(11) DEFAULT NULL,
  `Risk` int(11) DEFAULT NULL,
  `Region` int(11) DEFAULT NULL,
  `Urgency` int(11) DEFAULT NULL,
  `RequestText` varchar(450) DEFAULT NULL,
  `Keywords` varchar(450) DEFAULT NULL,
  PRIMARY KEY (`idRequest`),
  UNIQUE KEY `idRequest_UNIQUE` (`idRequest`),
  KEY `Sensitivity_idx` (`Sensitivity`),
  KEY `Risk_idx` (`Risk`),
  KEY `Region_idx` (`Region`),
  KEY `Urgency_idx` (`Urgency`),
  CONSTRAINT `Sensitivity` FOREIGN KEY (`Sensitivity`) REFERENCES `sensitivitylevel` (`idSensitivityLevel`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Risk` FOREIGN KEY (`Risk`) REFERENCES `risklevel` (`idRiskLevel`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Region` FOREIGN KEY (`Region`) REFERENCES `region` (`idRegion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Urgency` FOREIGN KEY (`Urgency`) REFERENCES `urgencylevel` (`idUrgencyLevel`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request`
--

LOCK TABLES `request` WRITE;
/*!40000 ALTER TABLE `request` DISABLE KEYS */;
/*!40000 ALTER TABLE `request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `risklevel`
--

DROP TABLE IF EXISTS `risklevel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `risklevel` (
  `idRiskLevel` int(11) NOT NULL AUTO_INCREMENT,
  `riskLevelName` varchar(45) NOT NULL,
  `riskLevelIsActive` tinyint(1) NOT NULL,
  PRIMARY KEY (`idRiskLevel`),
  UNIQUE KEY `idRiskLevel_UNIQUE` (`idRiskLevel`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `risklevel`
--

LOCK TABLES `risklevel` WRITE;
/*!40000 ALTER TABLE `risklevel` DISABLE KEYS */;
INSERT INTO `risklevel` VALUES (1,'Life',1),(2,'Safety',1),(3,'Duress',1),(4,'Unknown',1);
/*!40000 ALTER TABLE `risklevel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sensitivitylevel`
--

DROP TABLE IF EXISTS `sensitivitylevel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sensitivitylevel` (
  `idSensitivityLevel` int(11) NOT NULL AUTO_INCREMENT,
  `sensitivityName` varchar(45) NOT NULL,
  `sensitvitiyLevelIsActive` tinyint(1) NOT NULL,
  PRIMARY KEY (`idSensitivityLevel`),
  UNIQUE KEY `idSensitivityLevel_UNIQUE` (`idSensitivityLevel`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sensitivitylevel`
--

LOCK TABLES `sensitivitylevel` WRITE;
/*!40000 ALTER TABLE `sensitivitylevel` DISABLE KEYS */;
INSERT INTO `sensitivitylevel` VALUES (1,'Yes',1),(2,'No',1);
/*!40000 ALTER TABLE `sensitivitylevel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `urgencylevel`
--

DROP TABLE IF EXISTS `urgencylevel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `urgencylevel` (
  `idUrgencyLevel` int(11) NOT NULL AUTO_INCREMENT,
  `UrgencyLevelName` varchar(45) NOT NULL,
  `UrgencyLevelIsActive` tinyint(1) NOT NULL,
  PRIMARY KEY (`idUrgencyLevel`),
  UNIQUE KEY `idUrgencyLevel_UNIQUE` (`idUrgencyLevel`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `urgencylevel`
--

LOCK TABLES `urgencylevel` WRITE;
/*!40000 ALTER TABLE `urgencylevel` DISABLE KEYS */;
INSERT INTO `urgencylevel` VALUES (1,'Extreme < 6 hours',1),(2,'High < 24 hours',1),(3,'Moderate < 3 days',1),(4,'Low < 1 week',1),(5,'ASAP < 1 month',1);
/*!40000 ALTER TABLE `urgencylevel` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-12-02 16:35:47
