/*
SQLyog Ultimate v11.24 (32 bit)
MySQL - 5.1.73 : Database - webpy_test
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`webpy_test` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `webpy_test`;

/*Table structure for table `admin_auth` */

CREATE TABLE `admin_auth` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `controller` varchar(255) NOT NULL,
  `action` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL COMMENT '功能说明',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT ' 认证类别\n0  菜单 有链接\n1 菜单, 用于表示菜单分类\n2 操作, 页面中的操作, 不显示在菜单中',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `admin_auth` */

insert  into `admin_auth`(`id`,`controller`,`action`,`name`,`parent_id`,`type`) values (1,'auth','index','权限管理',0,0);

/*Table structure for table `admin_role` */

CREATE TABLE `admin_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `admin_role` */

insert  into `admin_role`(`id`,`name`) values (1,'超级管理员');
insert  into `admin_role`(`id`,`name`) values (2,'注册用户');

/*Table structure for table `admin_role_auth_link` */

CREATE TABLE `admin_role_auth_link` (
  `role_id` int(10) unsigned NOT NULL,
  `auth_id` int(10) unsigned NOT NULL,
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `admin_role_auth_link` */

insert  into `admin_role_auth_link`(`role_id`,`auth_id`,`id`) values (1,1,1);

/*Table structure for table `admin_user` */

CREATE TABLE `admin_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL COMMENT '展示用',
  `account` varchar(255) NOT NULL COMMENT '登录用',
  `password` varchar(255) NOT NULL,
  `create_time` int(10) unsigned NOT NULL DEFAULT '0',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `acc` (`account`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `admin_user` */

insert  into `admin_user`(`id`,`username`,`account`,`password`,`create_time`,`update_time`) values (1,'超级管理员','admin','96e79218965eb72c92a549dd5a330112',1431780329,1431780329);
insert  into `admin_user`(`id`,`username`,`account`,`password`,`create_time`,`update_time`) values (2,'admin','admin2','96e79218965eb72c92a549dd5a330112',1465728391,0);
insert  into `admin_user`(`id`,`username`,`account`,`password`,`create_time`,`update_time`) values (3,'','admin1','96e79218965eb72c92a549dd5a330112',1465728499,0);

/*Table structure for table `admin_user_role_link` */

CREATE TABLE `admin_user_role_link` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `admin_user_role_link` */

insert  into `admin_user_role_link`(`id`,`user_id`,`role_id`) values (1,1,1);

/*Table structure for table `sessions` */

CREATE TABLE `sessions` (
  `session_id` char(128) CHARACTER SET latin1 NOT NULL,
  `atime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `data` text CHARACTER SET latin1,
  UNIQUE KEY `session_id` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sessions` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
