/*
SQLyog Community- MySQL GUI v8.21 
MySQL - 5.0.67-community-nt : Database - yuqiapp_java
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`yuqiapp_java` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `yuqiapp_java`;

/*Table structure for table `shop_category` */

DROP TABLE IF EXISTS `shop_category`;

CREATE TABLE `shop_category` (
  `id` bigint(20) unsigned NOT NULL auto_increment,
  `name` varchar(255) NOT NULL default '',
  `pid` bigint(20) unsigned default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK6A31321CDBFCB7FC` (`pid`),
  CONSTRAINT `FK_shop_category` FOREIGN KEY (`pid`) REFERENCES `shop_category` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

/*Data for the table `shop_category` */

insert  into `shop_category`(`id`,`name`,`pid`) values (2,'a1',NULL),(17,'啊啊',NULL);

/*Table structure for table `shop_item` */

DROP TABLE IF EXISTS `shop_item`;

CREATE TABLE `shop_item` (
  `id` bigint(20) unsigned NOT NULL auto_increment,
  `name` varchar(511) NOT NULL,
  `img` varchar(511) NOT NULL,
  `description` text,
  `price` float(10,2) unsigned NOT NULL,
  `creator` bigint(20) NOT NULL default '0',
  `category_id` bigint(20) unsigned NOT NULL,
  `create_time` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_shop_item_1` (`category_id`),
  KEY `FK_shop_item_2` (`creator`),
  CONSTRAINT `FK_shop_item_1` FOREIGN KEY (`category_id`) REFERENCES `shop_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_shop_item_2` FOREIGN KEY (`creator`) REFERENCES `ss_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `shop_item` */

insert  into `shop_item`(`id`,`name`,`img`,`description`,`price`,`creator`,`category_id`,`create_time`) values (1,'sdfdsf','','dsfsd',0.01,1,2,'2010-05-16 23:00:07'),(2,'fdgfd','1274112086093.jpg','sdfsdfs',0.02,1,2,'2010-05-18 00:01:26');

/*Table structure for table `ss_authority` */

DROP TABLE IF EXISTS `ss_authority`;

CREATE TABLE `ss_authority` (
  `id` bigint(20) NOT NULL auto_increment,
  `display_name` varchar(255) default NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `ss_authority` */

insert  into `ss_authority`(`id`,`display_name`,`name`) values (1,'浏览用户','A_VIEW_USER'),(2,'修改用户','A_MODIFY_USER'),(3,'浏览角色','A_VIEW_ROLE'),(4,'修改角色','A_MODIFY_ROLE'),(5,'浏览商品分类','A_VIEW_CATEGORY'),(6,'修改商品分类','A_MODIFY_CATEGORY'),(7,'浏览商品','A_VIEW_ITEM'),(8,'修改商品','A_MODIFY_ITEM');

/*Table structure for table `ss_resource` */

DROP TABLE IF EXISTS `ss_resource`;

CREATE TABLE `ss_resource` (
  `id` bigint(20) NOT NULL auto_increment,
  `position` double NOT NULL,
  `resource_type` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `value` (`value`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `ss_resource` */

insert  into `ss_resource`(`id`,`position`,`resource_type`,`value`) values (1,1,'url','/security/user!save*'),(2,2,'url','/security/user!delete*'),(3,3,'url','/security/user*'),(4,4,'url','/security/role!save*'),(5,5,'url','/security/role!delete*'),(6,6,'url','/security/role*'),(7,7,'url','/security/category!save*'),(8,8,'url','/security/category!delete*'),(9,9,'url','/security/category*');

/*Table structure for table `ss_resource_authority` */

DROP TABLE IF EXISTS `ss_resource_authority`;

CREATE TABLE `ss_resource_authority` (
  `resource_id` bigint(20) NOT NULL,
  `authority_id` bigint(20) NOT NULL,
  KEY `FKD7216891C67601C1` (`authority_id`),
  KEY `FKD721689170DB5B33` (`resource_id`),
  CONSTRAINT `FKD721689170DB5B33` FOREIGN KEY (`resource_id`) REFERENCES `ss_resource` (`id`),
  CONSTRAINT `FKD7216891C67601C1` FOREIGN KEY (`authority_id`) REFERENCES `ss_authority` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `ss_resource_authority` */

insert  into `ss_resource_authority`(`resource_id`,`authority_id`) values (1,2),(2,2),(3,1),(4,4),(5,4),(6,3),(7,6),(8,6),(9,5);

/*Table structure for table `ss_role` */

DROP TABLE IF EXISTS `ss_role`;

CREATE TABLE `ss_role` (
  `id` bigint(20) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `ss_role` */

insert  into `ss_role`(`id`,`name`) values (2,'用户'),(1,'管理员');

/*Table structure for table `ss_role_authority` */

DROP TABLE IF EXISTS `ss_role_authority`;

CREATE TABLE `ss_role_authority` (
  `role_id` bigint(20) NOT NULL,
  `authority_id` bigint(20) NOT NULL,
  KEY `FKE536BA7993BA26B3` (`role_id`),
  KEY `FKE536BA79C67601C1` (`authority_id`),
  CONSTRAINT `FKE536BA7993BA26B3` FOREIGN KEY (`role_id`) REFERENCES `ss_role` (`id`),
  CONSTRAINT `FKE536BA79C67601C1` FOREIGN KEY (`authority_id`) REFERENCES `ss_authority` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `ss_role_authority` */

insert  into `ss_role_authority`(`role_id`,`authority_id`) values (2,1),(2,5),(1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8);

/*Table structure for table `ss_user` */

DROP TABLE IF EXISTS `ss_user`;

CREATE TABLE `ss_user` (
  `id` bigint(20) NOT NULL auto_increment,
  `email` varchar(255) default NULL,
  `login_name` varchar(255) NOT NULL,
  `name` varchar(255) default NULL,
  `password` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `login_name` (`login_name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `ss_user` */

insert  into `ss_user`(`id`,`email`,`login_name`,`name`,`password`) values (1,'admin@springside.org.cn','admin','Admin','21232f297a57a5a743894a0e4a801fc3'),(2,'user@springside.org.cn','user','User','96e79218965eb72c92a549dd5a330112'),(3,'jack@springside.org.cn','user2','Jack','user2'),(4,'kate@springside.org.cn','user3','Kate','user3'),(5,'sawyer@springside.org.cn','user4','Sawyer','user4'),(6,'ben@springside.org.cn','user5','Ben','user5'),(9,'usertest1@sdf.com','usertest1','usertest1','21232f297a57a5a743894a0e4a801fc3'),(10,'usertest2@usertest2.com','usertest2','usertest2','21232f297a57a5a743894a0e4a801fc3');

/*Table structure for table `ss_user_role` */

DROP TABLE IF EXISTS `ss_user_role`;

CREATE TABLE `ss_user_role` (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  KEY `FK1306854B38E4EA93` (`user_id`),
  KEY `FK1306854B93BA26B3` (`role_id`),
  CONSTRAINT `FK1306854B38E4EA93` FOREIGN KEY (`user_id`) REFERENCES `ss_user` (`id`),
  CONSTRAINT `FK1306854B93BA26B3` FOREIGN KEY (`role_id`) REFERENCES `ss_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `ss_user_role` */

insert  into `ss_user_role`(`user_id`,`role_id`) values (1,1),(1,2),(2,2),(3,2),(4,2),(5,2),(6,2),(9,1),(9,2),(10,1),(10,2);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
