-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: cs336db.cwxfeptjejpx.us-east-1.rds.amazonaws.com    Database: RailroadBooking
-- ------------------------------------------------------
-- Server version	8.0.20

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '';

--
-- Table structure for table `Admins`
--

DROP TABLE IF EXISTS `Admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Admins` (
  `SSN` int NOT NULL,
  `AdminUsername` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`SSN`),
  KEY `AdminUsername_idx` (`AdminUsername`),
  CONSTRAINT `AdminUsername` FOREIGN KEY (`AdminUsername`) REFERENCES `login` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Admins`
--

LOCK TABLES `Admins` WRITE;
/*!40000 ALTER TABLE `Admins` DISABLE KEYS */;
INSERT INTO `Admins` VALUES (1234567890,'admin');
/*!40000 ALTER TABLE `Admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ArrivesAt`
--

DROP TABLE IF EXISTS `ArrivesAt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ArrivesAt` (
  `4DigitID` int NOT NULL,
  `UniqueID` int NOT NULL,
  `ArrivalDateTime` datetime DEFAULT NULL,
  `Destination` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`4DigitID`,`UniqueID`),
  KEY `UniqueID` (`UniqueID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ArrivesAt`
--

LOCK TABLES `ArrivesAt` WRITE;
/*!40000 ALTER TABLE `ArrivesAt` DISABLE KEYS */;
/*!40000 ALTER TABLE `ArrivesAt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BooksReservation`
--

DROP TABLE IF EXISTS `BooksReservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BooksReservation` (
  `ReservationNumber` int NOT NULL,
  `Email` varchar(40) NOT NULL,
  `DepartureDatetime` datetime DEFAULT NULL,
  `ArrivalDatetime` datetime DEFAULT NULL,
  `Passenger` varchar(30) DEFAULT NULL,
  `Fare` double DEFAULT NULL,
  `RoundTrip` tinyint DEFAULT NULL,
  `FirstLineName` varchar(15) DEFAULT NULL,
  `SecondLineName` varchar(15) DEFAULT NULL,
  `BookingDate` date DEFAULT NULL,
  `DepartureStation` varchar(15) DEFAULT NULL,
  `ArrivalStation` varchar(15) DEFAULT NULL,
  `RDDatetime` datetime DEFAULT NULL,
  `RADatetime` datetime DEFAULT NULL,
  PRIMARY KEY (`ReservationNumber`,`Email`),
  KEY `FirstLineName_idx` (`FirstLineName`),
  KEY `SecondLineName_idx` (`SecondLineName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BooksReservation`
--

LOCK TABLES `BooksReservation` WRITE;
/*!40000 ALTER TABLE `BooksReservation` DISABLE KEYS */;
INSERT INTO `BooksReservation` VALUES (1,'ad1320@rutgers.edu','2020-12-20 12:00:00','2020-12-20 13:00:00',NULL,40,1,'Line1',NULL,'2020-12-18','1','4',NULL,NULL),(2,'joe@customer.com','2020-12-20 12:00:00','2020-12-20 13:00:00',NULL,20,0,'Line1',NULL,'2020-12-18','1','4',NULL,NULL),(4,'ad1320','2020-12-20 12:00:00','2020-12-20 13:00:00',NULL,20,0,'Line1',NULL,'2020-12-18','1','4',NULL,NULL),(371543,'ad1320','2020-12-20 12:00:00','2020-12-20 13:00:00',NULL,20,0,'Line1',NULL,'2020-12-18','1','4',NULL,NULL);
/*!40000 ALTER TABLE `BooksReservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customer`
--

DROP TABLE IF EXISTS `Customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Customer` (
  `Email` varchar(40) NOT NULL,
  `FirstName` varchar(20) DEFAULT NULL,
  `LastName` varchar(20) DEFAULT NULL,
  `Username` varchar(20) DEFAULT NULL,
  `Password` varchar(20) DEFAULT NULL,
  `age` int DEFAULT NULL,
  PRIMARY KEY (`Email`),
  KEY `CustomerUsername_idx` (`Username`),
  CONSTRAINT `CustomerUsername` FOREIGN KEY (`Username`) REFERENCES `login` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer`
