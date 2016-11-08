/*
SQLyog Enterprise v12.08 (64 bit)
MySQL - 10.1.8-MariaDB : Database - khnapps_main
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`khnapps_main` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `khnapps_main`;

/*Table structure for table `admin_auths` */

DROP TABLE IF EXISTS `admin_auths`;

CREATE TABLE `admin_auths` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `controller` varchar(255) NOT NULL,
  `action` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL COMMENT '功能说明',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT ' 认证类别\n0  菜单 有链接\n1 菜单, 用于表示菜单分类\n2 操作, 页面中的操作, 不显示在菜单中',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `admin_auths` */

insert  into `admin_auths`(`id`,`controller`,`action`,`name`,`parent_id`,`type`) values (1,'auth','index','权限管理',2,0),(2,'','','系统管理',0,1),(3,'','','文章管理',0,1),(4,'article','index','文章列表',3,0),(6,'role','index','角色管理',2,0),(7,'role','add','添加角色',2,0),(8,'auth','add','添加权限',2,0),(9,'user','add','添加用户',2,0),(10,'user','index','用户管理',2,0);

/*Table structure for table `admin_role_auth` */

DROP TABLE IF EXISTS `admin_role_auth`;

CREATE TABLE `admin_role_auth` (
  `role_id` int(10) unsigned NOT NULL,
  `auth_id` int(10) unsigned NOT NULL,
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `admin_role_auth` */

insert  into `admin_role_auth`(`role_id`,`auth_id`,`id`) values (1,1,1);

/*Table structure for table `admin_roles` */

DROP TABLE IF EXISTS `admin_roles`;

CREATE TABLE `admin_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `admin_roles` */

insert  into `admin_roles`(`id`,`name`) values (1,'超级管理员'),(2,'注册用户');

/*Table structure for table `admin_user_role` */

DROP TABLE IF EXISTS `admin_user_role`;

CREATE TABLE `admin_user_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `admin_user_role` */

insert  into `admin_user_role`(`id`,`user_id`,`role_id`) values (1,1,1);

/*Table structure for table `admin_users` */

DROP TABLE IF EXISTS `admin_users`;

CREATE TABLE `admin_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL COMMENT '展示用',
  `account` varchar(255) NOT NULL COMMENT '登录用',
  `password` varchar(255) NOT NULL,
  `create_time` int(10) unsigned NOT NULL DEFAULT '0',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `acc` (`account`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `admin_users` */

insert  into `admin_users`(`id`,`username`,`account`,`password`,`create_time`,`update_time`) values (1,'超级管理员','admin','e3d38af46f7fe58f71a62d16e8afdf6178caa6047f9e300426f998a60243fd25',1431780329,1431780329),(5,'1','1','6ec54c0a8eb247ecd4333502451bf063170c6f394a702875fcf8f451cc512ccf',1453990982,1453990982),(6,'2','2','672cb655f6b578f86da030989c0cb3460edcf3dcc0ed6531e99cd3bcb7e19449',1453991039,1453991039);

/*Table structure for table `sessions` */

DROP TABLE IF EXISTS `sessions`;

CREATE TABLE `sessions` (
  `session_id` varchar(24) NOT NULL,
  `last_active` int(10) unsigned NOT NULL,
  `contents` text NOT NULL,
  PRIMARY KEY (`session_id`),
  KEY `last_active` (`last_active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sessions` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
