-- MySQL dump 10.13  Distrib 5.6.17, for Win64 (x86_64)
--
-- Host: localhost    Database: demo_survey
-- ------------------------------------------------------
-- Server version	5.6.17

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
-- Table structure for table `data_set`
--

DROP TABLE IF EXISTS `data_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_set` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(200) NOT NULL,
  `name` varchar(75) NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_set`
--

LOCK TABLES `data_set` WRITE;
/*!40000 ALTER TABLE `data_set` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_set` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_set_item`
--

DROP TABLE IF EXISTS `data_set_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_set_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `item_order` int(11) NOT NULL,
  `item_text` varchar(250) NOT NULL,
  `item_value` varchar(75) NOT NULL,
  `version` int(11) DEFAULT NULL,
  `dataset_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK76B325C5D92930C` (`dataset_id`),
  CONSTRAINT `FK76B325C5D92930C` FOREIGN KEY (`dataset_id`) REFERENCES `data_set` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_set_item`
--

LOCK TABLES `data_set_item` WRITE;
/*!40000 ALTER TABLE `data_set_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_set_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `day`
--

DROP TABLE IF EXISTS `day`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `day` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `day_name` varchar(10) NOT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `day_name` (`day_name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `day`
--

LOCK TABLES `day` WRITE;
/*!40000 ALTER TABLE `day` DISABLE KEYS */;
INSERT INTO `day` VALUES (1,'Monday',1),(2,'Tuesday',1),(3,'Wednesday',1),(4,'Thursday',1),(5,'Friday',1),(6,'Saturday',1),(7,'Sunday',1);
/*!40000 ALTER TABLE `day` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(2000) DEFAULT NULL,
  `name` varchar(75) NOT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'','Demonstration Department',0);
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `global_settings`
--

DROP TABLE IF EXISTS `global_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `global_settings` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `invalid_content_message` varchar(500) NOT NULL,
  `invalid_file_size_message` varchar(500) NOT NULL,
  `maximun_file_size` int(11) NOT NULL,
  `password_enforcement_message` varchar(500) NOT NULL,
  `password_regex` varchar(255) NOT NULL,
  `valid_content_types` longtext NOT NULL,
  `valid_image_types` longtext NOT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `global_settings`
--

LOCK TABLES `global_settings` WRITE;
/*!40000 ALTER TABLE `global_settings` DISABLE KEYS */;
INSERT INTO `global_settings` VALUES (1,'The type of file that you are trying to upload is invalid. Please upload a valid file.','The size of the file that you are trying to upload is invalid. Please upload a file that does not exceed 10MB.',10,'Your password must be at least 8 characters long. It must have at least one numeric character, one uppercase, one lowercase and one symbol.','(?=.{8,})(?=.*?[^\\\\w\\\\s])(?=.*?[0-9])(?=.*?[A-Z]).*?[a-z].*','image/gif,image/jpeg,image/pjpeg,image/png,image/tiff,application/pdf,application/vnd.oasis.opendocument.text,application/vnd.oasis.opendocument.spreadsheet,application/vnd.oasis.opendocument.presentation,application/vnd.oasis.opendocument.graphics,application/vnd.ms-excel,application/vnd.openxmlformats-officedocument.spreadsheetml.sheet,application/vnd.ms-powerpoint,application/vnd.openxmlformats-officedocument.presentationml.presentation,application/vnd.openxmlformats-officedocument.wordprocessingml.document','image/gif,image/jpeg,image/pjpeg,image/png,image/tiff',0);
/*!40000 ALTER TABLE `global_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invitation`
--

DROP TABLE IF EXISTS `invitation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invitation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `first_name` varchar(75) DEFAULT NULL,
  `invitation_email_opened_date` datetime DEFAULT NULL,
  `invitation_email_sent_date` datetime NOT NULL,
  `last_name` varchar(75) DEFAULT NULL,
  `middle_name` varchar(75) DEFAULT NULL,
  `uuid` varchar(500) NOT NULL,
  `version` int(11) DEFAULT NULL,
  `survey_definition_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK473F77997FC58F7D` (`survey_definition_id`),
  CONSTRAINT `FK473F77997FC58F7D` FOREIGN KEY (`survey_definition_id`) REFERENCES `survey_definition` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invitation`
--

LOCK TABLES `invitation` WRITE;
/*!40000 ALTER TABLE `invitation` DISABLE KEYS */;
/*!40000 ALTER TABLE `invitation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `allow_other_text_box` tinyint(1) DEFAULT NULL,
  `data_set_id` bigint(20) DEFAULT NULL,
  `date_maximum` datetime DEFAULT NULL,
  `date_minimum` datetime DEFAULT NULL,
  `decimal_maximum` decimal(19,2) DEFAULT NULL,
  `decimal_minimum` decimal(19,2) DEFAULT NULL,
  `direction` varchar(255) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `integer_maximum` int(11) DEFAULT NULL,
  `integer_minimum` int(11) DEFAULT NULL,
  `multimedia_link` varchar(750) DEFAULT NULL,
  `question_order` smallint(6) NOT NULL,
  `question_text` varchar(2000) NOT NULL,
  `randomize_options` tinyint(1) DEFAULT NULL,
  `regular_expression` varchar(250) DEFAULT NULL,
  `required` tinyint(1) DEFAULT NULL,
  `tip` varchar(2000) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `visible` tinyint(1) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `survey_definition_page_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKBA823BE63B4EBC2E` (`survey_definition_page_id`),
  CONSTRAINT `FKBA823BE63B4EBC2E` FOREIGN KEY (`survey_definition_page_id`) REFERENCES `survey_definition_page` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES (12,0,NULL,NULL,NULL,NULL,NULL,'VERTICAL',NULL,NULL,NULL,'',1,'<p>What grade level are you?</p>',0,'',0,'','SINGLE_CHOICE_DROP_DOWN',1,1,NULL,3),(13,0,NULL,NULL,NULL,NULL,NULL,'VERTICAL',NULL,NULL,NULL,'\r\n\r\n',2,'<p>Why are you taking this course?</p>',0,'',0,'','SINGLE_CHOICE_DROP_DOWN',0,1,NULL,3),(14,0,NULL,NULL,NULL,NULL,NULL,'HORIZONTAL',NULL,NULL,NULL,'',4,'<p>What grade do you expect to earn for the course?</p>',0,'',0,'','SINGLE_CHOICE_RADIO_BUTTONS',2,1,NULL,3),(15,0,NULL,NULL,NULL,NULL,NULL,'VERTICAL',NULL,NULL,NULL,'',5,'<p>What is your major?</p>',0,'',0,'','SHORT_TEXT_INPUT',2,1,NULL,3),(16,0,NULL,NULL,NULL,NULL,NULL,'VERTICAL',NULL,NULL,NULL,'\r\n\r\n',6,'<p>What is your current GPA?</p>',0,'',0,'','DECIMAL_INPUT',1,1,NULL,3),(17,0,NULL,NULL,NULL,NULL,NULL,'VERTICAL',NULL,NULL,NULL,'\r\n\r\n',7,'<p>Please rate your overall satisfaction with this course.</p>',0,'',0,'','SMILEY_FACES_RATING',1,1,NULL,3),(18,0,NULL,NULL,NULL,NULL,NULL,'VERTICAL',NULL,NULL,NULL,'\r\n\r\n',1,'<p>How difficult was the class compared to others taken this semester/quarter?</p>',0,'',0,'','SINGLE_CHOICE_RADIO_BUTTONS',0,1,NULL,4),(19,0,NULL,NULL,NULL,NULL,NULL,'VERTICAL',NULL,NULL,NULL,'\r\n\r\n',2,'<p>How difficult was the course compared to all your other courses taken?</p>',0,'',0,'','SINGLE_CHOICE_RADIO_BUTTONS',0,1,NULL,4),(20,0,NULL,NULL,NULL,NULL,NULL,'VERTICAL',NULL,NULL,NULL,'\r\n\r\n',3,'<p>How much more effort did you put into this class, compared to others\n  this semester?</p>',0,'',0,'','SINGLE_CHOICE_RADIO_BUTTONS',0,1,NULL,4),(21,0,NULL,NULL,NULL,NULL,NULL,'VERTICAL',NULL,NULL,NULL,'\r\n\r\n',4,'<p>The course description accurately reflected the content of the course.</p>',0,'',0,'','SINGLE_CHOICE_RADIO_BUTTONS',0,1,NULL,4),(22,0,NULL,NULL,NULL,NULL,NULL,'VERTICAL',NULL,NULL,NULL,'\r\n\r\n',5,'<p>Describe what you enjoyed about the course:</p>',0,'',0,'','HUGE_TEXT_INPUT',0,1,NULL,4),(23,0,NULL,NULL,NULL,NULL,NULL,'VERTICAL',NULL,NULL,NULL,'\r\n\r\n',6,'<p>Describe what you would change about the course:</p>',0,'',0,'','HUGE_TEXT_INPUT',0,1,NULL,4),(24,0,NULL,NULL,NULL,NULL,NULL,'VERTICAL',NULL,NULL,NULL,'\r\n\r\n',1,'<p>The instructor demonstrated knowledge of course materials.</p>',0,'',0,'','SINGLE_CHOICE_DROP_DOWN',0,1,NULL,5),(25,0,NULL,NULL,NULL,NULL,NULL,'VERTICAL',NULL,NULL,NULL,'\r\n\r\n',2,'<p>The instructor was on time and prepared for class.</p>',0,'',0,'','SINGLE_CHOICE_DROP_DOWN',0,1,NULL,5),(26,0,NULL,NULL,NULL,NULL,NULL,'VERTICAL',NULL,NULL,NULL,'\r\n\r\n',3,'<p>The instructor was available during advertised office hours.</p>',0,'',0,'','SINGLE_CHOICE_DROP_DOWN',0,1,NULL,5),(27,0,NULL,NULL,NULL,NULL,NULL,'VERTICAL',NULL,NULL,NULL,'\r\n\r\n',4,'<p>The instructor treated students fairly and impartially.</p>',0,'',0,'','SINGLE_CHOICE_DROP_DOWN',0,1,NULL,5),(28,0,NULL,NULL,NULL,NULL,NULL,'VERTICAL',NULL,NULL,NULL,'\r\n\r\n',5,'<p>Would you take another course with this instructor?</p>',0,'',0,'','YES_NO_DROPDOWN',0,1,NULL,5),(52,1,NULL,NULL,NULL,NULL,NULL,'VERTICAL',NULL,NULL,NULL,'\r\n\r\n',1,'<p>What are your reasons for leaving the company?</p>',0,'',0,'','MULTIPLE_CHOICE_CHECKBOXES',0,1,NULL,10),(53,0,NULL,NULL,NULL,NULL,NULL,'VERTICAL',NULL,NULL,NULL,'\r\n\r\n',2,'<p>Do you feel your skills were put to use effectively in this company?</p>',0,'',0,'','YES_NO_DROPDOWN',0,1,NULL,10),(54,0,NULL,NULL,NULL,NULL,NULL,'VERTICAL',NULL,NULL,NULL,'\r\n\r\n',3,'<p>Do you feel you had a positive relationship with your supervisor(s)?</p>',0,'',0,'','YES_NO_DROPDOWN',0,1,NULL,10),(55,0,NULL,NULL,NULL,NULL,NULL,'VERTICAL',NULL,NULL,NULL,'\r\n\r\n',4,'<p>Do you feel you generally had positive relationships with other employees?</p>',0,'',0,'','YES_NO_DROPDOWN',0,1,NULL,10),(56,0,NULL,NULL,NULL,NULL,NULL,'VERTICAL',NULL,NULL,NULL,'',5,'<p>What did you enjoy most about your job?</p>',0,'',0,'','HUGE_TEXT_INPUT',1,1,NULL,10),(57,0,NULL,NULL,NULL,NULL,NULL,'VERTICAL',NULL,NULL,NULL,'\r\n\r\n',6,'<p>What would you change about your job?</p>',0,'',0,'','HUGE_TEXT_INPUT',0,1,NULL,10),(58,0,NULL,NULL,NULL,NULL,NULL,'VERTICAL',NULL,NULL,NULL,'\r\n\r\n',1,'<p>My work was appreciated.</p>',0,'',0,'','SINGLE_CHOICE_RADIO_BUTTONS',0,1,NULL,11),(59,0,NULL,NULL,NULL,NULL,NULL,'VERTICAL',NULL,NULL,NULL,'',2,'<p>The work was challenging.</p>',0,'',0,'','SINGLE_CHOICE_RADIO_BUTTONS',1,1,NULL,11),(60,0,NULL,NULL,NULL,NULL,NULL,'VERTICAL',NULL,NULL,NULL,'\r\n\r\n',3,'<p>The work was rewarding.</p>',0,'',0,'','SINGLE_CHOICE_RADIO_BUTTONS',0,1,NULL,11),(61,0,NULL,NULL,NULL,NULL,NULL,'VERTICAL',NULL,NULL,NULL,'\r\n\r\n',4,'<p>I was given enough time to complete my work.</p>',0,'',0,'','SINGLE_CHOICE_RADIO_BUTTONS',0,1,NULL,11),(62,0,NULL,NULL,NULL,NULL,NULL,'VERTICAL',NULL,NULL,NULL,'\r\n\r\n',5,'<p>I frequently felt stressed while at work.</p>',0,'',0,'','SINGLE_CHOICE_RADIO_BUTTONS',0,1,NULL,11),(63,0,NULL,NULL,NULL,NULL,NULL,'VERTICAL',NULL,NULL,NULL,'\r\n\r\n',6,'<p>The compenstation and benefits were fair.</p>',0,'',0,'','SINGLE_CHOICE_RADIO_BUTTONS',0,1,NULL,11),(64,0,NULL,NULL,NULL,NULL,NULL,'VERTICAL',NULL,NULL,NULL,'\r\n\r\n',7,'<p>I liked working for this company.</p>',0,'',0,'','SINGLE_CHOICE_RADIO_BUTTONS',0,1,NULL,11),(80,0,NULL,NULL,NULL,NULL,NULL,'VERTICAL',NULL,NULL,NULL,'',7,'<p>Overall what rating would you give this course?</p>\n<p>¬†</p>',0,'',0,'','STAR_RATING',1,1,NULL,4),(81,0,NULL,NULL,NULL,NULL,NULL,'VERTICAL',NULL,NULL,NULL,'',3,'<p>What is your expected date of graduation?</p>',0,'',0,'','DATE_INPUT',0,1,NULL,3),(88,0,NULL,NULL,NULL,NULL,NULL,'VERTICAL',NULL,NULL,NULL,'\r\n\r\n',1,'<p>What is your gender?</p>',0,'',0,'','SINGLE_CHOICE_RADIO_BUTTONS',0,1,NULL,15),(89,0,NULL,NULL,NULL,NULL,NULL,'VERTICAL',NULL,NULL,NULL,'\r\n\r\n',2,'<p>What is your age group?</p>',0,'',0,'','SINGLE_CHOICE_RADIO_BUTTONS',0,1,NULL,15),(90,0,NULL,NULL,NULL,NULL,NULL,'VERTICAL',NULL,NULL,NULL,'\r\n\r\n',3,'<p>What would be the best description of your education level?</p>',0,'',0,'','SINGLE_CHOICE_RADIO_BUTTONS',0,1,NULL,15),(91,0,NULL,NULL,NULL,NULL,NULL,'VERTICAL',NULL,NULL,NULL,'\r\n\r\n',4,'<p>What statement would best fit your employment status?</p>',0,'',0,'','SINGLE_CHOICE_RADIO_BUTTONS',0,1,NULL,15),(93,1,NULL,NULL,NULL,NULL,NULL,'VERTICAL',NULL,NULL,NULL,'\r\n\r\n',6,'<p>What selection best describes your race?</p>',0,'',0,'','SINGLE_CHOICE_RADIO_BUTTONS',2,1,NULL,15),(94,0,NULL,NULL,NULL,NULL,NULL,'VERTICAL',NULL,NULL,NULL,'',5,'<p>What was you income in the catagories below for the following years?</p>',0,'',0,'','CURRENCY_INPUT_MATRIX',2,1,NULL,15);
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_column_label`
--

DROP TABLE IF EXISTS `question_column_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question_column_label` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `label` varchar(75) NOT NULL,
  `column_label_order` smallint(6) NOT NULL,
  `version` int(11) DEFAULT NULL,
  `question_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK6F409084734621C8` (`question_id`),
  CONSTRAINT `FK6F409084734621C8` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_column_label`
--

LOCK TABLES `question_column_label` WRITE;
/*!40000 ALTER TABLE `question_column_label` DISABLE KEYS */;
INSERT INTO `question_column_label` VALUES (1,'2013',1,0,94),(2,'2012',2,0,94),(3,'2011',3,0,94);
/*!40000 ALTER TABLE `question_column_label` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_option`
--

DROP TABLE IF EXISTS `question_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question_option` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `option_order` smallint(6) NOT NULL,
  `option_text` varchar(250) NOT NULL,
  `option_value` varchar(50) NOT NULL,
  `version` int(11) DEFAULT NULL,
  `question_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK6E1E3AEE734621C8` (`question_id`),
  CONSTRAINT `FK6E1E3AEE734621C8` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=394 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_option`
--

LOCK TABLES `question_option` WRITE;
/*!40000 ALTER TABLE `question_option` DISABLE KEYS */;
INSERT INTO `question_option` VALUES (66,1,'Freshman','1',0,12),(67,2,'Sophomore','2',0,12),(68,3,'Junior','3',0,12),(69,4,'Senior','4',0,12),(70,5,'Graduate','5',0,12),(71,6,'Not applicable','6',0,12),(72,1,'Major requirement','1',0,13),(73,2,'Minor requirement','2',0,13),(74,3,'Gen-Ed requirement','3',0,13),(75,4,'Elective','4',0,13),(76,5,'None of the above','5',0,13),(77,1,'A/A-','1',0,14),(78,2,'B+/B','2',0,14),(79,3,'B-/C+','3',0,14),(80,4,'C/C-','4',0,14),(81,5,'D+/D','5',0,14),(82,6,'F','6',0,14),(83,1,'Extremely Unsatisfied','1',0,17),(84,2,'Unsatisfied','2',0,17),(85,3,'Neutral','3',0,17),(86,4,'Satisfied','4',0,17),(87,5,'Extremely Satisfied','5',0,17),(88,1,'Extremely difficult','1',0,18),(89,2,'Somewhat difficult','2',0,18),(90,3,'About the same','3',0,18),(91,4,'Less difficult','4',0,18),(92,5,'Much less difficult','5',0,18),(93,1,'Extremely difficult','1',0,19),(94,2,'Somewhat difficult','2',0,19),(95,3,'About the same','3',0,19),(96,4,'Less difficult','4',0,19),(97,5,'Much less difficult','5',0,19),(98,1,'Significantly more effort','1',0,20),(99,2,'Somewhat more effort','2',0,20),(100,3,'About the same','3',0,20),(101,4,'Less effort','4',0,20),(102,5,'Much less effort','5',0,20),(103,1,'Strongly Disagree','1',0,21),(104,2,'Disagree','2',0,21),(105,3,'Neutral','3',0,21),(106,4,'Agree','4',0,21),(107,5,'Strongly Agree','5',0,21),(108,1,'Strongly Disagree','1',0,24),(109,2,'Disagree','2',0,24),(110,3,'Neutral','3',0,24),(111,4,'Agree','4',0,24),(112,5,'Strongly Agree','5',0,24),(113,1,'Strongly Disagree','1',0,25),(114,2,'Disagree','2',0,25),(115,3,'Neutral','3',0,25),(116,4,'Agree','4',0,25),(117,5,'Strongly Agree','5',0,25),(118,1,'Strongly Disagree','1',0,26),(119,2,'Disagree','2',0,26),(120,3,'Neutral','3',0,26),(121,4,'Agree','4',0,26),(122,5,'Strongly Agree','5',0,26),(123,1,'Strongly Disagree','1',0,27),(124,2,'Disagree','2',0,27),(125,3,'Neutral','3',0,27),(126,4,'Agree','4',0,27),(127,5,'Strongly Agree','5',0,27),(213,1,'Higher Pay','1',0,52),(214,2,'Better Benefits','2',0,52),(215,3,'Career advancement','3',0,52),(216,4,'Career change','4',0,52),(217,5,'Better culture fit','5',0,52),(218,6,'Commute','6',0,52),(219,7,'Conflict with others','7',0,52),(220,8,'Relocate/Move','8',0,52),(221,9,'Other','9',0,52),(222,1,'Strongly Disagree','1',0,58),(223,2,'Disagree','2',0,58),(224,3,'Neutral','3',0,58),(225,4,'Agree','4',0,58),(226,5,'Strongly Agree','5',0,58),(227,1,'Strongly Disagree','1',0,59),(228,2,'Disagree','2',0,59),(229,3,'Neutral','3',0,59),(230,4,'Agree','4',0,59),(231,5,'Strongly Agree','5',0,59),(232,1,'Strongly Disagree','1',0,60),(233,2,'Disagree','2',0,60),(234,3,'Neutral','3',0,60),(235,4,'Agree','4',0,60),(236,5,'Strongly Agree','5',0,60),(237,1,'Strongly Disagree','1',0,61),(238,2,'Disagree','2',0,61),(239,3,'Neutral','3',0,61),(240,4,'Agree','4',0,61),(241,5,'Strongly Agree','5',0,61),(242,1,'Strongly Disagree','1',0,62),(243,2,'Disagree','2',0,62),(244,3,'Neutral','3',0,62),(245,4,'Agree','4',0,62),(246,5,'Strongly Agree','5',0,62),(247,1,'Strongly Disagree','1',0,63),(248,2,'Disagree','2',0,63),(249,3,'Neutral','3',0,63),(250,4,'Agree','4',0,63),(251,5,'Strongly Agree','5',0,63),(252,1,'Strongly Disagree','1',0,64),(253,2,'Disagree','2',0,64),(254,3,'Neutral','3',0,64),(255,4,'Agree','4',0,64),(256,5,'Strongly Agree','5',0,64),(299,1,'Extremely Unsatisfied','1',0,80),(300,2,'Unsatisfied','2',0,80),(301,3,'Neutral','3',0,80),(302,4,'Satisfied','4',0,80),(303,5,'Extremely Satisfied','5',0,80),(349,1,'Male','1',0,88),(350,2,'Female','2',0,88),(351,3,'Transgender','3',0,88),(352,4,'I choose to not answer','4',0,88),(353,1,'15 or younger','1',0,89),(354,2,'16 - 18','2',0,89),(355,3,'19 - 21','3',0,89),(356,4,'21 - 29','4',0,89),(357,5,'30 - 45','5',0,89),(358,6,'46 - 60','6',0,89),(359,7,'61 or older','7',0,89),(360,8,'I choose to not answer','8',0,89),(361,1,'Some high school','1',0,90),(362,2,'High school or similar (GED)','2',0,90),(363,3,'Some college','3',0,90),(364,4,'Associate\'s Degree','4',0,90),(365,5,'Bachelor\'s Degree','5',0,90),(366,6,'Graduate degree','6',0,90),(367,7,'Trade or vocational degree','7',0,90),(368,8,'I choose to not answer','8',0,90),(369,1,'Employed full-time','1',0,91),(370,2,'Employed part-time','2',0,91),(371,3,'Homemaker','3',0,91),(372,4,'Student','4',0,91),(373,5,'Retired','5',0,91),(374,6,'Disabled','6',0,91),(375,7,'Not employed, looking','7',0,91),(376,8,'Not employed, not looking','8',0,91),(377,9,'I choose to not answer','9',0,91),(386,1,'Caucasian (White)','1',0,93),(387,2,'African-American','2',0,93),(388,3,'American Indian','3',0,93),(389,4,'Asian','4',0,93),(390,5,'Alaskan Native','5',0,93),(391,6,'Hawaiian Native','6',0,93),(392,7,'Pacific Islander','7',0,93),(393,8,'Other','8',0,93);
/*!40000 ALTER TABLE `question_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_row_label`
--

DROP TABLE IF EXISTS `question_row_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question_row_label` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `label` varchar(75) NOT NULL,
  `row_label_order` smallint(6) NOT NULL,
  `version` int(11) DEFAULT NULL,
  `question_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK724B5F36734621C8` (`question_id`),
  CONSTRAINT `FK724B5F36734621C8` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_row_label`
--

LOCK TABLES `question_row_label` WRITE;
/*!40000 ALTER TABLE `question_row_label` DISABLE KEYS */;
INSERT INTO `question_row_label` VALUES (2,'Wages/Salery',1,0,94),(3,'Interest',2,0,94),(4,'Dividends',3,0,94),(5,'Business Income',4,0,94),(6,'Capital Gains',5,0,94),(7,'Rental Income',6,0,94);
/*!40000 ALTER TABLE `question_row_label` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regular_expression`
--

DROP TABLE IF EXISTS `regular_expression`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `regular_expression` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(2000) DEFAULT NULL,
  `name` varchar(500) NOT NULL,
  `regex` varchar(250) NOT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regular_expression`
--

LOCK TABLES `regular_expression` WRITE;
/*!40000 ALTER TABLE `regular_expression` DISABLE KEYS */;
INSERT INTO `regular_expression` VALUES (1,'First Name Validation','First Name','^[0-9a-zA-Z\\.\\-\\, ]{0,75}$',0),(2,'Last Name Validation','Last Name','^[0-9a-zA-Z\\.\\-\\, ]{0,75}$',0),(3,'Email Validation','Email','^([0-9a-zA-Z]([-.\\w]*[0-9a-zA-Z])*@([0-9a-zA-Z][-\\w]*[0-9a-zA-Z]\\.)+[a-zA-Z]{0,9})$',0),(4,'Address Validation','Address','^[0-9a-zA-Z\\.\\-,# ]{0,100}$',0),(5,'Zip Code Validation','Zip Code','^\\d{5}$|^$',0),(6,'US Phone Number Validation','US Phone Number','^\\d{3}-\\d{3}-\\d{4}$|^$',0),(7,'Social Security Number Validation','Social Security Number','^(\\d{3}-\\d{2}-\\d{4}){1,12}$|^$',0);
/*!40000 ALTER TABLE `regular_expression` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sec_authority`
--

DROP TABLE IF EXISTS `sec_authority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sec_authority` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(500) DEFAULT NULL,
  `name` varchar(75) NOT NULL,
  `authority_type` varchar(255) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sec_authority`
--

LOCK TABLES `sec_authority` WRITE;
/*!40000 ALTER TABLE `sec_authority` DISABLE KEYS */;
INSERT INTO `sec_authority` VALUES (1,'Highest level access withoyut anuy restrictions','ROLE_ADMIN','I',0),(2,'This role allows a user to manage surveys.','ROLE_SURVEY_ADMIN','I',0),(3,'This role allows a user to fill a survey ','ROLE_SURVEY_PARTICIPANT','E',0);
/*!40000 ALTER TABLE `sec_authority` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sec_group`
--

DROP TABLE IF EXISTS `sec_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sec_group` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(500) DEFAULT NULL,
  `name` varchar(75) NOT NULL,
  `group_type` varchar(255) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sec_group`
--

LOCK TABLES `sec_group` WRITE;
/*!40000 ALTER TABLE `sec_group` DISABLE KEYS */;
INSERT INTO `sec_group` VALUES (1,'Users with admininstator access','Adminitrators','I',0),(2,'Users who may manage Surveys','Survey Adminitrators','I',0),(3,'Users who can fill surveys','Survey Participants','E',0);
/*!40000 ALTER TABLE `sec_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sec_group_authority`
--

DROP TABLE IF EXISTS `sec_group_authority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sec_group_authority` (
  `group_id` bigint(20) NOT NULL,
  `authority_id` bigint(20) NOT NULL,
  PRIMARY KEY (`group_id`,`authority_id`),
  KEY `FKA6397595818EF9A9` (`authority_id`),
  KEY `FKA6397595B9DF9FA9` (`group_id`),
  CONSTRAINT `FKA6397595B9DF9FA9` FOREIGN KEY (`group_id`) REFERENCES `sec_group` (`id`),
  CONSTRAINT `FKA6397595818EF9A9` FOREIGN KEY (`authority_id`) REFERENCES `sec_authority` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sec_group_authority`
--

LOCK TABLES `sec_group_authority` WRITE;
/*!40000 ALTER TABLE `sec_group_authority` DISABLE KEYS */;
INSERT INTO `sec_group_authority` VALUES (1,1),(2,2),(3,3);
/*!40000 ALTER TABLE `sec_group_authority` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sec_password_reset_request`
--

DROP TABLE IF EXISTS `sec_password_reset_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sec_password_reset_request` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `hashkey` varchar(500) NOT NULL,
  `login` varchar(100) NOT NULL,
  `request_date` datetime NOT NULL,
  `reset_date` datetime DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sec_password_reset_request`
--

LOCK TABLES `sec_password_reset_request` WRITE;
/*!40000 ALTER TABLE `sec_password_reset_request` DISABLE KEYS */;
/*!40000 ALTER TABLE `sec_password_reset_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sec_user`
--

DROP TABLE IF EXISTS `sec_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sec_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creation_date` datetime NOT NULL,
  `date_of_birth` datetime NOT NULL,
  `email` varchar(100) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `first_name` varchar(75) NOT NULL,
  `last_name` varchar(75) NOT NULL,
  `last_update_date` datetime DEFAULT NULL,
  `login` varchar(100) NOT NULL,
  `middle_name` varchar(75) DEFAULT NULL,
  `password` varchar(500) NOT NULL,
  `user_type` varchar(255) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `login` (`login`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sec_user`
--

LOCK TABLES `sec_user` WRITE;
/*!40000 ALTER TABLE `sec_user` DISABLE KEYS */;
INSERT INTO `sec_user` VALUES (1,'2012-10-21 14:44:53','1975-01-01 00:00:00','me@example.com',1,'admin','admin','2012-10-21 14:44:53','admin','admin','a601995c56b8c7148e36cf2feb682d308404e262a2dc6eab1a14e158ef6eed49','I',0);
/*!40000 ALTER TABLE `sec_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sec_user_department`
--

DROP TABLE IF EXISTS `sec_user_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sec_user_department` (
  `user_id` bigint(20) NOT NULL,
  `department_id` bigint(20) NOT NULL,
  PRIMARY KEY (`department_id`,`user_id`),
  KEY `FK5A0D405840AC9EC8` (`department_id`),
  KEY `FK5A0D4058CABAA1AB` (`user_id`),
  CONSTRAINT `FK5A0D4058CABAA1AB` FOREIGN KEY (`user_id`) REFERENCES `sec_user` (`id`),
  CONSTRAINT `FK5A0D405840AC9EC8` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sec_user_department`
--

LOCK TABLES `sec_user_department` WRITE;
/*!40000 ALTER TABLE `sec_user_department` DISABLE KEYS */;
/*!40000 ALTER TABLE `sec_user_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sec_user_group`
--

DROP TABLE IF EXISTS `sec_user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sec_user_group` (
  `user_id` bigint(20) NOT NULL,
  `group_id` bigint(20) NOT NULL,
  PRIMARY KEY (`group_id`,`user_id`),
  KEY `FK3D8D6DB9CABAA1AB` (`user_id`),
  KEY `FK3D8D6DB9B9DF9FA9` (`group_id`),
  CONSTRAINT `FK3D8D6DB9B9DF9FA9` FOREIGN KEY (`group_id`) REFERENCES `sec_group` (`id`),
  CONSTRAINT `FK3D8D6DB9CABAA1AB` FOREIGN KEY (`user_id`) REFERENCES `sec_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sec_user_group`
--

LOCK TABLES `sec_user_group` WRITE;
/*!40000 ALTER TABLE `sec_user_group` DISABLE KEYS */;
INSERT INTO `sec_user_group` VALUES (1,1);
/*!40000 ALTER TABLE `sec_user_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sec_user_survey_definition`
--

DROP TABLE IF EXISTS `sec_user_survey_definition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sec_user_survey_definition` (
  `user_id` bigint(20) NOT NULL,
  `survey_definition_id` bigint(20) NOT NULL,
  PRIMARY KEY (`survey_definition_id`,`user_id`),
  KEY `FK3C5B1792CABAA1AB` (`user_id`),
  KEY `FK3C5B17927FC58F7D` (`survey_definition_id`),
  CONSTRAINT `FK3C5B17927FC58F7D` FOREIGN KEY (`survey_definition_id`) REFERENCES `survey_definition` (`id`),
  CONSTRAINT `FK3C5B1792CABAA1AB` FOREIGN KEY (`user_id`) REFERENCES `sec_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sec_user_survey_definition`
--

LOCK TABLES `sec_user_survey_definition` WRITE;
/*!40000 ALTER TABLE `sec_user_survey_definition` DISABLE KEYS */;
/*!40000 ALTER TABLE `sec_user_survey_definition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sector`
--

DROP TABLE IF EXISTS `sector`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sector` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(200) NOT NULL,
  `name` varchar(75) NOT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sector`
--

LOCK TABLES `sector` WRITE;
/*!40000 ALTER TABLE `sector` DISABLE KEYS */;
/*!40000 ALTER TABLE `sector` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `survey`
--

DROP TABLE IF EXISTS `survey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `survey` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creation_date` datetime NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `first_name` varchar(75) DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `last_name` varchar(75) DEFAULT NULL,
  `last_update_date` datetime DEFAULT NULL,
  `login` varchar(100) DEFAULT NULL,
  `middle_name` varchar(75) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `submission_date` datetime DEFAULT NULL,
  `survey_definition_id` bigint(20) DEFAULT NULL,
  `type_name` varchar(75) NOT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey`
--

LOCK TABLES `survey` WRITE;
/*!40000 ALTER TABLE `survey` DISABLE KEYS */;
/*!40000 ALTER TABLE `survey` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `survey_definition`
--

DROP TABLE IF EXISTS `survey_definition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `survey_definition` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `allow_multiple_submissions` tinyint(1) NOT NULL,
  `auto_reminder_last_sent_date` datetime DEFAULT NULL,
  `auto_reminders_day_of_month` int(11) DEFAULT NULL,
  `reminders_frequency` varchar(255) DEFAULT NULL,
  `auto_reminders_monthly_occurrence` int(11) DEFAULT NULL,
  `auto_reminders_weekly_occurrence` int(11) DEFAULT NULL,
  `completed_survey_template` varchar(5000) NOT NULL,
  `description` varchar(2000) DEFAULT NULL,
  `email_invitation_template` varchar(5000) NOT NULL,
  `is_public` tinyint(1) NOT NULL,
  `logo` longblob,
  `name` varchar(75) NOT NULL,
  `send_auto_reminders` tinyint(1) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `survey_theme` varchar(255) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `department_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK34F9A75840AC9EC8` (`department_id`),
  CONSTRAINT `FK34F9A75840AC9EC8` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey_definition`
--

LOCK TABLES `survey_definition` WRITE;
/*!40000 ALTER TABLE `survey_definition` DISABLE KEYS */;
INSERT INTO `survey_definition` VALUES (3,0,NULL,1,'WEEKLY',1,1,'<p>Your survey has been submitted. Thank you for participating.</p>\n','','<h2>Invitation</h2>\n<p>Hi ${full_name};</p>\n<p>You have been invited to participate in the folllowing\n  survey:<br />Survey: ${survey_name}<br />\n  <br />To participate please click on the following link:</p>\n<p>${survey_link}</p>\n',0,NULL,'Education - Course Review',0,'I','STANDARD',0,1),(6,0,NULL,1,'WEEKLY',1,1,'<p>Your survey has been submitted. Thank you for participating.</p>\n','','<h2>Invitation</h2>\n<p>Hi ${full_name};</p>\n<p>You have been invited to participate in the folllowing\n  survey:<br />Survey: ${survey_name}<br />\n  <br />To participate please click on the following link:</p>\n<p>${survey_link}</p>',0,'¬âPNG\r\n\Z\n\0\0\0\rIHDR\0\0\0k\0\0\0(\0\0\0√πs√é\0\0\0sBIT|d¬à\0\0\0	pHYs\0\0G\0\0Gt¬ÆQv\0\0\0tEXtSoftware\0www.inkscape.org¬õ√Æ<\Z\0\0√ßIDATx¬ú√≠¬õpT√Ö√Ä?√ªr!	H¬Ñ√í¬Ç¬≠E¬úb-¬≠$¬ß√Ö√æ+√†[√Ñ¬é√ñN+mSE[¬≠¬•¬îaj8√É@¬Ä)4¬®¬¥ZJ[¬¥√ª¬¶\r√¥¬áE@h√•WKQ,X+¬ñ√ö¬â√º¬∫√ã]√Æm√øx√Ø.{{¬ó@√ÆB`√™}f2√ô√Ω√Æ~w√∑√û√∑√ûw¬ø√Ø√ª√∂√Ñ√îF√Ω`√≠<¬≥¬∫¬û¬å:¬∑,√ß√†¬´¬Ü√ào¬ç√∞√±√üN√£8√ß)k√ñ¬¨¬è\'√ñ¬ô2!X√©¬∫√Æ√ºs¬µ¬¶B¬â\0o√ó¬≤j√à4¬ÇIh¬Æ0$¬ª√ègCD¬£√ëHII√Ñ\\3Z¬ã\r√ßj=√ù¬Å#√èZ¬≤Ny¬å√∑¬ß*√≥√¶√°¬†¬©3;¬≤t¬ä√¥\0N¬õ¬ì}√°K¬í\\¬ì*¬ø√º>>\n√¥5√õ√Ωl√©¬ú√ü|¬Ö√ó¬Ä√ΩR√Å¬∏T1√©¬¥.¬§-^√Çs=¬∞¬∂\"¬Ä¬Äu¬ñ<m √ág¬¨√ï¬∂√£|√ü¬Ø√æ_q\0√º√¨=h√§√§¬Å√´√ì\"√≥√é√ä¬±√á√©!\"\0¬•¬∞¬°\r4 ByIY¬Ç¬∫[W√∞0√ÑT√∞¬ì¬ñ¬±√¶	\'ZU{¬ìp√º√°B¬ã~√Ä!√ò√òk√Ü¬é¬≥f¬õ7>¬´:1√é%J¬ù√ù}√Ø√ûv¬Ñ%u¬ï¬±d√≤*¬≥¬≠¬º¬§e√∑¬æ√í\np¬™¬°f¬ê¬É¬∏,√ù(¬Ñ_>s√ª&¬Ä√®√¢√ëc√±√µ√®√°¬Ø√Ø5s√ß√ü√≥¬π¬°¬î√ó8%¬•¬õ√¨¬Ç¬é\0.¬ê√í√≠√ê)√•E¬§t√õr√à¬ùP√∑¬ò√ùXU√è[¬∑,gpe¬™A¬ÆI&¬®J¬õ/ *√∫√≥|¬™rb√âU√Ø¬âT√ól√®√°h¬Å√•Z¬£c¬ãjQ√û√í√º%√¶j?√ï√øXeke/AF√∏√ú+¬Æ\'MQ√≠¬èV[4√ë√Ø√¢\nx¬†√Ñq&j¬≠√õ[u¬ú√•5√ΩZ¬£√¢IS¬ê	l,¬•¬º!√Ä√É√Ä¬ç@W√ä√ª¬∞x<√óE√µ√™¬Äu@¬πR√û√†/√Ä2)√ù¬≠a¬ü√è¬Å√Ä|Cw*√∞√†r¬†T)√Ø¬∞√∏¬û¬î√Æ.¬çA8¬Æ\rci\'U)¬Ñl^=¬ïx¬®!\"~√ç√Ä√∞√´√Ä√≠¬±~¬£^/¬áo¬ü√æ√≤√§G,J0¬•;√á√Ø¬§u√Ä¬•¬Ü¬∏0√∏	√Å√Ö¬ú¬ïC√ØJ`=Pa¬à¬á¬ÜSCc¬å¬Ç√å[@)√Ø√≥√Ä¬Ø¬¨!√ª|¬∂	JyuR¬∫¬ª¬ùTK¬ép|¬å¬ÜI¬¶@{[k√É¬®;¬Å	|√¶PA|+√ñ0√™¬∫N√ª√§O√Ñga√úF2\re3S)√Ø6S¬†¬î√óPd\Z√ä¬§h\"√∏√¢√ö¬Ü\Z\n,√Ød¬æ√û¬Ä¬ß¬îW¬ù6VE9¬õ¬Ä¬Ñ√ïi¬®¬©%¬åg2-¬ú√âCj¬Ω\Z√çx¬Ñ√òl¬™ ¬ú¬Øu¬≤¬êBp0<Cw¬†¬î7¬∏√ï¬ø¬¥d√≥¬ï√≤J¬å√∫√Ä%V¬ü¬ÑU¬Ü√º¬ü√Ä√Ç√∫¬É@¬•√ë¬ØxR¬æ<√∑¬§¬ç√µ√§9	l√´√®¬É\0G¬á¬ø√Å√°¬ºB¬†¬Ø6√ã[¬©/¬ü¬µc#√â√§lKot\'cJTk}¬ø¬Ø√µ√†D√ÑPM¬Æ/p¬º1V√ù¬ì√í|8j√à¬ë√π¬π¬Æ¬µ√¥¬û 0@¬£%o> ¬•√ª!)√ù¬ï√å9AJ√∑√Ä√Ω¬ñ|¬≤c√ñN¬ìF√ö0w.>@√´¬íQCu¬êC√µ√ÑQl~¬Ä√í√à!Kop\'c¬Ü√ñ3*f5/√®=¬´√πp√ü¬ª¬∑I¬Ø!√™¬¨√∫¬ü¬§t[¬Äf¬´√ç√¥:√£¬¨¬∂_K√©√Ü¬åfR¬Ü√°√É√Ω√ë√ú√≥AEzn¬ÉK3¬å√•√ßH=¬•√ê√Ü¬û&√ö√®¬ù√ë¬ÜNGG:¬Æ√≠H¬©¬Ñ¬≥DyoVu√≥¬ê¬∂+k1√ä\'¬¨¬∂J¬Ä√ê¬∞√öR.√∞¬ø9√¶0]√∑√Ö¬Ñ√è¬∫!√á¬§tS1]√ñ|√Ü¬∫√êg+p2√á¬à¬∂√≥√Æa8N}√≥¬©s¬Ω¬à¬û$√ÉX¬ç√µ$¬ÄM9√∫¬Ω¬±√∫.√∂√∂√å¬í¬ät¬Ñct¬é}¬´¬òb:?√à2>;¬≥D~√ñ√¶Z√§¬êm¬¨√ô90\'¬á¬¨H¬è¬ìm¬¨\"]√Ö¬¢¬ñ√å¬±√æ¬õ√§√†√é¬Ñ¬¢¬±\n$¬µ√∑X√¢¬ã√Ç√ø¬ó[√≤¬ΩR¬∫G√â¬ìnM√ó¬º¬ã√ô\0¬å2√™√üW√ä¬ª√∏¬Ç√ï/W¬§}√Ü√Ø¬¨√Æa¬Å;L1¬òCf¬ñ#N√∞Z$o¬ä√Ü√™¬§t\0√µ¬Ä√Æ¬§√õ¬ù¬©wZ√π¬í¬ó¬±¬¥#√å¬å0J√ì:√≠√•¬ê8√Ø¬û¬ÇT¬¢;¬ÉW¬ÅiR¬∫?-t¬Ç¬º¬åU√¶¬ó√æ√£[¬§¬°√∫√ò√Ç¬±√•√§¬´√ª¬Æ√é√Ü√í¬Ç√æ√°Bj√≥YK7√≥¬ñU¬Ø√Æ¬†√∞√ØTA)o ¬∞HKX\0√î\0¬•t¬ávb({¬æ√ä√∞H@√é√π√≤0√Æ{>¬™√ï√Æ√Å√õS\0√ä¬ú√Ñ√≤S\r5+√áy√àt¬∂¬ßW√í\'~<I√å√§¬Æ√∞¬é.¬Æ¬ïBsC^k√©\Z√£¬î√≤~d¬Ö`¬ø√´¬∫¬èBVJm¬∞L)¬Ø?√≠¬ÜH¬±√ù(√ø√∏¬àQo¬í√í√çJ.√òH√©¬æ¬©¬î√∑√Å√ë<√î¬ß2√Æ¬ü¬±√ß√ã;\Zt¬ÑX¬°¬µnH√ï5Lq¬Ñ¬ò¬í√Ék√ø>]¬™oN¬∞¬®√∂√†√É√≠√ç√¢\"¬°√ì¬°√ÆYF√ó|√£m6¬èk	√éA¬§¬ò¬®¬î¬∑H√ª8$¬•{√íoz√≠√ª¬åR√û	√é_¬º4K√©√¶√ä√Ä√éi¬æy^¬´¬î¬∑√£F√ô¬ñw¬ÄQ6c√ábk;√´#`a√ô√å¬ô√Øe¬Ñ√é√ΩZ√£4c√µa\0√∞¬î%F¬∂K¬öc¬î}¬≤)&¬è√£M¬•¬º¬ΩJy√ì¬ï√≤√ä¬≠¬æ√≥¬Äc¬ñ√Æd¬æ√æ\rx¬º¬ÄhP√´¬ò√üv;¬à¬ú¬é4¬ï¬µ\\√∞¬Ä-/¬è\' 2\\H\\h=]#~¬ê√øZ¬∫¬ïi√Ä√ã¬ù¬¥?&¬•√ª¬≥TEJ√∑ √Å~u:¬Ü?¬∂)√•¬•√ØR)√ù}√Ä¬ó;√ëkn¬ñ√í};√ã\r\n¬ü√à<√≠√®√∂√ç√î¬§z√ñ-√Ä¬ò√ò√¢¬ö√±Z¬ã\Z√ª¬Ç√É\"√©o¬©¬∏o√ß√¶\\:|c√ó√â√≤¬•#>KTHC√áy¬∫√ó¬Ω[√∑¬∞¬§¬Æ2√¶\'√á¬õ]+J¬è¬¶]G√í√∑¬õ√Ñ¬æ√∂¬Ö¬ä\\√üh¬ì¬∏√Ω9:Bk√±¬∑TYJ√∑¬ÑR√ûu√Äl√Ä%√àF√∏√Ä!¬Ç¬ã¬Ω(√á7√ü¬¶CV4l3x\Z√∏¬¥1¬ß¬ß¬îw=√Å√â¬ß\Z¬†A\nk0GJ¬∑@h√ù√ô¬£A¬•¬º>@\\J√ó>\0c√∂)¬æI√∞S¬©*√†8¬Å¬Å¬´:√í√û√õ√ë>¬¶¬îW%¬•¬õuD¬°h¬¨Q√ä¬´√æD√ª¬ö}Q√§¬´¬å¬´¬Å¬õ¬Ä¬õ√â√ú¬á&K√©√æ¬Æ+ss¬É¬Ö¬≥¬î√å¬ìN¬è¬Ñ\r~¬ù¬≥X¬•¬î√óD√†.St√π Q1√ùT8¬ü¬≥√™Y√∑√°s√öe¬ñ√∏`W\'*√ûY¬Ös\0√£√ò9√∞u¬•¬ºk¬Å¬ø√§√ú@√¶A√é√ö¬è¬ú¬ù1Ec√é¬≥d\ZK¬ú√å√µ\0¬è¬ª√Çs¬Ö]¬¢√®g6¬∞√¶√ª√∫√Ä)]√ªGgD1\Z√¨¬î√≤\"√üm√Äx23I¬Çg¬¥_¬ç√°Ct^√º\\`√ç√ª¬çS√´¬æ\0\0\0\0IEND¬ÆB`¬Ç','HR -  Employee Exit',0,'I','STANDARD',0,1),(10,0,NULL,1,'WEEKLY',1,1,'<p>Your survey has been submitted. Thank you for participating.</p>\n','','<h2>Invitation</h2>\n<p>Hi ${full_name};</p>\n<p>You have been invited to participate in the folllowing\n  survey:<br />Survey: ${survey_name}<br />\n  <br />To participate please click on the following link:</p>\n<p>${survey_link}</p>',0,'âPNG\r\n\Z\n\0\0\0\rIHDR\0\0\0k\0\0\0(\0\0\0˘sŒ\0\0\0sBIT|dà\0\0\0	pHYs\0\0G\0\0GtÆQv\0\0\0tEXtSoftware\0www.inkscape.orgõÓ<\Z\0\0ÁIDATxúÌõpT≈¿?˚r!	HÑ“Ç≠Eúb-≠$ß≈˛+‡[ƒé÷N+mSE[≠•îaj8√@Ä)4®¥ZJ[¥˚¶\rÙáE@hÂWKQ,X+ñ⁄â¸∫À]ÓmˇxÔ.{{ó@ÓB`Í}f2Ÿ˝Ó~w˜ﬁ˜ﬁwøÔ˚ˆƒ‘F˝`Ì<≥∫ûå:∑,Á‡´Ü»oçÒﬂN„8Á)k÷¨è\'÷ô2!XÈ∫Ó¸sµ¶Bâ\0o◊≤j»4ÇIhÆ0$ªœgCD£—HIIƒ\\3Zã\rÁj=›Å#œZ≤Nyå˜ß*ÛÊ·†©3;≤täÙ\0Nõì}·Kí\\ì*ø¸>>\nÙ5€˝lÈúﬂ|Ö◊Ä˝R¡∏T1È¥.§-^¬s=∞∂\"ÄÄuñ<m «g¨’∂„|ﬂØ˛_q\0¸Ï=h‰‰ÅÎ”\"ÛŒ ±«È!\"\0•∞°\r4 ByIYÇ∫[W0ƒTìñ±Ê	\'ZU{ìp¸·Bã~¿!ÿÿk∆é≥fõ7>´:1Œ%Jù›}ÔﬁvÑ%uï±dÚ*≥≠º§e˜æ“\np™°fêÉ∏,›(Ñ_>s˚&ÄË‚—cÒıË·ØÔ5sÁﬂÛπ°î◊8%•õÏÇé\0.ê“Ì–)ÂE§t€r»ùP˜ò›XUœ[∑,gpe™AÆI&®Jõ/ *˙Û|™rb…UÔâT◊lË·hÅÂZ£cãjQﬁ“¸%Êj?’ˇXeke/AF¯‹+Æ\'MQÌèV[4—Ô‚\nx†ƒq&j≠€[uúÂ5˝Z£‚ISê	l,•º!¿√¿ç@W ˚∞x<◊EıÍÄu@πRﬁ‡/¿2)›≠aüœÅ¿|Cw*‡r†T)Ô∞¯ûîÓ.çA8Æ\rci\'U)Ñl^=ïx®!\"~Õ¿Î¿Ì±~£^/áoü˛Ú‰G,J0•;«Ô§u¿•Ü∏0¯	¡≈úïCÔJ`=PaàáÜSCcåÇÃ[@)ÔÛ¿Ø¨!˚|∂	JyuR∫ªùTKép|åÜI¶@{[k√®;Å	|ÊPA|+÷0Í∫N˚‰Oƒga‹F2\re3S)Ô6S†î◊Pd\Z §h\"¯‚⁄Ü\Z\n,ÔdæﬁÄßîWù6VE9õÄÑ’i®©%åg2-ú…CjΩ\ZÕxÑÿl™ úØu≤êBp0<Cw†î7∏’ø¥dÛïÚJå˙¿%VüÑUÜ¸ü¿¬˙É@•—ØxRæ<˜§çı‰9	lÎËÉ\0Gáø¡·ºB†Ø6À[©/üµc#…‰lKot\'cJTk}øØı‡DƒPMÆ/pº1V›ì“|8j»ë˘πÆµÙû 0@£%o> •˚!)›ïÃ9AJ˜¿˝ñ|≤c÷NìF⁄0w.>@ÎíQCuêCıƒQl~Ä“»!Kop\'cÜ÷3*f5/Ë=´˘pﬂª∑IØ!Í¨˙ü§t[Äf´ÕÙ:„¨∂_KÈ∆åfRÜ·√˝—‹ÛAEznÉK3åÂÁH=•–∆û&⁄Ëù—ÜNGG:ÆÌH©Ñ≥DyoVuÛê∂+k1 \'¨∂JÄ–∞⁄R.ø9Ê0]˜≈Ñœ∫!«§tS1]÷|∆∫–g+p2«à∂ÛÓa8N}Û©sΩàû$√Xçı$ÄM9˙Ω±˙.ˆˆÃíätÑcté}´òb:?»2>;≥D~÷ÊZ‰êm¨Ÿ90\'á¨Hèìm¨\"]≈¢ñÃ±˛õ‰‡ŒÑ¢±\n$µ˜X‚ã¬ˇó[ÚΩR∫G…ìnM◊ºãŸ\0å2ÍﬂW ª¯Ç’/W§}∆Ô¨ÓaÅ;L1òCfñ#NZ$oä∆Í§t\0ıÄÓ§€ù©wZ˘íó±¥#Ãå0J”:ÌÂê8ÔûÇT¢;ÉWÅiR∫?-tÇºåUÊó˛„[§°˙ÿ¬±Â‰´˚ÆŒ∆“Ç˛·BjÛYK7ÛñUØÓ†ÔTA)o ∞HKX\0‘\0•távb({æ H@Œ˘Ú0Ó{>™’Ó¡€S\0 úƒÚS\r5+«y»t∂ßW“\'~<IÃ‰Æé.ÆïBsC^kÈ\Z„îÚ~dÖ`øÎ∫èBVJm∞L)Ø?ÌÜH±›(ˇ¯àQoí“ÕJ.ÿHÈæ©î˜¡—<‘ß2Óü±ÁÀ;\ZtÑX°µnH’5LqÑòí√kˇ>]™oN∞®ˆ‡√ÌÕ‚\"°”°ÓYF◊|„m6èk	ŒA§ò®î∑H˚8$•{“ozÌ˚åRﬁ	Œ_º4KÈÊ ¿Œiæy^´î∑„FŸñwÄQ6c«bk;Î#`aŸÃôÔeÑŒ˝Z„4cıa\0î%F∂Köcî}≤)&è„M•ºΩJy”ïÚ ≠æÛÄcñÓdæ˛\rxºÄhPÎòﬂv;àúé4ïµ\\Ä-/è\' 2\\H\\h=]#~êˇZ∫ïi¿Àù¥?&•˚≥TEJ˜ ¡~u:Ü?∂)Â•ÔR)›}¿ó;—knñ“};À\r\nü»<ÌËˆÕ‘§z÷-¿òÿ‚öÒZã\Z˚Ç√\"Èo©∏oÁÊ\\:|c◊…Ú•#>KTHC«y∫◊Ω[˜∞§Æ2Ê\'«õ]+Jè¶]G“˜õƒæˆÖä\\ﬂhì∏˝9:BkÒ∑TYJ˜ÑRﬁu¿l¿%»F¯¿!ÇãΩ(«7ﬂ¶CV4l3x\Z¯¥1ßßîw=¡…ß\Z†A\nk0GJ∑@h›Ÿ£A•º>@\\J◊>\0cˆ)æIS©*‡8ÅÅ´:“ﬁ€—>¶îW%•õuD°h¨Q ´˛D˚ö}Q‰´å´ÅõÄõ…‹á&KÈ˛Æ+ssÉÖ≥îÃìNèÑ\r~ù≥X•î◊D‡.St˘ Q1›T8ü≥ÍY˜·s⁄eñ¯`W\'*ﬁYÖs\0„ÿ9u•ºkÅø‰‹@ÊAŒ⁄èúù1EcŒ≥d\ZKúÃı\0èª¬sÖ]¢Ëg6∞Ê˚˙¿)]˚GgD1\ZÏîÚ\"ﬂm¿x23IÇg¥_ç·Ct^¸\\`Õ˚çSÎæ\0\0\0\0IENDÆB`Ç','Demographic',0,'I','STANDARD',0,1);
/*!40000 ALTER TABLE `survey_definition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `survey_definition_page`
--

DROP TABLE IF EXISTS `survey_definition_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `survey_definition_page` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `instructions` varchar(2000) NOT NULL,
  `page_order` smallint(6) NOT NULL,
  `page_logicjson` longblob,
  `randomize_questions` tinyint(1) DEFAULT NULL,
  `title` varchar(250) NOT NULL,
  `version` int(11) DEFAULT NULL,
  `survey_definition_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK93904B167FC58F7D` (`survey_definition_id`),
  CONSTRAINT `FK93904B167FC58F7D` FOREIGN KEY (`survey_definition_id`) REFERENCES `survey_definition` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey_definition_page`
--

LOCK TABLES `survey_definition_page` WRITE;
/*!40000 ALTER TABLE `survey_definition_page` DISABLE KEYS */;
INSERT INTO `survey_definition_page` VALUES (3,'Please provide honest, accurate information.  It will be kept anonymous.',1,NULL,0,'Student Information',0,3),(4,'Please provide honest, accurate information. It will be kept anonymous.',2,NULL,0,'Course Questions',1,3),(5,'Please tell us how much you agree or disagree with the following statements.',3,NULL,0,'Instructor Questions',0,3),(10,'',1,NULL,0,'Questionnaire',0,6),(11,'Let us know how you feel about the following statements',2,NULL,0,'Response Questions',0,6),(15,'Please provide general information about you.',1,NULL,0,'Demographic Questions',0,10);
/*!40000 ALTER TABLE `survey_definition_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `survey_document`
--

DROP TABLE IF EXISTS `survey_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `survey_document` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` longblob,
  `content_type` varchar(250) NOT NULL,
  `creation_date` datetime NOT NULL,
  `file_name` varchar(50) NOT NULL,
  `question_id` bigint(20) NOT NULL,
  `survey_id` bigint(20) NOT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey_document`
--

LOCK TABLES `survey_document` WRITE;
/*!40000 ALTER TABLE `survey_document` DISABLE KEYS */;
/*!40000 ALTER TABLE `survey_document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `survey_template`
--

DROP TABLE IF EXISTS `survey_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `survey_template` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(200) NOT NULL,
  `json_code` longtext NOT NULL,
  `name` varchar(75) NOT NULL,
  `version` int(11) DEFAULT NULL,
  `sector_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK45B9FBBF27B88D48` (`sector_id`),
  CONSTRAINT `FK45B9FBBF27B88D48` FOREIGN KEY (`sector_id`) REFERENCES `sector` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey_template`
--

LOCK TABLES `survey_template` WRITE;
/*!40000 ALTER TABLE `survey_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `survey_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `surveydefinition_reminders_daily_port_schedule`
--

DROP TABLE IF EXISTS `surveydefinition_reminders_daily_port_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `surveydefinition_reminders_daily_port_schedule` (
  `day_id` bigint(20) NOT NULL,
  `survey_definition_id` bigint(20) NOT NULL,
  PRIMARY KEY (`survey_definition_id`,`day_id`),
  KEY `FK3E4FC55F7FC58F7D` (`survey_definition_id`),
  KEY `FK3E4FC55F7D6911AC` (`day_id`),
  CONSTRAINT `FK3E4FC55F7D6911AC` FOREIGN KEY (`day_id`) REFERENCES `day` (`id`),
  CONSTRAINT `FK3E4FC55F7FC58F7D` FOREIGN KEY (`survey_definition_id`) REFERENCES `survey_definition` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `surveydefinition_reminders_daily_port_schedule`
--

LOCK TABLES `surveydefinition_reminders_daily_port_schedule` WRITE;
/*!40000 ALTER TABLE `surveydefinition_reminders_daily_port_schedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `surveydefinition_reminders_daily_port_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `velocity_template`
--

DROP TABLE IF EXISTS `velocity_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `velocity_template` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `template_definition` longtext NOT NULL,
  `template_name` varchar(250) NOT NULL,
  `template_timestamp` datetime NOT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `template_name` (`template_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `velocity_template`
--

LOCK TABLES `velocity_template` WRITE;
/*!40000 ALTER TABLE `velocity_template` DISABLE KEYS */;
INSERT INTO `velocity_template` VALUES (1,'<html><body><p><strong>Per your request below is your JD eSurvey Login</strong></p><p>Login: ${user_login}</p></body></html>','Forgot Login','2012-10-21 14:44:53',0),(2,'<html><body><p>A password change request for your JD eSurvey account has been made. If you have made this request please use the link below to change your password. If not please ignore this email.</p><p>${reset_password_link}</p></body></html>','Forgot Password','2012-10-21 14:44:53',0),(3,'<html><body><h1 id=\"main_section\">JD eSurvey Frequently Asked Questions</h1>\n<!-- Survey creation FAQs -->\n<h2>Survey Process</h2>\n<ul>\n<li><a href=\"#survey_sec1\">How do I create surveys?</a></li>\n<li><a href=\"#survey_sec2\">What are the two templates that appear below the description box in the create new survey window?</a></li>\n<li><a href=\"#survey_sec3\">How do I make questions require an answer before proceeding any further into the survey?</a></li>\n<li><a href=\"#survey_sec4\">How do I attach logos to surveys?</a></li>\n<li><a href=\"#survey_sec5\">What are the steps to fill out surveys?</a></li>\n<li><a href=\"#survey_sec6\">How do I change the theme or color of surveys?</a></li>\n</ul>\n<!-- Logic FAQs -->\n<h2>Logic Features</h2>\n<ul>\n<li><a href=\"#logic_sec1\">What does the randomize questions and options feature do?</a></li>\n<li><a href=\"#logic_sec2\">How do I apply branching to questions and answers?</a></li>\n<li><a href=\"#logic_sec3\">What is the piping of answers feature and how do I use it?</a></li>\n</ul>\n<!-- Statistics FAQs -->\n<h2>Data Collection</h2>\n<ul>\n<li><a href=\"#data_sec1\">How do I download copies of completed surveys?</a></li>\n<li><a href=\"#data_sec2\">How can I view survey data/statistics?</a></li>\n<li><a href=\"#data_sec3\">What options are available for exporting survey statistics?</a></li>\n</ul>\n<!-- Security FAQs -->\n<h2>Security</h2>\n<ul>\n<li><a href=\"#security_sec1\">How do I create users?</a></li>\n<li><a href=\"#security_sec2\">Where is the option to make surveys private or public?</a></li>\n<li><a href=\"#security_sec3\">When I try to log in I am getting a message that states Your login attempt was not successful, try again. Reason: User is disabled. Why is this occurring?</a></li>\n</ul>\n<!-- Other FAQs -->\n<h2>Other Features</h2>\n<ul>\n<li><a href=\"#other_sec1\">How do I export and import surveys?</a></li>\n<li><a href=\"#other_sec2\">What are datasets?</a></li>\n<li><a href=\"#other_sec3\">How do I send out survey invitations to a group of participants?</a></li>\n<li><a href=\"#other_sec4\">What are masks?</a></li>\n</ul>\n<!-- survey_sec1 -->\n<h2 id=\"survey_sec1\">How do I create surveys?</h2>\n<p style=\"color: black;\">In order to create surveys you must either have administrator or survey administrator privileges. Follow these steps to create a survey:</p>\n<ol style=\"padding: 0em 4em;\">\n<li>Go to the Settings tab and click on Surveys.</li>\n<li>On the left panel click on Add new Survey.</li>\n<li>Select a department and type in a name for the survey. Fill out any of the other optional fields on the page and click on Save.</li>\n<li>Click on Add new Page from the left panel or from the bottom right corner.</li>\n<li>Select an order, enter a title for the survey page, include any additional instructions, and determine whether to randomize the questions or not.</li>\n<li>At the bottom right corner click on add question.</li>\n<li>Choose a position order, question type, and type in the question text. Fill out any other fields if necessary and click on Save.</li>\n<li>Depending on the question type additional fields may need to be defined:<ol type=\"a\">\n<li>An update options link appears for single choice drop down, multiple choice checkboxes, and single choice radio button questions types</li>\n<li>The update columns and update rows links appears for all matrix questions</li>\n</ol></li>\n<li>Add more questions to the page and survey pages if necessary.</li>\n<li>After building the survey click on Publish Survey from the panel on the left to publish or Export survey to download it.</li>\n</ol><!-- survey_sec2 -->\n<h2 id=\"survey_sec2\">What are the two templates that appear below the description box in the create new survey window?</h2>\n<p style=\"color: black;\">The first template, Email Invitation Template, contains the message that will be displayed to the email recipients for email invitation surveys. The second template, Completed Survey Template, is the message displayed to participants after completing a survey. Both of these templates can be modified with custom messages.</p>\n<!-- survey_sec3 -->\n<h2 id=\"survey_sec3\">How do I make questions require an answer before proceeding any further into the survey?</h2>\n<p style=\"color: black;\">While creating or updating questions there is a checkbox option labeled as Mandatory. Enabling this option will prevent participants from advancing to the next page unless an answer is provided.</p>\n<!-- survey_sec4 -->\n<h2 id=\"survey_sec4\">How do I attach logos to surveys?</h2>\n<p style=\"color: black;\">Adding customized or company logos to surveys can be accomplished during the creation process or after they have been published. Follow these steps to add a logo:</p>\n<ol style=\"padding: 0em 4em;\">\n<li>From the top menu bar go to Settings and click on Surveys.</li>\n<li>Select a survey to add the logo and click on the Show Survey link under the Actions column.</li>\n<li>From the left panel click on Update Logo.</li>\n<li>Click on the Choose File button, select an image (supported types include png, gif, bmp, and jpeg), and click on Upload.</li>\n</ol><!-- survey_sec5 -->\n<h2 id=\"survey_sec5\">What are the steps to fill out surveys?</h2>\n<p style=\"color: black;\">Once a survey has been published it is now ready to be filled out by participants. If the survey has been made public then registering participants is not necessary. However, if the survey has been made private then an administrator needs to assign it to the appropriate participants.</p>\n<ol style=\"padding: 0em 4em;\">\n<li>Log in to the external site.</li>\n<li>Locate the survey to be filled and click on the Fill Survey link.</li>\n<li>If the survey is being filled out for the first time then a new survey will automatically be generated. Otherwise, click on the Create New Survey link located on the bottom right corner of the page.</li>\n<li>After completing a page click on Next to proceed to the next page.</li>\n<li>Review the survey on the final page and click on Submit to finish.</li>\n</ol><!-- survey_sec6 -->\n<h2 id=\"survey_sec6\">How do I change the theme or color of surveys?</h2>\n<p style=\"color: black;\">The color and overall look of surveys may be modified by selecting a different theme in the Create new Survey or Update Survey windows. Clicking on the Lookup Theme link located at the right of the theme options will display a preview of each theme.</p>\n<!-- logic_sec1 -->\n<h2 id=\"logic_sec1\">What does the randomize questions and options feature do?</h2>\n<p style=\"color: black;\">The randomize feature sorts a list of questions and answers in a randomized order. This allows for a survey to display questions and options in a different order each time. The randomization feature is found in the create/update survey page window and in the create/update questions window.</p>\n<!-- logic_sec2 -->\n<h2 id=\"logic_sec2\">How do I apply branching to questions and answers?</h2>\n<p style=\"color: black;\">Branching is a method for skipping irrelevant questions based upon answer entries. While filling out surveys, there may be instances where particular answers require a participant to skip to specific questions or sections witin the survey. To add branching logic to questions follow these steps:</p>\n<ol style=\"padding: 0em 4em;\">\n<li>Choose a survey page containing the questions to add the branching logic.</li>\n<li>Click on the Edit branch and skip logic icon located inside the page header.</li>\n<li>Select the page to skip to in the Go To drop down list.</li>\n<li>In the When section choose a condition to be applied.</li>\n<li>Enable the questions to apply the logic to.</li>\n<li>Under the Values section, pick the answers that will activate the branch.</li>\n<li>Click on Save.</li>\n</ol><!-- logic_sec3 -->\n<h2 id=\"logic_sec3\">What is the piping of answers feature and how do I use it?</h2>\n<p style=\"color: black;\">The piping feature allows selected answers from questions to be incorporated into other questions. To utilize te piping functionality a parameter must be added to the question text. The parameter consists of a dollar sign, opening curly brace, page number, question number, and closing curly brace, written in that order. So for example, if we want to use te answer from question 4 on page 2, we would add the following parameter inside the current question text: ${p2q4}.</p>\n<p style=\"color: black;\"><em>Note: The piping feature is only operational by referencing answers from preceding pages. Attempting to use an answer from a future page will not work.</em></p>\n<!-- data_sec1 -->\n<h2 id=\"data_sec1\">How do I download copies of completed surveys?</h2>\n<p style=\"color: black;\">Survey entries may be downloaded as PDF files for viewing, printing, and keeping copies of them. To download survey entries do the following:</p>\n<ol style=\"padding: 0em 4em;\">\n<li>Go to Survey Entries at the top menu bar and click on List.</li>\n<li>Select a survey and click on Show Entries.</li>\n<li>Click on the Show Survey link associated with the survey to be downloaded.</li>\n<li>On the left panel click on the Export to PDF tab.</li>\n<li>The survey is displayed as a PDF and can be printed or saved.</li>\n</ol><!-- data_sec2 -->\n<h2 id=\"data_sec2\">How can I view survey data/statistics?</h2>\n<p style=\"color: black;\">Statistics may be viewed in the application. Questions, separated into their respective pages, are displayed in the left panel while the data is shown in the right panel. Survey statistics may be viewed by doing the following:</p>\n<ol style=\"padding: 0em 4em;\">\n<li>Click on the Statistics tab located on the top menu bar.</li>\n<li>Select a survey and click on Show Statistics.</li>\n</ol><!-- data_sec3 -->\n<h2 id=\"data_sec3\">What options are available for exporting survey statistics?</h2>\n<p style=\"color: black;\">There are three different formats to export survey statistics for data analysis. Survey statistics may be exported as an Excel file, comma delimited file, or SPSS file. As stated in the description, use the comma delimited values or SPSS formats for surveys containing large amounts of data. To export survey statistics complete these steps:</p>\n<ol style=\"padding: 0em 4em;\">\n<li>Under Survey Entries click on the Export link.</li>\n<li>Locate the survey that is to be exported from the list.</li>\n<li>Choose a format to export the survey as by clicking on one of the links under the Actions column.</li>\n<li>Specify a directory and file name and click on Save.</li>\n</ol><!-- security_sec1 -->\n<h2 id=\"security_sec1\">How do I create users?</h2>\n<p style=\"color: black;\">The process of creating both internal and external users may only be accomplished by administrators. To create new internal users follow these steps:</p>\n<ol style=\"padding: 0em 4em;\">\n<li>Ensure you are logged in as an administrator.</li>\n<li>From the top menu bar go to the Security tab and click on Internal Users.</li>\n<li>Click on Add new Internal User from the left panel.</li>\n<li>On the Create new User page, click on the Enabled option to activate the account or leave it blank if the account is to remain deactivated.</li>\n<li>Fill in the rest of the required fields. <br /><em>Note: The date of birth field accepts inputs in the MM/DD/YYYY format. The password must be at least eight characters long, contain at least one number, one lower case letter, one upper case letter, and at least one of these special characters: [@#$%^&amp;+=]</em></li>\n<li>Select a group to place the user under.</li>\n<li>If the assigned group is Survey Administrators, then choose a department or departments the user will have access to.</li>\n</ol>\n<p style=\"color: black;\">The method of creating a new external user is essentially identical, except that the only option under the Groups section is Survey Participants. Also, instead of having departmental access external users only have access to surveys.</p>\n<!-- security_sec2 -->\n<h2 id=\"security_sec2\">Where is the option to make surveys private or public?</h2>\n<p style=\"color: black;\">The option to make surveys private or public is located in the Create new Survey and Update Survey windows. The checkbox is labeled as Available to public.</p>\n<!-- security_sec3 -->\n<h2 id=\"security_sec3\">When I try to log in I am getting a message that states Your login attempt was not successful, try again. Reason: User is disabled. Why is this occurring?</h2>\n<p style=\"color: black;\">This message is displayed when a user attempts to sign into the application with an inactive account. An administrator can remedy this issue by:</p>\n<ol style=\"padding: 0em 4em;\">\n<li>Go to the Security tab on the top menu bar.</li>\n<li>Depending on the user account, click on Internal or External Users.</li>\n<li>Find the disabled account and click on the Update User link under the Actions column.</li>\n<li>Check the Enbaled checkbox and click on Save.</li>\n</ol><!-- other_sec1 -->\n<h2 id=\"other_sec1\">How do I export and import surveys?</h2>\n<p style=\"color: black;\">Exporting surveys only require a few steps:</p>\n<ol style=\"padding: 0em 4em;\">\n<li>Go to the Settings tab and click on Surveys.</li>\n<li>Find the survey to export and click on the Show Survey link located under the Actions column.</li>\n<li>From the left panel click on Export Survey.</li>\n<li>Choose a directory and specify a name for the file.</li>\n</ol>\n<p style=\"color: black;\">To import surveys follow these steps:</p>\n<ol style=\"padding: 0em 4em;\">\n<li>Go the Settings tab and click on Surveys.</li>\n<li>Click on Import Surveys from the left panel.</li>\n<li>Select a department, enter a name for the survey, and click on Choose File.</li>\n<li>Browse to the directly containing the survey file and open it.</li>\n<li>Click on Upload.</li>\n</ol>\n<p style=\"color: black;\">An alternative method for importing surveys is available, but is restricted to administrators only:</p>\n<ol style=\"padding: 0em 4em;\">\n<li>Go to the Security tab and click on Departments.</li>\n<li>Select a department and click on the show department link under the Actions column.</li>\n<li>Click on Import Surveys from the left panel.</li>\n<li>Type in a name for the survey.</li>\n<li>Select the survey file and click on Upload.</li>\n</ol><!-- other_sec2 -->\n<h2 id=\"other_sec2\">What are datasets?</h2>\n<p style=\"color: black;\">Datasets are collections of data that can be imported and then used to populate a list of options. The accepted format of datasets is the comma delimited values file. An example dataset file is available for download on the Upload Dataset page. Please note that the process of adding, updating, and deleting datasets is restricted to administrators only. Do the following to add datasets:</p>\n<ol style=\"padding: 0em 4em;\">\n<li>Under the Settings tab click on Datasets.</li>\n<li>Click on Add new Dataset from the</li>\n</ol><!-- other_sec3 -->\n<h2 id=\"other_sec3\">How do I send out survey invitations to a group of participants?</h2>\n<p style=\"color: black;\">A comma delimited file containing a list of the survey participants information may be used to send out email invitations for surveys. The format for the comma delimited files is first name, middle name, last name, and email address. An example file may be downloaded on the Invite Participants page.</p>\n<p style=\"color: black;\"><em>Note: Survey invitations may only be performed by administrators.</em></p>\n<p style=\"color: black;\">The steps to send out survey invitations are:</p>\n<ol style=\"padding: 0em 4em;\">\n<li>Click on the Invitations link located under the Settings tab.</li>\n<li>Click on Invite Participants from the left panel.</li>\n<li>Select a survey and choose an invitations file.</li>\n<li>Click on Upload.</li>\n</ol>\n<p style=\"color: black;\">The total number of email invitations sent and number of invitation emails opened is displayed, along with more detailed information per survey.</p>\n<!-- other_sec4 -->\n<h2 id=\"other_sec4\">What are masks?</h2>\n<p style=\"color: black;\">Masks are text patterns that responses must adhere to. \nIf a mask is applied to a question then a participants entry to it is required to match the specific format of the mask. Only administrators are allowed to add, update, and delete masks. Applying them to questions may be carried out during the question creation or update processes under the Validation Information section.</p></body></html>','Internal Help Content','2012-10-21 14:44:53',0),(4,'<html><body><h2>Invitation</h2><p>Hi ${full_name};</p><p>You have been invited to participate in the folllowing survey:<br />Survey: ${survey_name}<br /><br />To participate please click on the following link:</p><p>${survey_link}</p></body></html>','Survey Invitation Email','2012-10-21 14:44:53',0),(5,'Your survey has been submitted. Thank you for participating.','Survey Completed Page Content','2012-10-21 14:44:53',0);
/*!40000 ALTER TABLE `velocity_template` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-06-03 18:52:24
