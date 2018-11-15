CREATE DATABASE  IF NOT EXISTS `imdb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `imdb`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: imdb
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.34-MariaDB

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
-- Table structure for table `actors`
--

DROP TABLE IF EXISTS `actors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actors` (
  `id` int(11) NOT NULL DEFAULT '0',
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `directors`
--

DROP TABLE IF EXISTS `directors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `directors` (
  `id` int(11) NOT NULL DEFAULT '0',
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `directors_genres`
--

DROP TABLE IF EXISTS `directors_genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `directors_genres` (
  `director_id` int(11) NOT NULL,
  `genre_id` int(11) NOT NULL,
  `prob` float DEFAULT NULL,
  PRIMARY KEY (`director_id`,`genre_id`),
  KEY `directors_genres_ibfk_2_idx` (`genre_id`),
  CONSTRAINT `directors_genres_ibfk_1` FOREIGN KEY (`director_id`) REFERENCES `directors` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `directors_genres_ibfk_2` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `genres`
--

DROP TABLE IF EXISTS `genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genres` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `genre_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `movies`
--

DROP TABLE IF EXISTS `movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movies` (
  `id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(100) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `rank` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `movies_directors`
--

DROP TABLE IF EXISTS `movies_directors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movies_directors` (
  `director_id` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL,
  PRIMARY KEY (`director_id`,`movie_id`),
  KEY `movies_directors_director_id` (`director_id`),
  KEY `movies_directors_movie_id` (`movie_id`),
  CONSTRAINT `movies_directors_ibfk_1` FOREIGN KEY (`director_id`) REFERENCES `directors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `movies_directors_ibfk_2` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `movies_genres`
--

DROP TABLE IF EXISTS `movies_genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movies_genres` (
  `movie_id` int(11) NOT NULL,
  `genre_id` int(11) NOT NULL,
  PRIMARY KEY (`movie_id`,`genre_id`),
  KEY `movies_genres_ibfk_2_idx` (`genre_id`),
  CONSTRAINT `movies_genres_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `movies_genres_ibfk_2` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `actor_id` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL,
  `role` varchar(100) NOT NULL,
  PRIMARY KEY (`actor_id`,`movie_id`,`role`),
  KEY `movie_id` (`movie_id`),
  CONSTRAINT `roles_ibfk_1` FOREIGN KEY (`actor_id`) REFERENCES `actors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `roles_ibfk_2` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-15 16:30:22