--

LOCK TABLES `Customer` WRITE;
/*!40000 ALTER TABLE `Customer` DISABLE KEYS */;
INSERT INTO `Customer` VALUES ('customer@train.com','Joe','Capitalism','customer','customer',40);
/*!40000 ALTER TABLE `Customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CustomerReps`
--

DROP TABLE IF EXISTS `CustomerReps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CustomerReps` (
  `SSN` int NOT NULL,
  `Name` varchar(30) DEFAULT NULL,
  `Username` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`SSN`),
  KEY `Username_idx` (`Username`),
  CONSTRAINT `CRUsername` FOREIGN KEY (`Username`) REFERENCES `login` (`username`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CustomerReps`
--

LOCK TABLES `CustomerReps` WRITE;
/*!40000 ALTER TABLE `CustomerReps` DISABLE KEYS */;
INSERT INTO `CustomerReps` VALUES (123,'Brian','brianrep1'),(55466,'jack','man'),(1231231231,'somebody','oncetoldme'),(1234567891,'Cost Rep','costrep');
/*!40000 ALTER TABLE `CustomerReps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DepartsFrom`
--

DROP TABLE IF EXISTS `DepartsFrom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DepartsFrom` (
  `4DigitID` int NOT NULL,
  `UniqueID` int NOT NULL,
  `DepartureDateTime` datetime DEFAULT NULL,
  `Origin` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`4DigitID`,`UniqueID`),
  KEY `UniqueID` (`UniqueID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DepartsFrom`
--

LOCK TABLES `DepartsFrom` WRITE;
/*!40000 ALTER TABLE `DepartsFrom` DISABLE KEYS */;
/*!40000 ALTER TABLE `DepartsFrom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Employee`
--

DROP TABLE IF EXISTS `Employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Employee` (
  `SSN` int NOT NULL,
  `FirstName` varchar(20) DEFAULT NULL,
  `LastName` varchar(20) DEFAULT NULL,
  `Username` varchar(20) DEFAULT NULL,
  `Password` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`SSN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employee`
--

LOCK TABLES `Employee` WRITE;
/*!40000 ALTER TABLE `Employee` DISABLE KEYS */;
/*!40000 ALTER TABLE `Employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FollowsTrainSchedule`
--

DROP TABLE IF EXISTS `FollowsTrainSchedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FollowsTrainSchedule` (
  `TransitLineName` varchar(15) NOT NULL,
  `DepartureDatetime` datetime NOT NULL,
  `DepartureStation` int NOT NULL,
  `ArrivalDatetime` datetime NOT NULL,
  `ArrivalStation` int NOT NULL,
  `Fare` double DEFAULT NULL,
  `DStationName` varchar(15) DEFAULT NULL,
  `AStationName` varchar(15) DEFAULT NULL,
  `DepartureStationName` varchar(15) DEFAULT NULL,
  `ArrivalStationName` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`TransitLineName`,`DepartureDatetime`,`DepartureStation`,`ArrivalDatetime`,`ArrivalStation`),
  KEY `DepartureStationName_idx` (`DepartureStationName`),
  KEY `ArriivalStationName_idx` (`ArrivalStationName`),
  KEY `DStationName_idx` (`DStationName`),
  KEY `AStationName_idx` (`AStationName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FollowsTrainSchedule`
--

LOCK TABLES `FollowsTrainSchedule` WRITE;
/*!40000 ALTER TABLE `FollowsTrainSchedule` DISABLE KEYS */;
INSERT INTO `FollowsTrainSchedule` VALUES ('Line1','2020-12-20 12:00:00',1,'2020-12-20 13:00:00',4,20,NULL,NULL,NULL,NULL),('Line1','2020-12-20 13:05:00',4,'2020-12-20 14:00:00',1,20,NULL,NULL,NULL,NULL),('Line2','2020-12-20 12:00:00',3,'2020-12-20 13:00:00',5,20,NULL,NULL,NULL,NULL),('Line2','2020-12-20 13:05:00',4,'2020-12-20 14:00:00',1,20,NULL,NULL,NULL,NULL),('Line2','2020-12-20 13:05:00',5,'2020-12-20 14:00:00',6,20,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `FollowsTrainSchedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `For`
--

DROP TABLE IF EXISTS `For`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `For` (
  `ReservationNumber` int NOT NULL,
  `4DigitID` int NOT NULL,
  PRIMARY KEY (`ReservationNumber`,`4DigitID`),
  KEY `4DigitID` (`4DigitID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `For`
--

LOCK TABLES `For` WRITE;
/*!40000 ALTER TABLE `For` DISABLE KEYS */;
/*!40000 ALTER TABLE `For` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QandA`
--

DROP TABLE IF EXISTS `QandA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QandA` (
  `Question` varchar(500) NOT NULL,
  `Answer` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`Question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QandA`
--

LOCK TABLES `QandA` WRITE;
/*!40000 ALTER TABLE `QandA` DISABLE KEYS */;
INSERT INTO `QandA` VALUES ('Can I bring pets with me?','Only service animals accompanying customers with disabilities are allowed on the train.'),('How do I report suspicious activity?','Please contact the nearest police station or visit the front desk and they will assist you.'),('I left my belongings on the train. How can I retrieve my belongings?','Please visit the front desk of the station.'),('I missed my train, may I get a refund?','Yes, Please Contact 646-332-REFD or go to our website at DBtransit.net.'),('Is eating and drinking allowed on the train?','Eating and drinking are permitted aboard trains. However, please be considerate of your fellow passengers and remember to throw away all trash when leaving the train.'),('What payment methods are accepted?','We accept Cash and Credit cards (Visa, Mastercard, etc) only.'),('Who are you?',NULL);
/*!40000 ALTER TABLE `QandA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WorksAtStation`
--

DROP TABLE IF EXISTS `WorksAtStation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `WorksAtStation` (
  `UniqueID` varchar(15) NOT NULL,
  `Name` varchar(15) DEFAULT NULL,
  `City` varchar(15) DEFAULT NULL,
  `State` char(2) DEFAULT NULL,
  PRIMARY KEY (`UniqueID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WorksAtStation`
--

LOCK TABLES `WorksAtStation` WRITE;
/*!40000 ALTER TABLE `WorksAtStation` DISABLE KEYS */;
INSERT INTO `WorksAtStation` VALUES ('1','First Station','Hackensack','NJ'),('2','Second Station','Fair Lawn','NJ'),('3','Third Station','New Brunswick','NJ'),('4','Fourth Station','Piscataway','NJ'),('5','Fifth Station','Hackensack','NJ'),('6','Sixth Station','Manhattan','NY');
/*!40000 ALTER TABLE `WorksAtStation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WorksOnTrain`
--

DROP TABLE IF EXISTS `WorksOnTrain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `WorksOnTrain` (
  `4DigitID` int NOT NULL,
  `SSN` int NOT NULL,
  PRIMARY KEY (`4DigitID`,`SSN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WorksOnTrain`
--

LOCK TABLES `WorksOnTrain` WRITE;
/*!40000 ALTER TABLE `WorksOnTrain` DISABLE KEYS */;
/*!40000 ALTER TABLE `WorksOnTrain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login` (
  `username` varchar(20) NOT NULL,
  `password` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES ('ad1320','alias789'),('admin','admin'),('Alden','123qwe'),('Brian','Brian'),('brian1','brian1'),('brianrep','brianrep'),('brianrep1','brianrep1'),('costrep','costrep'),('custard','custard'),('customer','customer'),('doorringa','doorringa'),('fhgdfgfd','fhgdfgfd'),('man','man'),('ndeoliveira','dbproject'),('oncetoldme','oncetoldme'),('sg1494','asdqwe'),('testing','testing'),('testing1','testing1'),('user','password'),('username','password');
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-17 23:27:15
