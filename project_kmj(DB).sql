CREATE DATABASE  IF NOT EXISTS `project_kmj` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `project_kmj`;
-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: project_kmj
-- ------------------------------------------------------
-- Server version	5.7.33-log

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
-- Table structure for table `board_kmj`
--

DROP TABLE IF EXISTS `board_kmj`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `board_kmj` (
  `num` int(11) NOT NULL,
  `id` varchar(45) NOT NULL,
  `subject` varchar(500) NOT NULL,
  `content` varchar(2000) NOT NULL,
  `readcount` int(11) DEFAULT NULL,
  `re_ref` int(11) DEFAULT NULL,
  `re_lev` int(11) DEFAULT NULL,
  `re_seq` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `file` varchar(100) DEFAULT NULL,
  `ip` varchar(45) DEFAULT NULL,
  KEY `id` (`id`),
  CONSTRAINT `board_kmj_ibfk_1` FOREIGN KEY (`id`) REFERENCES `user_kmj` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board_kmj`
--

LOCK TABLES `board_kmj` WRITE;
/*!40000 ALTER TABLE `board_kmj` DISABLE KEYS */;
INSERT INTO `board_kmj` VALUES (1,'test1','집에갈래!','집에갈래 ',1,1,0,0,'2021-05-27','momo2.gif','192.168.2.230'),(2,'test2','hand 너무 무서워요 ㅠㅠ','너무무서웠어요 ㅠㅠ ',2,2,0,0,'2021-05-27','hand.jpg','192.168.2.230'),(3,'aaaaa','들렸다 가요~~',' 재미있는게 많네요',0,3,0,0,'2021-05-27','완두3.jpg','192.168.2.230'),(4,'aaaaa','[답변] 사진만 봐도 ...','무서워여 ㅠ ',0,2,1,1,'2021-05-27',NULL,'192.168.2.230'),(5,'abcde','방탈출엔 역시 ','팝콘 아닌가요? ',2,5,0,0,'2021-05-27','집에갈래!.jpg','192.168.2.230'),(6,'java1','[답변]집에갈래..','집에 갈래 이제 그만  ',0,5,1,1,'2021-05-27',NULL,'0:0:0:0:0:0:0:1'),(7,'java1','갠프 그만',' 이제 그만할래.. 살려줘',5,7,0,0,'2021-05-27','민들레냥2.png','0:0:0:0:0:0:0:1'),(8,'cherry','[답변]팀 잘 짜주세요....','제바알... ',1,7,1,1,'2021-05-27',NULL,'0:0:0:0:0:0:0:1'),(9,'cherry','방문 후기입니다.','재미있는 추억 만들고 갑니다^^ ',0,9,0,0,'2021-05-27','옥상.jpg','0:0:0:0:0:0:0:1'),(10,'sarang','방추천해주세요!',' 겁이 많아서 무서운건 좀.... 그래요...',7,10,0,0,'2021-05-27','2.jpg','192.168.2.13'),(11,'admin','[답변]타임머신은 어떠신가요?','타임머신이면 괜찮으실것같네요^^ ',1,10,1,3,'2021-05-27',NULL,'0:0:0:0:0:0:0:1'),(12,'admin','방문 인증 해주세요',' 눈이 품으며, 희망의 때문이다. 열락의 웅대한 석가는 것이다. 타오르고 인간이 피가 쓸쓸한 품으며, 천자만홍이 뛰노는 피고 무엇을 위하여서.',2,12,0,0,'2021-05-27','원자앵.jpg','0:0:0:0:0:0:0:1');
/*!40000 ALTER TABLE `board_kmj` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room_kmj`
--

DROP TABLE IF EXISTS `room_kmj`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room_kmj` (
  `r_title` varchar(45) NOT NULL,
  `r_img` varchar(100) DEFAULT NULL,
  `r_time` int(11) NOT NULL,
  `r_person` varchar(10) NOT NULL,
  `r_detail` varchar(500) DEFAULT NULL,
  `r_difficulty` varchar(45) DEFAULT NULL,
  UNIQUE KEY `r_name_UNIQUE` (`r_title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_kmj`
--

LOCK TABLES `room_kmj` WRITE;
/*!40000 ALTER TABLE `room_kmj` DISABLE KEYS */;
/*!40000 ALTER TABLE `room_kmj` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_kmj`
--

DROP TABLE IF EXISTS `user_kmj`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_kmj` (
  `id` varchar(45) NOT NULL,
  `pw` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `email` varchar(200) NOT NULL,
  `phone` varchar(45) NOT NULL,
  `address` varchar(100) DEFAULT NULL,
  `birth` varchar(45) DEFAULT NULL,
  `gender` varchar(5) DEFAULT NULL,
  `regdate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_kmj`
--

LOCK TABLES `user_kmj` WRITE;
/*!40000 ALTER TABLE `user_kmj` DISABLE KEYS */;
INSERT INTO `user_kmj` VALUES ('aaaaa','1234','집가자','aaaa@aaaa.com','010-1111-1113','(46084)부산 기장군 기장읍 동부산관광8로 11 (시랑리)기장',NULL,'남','2021-05-27 07:29:14'),('abcde','1234','집가자','aaab@aaaa.com','010-1111-1114','(13473)경기 성남시 분당구 경부고속도로 409 (삼평동)분당',NULL,'여','2021-05-27 07:29:42'),('admin','1234','관리자','akdpekdkdl11@naver.com','010-6509-6595','(13536)경기 성남시 분당구 판교역로 4 (백현동)12층','1990-11-07','여','2021-05-27 07:24:47'),('cherry','1234','앵두','jsp@google.com','010-3333-4444','()',NULL,'남','2021-05-27 07:27:21'),('java1','1111','자바','java@google.com','010-2461-1111','()',NULL,'남','2021-05-27 07:31:06'),('mina0502','1234','이미나','mina@ruu.com','010-1234-4321','(52550)경남 사천시 주공1길 19 (벌리동, 정석학원)사천','2021-05-14','여','2021-05-27 07:32:45'),('onebean','1234','원두','kmj9953@hanmail.net','010-2222-2222','(47846)부산 동래구 석사북로 107 (온천동)6층','2018-07-02','남','2021-05-27 07:26:49'),('papaya','1234','파파야','itwill@google.com','010-6666-7777','()',NULL,'여','2021-05-27 07:28:15'),('sarang','1234','사랑이','sarang@gmail.com','010-1234-1235','()',NULL,'여','2021-05-27 07:51:17'),('test1','1234','테스트','test001@ruu.net','010-1111-1111','()',NULL,'남','2021-05-27 07:24:50'),('test1234','1234','김경민','reewrwe@dsdsf.com','010-1547-2132','(46769)부산 강서구 가덕해안로 3 (성북동)',NULL,'남','2021-05-27 08:44:35'),('test2','1111','테스트','test002@ruu.net','010-1111-1112','(46084)부산 기장군 기장읍 동부산관광8로 11 (시랑리)메일','2021-05-11','여','2021-05-27 07:25:17'),('test3','1111','테스트','jsp1@google.com','010-3333-4444','(13536)경기 성남시 분당구 판교역로 4 (백현동)12층','2021-05-28','남','2021-05-28 00:24:43');
/*!40000 ALTER TABLE `user_kmj` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-28 10:25:00
