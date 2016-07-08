/*
SQLyog Community Edition- MySQL GUI v6.07
Host - 5.0.45-community-nt : Database - diggdown
*********************************************************************
Server version : 5.0.45-community-nt
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

create database if not exists `diggdown`;

USE `diggdown`;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

/*Table structure for table `categories` */

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
  `id` int(8) unsigned NOT NULL auto_increment,
  `name` varchar(100) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Table structure for table `category_creator` */

DROP TABLE IF EXISTS `category_creator`;

CREATE TABLE `category_creator` (
  `creator_id` int(8) unsigned NOT NULL,
  `category_id` int(8) unsigned NOT NULL,
  KEY `FK_category_creator_1` (`category_id`),
  KEY `FK_category_creator_2` (`creator_id`),
  CONSTRAINT `FK_category_creator_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `FK_category_creator_2` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `downloads` */

DROP TABLE IF EXISTS `downloads`;

CREATE TABLE `downloads` (
  `id` int(8) unsigned NOT NULL auto_increment,
  `title` varchar(200) NOT NULL default '',
  `description` text NOT NULL,
  `link` varchar(200) NOT NULL default '',
  `user_id` int(8) unsigned NOT NULL,
  `create_time` bigint(20) NOT NULL,
  `category_id` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_downloads_2` (`user_id`),
  KEY `FK_downloads_3` (`category_id`),
  CONSTRAINT `FK_downloads_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_downloads_3` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Table structure for table `keyword_download` */

DROP TABLE IF EXISTS `keyword_download`;

CREATE TABLE `keyword_download` (
  `download_id` int(8) unsigned NOT NULL auto_increment,
  `keyword_id` int(8) unsigned NOT NULL,
  KEY `FK_keyword_download_1` (`download_id`),
  KEY `FK_keyword_download_2` (`keyword_id`),
  CONSTRAINT `FK_keyword_download_1` FOREIGN KEY (`download_id`) REFERENCES `downloads` (`id`),
  CONSTRAINT `FK_keyword_download_2` FOREIGN KEY (`keyword_id`) REFERENCES `keywords` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Table structure for table `keywords` */

DROP TABLE IF EXISTS `keywords`;

CREATE TABLE `keywords` (
  `id` int(8) unsigned NOT NULL auto_increment,
  `keyword` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `username` varchar(200) NOT NULL default '',
  `nickname` varchar(200) NOT NULL default '',
  `password` varchar(100) NOT NULL default '',
  `email` varchar(200) NOT NULL default '',
  `create_time` datetime NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
