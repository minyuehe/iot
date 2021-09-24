-- MySQL dump 10.13  Distrib 8.0.26, for macos11 (arm64)
--
-- Host: localhost    Database: iot
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `article` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `viewCount` int DEFAULT '0',
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` VALUES (-1,'关于页面','关于页面存档，勿删',16,'2021-09-14 15:28:40','2021-09-14 16:39:45'),(92,'韵苑食堂','## 韵苑食堂---“yyds”\n![hhhhh](https://tse1-mm.cn.bing.net/th/id/OIP-C._23K0ChKsbkWLsq4eZ7IQgEsDI?w=284&h=189&c=7&r=0&o=5&dpr=1.25&pid=1.7) \n',10,'2021-09-14 15:46:56','2021-09-14 16:38:03'),(93,'东园食堂','## 东园食堂--jjz\n![hhhhh](https://tse1-mm.cn.bing.net/th/id/OIP-C._23K0ChKsbkWLsq4eZ7IQgEsDI?w=284&h=189&c=7&r=0&o=5&dpr=1.25&pid=1.7) ',14,'2021-09-14 15:49:25','2021-09-14 16:35:48'),(94,'学一食堂','## 学一食堂\n\n![hhhhh](https://tse1-mm.cn.bing.net/th/id/OIP-C._23K0ChKsbkWLsq4eZ7IQgEsDI?w=284&h=189&c=7&r=0&o=5&dpr=1.25&pid=1.7) ',22,'2021-09-14 15:56:30','2021-09-14 16:54:11');
/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `articleId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `articleId` (`articleId`),
  CONSTRAINT `category_ibfk_1` FOREIGN KEY (`articleId`) REFERENCES `article` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=177 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (174,'东校区',93),(175,'东校区',94),(176,'东校区',92);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `articleId` int DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `articleId` (`articleId`),
  KEY `userId` (`userId`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`articleId`) REFERENCES `article` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (55,92,'laji','2021-09-14 16:26:05','2021-09-14 16:26:05',64078971),(56,92,'辣鸡','2021-09-14 16:30:45','2021-09-14 16:30:45',64078972),(57,93,'感觉不如韵苑。。。菜品','2021-09-14 16:32:43','2021-09-14 16:32:43',64078972),(58,94,'辣🐔','2021-09-14 16:33:19','2021-09-14 16:33:19',64078972),(59,-1,'nb','2021-09-14 16:39:00','2021-09-14 16:39:00',64078972);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ip`
--

DROP TABLE IF EXISTS `ip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ip` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ip` text NOT NULL,
  `auth` tinyint(1) DEFAULT '1',
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `userId` (`userId`) USING BTREE,
  CONSTRAINT `ip_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ip`
--

LOCK TABLES `ip` WRITE;
/*!40000 ALTER TABLE `ip` DISABLE KEYS */;
INSERT INTO `ip` VALUES (2,'::ffff:10.13.49.85',1,64078971),(3,'::ffff:10.13.49.48',1,64078972);
/*!40000 ALTER TABLE `ip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reply`
--

DROP TABLE IF EXISTS `reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reply` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `articleId` int DEFAULT NULL,
  `commentId` int DEFAULT NULL,
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `articleId` (`articleId`),
  KEY `userId` (`userId`),
  CONSTRAINT `reply_ibfk_1` FOREIGN KEY (`articleId`) REFERENCES `article` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `reply_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reply`
--

LOCK TABLES `reply` WRITE;
/*!40000 ALTER TABLE `reply` DISABLE KEYS */;
/*!40000 ALTER TABLE `reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tag` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `articleId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `articleId` (`articleId`),
  CONSTRAINT `tag_ibfk_1` FOREIGN KEY (`articleId`) REFERENCES `article` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=240 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` VALUES (233,'欧式大圆台',93),(234,'三层小洋楼',93),(235,'top.2',93),(236,'top.3',94),(237,'豪华地段',92),(238,'韵苑市中心',92),(239,'top.1',92);
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(255) DEFAULT NULL COMMENT '通过 bcrypt 加密后的密码',
  `email` varchar(50) DEFAULT NULL,
  `notice` tinyint(1) DEFAULT '1',
  `disabledDiscuss` tinyint(1) DEFAULT '0',
  `role` tinyint DEFAULT '2' COMMENT '用户权限：1 - admin, 2 - 普通用户',
  `github` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64078973 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (64078969,'minyuehe','$2a$10$xjOfZxxQf4QTM1XZPJ383.BXQxwcRUEZYfq6Cp3Z0tzn9L2XzbNA2','870827153@qq.com',1,0,1,'{\"login\":\"minyuehe\",\"id\":64078969,\"node_id\":\"MDQ6VXNlcjY0MDc4OTY5\",\"avatar_url\":\"https://avatars.githubusercontent.com/u/64078969?v=4\",\"gravatar_id\":\"\",\"url\":\"https://api.github.com/users/minyuehe\",\"html_url\":\"https://github.com/minyuehe\",\"followers_url\":\"https://api.github.com/users/minyuehe/followers\",\"following_url\":\"https://api.github.com/users/minyuehe/following{/other_user}\",\"gists_url\":\"https://api.github.com/users/minyuehe/gists{/gist_id}\",\"starred_url\":\"https://api.github.com/users/minyuehe/starred{/owner}{/repo}\",\"subscriptions_url\":\"https://api.github.com/users/minyuehe/subscriptions\",\"organizations_url\":\"https://api.github.com/users/minyuehe/orgs\",\"repos_url\":\"https://api.github.com/users/minyuehe/repos\",\"events_url\":\"https://api.github.com/users/minyuehe/events{/privacy}\",\"received_events_url\":\"https://api.github.com/users/minyuehe/received_events\",\"type\":\"User\",\"site_admin\":false,\"name\":null,\"company\":null,\"blog\":\"\",\"location\":null,\"email\":null,\"hireable\":null,\"bio\":null,\"twitter_username\":null,\"public_repos\":7,\"public_gists\":0,\"followers\":1,\"following\":1,\"created_at\":\"2020-04-21T11:40:25Z\",\"updated_at\":\"2021-08-24T03:33:34Z\"}','2021-09-14 15:28:42','2021-09-14 15:28:42'),(64078971,'aaa','$2a$10$PCR9dm9YoFMkheO3bSL8bumT3dnO8mFBt.VJLXAJiELih7z3k8zmO','123@qq.com',1,0,2,NULL,'2021-09-14 16:25:46','2021-09-14 16:25:46'),(64078972,'干饭人','$2a$10$geADTk2nkR18GamD8I4wtuU/ZZ.vtLyO6CO3.eaNjagOlR/DwIQzG','657850432@qq.com',1,0,2,NULL,'2021-09-14 16:30:25','2021-09-14 16:30:25');
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

-- Dump completed on 2021-09-24 13:00:32
