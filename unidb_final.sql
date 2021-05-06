-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: unidb
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `centerofexcellence`
--

DROP TABLE IF EXISTS `centerofexcellence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `centerofexcellence` (
  `ID` int NOT NULL,
  `Name` varchar(60) NOT NULL,
  `coordinatorID` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `coordID_fkey_idx` (`coordinatorID`),
  CONSTRAINT `coordID_fkey` FOREIGN KEY (`coordinatorID`) REFERENCES `staff` (`StaffID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `centerofexcellence`
--

LOCK TABLES `centerofexcellence` WRITE;
/*!40000 ALTER TABLE `centerofexcellence` DISABLE KEYS */;
INSERT INTO `centerofexcellence` VALUES (1,'Unity : AR and Game Development',1),(2,'Wilo : Water safety Innovation',5);
/*!40000 ALTER TABLE `centerofexcellence` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `delete_allocc_of_coe` BEFORE DELETE ON `centerofexcellence` FOR EACH ROW BEGIN
   Delete from projects where coeID = old.ID;
   Delete from coemembers where coeID = old.ID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `class`
--

DROP TABLE IF EXISTS `class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `class` (
  `ClassID` int NOT NULL AUTO_INCREMENT,
  `ClassName` varchar(20) NOT NULL,
  `CourseID` varchar(15) NOT NULL,
  `ClassTeacherID` int NOT NULL,
  `Semister` int NOT NULL,
  `Division` varchar(5) NOT NULL,
  `Year` int NOT NULL,
  PRIMARY KEY (`ClassID`),
  KEY `Class_fk0` (`CourseID`),
  KEY `Class_fk1` (`ClassTeacherID`),
  CONSTRAINT `Class_fk0` FOREIGN KEY (`CourseID`) REFERENCES `courses` (`CourseID`),
  CONSTRAINT `Class_fk1` FOREIGN KEY (`ClassTeacherID`) REFERENCES `staff` (`StaffID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class`
--

LOCK TABLES `class` WRITE;
/*!40000 ALTER TABLE `class` DISABLE KEYS */;
INSERT INTO `class` VALUES (1,'SY-BTECH-ME','BTECHME',2,3,'ME2-B',2020),(2,'FY-BTA','BTA',15,2,'TA1-A',2021),(3,'TY-BTECH-CE','BTECHCE',11,5,'CE3-A',2021),(4,'TY-BBA','BBA',16,6,'BA3-B',2019),(5,'FY-BFAM','BFAM',19,1,'FM1',2018),(6,'SY-BFAPD','BFAPD',18,4,'PD2-A',2020);
/*!40000 ALTER TABLE `class` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `delete_allocc_of_class` BEFORE DELETE ON `class` FOR EACH ROW BEGIN
   Delete from studiesin where ClassID = old.classID;
   Delete from subjecttaught where ClassID = old.ClassID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `coe_n_members`
--

DROP TABLE IF EXISTS `coe_n_members`;
/*!50001 DROP VIEW IF EXISTS `coe_n_members`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `coe_n_members` AS SELECT 
 1 AS `ID`,
 1 AS `Name`,
 1 AS `CoordinatorID`,
 1 AS `Coordinator First Name`,
 1 AS `Coordinator Last Name`,
 1 AS `studentID`,
 1 AS `Student First Name`,
 1 AS `Student Last Name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `coemembers`
--

DROP TABLE IF EXISTS `coemembers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coemembers` (
  `coeID` int NOT NULL,
  `memID` int NOT NULL,
  KEY `memID_fkey_idx` (`memID`),
  KEY `coeID_fkey` (`coeID`),
  CONSTRAINT `coeID_fkey` FOREIGN KEY (`coeID`) REFERENCES `centerofexcellence` (`ID`),
  CONSTRAINT `memID_fkey` FOREIGN KEY (`memID`) REFERENCES `students` (`GRN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coemembers`
--

LOCK TABLES `coemembers` WRITE;
/*!40000 ALTER TABLE `coemembers` DISABLE KEYS */;
INSERT INTO `coemembers` VALUES (1,9),(1,1),(1,18),(1,21),(1,24),(1,6),(2,14),(2,23),(2,13),(2,7),(2,8),(2,20);
/*!40000 ALTER TABLE `coemembers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `completed_projects`
--

DROP TABLE IF EXISTS `completed_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `completed_projects` (
  `projectID` int NOT NULL,
  `projectTopic` varchar(50) NOT NULL,
  `coeID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Completed projects are shown here';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `completed_projects`
--

LOCK TABLES `completed_projects` WRITE;
/*!40000 ALTER TABLE `completed_projects` DISABLE KEYS */;
/*!40000 ALTER TABLE `completed_projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses` (
  `CourseID` varchar(15) NOT NULL,
  `CourseName` varchar(60) NOT NULL,
  `DepartmentID` int NOT NULL,
  `CourseHeadID` int NOT NULL,
  PRIMARY KEY (`CourseID`),
  UNIQUE KEY `CourseID` (`CourseID`),
  KEY `Courses_fk0` (`DepartmentID`),
  KEY `Courses_fk1` (`CourseHeadID`),
  CONSTRAINT `Courses_fk0` FOREIGN KEY (`DepartmentID`) REFERENCES `department` (`DepartmentID`),
  CONSTRAINT `Courses_fk1` FOREIGN KEY (`CourseHeadID`) REFERENCES `staff` (`StaffID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES ('BBA','Bachelor of Business Administration',2,3),('BFAM','Bachelor of Fine Arts in Music',3,10),('BFAPD','Bachelor of Fine Arts in Product Design',3,12),('BTA','Bachelor of Tourism Administration',2,9),('BTECHCE','Bachelor of Technology in Computer Engineering',1,6),('BTECHME','Bachelor of Technology in Mechanical Engineering',1,8);
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `delete_allocc_of_course` BEFORE DELETE ON `courses` FOR EACH ROW BEGIN
   Delete from class where CourseID = old.CourseID;
   Delete from subjects where CourseID = old.CourseID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `DepartmentID` int NOT NULL AUTO_INCREMENT,
  `DepartmentName` varchar(25) NOT NULL,
  `DepartmentHeadID` int DEFAULT NULL,
  PRIMARY KEY (`DepartmentID`),
  UNIQUE KEY `DepartmentID` (`DepartmentID`),
  KEY `Department_fk0` (`DepartmentHeadID`),
  CONSTRAINT `Department_fk0` FOREIGN KEY (`DepartmentHeadID`) REFERENCES `staff` (`StaffID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'Science and Technology',1),(2,'Management and Finance',3),(3,'Fine Arts',4),(4,'Administration',20);
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `delete_allocc_of_department` BEFORE DELETE ON `department` FOR EACH ROW BEGIN
   Delete from staff where DepartmentID = old.DepartmentID;
   Delete from courses where DepartmentID = old.DepartmentID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `examgiven`
--

DROP TABLE IF EXISTS `examgiven`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `examgiven` (
  `StudentID` int NOT NULL,
  `ExamID` int NOT NULL,
  `MarksObtained` int NOT NULL,
  `Grade` varchar(2) DEFAULT NULL,
  KEY `ExamGiven_fk0` (`StudentID`),
  KEY `ExamGiven_fk1` (`ExamID`),
  CONSTRAINT `ExamGiven_fk0` FOREIGN KEY (`StudentID`) REFERENCES `students` (`GRN`),
  CONSTRAINT `ExamGiven_fk1` FOREIGN KEY (`ExamID`) REFERENCES `exams` (`ExamID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `examgiven`
--

LOCK TABLES `examgiven` WRITE;
/*!40000 ALTER TABLE `examgiven` DISABLE KEYS */;
INSERT INTO `examgiven` VALUES (9,21,35,'B'),(18,21,41,'A'),(24,21,32,'B'),(14,21,31,'B'),(9,22,36,'B'),(18,22,23,'C'),(24,22,47,'A'),(14,22,40,'A'),(9,23,34,'B'),(18,23,29,'C'),(24,23,30,'B'),(14,23,40,'A'),(9,24,45,'A'),(18,24,49,'A'),(24,24,48,'A'),(14,24,37,'B'),(19,13,40,'A'),(11,13,39,'B'),(22,13,38,'B'),(20,13,26,'C'),(19,14,26,'C'),(11,14,35,'B'),(22,14,48,'A'),(20,14,46,'A'),(19,15,32,'B'),(11,15,29,'C'),(22,15,45,'A'),(20,15,35,'B'),(19,16,38,'B'),(11,16,37,'B'),(22,16,42,'A'),(20,16,41,'A'),(1,17,27,'C'),(21,17,38,'B'),(6,17,46,'A'),(23,17,48,'A'),(1,18,37,'B'),(21,18,29,'C'),(6,18,45,'A'),(23,18,39,'B'),(1,19,37,'B'),(21,19,34,'B'),(6,19,47,'A'),(23,19,50,'A'),(1,20,29,'C'),(21,20,49,'A'),(6,20,45,'A'),(23,20,43,'A'),(13,1,39,'B'),(4,1,40,'A'),(10,1,42,'A'),(16,1,38,'B'),(13,2,39,'B'),(4,2,40,'A'),(10,2,34,'B'),(16,2,37,'B'),(13,3,40,'A'),(4,3,23,'C'),(10,3,38,'B'),(16,3,39,'B'),(13,4,38,'B'),(4,4,38,'B'),(10,4,41,'A'),(16,4,48,'A'),(24,5,38,'B'),(2,5,39,'B'),(5,5,40,'A'),(8,5,38,'B'),(24,6,35,'B'),(2,6,38,'B'),(5,6,49,'A'),(8,6,39,'B'),(24,7,37,'B'),(2,7,50,'A'),(5,7,49,'A'),(8,7,31,'B'),(24,8,37,'B'),(2,8,35,'B'),(5,8,49,'A'),(8,8,40,'A'),(10,9,49,'A'),(7,9,29,'C'),(12,9,40,'A'),(3,9,39,'B'),(10,10,37,'B'),(7,10,39,'B'),(12,10,40,'A'),(3,10,37,'B'),(10,11,46,'A'),(7,11,38,'B'),(12,11,39,'B'),(3,11,49,'A'),(10,12,49,'A'),(7,12,39,'B'),(12,12,48,'A'),(3,12,49,'A');
/*!40000 ALTER TABLE `examgiven` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_insert_examgiven` BEFORE INSERT ON `examgiven` FOR EACH ROW begin
	if new.MarksObtained >= 40 
	then set new.Grade = "A" ;
	elseif new.MarksObtained < 40 and new.MarksObtained >= 30
    then set new.Grade = "B" ;
    elseif new.MarksObtained < 30 and new.MarksObtained >= 20
    then set new.Grade = "C" ;
    elseif new.MarksObtained < 20
    then set new.Grade = "F" ;
	end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `exams`
--

DROP TABLE IF EXISTS `exams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exams` (
  `ExamID` int NOT NULL AUTO_INCREMENT,
  `SubjectID` varchar(15) NOT NULL,
  `ExamDate` date NOT NULL,
  `Type` varchar(25) NOT NULL,
  `TotalMarks` int NOT NULL DEFAULT '25',
  PRIMARY KEY (`ExamID`),
  UNIQUE KEY `ExamID` (`ExamID`),
  KEY `Exams_fk0` (`SubjectID`),
  CONSTRAINT `Exams_fk0` FOREIGN KEY (`SubjectID`) REFERENCES `subjects` (`SubjectID`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exams`
--

LOCK TABLES `exams` WRITE;
/*!40000 ALTER TABLE `exams` DISABLE KEYS */;
INSERT INTO `exams` VALUES (1,'BBA207','2020-05-15','ESE',50),(2,'BBA209','2020-05-17','ESE',50),(3,'BBA301','2020-05-20','ESE',50),(4,'BBA303','2020-05-22','ESE',50),(5,'BFAM103','2020-05-15','Practical',50),(6,'BFAM105','2020-05-17','Practical',50),(7,'BFAM307','2020-05-20','ESE',50),(8,'BFAM309','2020-05-22','ESE',50),(9,'BFAPD106','2020-05-15','Practical',50),(10,'BFAPD108','2020-05-17','Practical',50),(11,'BFAPD110','2020-05-20','ESE',50),(12,'BFAPD204','2020-05-22','ESE',50),(13,'BTA103','2020-05-15','ESE',50),(14,'BTA208','2020-05-17','ESE',50),(15,'BTA213','2020-05-20','ESE',50),(16,'BTA403','2020-05-22','ESE',50),(17,'BTECHCE101','2020-05-15','Practical',50),(18,'BTECHCE201','2020-05-17','ESE',50),(19,'BTECHCE208','2020-05-20','ESE',50),(20,'BTECHCE302','2020-05-22','ESE',50),(21,'BTECHME311','2020-05-15','ESE',50),(22,'BTECHME402','2020-05-17','ESE',50),(23,'BTECHME403','2020-05-20','Practical',50),(24,'BTECHME405','2020-05-22','ESE',50);
/*!40000 ALTER TABLE `exams` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `delete_allocc_of_exams` BEFORE DELETE ON `exams` FOR EACH ROW BEGIN
   Delete from examgiven where ExamID = old.ExamID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `project_n_members`
--

DROP TABLE IF EXISTS `project_n_members`;
/*!50001 DROP VIEW IF EXISTS `project_n_members`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `project_n_members` AS SELECT 
 1 AS `ID`,
 1 AS `Topic`,
 1 AS `coeID`,
 1 AS `studentID`,
 1 AS `Student First Name`,
 1 AS `Student Last Name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projects` (
  `ID` int NOT NULL,
  `topic` varchar(50) NOT NULL,
  `coeID` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `coexID_fkey_idx` (`coeID`),
  CONSTRAINT `coexID_fkey` FOREIGN KEY (`coeID`) REFERENCES `centerofexcellence` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` VALUES (1,'AR Model of College',1),(2,'AR Science Laboratory',1),(3,'Water reservoir Pollution Survey',2),(4,'Water Purifier from readily available stuff',2);
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `delete_allocc_of_projects` BEFORE DELETE ON `projects` FOR EACH ROW BEGIN
   Delete from promembers where projectID = old.ID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_delete_projects` AFTER DELETE ON `projects` FOR EACH ROW begin
	insert into completed_projects value(old.ID,old.topic,old.coeID);
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `promembers`
--

DROP TABLE IF EXISTS `promembers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promembers` (
  `projectID` int NOT NULL,
  `studentID` int NOT NULL,
  KEY `proID_fkey_idx` (`projectID`),
  KEY `stuID_fkey_idx` (`studentID`),
  CONSTRAINT `proID_fkey` FOREIGN KEY (`projectID`) REFERENCES `projects` (`ID`),
  CONSTRAINT `stuID_fkey` FOREIGN KEY (`studentID`) REFERENCES `students` (`GRN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promembers`
--

LOCK TABLES `promembers` WRITE;
/*!40000 ALTER TABLE `promembers` DISABLE KEYS */;
INSERT INTO `promembers` VALUES (1,1),(1,21),(1,6),(1,11),(2,9),(2,24),(2,19),(2,18),(3,14),(3,13),(3,8),(3,7),(4,23),(4,6),(4,4),(4,17);
/*!40000 ALTER TABLE `promembers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `retired`
--

DROP TABLE IF EXISTS `retired`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `retired` (
  `StaffId` int DEFAULT NULL,
  `FirstName` varchar(45) DEFAULT NULL,
  `LastName` varchar(45) DEFAULT NULL,
  `ContactNo` varchar(25) DEFAULT NULL,
  `YearsOfService` int DEFAULT NULL,
  KEY `StaffId` (`StaffId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `retired`
--

LOCK TABLES `retired` WRITE;
/*!40000 ALTER TABLE `retired` DISABLE KEYS */;
/*!40000 ALTER TABLE `retired` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `StaffID` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(15) NOT NULL,
  `MiddleName` varchar(15) DEFAULT NULL,
  `LastName` varchar(15) NOT NULL,
  `DOB` date NOT NULL,
  `Age` int NOT NULL,
  `Qualification` varchar(40) NOT NULL,
  `YearsOfService` int DEFAULT NULL,
  `Position` varchar(25) DEFAULT NULL,
  `DepartmentID` int NOT NULL,
  `Email` varchar(30) NOT NULL,
  `ContactNo` varchar(13) NOT NULL,
  `Address` varchar(50) NOT NULL,
  PRIMARY KEY (`StaffID`),
  UNIQUE KEY `StaffID` (`StaffID`),
  KEY `Staff_fk0` (`DepartmentID`),
  CONSTRAINT `Staff_fk0` FOREIGN KEY (`DepartmentID`) REFERENCES `department` (`DepartmentID`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (1,'Arjit','kumar','Malhotra','1980-02-11',40,'phd in Computer Science',6,'HOD',1,'ArjitMalhotra@unidb.co.in','9606456390','Green Valley, A-12'),(2,'Amarjit','Singh','Siddhu','1975-07-11',45,'Phd in Mechanical Engineering',5,'Teacher',1,'AmarjitSiddhu@unidb.co.in','9606456890','Flower Valley, C-22'),(3,'Rajesh','Kumar','Sharma','1981-11-01',40,'phd in Management and finance',6,'HOD',2,'RajeshKumar@unidb.co.in','9606458974','Rose Parade, B-109'),(4,'Jai','Singh','Rathod','1982-05-03',38,'phd in Fine Arts',4,'HOD',3,'jaiRathod@unidb.co.in','9606454234','Hillmist Colony, A-09'),(5,'Ashraf','Ali','Khan','1992-02-12',28,'MTECH in Computer Science',3,'Teacher',1,'AshrafKhan@unidb.co.in','9606854390','Bhrama Angan, C-02'),(6,'Asif','Arfan','Inamdar','1980-10-17',40,'phd in Computer Science',4,'Teacher',1,'AsifKhan@unidb.co.in','9606477799','Brahma Majestic, C-32'),(7,'Gopal','Krishna','Kumar','1984-02-11',36,'MTECH in Mechanical Engineering',4,'Teacher',1,'GopalKumar@unidb.co.in','9606982365','Green Acres, E-11'),(8,'Sejal','Rajesh','Chadda','1992-04-07',28,'phd in Mechanical Engineering',3,'Teacher',1,'SejalChadda@unidb.co.in','9606490873','Oxford Village Comforts, I-09'),(9,'Jeevisha','Singh','Rana','1989-01-06',31,'phd in Finance ',4,'Teacher',2,'JeevishaRana@unidb.co.in','9606457518','Salunke Vihar, Q-08'),(10,'Khushi','Singh','Rajpal','1995-02-11',25,'MA in Music',2,'Teacher',3,'KhushiRajpal@unidb.co.in','9606457777','Green Orchids, A-01'),(11,'Mustafa','Hussein','Galal','1985-11-10',35,'phd in Computer Science',4,'Teacher',1,'mustafagalal@unidb.co.in','9606456388','Cloud 9, A-02'),(12,'Zainab','Mustafa','Kapasi','1995-05-01',26,'phd in fine-arts',3,'Teacher',3,'zainabKapasi@unidb.co.in','9606458769','Ganga Savera, B-14'),(13,'Arvind','Miland','Kumar','1982-12-17',38,'MBA',5,'Teacher',2,'ArvindKumar@unidb.co.in','9606458766','Kent Exclusive, C-09'),(14,'Bharti','Arvind','Kumar','1985-01-09',35,'MTECH in MEchanical Engineering',4,'Teacher',1,'BhartiKumar@unidb.co.in','9606456589','Kent Exclusive, C-09'),(15,'Manoj','Ram','Mahajani','1981-11-22',39,'MBA Tourism',5,'Teacher',2,'ManojMahajani@unidb.co.in','9606456555','Brahma Avenue, A-08'),(16,'Suresh','Kumar','Sharma','1980-12-19',40,'phd in Management',5,'Teacher',2,'SureshKumar@unidb.co.in','9606456000','Green Valley, E-14'),(17,'Sheela','Manoj','Kumari','1986-07-08',34,'MBA Hotel Management',4,'Teacher',2,'SheelaKumari@unidb.co.in','9606459999','Nine Hills, B-04'),(18,'Ujwala','Ramesh','Maheshwari','1990-02-11',30,'phd in arts and design',5,'Teacher',3,'UjwalaMahesshwari@unidb.co.in','9606409098','Olive Gardens, N-22'),(19,'Brian','Samuel','Dsouza','1979-01-01',41,'phd Music',6,'Teacher',3,'BrianDsouza@unidb.co.in','9606400091','Ganga Satellite, A-12'),(20,'Ramesh','bharat','Shetty','1974-03-12',46,'Metric Pass',5,'Manager',4,'RameshShetty@unidb.co.in','9606450040','Ramesh Housing, flatno-12'),(21,'Bharat','Ram','Kumar','1980-02-11',40,'Metric Pass',5,'Clerk',4,'Bharatkumar@unidb.co.in','9606999545','Ramesh Housing, flatno-09'),(22,'Aarti','Rajesh','Bansal','1980-02-22',40,'Metric Pass',5,'Clerk',4,'AartiBansal@unidb.co.in','9606458989','Ramesh Housing, flatno-04'),(23,'Shabaz','Amir','Khan','1979-03-12',41,'Book Keeping',4,'Librarian',4,'shabazKhan@unidb.co.in','9606450444','Ramesh Housing, flatno-03'),(24,'Babu','Ram','Shinde','1979-02-03',41,'Metric Pass',4,'Watchman',4,'BabuShinde@unidb.co.in','96064504921','Ramesh Housing, flatno-02'),(25,'salim','Shaan','Sayyed','1973-01-12',47,'Metric Pass',5,'Watchman',4,'salimSayyed@unidb.co.in','9606450049','Ramesh Housing, flatno-01'),(26,'Ramu','Khrishnan','Kumar','1978-05-05',42,'Metric Pass',5,'Janitor',4,'RamuKumar@unidb.co.in','9606450987','Ramesh Housing, flatno-08'),(27,'Shaanta','Sanjesh','Kumari','1981-02-11',39,'Metric Pass',4,'Janitor',4,'ShaantaKumari@unidb.co.in','9606450044','Ramesh Housing, flatno-07');
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `delete_allocc_of_staff` BEFORE DELETE ON `staff` FOR EACH ROW BEGIN
   Delete from centerofexcellence where coordinatorID = old.staffID;
   Delete from class where ClassTeacherID = old.staffID;
   Delete from courses where CourseHeadID = old.staffID;
   Delete from department where DepartmentHeadID = old.staffID;
   Delete from subjecttaught where staffID = old.staffID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `RetiredTrigger` AFTER DELETE ON `staff` FOR EACH ROW BEGIN
   IF (old.YearsOfService > 5)
   THEN
   INSERT INTO Retired VALUES
                       (old.StaffId, old.FirstName, old.LastName, old.ContactNo, old.YearsOfService);
   


END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `staff_and_subjectcount`
--

DROP TABLE IF EXISTS `staff_and_subjectcount`;
/*!50001 DROP VIEW IF EXISTS `staff_and_subjectcount`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `staff_and_subjectcount` AS SELECT 
 1 AS `staffID`,
 1 AS `FirstNAme`,
 1 AS `LastName`,
 1 AS `count(st.staffID)`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `staff_of_administration_dept`
--

DROP TABLE IF EXISTS `staff_of_administration_dept`;
/*!50001 DROP VIEW IF EXISTS `staff_of_administration_dept`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `staff_of_administration_dept` AS SELECT 
 1 AS `ID`,
 1 AS `First Name`,
 1 AS `Middle Name`,
 1 AS `Last Name`,
 1 AS `DOB`,
 1 AS `Age`,
 1 AS `Qualification`,
 1 AS `Years Of Service`,
 1 AS `Position`,
 1 AS `Department ID`,
 1 AS `Email`,
 1 AS `Contact No.`,
 1 AS `Address`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `GRN` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(15) NOT NULL,
  `MiddleName` varchar(15) DEFAULT NULL,
  `LastName` varchar(15) NOT NULL,
  `DOB` date NOT NULL,
  `Age` int DEFAULT NULL,
  `StudentEmail` varchar(30) NOT NULL,
  `StudentMobileNo` varchar(13) NOT NULL,
  `ParentMobileNo` varchar(13) NOT NULL,
  `ParentEmail` varchar(30) NOT NULL,
  `Address` varchar(50) NOT NULL,
  `JoinDate` date NOT NULL,
  PRIMARY KEY (`GRN`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,'Rick','Vijay','Sharma','2000-02-08',21,'ricksharma@unidb.co.in','9890706050','8909897867','vijaysharma@unidb.co.in','Flower Gardens, E-204','2017-01-05'),(2,'Penny','Henry','Jerald','2000-12-08',21,'pennyjerald@unidb.co.in','8903706050','8965897867','henryjerald@unidb.co.in','King Residence, I-09','2017-01-05'),(3,'Mason','Jason','David','2001-12-19',20,'masondavid@unidb.co.in','8903706630','8968497867','jasondavid@unidb.co.in','Free Sky, H-459','2018-09-06'),(4,'Samuel','Reon','Shannon','2001-08-05',20,'samuelshannon@unidb.co.in','7703740630','8968397217','reonshannon@unidb.co.in','Selhurst Park, Row-59','2018-09-06'),(5,'Milind','Sarkar','Damji','2002-08-04',19,'milinddamji@unidb.co.in','8393706630','8958493867','sarkardamji@unidb.co.in','Campden Park, A-1920','2017-01-04'),(6,'Saumya','Shekhar','Saha','2002-08-18',19,'saumyasaha@unidb.co.in','9333706630','7695849386','shekharsaha@unidb.co.in','Fenway Galaxy, C-201','2018-11-07'),(7,'Shweta','Narayan','Shitole','2001-04-18',20,'shwetashitole@unidb.co.in','9323706630','7308493867','narayanshitole@unidb.co.in','Narayan Villa','2018-10-04'),(8,'Shruti','Sanjay','Bagmar','2002-06-24',19,'shrutibagmar@unidb.co.in','9308006630','98608493867','sanjaybagmar@unidb.co.in','Erb Society, A-08','2017-10-09'),(9,'Udit','Arjun','Malhotra','2002-09-18',19,'uditmalhotra@unidb.co.in','7089706630','9806493867','uditmalhotra@unidb.co.in','Sunshine Gardens, T-09','2018-09-10'),(10,'Rahul','Lucky','D\'Souza','2002-12-24',19,'rahuldsouza@unidb.co.in','9323706630','9708193867','luckydsouza@unidb.co.in','OneColumbia ,M-80','2017-07-02'),(11,'Raj','Kajol','Briganza','2001-09-05',20,'rajbriganza@unidb.co.in','9023806630','9008493867','kajolbriganza@unidb.co.in','Briganza Bunglow','2018-09-09'),(12,'Ramu','Prasad','Singh','2000-01-10',21,'ramusingh@unidb.co.in','6723426630','8242133867','prasadsingh@unidb.co.in','Tamini Society, Row-10','2019-11-06'),(13,'Hamza','Imam','Abdullah','2002-01-13',19,'hamzaabdullah@unidb.co.in','9827706930','5908493867','imamabdullah@unidb.co.in','Trees Abode, I-07','2017-07-08'),(14,'Zainab','Imam','Abdullah','2002-10-01',19,'zainababdullah@unidb.co.in','9022746930','5908493867','imamabdullah@unidb.co.in','Trees Abode, I-07','2017-07-08'),(15,'Ruturaj','Shailesh','Shinde','2000-02-12',21,'ruturajshinde@unidb.co.in','5817706930','5240842267','shaileshshinde@unidb.co.in','Heavens Park, A-12','2016-09-02'),(16,'Mukhta','Pranav','Chavan','2001-07-09',20,'mukhtachavan@unidb.co.in','5217456930','8128423267','pranavchavan@unidb.co.in','Ganga Satelliete, A2-12','2018-12-10'),(17,'Seema','Rajendra','Jyoti','2000-04-03',21,'seemajyoti@unidb.co.in','8347706930','5324423267','rajendrajyoti@unidb.co.in','Silver Nest, A-17','2016-12-02'),(18,'Rizwan','Ali','Deshmukh','2001-05-12',20,'riswandeshmukh@unidb.co.in','8547702330','9014423267','alideshmukh@unidb.co.in','Mayflower Highlands, H-92','2017-05-12'),(19,'Sadnik','Puru','Mukherjee','2002-05-04',19,'sadnikmukherjee@unidb.co.in','5147706930','5322332672','purumukherjee@unidb.co.in','Clover Eleganza, Row-03','2018-06-04'),(20,'Manpreet','Dolly','Singh','2001-11-07',20,'manpreetsingh@unidb.co.in','9470692330','1322332671','dollysingh@unidb.co.in','Kumar Palisades, A-02','2016-06-02'),(21,'Rohan','Mark','D\'Souza','1999-09-05',22,'rohandsouza@unidb.co.in','6137706930','9322332267','markdsouza@unidb.co.in','Cloud-9, P-03','2016-12-09'),(22,'Abdullah','Mohammed','Khan','2001-11-09',20,'abdullahkhan@unidb.co.in','9087706930','2422332672','mohammadkhan@unidb.co.in','Golden Orchids, 27','2017-01-06'),(23,'Sahil','Kumar','Tripathi','2000-10-05',21,'sahiltripathi@unidb.co.in','9876706930','9423322912','kumartripathi@unidb.co.in','Timberland, F-17','2018-09-02'),(24,'Tom','Mark','Sawyer','2002-03-06',19,'tomsawyer@unidb.co.in','9217706930','9832332672','marksawyer@unidb.co.in','Platinum Freedom, A-02','2016-01-12');
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `delete_allocc_of_student` BEFORE DELETE ON `students` FOR EACH ROW BEGIN
   Delete from coemembers where memID = old.GRN;
   Delete from examgiven where StudentID = old.GRN;
   Delete from promembers where studentID = old.GRN;
   Delete from studiesin where studentID = old.GRN;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `studiesin`
--

DROP TABLE IF EXISTS `studiesin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `studiesin` (
  `StudentID` int NOT NULL,
  `ClassID` int NOT NULL,
  `Rollno` int NOT NULL,
  KEY `StudiesIn_fk0` (`StudentID`),
  KEY `StudiesIn_fk1` (`ClassID`),
  CONSTRAINT `StudiesIn_fk0` FOREIGN KEY (`StudentID`) REFERENCES `students` (`GRN`),
  CONSTRAINT `StudiesIn_fk1` FOREIGN KEY (`ClassID`) REFERENCES `class` (`ClassID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studiesin`
--

LOCK TABLES `studiesin` WRITE;
/*!40000 ALTER TABLE `studiesin` DISABLE KEYS */;
INSERT INTO `studiesin` VALUES (9,1,4),(18,1,2),(24,1,3),(14,1,1),(19,2,2),(11,2,3),(22,2,4),(20,2,1),(1,3,2),(21,3,4),(6,3,1),(23,3,3),(13,4,1),(4,4,2),(10,4,4),(16,4,3),(24,5,4),(2,5,2),(5,5,3),(8,5,1),(10,6,2),(7,6,3),(12,6,4),(3,6,1);
/*!40000 ALTER TABLE `studiesin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subjects`
--

DROP TABLE IF EXISTS `subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subjects` (
  `SubjectID` varchar(15) NOT NULL,
  `SubjectName` varchar(50) NOT NULL,
  `Type` varchar(15) NOT NULL,
  `CourseID` varchar(15) NOT NULL,
  `Credit` int NOT NULL,
  PRIMARY KEY (`SubjectID`),
  UNIQUE KEY `SubjectID` (`SubjectID`),
  KEY `Subjects_fk0` (`CourseID`),
  CONSTRAINT `Subjects_fk0` FOREIGN KEY (`CourseID`) REFERENCES `courses` (`CourseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subjects`
--

LOCK TABLES `subjects` WRITE;
/*!40000 ALTER TABLE `subjects` DISABLE KEYS */;
INSERT INTO `subjects` VALUES ('BBA207','Principles of Management','Theory','BBA',3),('BBA209','Human Resource Management','Theory','BBA',3),('BBA301','Business Communication','Theory','BBA',3),('BBA303','Production and Materials Management','Theory','BBA',3),('BFAM103','Appreciation of Music','Lab','BFAM',2),('BFAM105','Concert Singing','Lab','BFAM',3),('BFAM307','Music and Literature','Theory','BFAM',4),('BFAM309','Classification of Music','Theory','BFAM',3),('BFAPD106','Product Interface and Design','Lab','BFAPD',4),('BFAPD108','Communication and Presentation Skills','Lab','BFAPD',3),('BFAPD110','Framework of Design','Theory','BFAPD',3),('BFAPD204','Applied Ergonomics','Theory','BFAPD',4),('BTA103','Tourism Geography','Theory','BTA',3),('BTA208','Tourism Marketing','Theory','BTA',2),('BTA213','Organizational Behaviour','Theory','BTA',4),('BTA403','Basics of Tourism','Theory','BTA',3),('BTECHCE101','Python','Lab','BTECHCE',2),('BTECHCE201','Database Management Systems','Theory','BTECHCE',4),('BTECHCE208','Applied Statistical Analysis','Theory','BTECHCE',3),('BTECHCE302','Computer Graphics','Theory','BTECHCE',3),('BTECHME311','Compresible Fluid Flow','Theory','BTECHME',3),('BTECHME402','Mechatronics','Theory','BTECHME',3),('BTECHME403','Mechanical Engineering Lab','Lab','BTECHME',1),('BTECHME405','Advanced Energy Engineering','Theory','BTECHME',4);
/*!40000 ALTER TABLE `subjects` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `delete_allocc_of_subject` BEFORE DELETE ON `subjects` FOR EACH ROW BEGIN
   Delete from exams where SubjectID = old.SubjectID;
   Delete from subjecttaught where SubjectID = old.SubjectID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `subjecttaught`
--

DROP TABLE IF EXISTS `subjecttaught`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subjecttaught` (
  `ClassID` int NOT NULL,
  `SubjectID` varchar(15) NOT NULL,
  `StaffID` int NOT NULL,
  KEY `SubjectTaught_fk0` (`ClassID`),
  KEY `SubjectTaught_fk1` (`SubjectID`),
  KEY `SubjectTaught_fk2` (`StaffID`),
  CONSTRAINT `SubjectTaught_fk0` FOREIGN KEY (`ClassID`) REFERENCES `class` (`ClassID`),
  CONSTRAINT `SubjectTaught_fk1` FOREIGN KEY (`SubjectID`) REFERENCES `subjects` (`SubjectID`),
  CONSTRAINT `SubjectTaught_fk2` FOREIGN KEY (`StaffID`) REFERENCES `staff` (`StaffID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subjecttaught`
--

LOCK TABLES `subjecttaught` WRITE;
/*!40000 ALTER TABLE `subjecttaught` DISABLE KEYS */;
INSERT INTO `subjecttaught` VALUES (1,'BTECHME311',2),(1,'BTECHME402',7),(1,'BTECHME403',8),(1,'BTECHME405',14),(2,'BTA103',3),(2,'BTA208',15),(2,'BTA213',9),(2,'BTA403',13),(3,'BTECHCE101',1),(3,'BTECHCE201',5),(3,'BTECHCE208',6),(3,'BTECHCE302',11),(4,'BBA207',17),(4,'BBA209',16),(4,'BBA301',13),(4,'BBA303',9),(5,'BFAM103',19),(5,'BFAM105',10),(5,'BFAM307',10),(5,'BFAM309',19),(6,'BFAPD106',4),(6,'BFAPD108',18),(6,'BFAPD110',12),(6,'BFAPD204',18);
/*!40000 ALTER TABLE `subjecttaught` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `teachers_of_fine_arts`
--

DROP TABLE IF EXISTS `teachers_of_fine_arts`;
/*!50001 DROP VIEW IF EXISTS `teachers_of_fine_arts`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `teachers_of_fine_arts` AS SELECT 
 1 AS `ID`,
 1 AS `First Name`,
 1 AS `Middle Name`,
 1 AS `Last Name`,
 1 AS `DOB`,
 1 AS `Age`,
 1 AS `Qualification`,
 1 AS `Years Of Service`,
 1 AS `Position`,
 1 AS `Department ID`,
 1 AS `Email`,
 1 AS `Contact No.`,
 1 AS `Address`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `teachers_of_management_and_finance`
--

DROP TABLE IF EXISTS `teachers_of_management_and_finance`;
/*!50001 DROP VIEW IF EXISTS `teachers_of_management_and_finance`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `teachers_of_management_and_finance` AS SELECT 
 1 AS `ID`,
 1 AS `First Name`,
 1 AS `Middle Name`,
 1 AS `Last Name`,
 1 AS `DOB`,
 1 AS `Age`,
 1 AS `Qualification`,
 1 AS `Years Of Service`,
 1 AS `Position`,
 1 AS `Department ID`,
 1 AS `Email`,
 1 AS `Contact No.`,
 1 AS `Address`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `teachers_of_science_and_technology`
--

DROP TABLE IF EXISTS `teachers_of_science_and_technology`;
/*!50001 DROP VIEW IF EXISTS `teachers_of_science_and_technology`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `teachers_of_science_and_technology` AS SELECT 
 1 AS `StaffID`,
 1 AS `FirstName`,
 1 AS `MiddleName`,
 1 AS `LastName`,
 1 AS `DOB`,
 1 AS `Age`,
 1 AS `Qualification`,
 1 AS `YearsOfService`,
 1 AS `Position`,
 1 AS `DepartmentID`,
 1 AS `Email`,
 1 AS `ContactNo`,
 1 AS `Address`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'unidb'
--

--
-- Dumping routines for database 'unidb'
--
/*!50003 DROP FUNCTION IF EXISTS `overall_grade` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `overall_grade`(student_grn int) RETURNS varchar(5) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
	Declare sum int;
    Declare n int;
    Declare p int;
    Declare grade varchar(5) default "";
	select sum(MarksObtained),count(StudentID) into sum,n from examgiven where StudentID = student_grn;
    set p = (sum*2)/n;
    if  p >= 90
    then set grade = "A+";
    elseif  p < 90 and p >= 80
    then set grade = "A";
    elseif  p < 80 and p >= 70
    then set grade = "B+";
    elseif  p < 70 and p >= 60
    then set grade = "B";
    elseif  p < 60 and p >= 50
    then set grade = "C+";
    elseif  p < 50 and p >= 40 
    then set grade = "C";
    elseif  p < 40 and p >= 35
    then set grade = "P";
    elseif  p < 35
    then set grade = "F";
    end if;
    return grade;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `staffcount_in_dept` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `staffcount_in_dept`(deptid int) RETURNS int
    DETERMINISTIC
BEGIN
	declare sc int;
    select count(staffID) into sc from staff where DepartmentID = deptid;  
RETURN sc;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `studentcount_in_class` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `studentcount_in_class`(cid int) RETURNS int
    DETERMINISTIC
BEGIN
declare stc int;
select count(studentID) into stc from studiesin where classid=cid;
RETURN stc;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `classstud` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `classstud`( IN classid int)
BEGIN
		select si.Rollno,s.GRN,s.FirstName,s.MiddleName,s.LastName,s.StudentEmail as Email,s.StudentMobileNo as "Mobile No." 
        from students as s,studiesin as si
        where s.GRN = si.StudentID and si.ClassID = classid order by si.Rollno;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `liststaffnames` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `liststaffnames`(INOUT staffnamelist varchar(16000))
BEGIN

DECLARE is_done INTEGER DEFAULT 0;
DECLARE s_name varchar(1000) DEFAULT "";
DECLARE staff_cur CURSOR FOR 

SELECT FirstName from staff;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET is_done=1;
OPEN staff_cur;

get_list: LOOP
FETCH staff_cur INTO s_name;
IF is_done=1 THEN
LEAVE get_list;
END IF;

SET staffnamelist= CONCAT(s_name, ";",staffnamelist);
END LOOP get_list;
CLOSE staff_cur;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `liststudentnames` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `liststudentnames`(INOUT namelist varchar(16000))
BEGIN

DECLARE is_done INTEGER DEFAULT 0;
DECLARE s_name varchar(1000) DEFAULT "";
DECLARE student_cur CURSOR FOR 

SELECT FirstName from students;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET is_done=1;
OPEN student_cur;

get_list: LOOP
FETCH student_cur INTO s_name;
IF is_done=1 THEN
LEAVE get_list;
END IF;

SET namelist= CONCAT(s_name, ";",namelist);
END LOOP get_list;
CLOSE student_cur;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `staffdept` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `staffdept`(in deptid int)
BEGIN
	select * from staff where DepartmentID = deptid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `staffteaches` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `staffteaches`(IN staffid int)
BEGIN
	select su.SubjectName as "Subject taught by staff",c.ClassName as "to class",c.CourseID as "Studing",c.Division,stu.FirstNAme as "Student First Name",stu.LastName as "Student Last Name"
    from staff as s,subjects as su,class as c,subjecttaught as st,students as stu
    where s.staffID = staffid
    and st.staffID = staffid
    and c.classID = st.classID
    and stu.GRN in (select StudentID from studiesin where classID = st.classID)
    and su.subjectID = st.subjectID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `coe_n_members`
--

/*!50001 DROP VIEW IF EXISTS `coe_n_members`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `coe_n_members` AS select `c`.`ID` AS `ID`,`c`.`Name` AS `Name`,`c`.`coordinatorID` AS `CoordinatorID`,`st`.`FirstName` AS `Coordinator First Name`,`st`.`LastName` AS `Coordinator Last Name`,`cm`.`memID` AS `studentID`,`s`.`FirstName` AS `Student First Name`,`s`.`LastName` AS `Student Last Name` from (((`centerofexcellence` `c` join `coemembers` `cm`) join `students` `s`) join `staff` `st`) where ((`cm`.`coeID` = `c`.`ID`) and (`s`.`GRN` = `cm`.`memID`) and (`st`.`StaffID` = `c`.`coordinatorID`)) order by `c`.`ID` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `project_n_members`
--

/*!50001 DROP VIEW IF EXISTS `project_n_members`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `project_n_members` AS select `p`.`ID` AS `ID`,`p`.`topic` AS `Topic`,`p`.`coeID` AS `coeID`,`pm`.`studentID` AS `studentID`,`s`.`FirstName` AS `Student First Name`,`s`.`LastName` AS `Student Last Name` from ((`projects` `p` join `promembers` `pm`) join `students` `s`) where ((`pm`.`projectID` = `p`.`ID`) and (`s`.`GRN` = `pm`.`studentID`)) order by `p`.`ID` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `staff_and_subjectcount`
--

/*!50001 DROP VIEW IF EXISTS `staff_and_subjectcount`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `staff_and_subjectcount` AS select `st`.`StaffID` AS `staffID`,`s`.`FirstName` AS `FirstNAme`,`s`.`LastName` AS `LastName`,count(`st`.`StaffID`) AS `count(st.staffID)` from (`staff` `s` join `subjecttaught` `st`) where (`s`.`StaffID` = `st`.`StaffID`) group by `st`.`StaffID` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `staff_of_administration_dept`
--

/*!50001 DROP VIEW IF EXISTS `staff_of_administration_dept`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `staff_of_administration_dept` AS select `staff`.`StaffID` AS `ID`,`staff`.`FirstName` AS `First Name`,`staff`.`MiddleName` AS `Middle Name`,`staff`.`LastName` AS `Last Name`,`staff`.`DOB` AS `DOB`,`staff`.`Age` AS `Age`,`staff`.`Qualification` AS `Qualification`,`staff`.`YearsOfService` AS `Years Of Service`,`staff`.`Position` AS `Position`,`staff`.`DepartmentID` AS `Department ID`,`staff`.`Email` AS `Email`,`staff`.`ContactNo` AS `Contact No.`,`staff`.`Address` AS `Address` from `staff` where (`staff`.`DepartmentID` = 4) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `teachers_of_fine_arts`
--

/*!50001 DROP VIEW IF EXISTS `teachers_of_fine_arts`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `teachers_of_fine_arts` AS select `staff`.`StaffID` AS `ID`,`staff`.`FirstName` AS `First Name`,`staff`.`MiddleName` AS `Middle Name`,`staff`.`LastName` AS `Last Name`,`staff`.`DOB` AS `DOB`,`staff`.`Age` AS `Age`,`staff`.`Qualification` AS `Qualification`,`staff`.`YearsOfService` AS `Years Of Service`,`staff`.`Position` AS `Position`,`staff`.`DepartmentID` AS `Department ID`,`staff`.`Email` AS `Email`,`staff`.`ContactNo` AS `Contact No.`,`staff`.`Address` AS `Address` from `staff` where (`staff`.`DepartmentID` = 3) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `teachers_of_management_and_finance`
--

/*!50001 DROP VIEW IF EXISTS `teachers_of_management_and_finance`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `teachers_of_management_and_finance` AS select `staff`.`StaffID` AS `ID`,`staff`.`FirstName` AS `First Name`,`staff`.`MiddleName` AS `Middle Name`,`staff`.`LastName` AS `Last Name`,`staff`.`DOB` AS `DOB`,`staff`.`Age` AS `Age`,`staff`.`Qualification` AS `Qualification`,`staff`.`YearsOfService` AS `Years Of Service`,`staff`.`Position` AS `Position`,`staff`.`DepartmentID` AS `Department ID`,`staff`.`Email` AS `Email`,`staff`.`ContactNo` AS `Contact No.`,`staff`.`Address` AS `Address` from `staff` where (`staff`.`DepartmentID` = 2) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `teachers_of_science_and_technology`
--

/*!50001 DROP VIEW IF EXISTS `teachers_of_science_and_technology`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `teachers_of_science_and_technology` AS select `staff`.`StaffID` AS `StaffID`,`staff`.`FirstName` AS `FirstName`,`staff`.`MiddleName` AS `MiddleName`,`staff`.`LastName` AS `LastName`,`staff`.`DOB` AS `DOB`,`staff`.`Age` AS `Age`,`staff`.`Qualification` AS `Qualification`,`staff`.`YearsOfService` AS `YearsOfService`,`staff`.`Position` AS `Position`,`staff`.`DepartmentID` AS `DepartmentID`,`staff`.`Email` AS `Email`,`staff`.`ContactNo` AS `ContactNo`,`staff`.`Address` AS `Address` from `staff` where (`staff`.`DepartmentID` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-01 19:56:26
