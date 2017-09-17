/*
SQLyog Ultimate v10.0 
MySQL - 5.7.9 : Database - showsaround
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`showsaround` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `showsaround`;

/*Table structure for table `areas` */

DROP TABLE IF EXISTS `areas`;

CREATE TABLE `areas` (
  `area_id` int(200) unsigned NOT NULL AUTO_INCREMENT,
  `area_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'מרכז',
  `eng_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`area_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `areas` */

insert  into `areas`(`area_id`,`area_name`,`eng_name`) values (1,'מרכז','Center'),(2,'תל אביב','Tel Aviv'),(3,'השרון','Hasharon'),(4,'צפון','North'),(5,'דרום','South'),(6,'ירושלים','Jerusalem');

/*Table structure for table `artists` */

DROP TABLE IF EXISTS `artists`;

CREATE TABLE `artists` (
  `artist_id` int(200) unsigned NOT NULL AUTO_INCREMENT,
  `artist_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `genre` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `main_image` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'http://www.bsmc.net.au/wp-content/uploads/No-image-available.jpg',
  `comment` text COLLATE utf8_unicode_ci,
  `last_modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`artist_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `artists` */

/*Table structure for table `events` */

DROP TABLE IF EXISTS `events`;

CREATE TABLE `events` (
  `event_id` int(200) unsigned NOT NULL AUTO_INCREMENT,
  `artist_id` int(200) NOT NULL,
  `venue_id` int(200) NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `desc_eng` text COLLATE utf8_unicode_ci,
  `time` datetime NOT NULL,
  `main_image` varchar(100) COLLATE utf8_unicode_ci DEFAULT 'http://www.bsmc.net.au/wp-content/uploads/No-image-available.jpg',
  `event_link` varbinary(100) DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `last_modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`event_id`),
  UNIQUE KEY `UNIQUE_EVENT` (`artist_id`,`venue_id`,`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `events` */

/*Table structure for table `genres` */

DROP TABLE IF EXISTS `genres`;

CREATE TABLE `genres` (
  `genre_id` int(200) unsigned NOT NULL AUTO_INCREMENT,
  `genre_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `eng_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`genre_id`),
  UNIQUE KEY `Name` (`genre_name`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `genres` */

insert  into `genres`(`genre_id`,`genre_name`,`eng_name`) values (42,'אינדי','Indie'),(43,'אינדסטריאל','Industrial '),(44,'אלטרנטיב','Alternative'),(45,'אמביינט','Ambient'),(46,'אסיאן אנדרגראונד ','Asian Underground'),(47,'אסיד ג\'אז','Acid Jazz'),(48,'אסיד האוס','Acid House'),(49,'אפרו פאנק','Afro Funk'),(50,'בי בופ','Be bop'),(51,'ביג בנד ג\'אז','Big Band'),(52,'בלוגראס','Bluegrass'),(53,'קאנטרי בלוז','Country blues'),(54,'בוגי ווגי',''),(55,'ביט','Bit'),(56,'רית\'ם & בלוז בריטי','R & B'),(57,'בלוז קלאסי',''),(58,'קאנטרי','Country & Western , C & W'),(59,'קאנטריפוליטן',''),(60,'קאנטרי רוק',''),(61,'דיסקו','Disco'),(62,'דו וופ','Doo-Wop'),(63,'דאב','Dub'),(64,'פולק','Folk'),(65,'פולק רוק','Folk Rock'),(66,'פ\'אנק','Funk'),(67,'פי פאנק','P Funk'),(68,'פיוז\'ן','Fusion'),(69,'גוספל',''),(70,'רוק כבד','Heavy Metal'),(71,'היפ הופ','Hip-Hop'),(72,'הונקי טונק',''),(73,'ג\'אז','Jazz'),(74,'ג\'אמפ בלוז','Jump Blues'),(75,'מוסיקה לטינית',''),(76,'הצליל של נשוויל',''),(77,'פופ','Pop'),(81,'רוק מתקדם',''),(82,'רוק','Rock');

/*Table structure for table `venues` */

DROP TABLE IF EXISTS `venues`;

CREATE TABLE `venues` (
  `venue_id` int(200) unsigned NOT NULL AUTO_INCREMENT,
  `venue_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `venue_eng_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `area_id` int(200) NOT NULL DEFAULT '1',
  `address` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `price` int(11) NOT NULL DEFAULT '0',
  `main_image` varchar(100) COLLATE utf8_unicode_ci DEFAULT 'http://www.bsmc.net.au/wp-content/uploads/No-image-available.jpg',
  `comment` text COLLATE utf8_unicode_ci,
  `last_modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`venue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `venues` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
