/*
SQLyog Ultimate v11.24 (32 bit)
MySQL - 5.1.73 : Database - phpcms_centos1
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`phpcms_centos1` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `phpcms_centos1`;

/*Table structure for table `v9_admin` */

CREATE TABLE `v9_admin` (
  `userid` mediumint(6) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `roleid` smallint(5) DEFAULT '0',
  `encrypt` varchar(6) DEFAULT NULL,
  `lastloginip` varchar(15) DEFAULT NULL,
  `lastlogintime` int(10) unsigned DEFAULT '0',
  `email` varchar(40) DEFAULT NULL,
  `realname` varchar(50) NOT NULL DEFAULT '',
  `card` varchar(255) NOT NULL,
  `lang` varchar(6) NOT NULL,
  PRIMARY KEY (`userid`),
  KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `v9_admin` */

insert  into `v9_admin`(`userid`,`username`,`password`,`roleid`,`encrypt`,`lastloginip`,`lastlogintime`,`email`,`realname`,`card`,`lang`) values (1,'phpcms','2acd224d231b72e94c07d8f19b6ff04e',1,'ZdjfT6','192.168.56.1',1465268981,'tangboqi@jindanlicai.com','','','');

/*Table structure for table `v9_admin_panel` */

CREATE TABLE `v9_admin_panel` (
  `menuid` mediumint(8) unsigned NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `name` char(32) DEFAULT NULL,
  `url` char(255) DEFAULT NULL,
  `datetime` int(10) unsigned DEFAULT '0',
  UNIQUE KEY `userid` (`menuid`,`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_admin_panel` */

/*Table structure for table `v9_admin_role` */

CREATE TABLE `v9_admin_role` (
  `roleid` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `rolename` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`roleid`),
  KEY `listorder` (`listorder`),
  KEY `disabled` (`disabled`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `v9_admin_role` */

insert  into `v9_admin_role`(`roleid`,`rolename`,`description`,`listorder`,`disabled`) values (1,'超级管理员','超级管理员',0,0);
insert  into `v9_admin_role`(`roleid`,`rolename`,`description`,`listorder`,`disabled`) values (2,'站点管理员','站点管理员',0,0);
insert  into `v9_admin_role`(`roleid`,`rolename`,`description`,`listorder`,`disabled`) values (3,'运营总监','运营总监',1,0);
insert  into `v9_admin_role`(`roleid`,`rolename`,`description`,`listorder`,`disabled`) values (4,'总编','总编',5,0);
insert  into `v9_admin_role`(`roleid`,`rolename`,`description`,`listorder`,`disabled`) values (5,'编辑','编辑',1,0);
insert  into `v9_admin_role`(`roleid`,`rolename`,`description`,`listorder`,`disabled`) values (7,'发布人员','发布人员',0,0);

/*Table structure for table `v9_admin_role_priv` */

CREATE TABLE `v9_admin_role_priv` (
  `roleid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `m` char(20) NOT NULL,
  `c` char(20) NOT NULL,
  `a` char(20) NOT NULL,
  `data` char(30) NOT NULL DEFAULT '',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  KEY `roleid` (`roleid`,`m`,`c`,`a`,`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_admin_role_priv` */

/*Table structure for table `v9_announce` */

CREATE TABLE `v9_announce` (
  `aid` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `title` char(80) NOT NULL,
  `content` text NOT NULL,
  `starttime` date NOT NULL DEFAULT '0000-00-00',
  `endtime` date NOT NULL DEFAULT '0000-00-00',
  `username` varchar(40) NOT NULL,
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `hits` smallint(5) unsigned NOT NULL DEFAULT '0',
  `passed` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `style` char(15) NOT NULL,
  `show_template` char(30) NOT NULL,
  PRIMARY KEY (`aid`),
  KEY `siteid` (`siteid`,`passed`,`endtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_announce` */

/*Table structure for table `v9_attachment` */

CREATE TABLE `v9_attachment` (
  `aid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `module` char(15) NOT NULL,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `filename` char(50) NOT NULL,
  `filepath` char(200) NOT NULL,
  `filesize` int(10) unsigned NOT NULL DEFAULT '0',
  `fileext` char(10) NOT NULL,
  `isimage` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isthumb` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `downloads` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `uploadtime` int(10) unsigned NOT NULL DEFAULT '0',
  `uploadip` char(15) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `authcode` char(32) NOT NULL,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`aid`),
  KEY `authcode` (`authcode`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `v9_attachment` */

insert  into `v9_attachment`(`aid`,`module`,`catid`,`filename`,`filepath`,`filesize`,`fileext`,`isimage`,`isthumb`,`downloads`,`userid`,`uploadtime`,`uploadip`,`status`,`authcode`,`siteid`) values (1,'special',0,'QQ图片20160511114543.png','2016/0607/20160607114205720.png',5452,'png',1,0,0,1,1465270925,'192.168.56.1',1,'a1ef82186da415666c7e9e254018d022',1);
insert  into `v9_attachment`(`aid`,`module`,`catid`,`filename`,`filepath`,`filesize`,`fileext`,`isimage`,`isthumb`,`downloads`,`userid`,`uploadtime`,`uploadip`,`status`,`authcode`,`siteid`) values (2,'content',6,'QQ图片20160511114543.png','2016/0607/20160607011046646.png',5452,'png',1,0,0,1,1465276245,'192.168.56.1',1,'8893719200d6d0e2579a71fb40b33f44',1);

/*Table structure for table `v9_attachment_index` */

CREATE TABLE `v9_attachment_index` (
  `keyid` char(30) NOT NULL,
  `aid` char(10) NOT NULL,
  KEY `keyid` (`keyid`),
  KEY `aid` (`aid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_attachment_index` */

insert  into `v9_attachment_index`(`keyid`,`aid`) values ('special-1','1');
insert  into `v9_attachment_index`(`keyid`,`aid`) values ('c-6-1','2');

/*Table structure for table `v9_badword` */

CREATE TABLE `v9_badword` (
  `badid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `badword` char(20) NOT NULL,
  `level` tinyint(5) NOT NULL DEFAULT '1',
  `replaceword` char(20) NOT NULL DEFAULT '0',
  `lastusetime` int(10) unsigned NOT NULL DEFAULT '0',
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`badid`),
  UNIQUE KEY `badword` (`badword`),
  KEY `usetimes` (`replaceword`,`listorder`),
  KEY `hits` (`listorder`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_badword` */

/*Table structure for table `v9_block` */

CREATE TABLE `v9_block` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned DEFAULT '0',
  `name` char(50) DEFAULT NULL,
  `pos` char(30) DEFAULT NULL,
  `type` tinyint(1) DEFAULT '0',
  `data` text,
  `template` text,
  PRIMARY KEY (`id`),
  KEY `pos` (`pos`),
  KEY `type` (`type`),
  KEY `siteid` (`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_block` */

/*Table structure for table `v9_block_history` */

CREATE TABLE `v9_block_history` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `blockid` int(10) unsigned DEFAULT '0',
  `data` text,
  `creat_at` int(10) unsigned DEFAULT '0',
  `userid` mediumint(8) unsigned DEFAULT '0',
  `username` char(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_block_history` */

/*Table structure for table `v9_block_priv` */

CREATE TABLE `v9_block_priv` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `roleid` tinyint(3) unsigned DEFAULT '0',
  `siteid` smallint(5) unsigned DEFAULT '0',
  `blockid` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `blockid` (`blockid`),
  KEY `roleid` (`roleid`,`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_block_priv` */

/*Table structure for table `v9_cache` */

CREATE TABLE `v9_cache` (
  `filename` char(50) NOT NULL,
  `path` char(50) NOT NULL,
  `data` mediumtext NOT NULL,
  PRIMARY KEY (`filename`,`path`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_cache` */

insert  into `v9_cache`(`filename`,`path`,`data`) values ('mood_program.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n  1 => \n  array (\n    1 => \n    array (\n      \'use\' => \'1\',\n      \'name\' => \'震惊\',\n      \'pic\' => \'mood/a1.gif\',\n    ),\n    2 => \n    array (\n      \'use\' => \'1\',\n      \'name\' => \'不解\',\n      \'pic\' => \'mood/a2.gif\',\n    ),\n    3 => \n    array (\n      \'use\' => \'1\',\n      \'name\' => \'愤怒\',\n      \'pic\' => \'mood/a3.gif\',\n    ),\n    4 => \n    array (\n      \'use\' => \'1\',\n      \'name\' => \'杯具\',\n      \'pic\' => \'mood/a4.gif\',\n    ),\n    5 => \n    array (\n      \'use\' => \'1\',\n      \'name\' => \'无聊\',\n      \'pic\' => \'mood/a5.gif\',\n    ),\n    6 => \n    array (\n      \'use\' => \'1\',\n      \'name\' => \'高兴\',\n      \'pic\' => \'mood/a6.gif\',\n    ),\n    7 => \n    array (\n      \'use\' => \'1\',\n      \'name\' => \'支持\',\n      \'pic\' => \'mood/a7.gif\',\n    ),\n    8 => \n    array (\n      \'use\' => \'1\',\n      \'name\' => \'超赞\',\n      \'pic\' => \'mood/a8.gif\',\n    ),\n    9 => \n    array (\n      \'use\' => NULL,\n      \'name\' => \'\',\n      \'pic\' => \'\',\n    ),\n    10 => \n    array (\n      \'use\' => NULL,\n      \'name\' => \'\',\n      \'pic\' => \'\',\n    ),\n  ),\n);\n?>');
insert  into `v9_cache`(`filename`,`path`,`data`) values ('category_content.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n  6 => \'1\',\n  1 => \'1\',\n  2 => \'1\',\n  3 => \'1\',\n  4 => \'1\',\n  5 => \'1\',\n);\n?>');
insert  into `v9_cache`(`filename`,`path`,`data`) values ('category_content_1.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n  6 => \n  array (\n    \'catid\' => \'6\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'1\',\n    \'parentid\' => \'0\',\n    \'arrparentid\' => \'\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'\',\n    \'catname\' => \'a\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'aa\',\n    \'parentdir\' => \'\',\n    \'catdir\' => \'aa\',\n    \'url\' => \'http://phpcms_centos.com\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category\",\"list_template\":\"list\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}\',\n    \'listorder\' => \'0\',\n    \'ismenu\' => \'1\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'a\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  1 => \n  array (\n    \'catid\' => \'1\',\n    \'siteid\' => \'1\',\n    \'type\' => \'1\',\n    \'modelid\' => \'0\',\n    \'parentid\' => \'0\',\n    \'arrparentid\' => \'0\',\n    \'child\' => \'1\',\n    \'arrchildid\' => \'1,2,3,4,5\',\n    \'catname\' => \'网站介绍\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'\',\n    \'catdir\' => \'about\',\n    \'url\' => \'http://phpcms_centos.com/html/about/\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'array (\n  \\\'ishtml\\\' => \\\'1\\\',\n  \\\'template_list\\\' => \\\'default\\\',\n  \\\'page_template\\\' => \\\'page\\\',\n  \\\'meta_title\\\' => \\\'\\\',\n  \\\'meta_keywords\\\' => \\\'\\\',\n  \\\'meta_description\\\' => \\\'\\\',\n  \\\'category_ruleid\\\' => \\\'1\\\',\n  \\\'show_ruleid\\\' => \\\'\\\',\n  \\\'repeatchargedays\\\' => \\\'1\\\',\n)\',\n    \'listorder\' => \'1\',\n    \'ismenu\' => \'0\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'wangzhanjieshao\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => NULL,\n    \'ishtml\' => \'1\',\n    \'content_ishtml\' => NULL,\n    \'category_ruleid\' => \'1\',\n    \'show_ruleid\' => \'\',\n    \'workflowid\' => NULL,\n    \'isdomain\' => \'0\',\n  ),\n  2 => \n  array (\n    \'catid\' => \'2\',\n    \'siteid\' => \'1\',\n    \'type\' => \'1\',\n    \'modelid\' => \'0\',\n    \'parentid\' => \'1\',\n    \'arrparentid\' => \'0,1\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'2\',\n    \'catname\' => \'关于我们\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'about/\',\n    \'catdir\' => \'aboutus\',\n    \'url\' => \'http://phpcms_centos.com/html/about/aboutus/\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'array (\n  \\\'ishtml\\\' => \\\'1\\\',\n  \\\'template_list\\\' => \\\'default\\\',\n  \\\'page_template\\\' => \\\'page\\\',\n  \\\'meta_title\\\' => \\\'关于我们\\\',\n  \\\'meta_keywords\\\' => \\\'关于我们\\\',\n  \\\'meta_description\\\' => \\\'关于我们\\\',\n  \\\'category_ruleid\\\' => \\\'1\\\',\n  \\\'show_ruleid\\\' => \\\'\\\',\n  \\\'repeatchargedays\\\' => \\\'1\\\',\n)\',\n    \'listorder\' => \'1\',\n    \'ismenu\' => \'1\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'guanyuwomen\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => NULL,\n    \'ishtml\' => \'1\',\n    \'content_ishtml\' => NULL,\n    \'category_ruleid\' => \'1\',\n    \'show_ruleid\' => \'\',\n    \'workflowid\' => NULL,\n    \'isdomain\' => \'0\',\n  ),\n  3 => \n  array (\n    \'catid\' => \'3\',\n    \'siteid\' => \'1\',\n    \'type\' => \'1\',\n    \'modelid\' => \'0\',\n    \'parentid\' => \'1\',\n    \'arrparentid\' => \'0,1\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'3\',\n    \'catname\' => \'联系方式\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'about/\',\n    \'catdir\' => \'contactus\',\n    \'url\' => \'http://phpcms_centos.com/html/about/contactus/\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'array (\n  \\\'ishtml\\\' => \\\'1\\\',\n  \\\'template_list\\\' => \\\'default\\\',\n  \\\'page_template\\\' => \\\'page\\\',\n  \\\'meta_title\\\' => \\\'联系方式\\\',\n  \\\'meta_keywords\\\' => \\\'联系方式\\\',\n  \\\'meta_description\\\' => \\\'联系方式\\\',\n  \\\'category_ruleid\\\' => \\\'1\\\',\n  \\\'show_ruleid\\\' => \\\'\\\',\n  \\\'repeatchargedays\\\' => \\\'1\\\',\n)\',\n    \'listorder\' => \'2\',\n    \'ismenu\' => \'1\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'lianxifangshi\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => NULL,\n    \'ishtml\' => \'1\',\n    \'content_ishtml\' => NULL,\n    \'category_ruleid\' => \'1\',\n    \'show_ruleid\' => \'\',\n    \'workflowid\' => NULL,\n    \'isdomain\' => \'0\',\n  ),\n  4 => \n  array (\n    \'catid\' => \'4\',\n    \'siteid\' => \'1\',\n    \'type\' => \'1\',\n    \'modelid\' => \'0\',\n    \'parentid\' => \'1\',\n    \'arrparentid\' => \'0,1\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'4\',\n    \'catname\' => \'版权声明\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'about/\',\n    \'catdir\' => \'copyright\',\n    \'url\' => \'http://phpcms_centos.com/index.php?m=content&c=index&a=lists&catid=4\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'array (\n  \\\'ishtml\\\' => \\\'0\\\',\n  \\\'template_list\\\' => \\\'default\\\',\n  \\\'page_template\\\' => \\\'page\\\',\n  \\\'meta_title\\\' => \\\'版权声明\\\',\n  \\\'meta_keywords\\\' => \\\'版权声明\\\',\n  \\\'meta_description\\\' => \\\'版权声明\\\',\n  \\\'category_ruleid\\\' => \\\'6\\\',\n  \\\'show_ruleid\\\' => \\\'\\\',\n  \\\'repeatchargedays\\\' => \\\'1\\\',\n)\',\n    \'listorder\' => \'3\',\n    \'ismenu\' => \'1\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'banquanshengming\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => NULL,\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => NULL,\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'\',\n    \'workflowid\' => NULL,\n    \'isdomain\' => \'0\',\n  ),\n  5 => \n  array (\n    \'catid\' => \'5\',\n    \'siteid\' => \'1\',\n    \'type\' => \'1\',\n    \'modelid\' => \'0\',\n    \'parentid\' => \'1\',\n    \'arrparentid\' => \'0,1\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'5\',\n    \'catname\' => \'招聘信息\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'about/\',\n    \'catdir\' => \'hr\',\n    \'url\' => \'http://phpcms_centos.com/html/about/hr/\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'array (\n  \\\'ishtml\\\' => \\\'1\\\',\n  \\\'template_list\\\' => \\\'default\\\',\n  \\\'page_template\\\' => \\\'page\\\',\n  \\\'meta_title\\\' => \\\'\\\',\n  \\\'meta_keywords\\\' => \\\'\\\',\n  \\\'meta_description\\\' => \\\'\\\',\n  \\\'category_ruleid\\\' => \\\'1\\\',\n  \\\'show_ruleid\\\' => \\\'\\\',\n  \\\'repeatchargedays\\\' => \\\'1\\\',\n)\',\n    \'listorder\' => \'4\',\n    \'ismenu\' => \'1\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'zhaopinxinxi\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => NULL,\n    \'ishtml\' => \'1\',\n    \'content_ishtml\' => NULL,\n    \'category_ruleid\' => \'1\',\n    \'show_ruleid\' => \'\',\n    \'workflowid\' => NULL,\n    \'isdomain\' => \'0\',\n  ),\n);\n?>');
insert  into `v9_cache`(`filename`,`path`,`data`) values ('sitelist.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n  1 => \n  array (\n    \'siteid\' => \'1\',\n    \'name\' => \'默认站点\',\n    \'dirname\' => \'\',\n    \'domain\' => \'http://phpcms_centos.com/\',\n    \'site_title\' => \'PHPCMS演示站\',\n    \'keywords\' => \'PHPCMS演示站\',\n    \'description\' => \'PHPCMS演示站\',\n    \'release_point\' => \'\',\n    \'default_style\' => \'default\',\n    \'template\' => \'default\',\n    \'setting\' => \'{\"upload_maxsize\":\"2048\",\"upload_allowext\":\"jpg|jpeg|gif|bmp|png|doc|docx|xls|xlsx|ppt|pptx|pdf|txt|rar|zip|swf\",\"watermark_enable\":\"1\",\"watermark_minwidth\":\"300\",\"watermark_minheight\":\"300\",\"watermark_img\":\"statics\\\\/images\\\\/water\\\\/\\\\/mark.png\",\"watermark_pct\":\"85\",\"watermark_quality\":\"80\",\"watermark_pos\":\"9\"}\',\n    \'uuid\' => \'5ef268f2-2bea-11e6-8e5f-080027f993c5\',\n    \'url\' => \'http://phpcms_centos.com/\',\n  ),\n);\n?>');
insert  into `v9_cache`(`filename`,`path`,`data`) values ('category_items_1.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n  6 => \'1\',\n);\n?>');
insert  into `v9_cache`(`filename`,`path`,`data`) values ('downservers.cache.php','caches_commons/caches_data/','<?php\nreturn NULL;\n?>');
insert  into `v9_cache`(`filename`,`path`,`data`) values ('badword.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n);\n?>');
insert  into `v9_cache`(`filename`,`path`,`data`) values ('ipbanned.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n);\n?>');
insert  into `v9_cache`(`filename`,`path`,`data`) values ('keylink.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n);\n?>');
insert  into `v9_cache`(`filename`,`path`,`data`) values ('position.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n  2 => \n  array (\n    \'posid\' => \'2\',\n    \'modelid\' => \'0\',\n    \'catid\' => \'0\',\n    \'name\' => \'首页头条推荐\',\n    \'maxnum\' => \'20\',\n    \'extention\' => NULL,\n    \'listorder\' => \'4\',\n    \'siteid\' => \'1\',\n    \'thumb\' => \'\',\n  ),\n  1 => \n  array (\n    \'posid\' => \'1\',\n    \'modelid\' => \'0\',\n    \'catid\' => \'0\',\n    \'name\' => \'首页焦点图推荐\',\n    \'maxnum\' => \'20\',\n    \'extention\' => NULL,\n    \'listorder\' => \'1\',\n    \'siteid\' => \'1\',\n    \'thumb\' => \'\',\n  ),\n  16 => \n  array (\n    \'posid\' => \'16\',\n    \'modelid\' => \'0\',\n    \'catid\' => \'0\',\n    \'name\' => \'视频首页每日热点\',\n    \'maxnum\' => \'20\',\n    \'extention\' => \'\',\n    \'listorder\' => \'0\',\n    \'siteid\' => \'1\',\n    \'thumb\' => \'\',\n  ),\n  15 => \n  array (\n    \'posid\' => \'15\',\n    \'modelid\' => \'0\',\n    \'catid\' => \'0\',\n    \'name\' => \'视频首页头条推荐\',\n    \'maxnum\' => \'20\',\n    \'extention\' => \'\',\n    \'listorder\' => \'0\',\n    \'siteid\' => \'1\',\n    \'thumb\' => \'\',\n  ),\n  14 => \n  array (\n    \'posid\' => \'14\',\n    \'modelid\' => \'0\',\n    \'catid\' => \'0\',\n    \'name\' => \'视频首页焦点图\',\n    \'maxnum\' => \'20\',\n    \'extention\' => \'\',\n    \'listorder\' => \'0\',\n    \'siteid\' => \'1\',\n    \'thumb\' => \'\',\n  ),\n  12 => \n  array (\n    \'posid\' => \'12\',\n    \'modelid\' => \'0\',\n    \'catid\' => \'0\',\n    \'name\' => \'首页图片推荐\',\n    \'maxnum\' => \'20\',\n    \'extention\' => NULL,\n    \'listorder\' => \'0\',\n    \'siteid\' => \'1\',\n    \'thumb\' => \'\',\n  ),\n  10 => \n  array (\n    \'posid\' => \'10\',\n    \'modelid\' => \'0\',\n    \'catid\' => \'0\',\n    \'name\' => \'栏目首页推荐\',\n    \'maxnum\' => \'20\',\n    \'extention\' => NULL,\n    \'listorder\' => \'0\',\n    \'siteid\' => \'1\',\n    \'thumb\' => \'\',\n  ),\n  9 => \n  array (\n    \'posid\' => \'9\',\n    \'modelid\' => \'0\',\n    \'catid\' => \'0\',\n    \'name\' => \'网站顶部推荐\',\n    \'maxnum\' => \'20\',\n    \'extention\' => NULL,\n    \'listorder\' => \'0\',\n    \'siteid\' => \'1\',\n    \'thumb\' => \'\',\n  ),\n  8 => \n  array (\n    \'posid\' => \'8\',\n    \'modelid\' => \'30\',\n    \'catid\' => \'54\',\n    \'name\' => \'图片频道首页焦点图\',\n    \'maxnum\' => \'20\',\n    \'extention\' => NULL,\n    \'listorder\' => \'0\',\n    \'siteid\' => \'1\',\n    \'thumb\' => \'\',\n  ),\n  5 => \n  array (\n    \'posid\' => \'5\',\n    \'modelid\' => \'69\',\n    \'catid\' => \'0\',\n    \'name\' => \'推荐下载\',\n    \'maxnum\' => \'20\',\n    \'extention\' => NULL,\n    \'listorder\' => \'0\',\n    \'siteid\' => \'1\',\n    \'thumb\' => \'\',\n  ),\n  13 => \n  array (\n    \'posid\' => \'13\',\n    \'modelid\' => \'82\',\n    \'catid\' => \'0\',\n    \'name\' => \'栏目页焦点图\',\n    \'maxnum\' => \'20\',\n    \'extention\' => NULL,\n    \'listorder\' => \'0\',\n    \'siteid\' => \'1\',\n    \'thumb\' => \'\',\n  ),\n  17 => \n  array (\n    \'posid\' => \'17\',\n    \'modelid\' => \'0\',\n    \'catid\' => \'0\',\n    \'name\' => \'视频栏目精彩推荐\',\n    \'maxnum\' => \'20\',\n    \'extention\' => \'\',\n    \'listorder\' => \'0\',\n    \'siteid\' => \'1\',\n    \'thumb\' => \'\',\n  ),\n);\n?>');
insert  into `v9_cache`(`filename`,`path`,`data`) values ('role_siteid.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n);\n?>');
insert  into `v9_cache`(`filename`,`path`,`data`) values ('role.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n  1 => \'超级管理员\',\n  2 => \'站点管理员\',\n  3 => \'运营总监\',\n  4 => \'总编\',\n  5 => \'编辑\',\n  7 => \'发布人员\',\n);\n?>');
insert  into `v9_cache`(`filename`,`path`,`data`) values ('urlrules_detail.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n  1 => \n  array (\n    \'urlruleid\' => \'1\',\n    \'module\' => \'content\',\n    \'file\' => \'category\',\n    \'ishtml\' => \'1\',\n    \'urlrule\' => \'{$categorydir}{$catdir}/index.html|{$categorydir}{$catdir}/{$page}.html\',\n    \'example\' => \'news/china/1000.html\',\n  ),\n  6 => \n  array (\n    \'urlruleid\' => \'6\',\n    \'module\' => \'content\',\n    \'file\' => \'category\',\n    \'ishtml\' => \'0\',\n    \'urlrule\' => \'index.php?m=content&c=index&a=lists&catid={$catid}|index.php?m=content&c=index&a=lists&catid={$catid}&page={$page}\',\n    \'example\' => \'index.php?m=content&c=index&a=lists&catid=1&page=1\',\n  ),\n  11 => \n  array (\n    \'urlruleid\' => \'11\',\n    \'module\' => \'content\',\n    \'file\' => \'show\',\n    \'ishtml\' => \'1\',\n    \'urlrule\' => \'{$year}/{$catdir}_{$month}{$day}/{$id}.html|{$year}/{$catdir}_{$month}{$day}/{$id}_{$page}.html\',\n    \'example\' => \'2010/catdir_0720/1_2.html\',\n  ),\n  12 => \n  array (\n    \'urlruleid\' => \'12\',\n    \'module\' => \'content\',\n    \'file\' => \'show\',\n    \'ishtml\' => \'1\',\n    \'urlrule\' => \'{$categorydir}{$catdir}/{$year}/{$month}{$day}/{$id}.html|{$categorydir}{$catdir}/{$year}/{$month}{$day}/{$id}_{$page}.html\',\n    \'example\' => \'it/product/2010/0720/1_2.html\',\n  ),\n  16 => \n  array (\n    \'urlruleid\' => \'16\',\n    \'module\' => \'content\',\n    \'file\' => \'show\',\n    \'ishtml\' => \'0\',\n    \'urlrule\' => \'index.php?m=content&c=index&a=show&catid={$catid}&id={$id}|index.php?m=content&c=index&a=show&catid={$catid}&id={$id}&page={$page}\',\n    \'example\' => \'index.php?m=content&c=index&a=show&catid=1&id=1\',\n  ),\n  17 => \n  array (\n    \'urlruleid\' => \'17\',\n    \'module\' => \'content\',\n    \'file\' => \'show\',\n    \'ishtml\' => \'0\',\n    \'urlrule\' => \'show-{$catid}-{$id}-{$page}.html\',\n    \'example\' => \'show-1-2-1.html\',\n  ),\n  18 => \n  array (\n    \'urlruleid\' => \'18\',\n    \'module\' => \'content\',\n    \'file\' => \'show\',\n    \'ishtml\' => \'0\',\n    \'urlrule\' => \'content-{$catid}-{$id}-{$page}.html\',\n    \'example\' => \'content-1-2-1.html\',\n  ),\n  30 => \n  array (\n    \'urlruleid\' => \'30\',\n    \'module\' => \'content\',\n    \'file\' => \'category\',\n    \'ishtml\' => \'0\',\n    \'urlrule\' => \'list-{$catid}-{$page}.html\',\n    \'example\' => \'list-1-1.html\',\n  ),\n);\n?>');
insert  into `v9_cache`(`filename`,`path`,`data`) values ('urlrules.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n  1 => \'{$categorydir}{$catdir}/index.html|{$categorydir}{$catdir}/{$page}.html\',\n  6 => \'index.php?m=content&c=index&a=lists&catid={$catid}|index.php?m=content&c=index&a=lists&catid={$catid}&page={$page}\',\n  11 => \'{$year}/{$catdir}_{$month}{$day}/{$id}.html|{$year}/{$catdir}_{$month}{$day}/{$id}_{$page}.html\',\n  12 => \'{$categorydir}{$catdir}/{$year}/{$month}{$day}/{$id}.html|{$categorydir}{$catdir}/{$year}/{$month}{$day}/{$id}_{$page}.html\',\n  16 => \'index.php?m=content&c=index&a=show&catid={$catid}&id={$id}|index.php?m=content&c=index&a=show&catid={$catid}&id={$id}&page={$page}\',\n  17 => \'show-{$catid}-{$id}-{$page}.html\',\n  18 => \'content-{$catid}-{$id}-{$page}.html\',\n  30 => \'list-{$catid}-{$page}.html\',\n);\n?>');
insert  into `v9_cache`(`filename`,`path`,`data`) values ('modules.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n  \'admin\' => \n  array (\n    \'module\' => \'admin\',\n    \'name\' => \'admin\',\n    \'url\' => \'\',\n    \'iscore\' => \'1\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'array (\n  \\\'admin_email\\\' => \\\'phpcms@phpcms.cn\\\',\n  \\\'adminaccessip\\\' => \\\'0\\\',\n  \\\'maxloginfailedtimes\\\' => \\\'8\\\',\n  \\\'maxiplockedtime\\\' => \\\'15\\\',\n  \\\'minrefreshtime\\\' => \\\'2\\\',\n  \\\'mail_type\\\' => \\\'1\\\',\n  \\\'mail_server\\\' => \\\'smtp.qq.com\\\',\n  \\\'mail_port\\\' => \\\'25\\\',\n  \\\'mail_user\\\' => \\\'phpcms.cn@foxmail.com\\\',\n  \\\'mail_auth\\\' => \\\'1\\\',\n  \\\'mail_from\\\' => \\\'phpcms.cn@foxmail.com\\\',\n  \\\'mail_password\\\' => \\\'\\\',\n  \\\'errorlog_size\\\' => \\\'20\\\',\n)\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-10-18\',\n    \'updatedate\' => \'2010-10-18\',\n  ),\n  \'member\' => \n  array (\n    \'module\' => \'member\',\n    \'name\' => \'会员\',\n    \'url\' => \'\',\n    \'iscore\' => \'1\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'{\"allowregister\":\"0\",\"choosemodel\":\"1\",\"enablemailcheck\":\"0\",\"enablcodecheck\":\"0\",\"mobile_checktype\":\"0\",\"user_sendsms_title\":\"\",\"registerverify\":\"0\",\"showapppoint\":\"0\",\"rmb_point_rate\":\"10\",\"defualtpoint\":\"0\",\"defualtamount\":\"0\",\"showregprotocol\":\"0\",\"regprotocol\":\"\\\\t\\\\t \\\\u6b22\\\\u8fce\\\\u60a8\\\\u6ce8\\\\u518c\\\\u6210\\\\u4e3aphpcms\\\\u7528\\\\u6237\\\\r\\\\n\\\\u8bf7\\\\u4ed4\\\\u7ec6\\\\u9605\\\\u8bfb\\\\u4e0b\\\\u9762\\\\u7684\\\\u534f\\\\u8bae\\\\uff0c\\\\u53ea\\\\u6709\\\\u63a5\\\\u53d7\\\\u534f\\\\u8bae\\\\u624d\\\\u80fd\\\\u7ee7\\\\u7eed\\\\u8fdb\\\\u884c\\\\u6ce8\\\\u518c\\\\u3002 \\\\r\\\\n1\\\\uff0e\\\\u670d\\\\u52a1\\\\u6761\\\\u6b3e\\\\u7684\\\\u786e\\\\u8ba4\\\\u548c\\\\u63a5\\\\u7eb3\\\\r\\\\n\\\\u3000\\\\u3000phpcms\\\\u7528\\\\u6237\\\\u670d\\\\u52a1\\\\u7684\\\\u6240\\\\u6709\\\\u6743\\\\u548c\\\\u8fd0\\\\u4f5c\\\\u6743\\\\u5f52phpcms\\\\u62e5\\\\u6709\\\\u3002phpcms\\\\u6240\\\\u63d0\\\\u4f9b\\\\u7684\\\\u670d\\\\u52a1\\\\u5c06\\\\u6309\\\\u7167\\\\u6709\\\\u5173\\\\u7ae0\\\\u7a0b\\\\u3001\\\\u670d\\\\u52a1\\\\u6761\\\\u6b3e\\\\u548c\\\\u64cd\\\\u4f5c\\\\u89c4\\\\u5219\\\\u4e25\\\\u683c\\\\u6267\\\\u884c\\\\u3002\\\\u7528\\\\u6237\\\\u901a\\\\u8fc7\\\\u6ce8\\\\u518c\\\\u7a0b\\\\u5e8f\\\\u70b9\\\\u51fb\\\\u201c\\\\u6211\\\\u540c\\\\u610f\\\\u201d \\\\u6309\\\\u94ae\\\\uff0c\\\\u5373\\\\u8868\\\\u793a\\\\u7528\\\\u6237\\\\u4e0ephpcms\\\\u8fbe\\\\u6210\\\\u534f\\\\u8bae\\\\u5e76\\\\u63a5\\\\u53d7\\\\u6240\\\\u6709\\\\u7684\\\\u670d\\\\u52a1\\\\u6761\\\\u6b3e\\\\u3002\\\\r\\\\n2\\\\uff0e phpcms\\\\u670d\\\\u52a1\\\\u7b80\\\\u4ecb\\\\r\\\\n\\\\u3000\\\\u3000phpcms\\\\u901a\\\\u8fc7\\\\u56fd\\\\u9645\\\\u4e92\\\\u8054\\\\u7f51\\\\u4e3a\\\\u7528\\\\u6237\\\\u63d0\\\\u4f9b\\\\u65b0\\\\u95fb\\\\u53ca\\\\u6587\\\\u7ae0\\\\u6d4f\\\\u89c8\\\\u3001\\\\u56fe\\\\u7247\\\\u6d4f\\\\u89c8\\\\u3001\\\\u8f6f\\\\u4ef6\\\\u4e0b\\\\u8f7d\\\\u3001\\\\u7f51\\\\u4e0a\\\\u7559\\\\u8a00\\\\u548cBBS\\\\u8bba\\\\u575b\\\\u7b49\\\\u670d\\\\u52a1\\\\u3002\\\\r\\\\n\\\\u3000\\\\u3000\\\\u7528\\\\u6237\\\\u5fc5\\\\u987b\\\\uff1a \\\\r\\\\n\\\\u3000\\\\u30001)\\\\u8d2d\\\\u7f6e\\\\u8bbe\\\\u5907\\\\uff0c\\\\u5305\\\\u62ec\\\\u4e2a\\\\u4eba\\\\u7535\\\\u8111\\\\u4e00\\\\u53f0\\\\u3001\\\\u8c03\\\\u5236\\\\u89e3\\\\u8c03\\\\u5668\\\\u4e00\\\\u4e2a\\\\u53ca\\\\u914d\\\\u5907\\\\u4e0a\\\\u7f51\\\\u88c5\\\\u7f6e\\\\u3002 \\\\r\\\\n\\\\u3000\\\\u30002)\\\\u4e2a\\\\u4eba\\\\u4e0a\\\\u7f51\\\\u548c\\\\u652f\\\\u4ed8\\\\u4e0e\\\\u6b64\\\\u670d\\\\u52a1\\\\u6709\\\\u5173\\\\u7684\\\\u7535\\\\u8bdd\\\\u8d39\\\\u7528\\\\u3001\\\\u7f51\\\\u7edc\\\\u8d39\\\\u7528\\\\u3002\\\\r\\\\n\\\\u3000\\\\u3000\\\\u7528\\\\u6237\\\\u540c\\\\u610f\\\\uff1a \\\\r\\\\n\\\\u3000\\\\u30001)\\\\u63d0\\\\u4f9b\\\\u53ca\\\\u65f6\\\\u3001\\\\u8be6\\\\u5c3d\\\\u53ca\\\\u51c6\\\\u786e\\\\u7684\\\\u4e2a\\\\u4eba\\\\u8d44\\\\u6599\\\\u3002 \\\\r\\\\n\\\\u3000\\\\u30002)\\\\u4e0d\\\\u65ad\\\\u66f4\\\\u65b0\\\\u6ce8\\\\u518c\\\\u8d44\\\\u6599\\\\uff0c\\\\u7b26\\\\u5408\\\\u53ca\\\\u65f6\\\\u3001\\\\u8be6\\\\u5c3d\\\\u3001\\\\u51c6\\\\u786e\\\\u7684\\\\u8981\\\\u6c42\\\\u3002\\\\u6240\\\\u6709\\\\u539f\\\\u59cb\\\\u952e\\\\u5165\\\\u7684\\\\u8d44\\\\u6599\\\\u5c06\\\\u5f15\\\\u7528\\\\u4e3a\\\\u6ce8\\\\u518c\\\\u8d44\\\\u6599\\\\u3002 \\\\r\\\\n\\\\u3000\\\\u30003)\\\\u7528\\\\u6237\\\\u540c\\\\u610f\\\\u9075\\\\u5b88\\\\u300a\\\\u4e2d\\\\u534e\\\\u4eba\\\\u6c11\\\\u5171\\\\u548c\\\\u56fd\\\\u4fdd\\\\u5b88\\\\u56fd\\\\u5bb6\\\\u79d8\\\\u5bc6\\\\u6cd5\\\\u300b\\\\u3001\\\\u300a\\\\u4e2d\\\\u534e\\\\u4eba\\\\u6c11\\\\u5171\\\\u548c\\\\u56fd\\\\u8ba1\\\\u7b97\\\\u673a\\\\u4fe1\\\\u606f\\\\u7cfb\\\\u7edf\\\\u5b89\\\\u5168\\\\u4fdd\\\\u62a4\\\\u6761\\\\u4f8b\\\\u300b\\\\u3001\\\\u300a\\\\u8ba1\\\\u7b97\\\\u673a\\\\u8f6f\\\\u4ef6\\\\u4fdd\\\\u62a4\\\\u6761\\\\u4f8b\\\\u300b\\\\u7b49\\\\u6709\\\\u5173\\\\u8ba1\\\\u7b97\\\\u673a\\\\u53ca\\\\u4e92\\\\u8054\\\\u7f51\\\\u89c4\\\\u5b9a\\\\u7684\\\\u6cd5\\\\u5f8b\\\\u548c\\\\u6cd5\\\\u89c4\\\\u3001\\\\u5b9e\\\\u65bd\\\\u529e\\\\u6cd5\\\\u3002\\\\u5728\\\\u4efb\\\\u4f55\\\\u60c5\\\\u51b5\\\\u4e0b\\\\uff0cphpcms\\\\u5408\\\\u7406\\\\u5730\\\\u8ba4\\\\u4e3a\\\\u7528\\\\u6237\\\\u7684\\\\u884c\\\\u4e3a\\\\u53ef\\\\u80fd\\\\u8fdd\\\\u53cd\\\\u4e0a\\\\u8ff0\\\\u6cd5\\\\u5f8b\\\\u3001\\\\u6cd5\\\\u89c4\\\\uff0cphpcms\\\\u53ef\\\\u4ee5\\\\u5728\\\\u4efb\\\\u4f55\\\\u65f6\\\\u5019\\\\uff0c\\\\u4e0d\\\\u7ecf\\\\u4e8b\\\\u5148\\\\u901a\\\\u77e5\\\\u7ec8\\\\u6b62\\\\u5411\\\\u8be5\\\\u7528\\\\u6237\\\\u63d0\\\\u4f9b\\\\u670d\\\\u52a1\\\\u3002\\\\u7528\\\\u6237\\\\u5e94\\\\u4e86\\\\u89e3\\\\u56fd\\\\u9645\\\\u4e92\\\\u8054\\\\u7f51\\\\u7684\\\\u65e0\\\\u56fd\\\\u754c\\\\u6027\\\\uff0c\\\\u5e94\\\\u7279\\\\u522b\\\\u6ce8\\\\u610f\\\\u9075\\\\u5b88\\\\u5f53\\\\u5730\\\\u6240\\\\u6709\\\\u6709\\\\u5173\\\\u7684\\\\u6cd5\\\\u5f8b\\\\u548c\\\\u6cd5\\\\u89c4\\\\u3002\\\\r\\\\n3\\\\uff0e \\\\u670d\\\\u52a1\\\\u6761\\\\u6b3e\\\\u7684\\\\u4fee\\\\u6539\\\\r\\\\n\\\\u3000\\\\u3000phpcms\\\\u4f1a\\\\u4e0d\\\\u5b9a\\\\u65f6\\\\u5730\\\\u4fee\\\\u6539\\\\u670d\\\\u52a1\\\\u6761\\\\u6b3e\\\\uff0c\\\\u670d\\\\u52a1\\\\u6761\\\\u6b3e\\\\u4e00\\\\u65e6\\\\u53d1\\\\u751f\\\\u53d8\\\\u52a8\\\\uff0c\\\\u5c06\\\\u4f1a\\\\u5728\\\\u76f8\\\\u5173\\\\u9875\\\\u9762\\\\u4e0a\\\\u63d0\\\\u793a\\\\u4fee\\\\u6539\\\\u5185\\\\u5bb9\\\\u3002\\\\u5982\\\\u679c\\\\u60a8\\\\u540c\\\\u610f\\\\u6539\\\\u52a8\\\\uff0c\\\\u5219\\\\u518d\\\\u4e00\\\\u6b21\\\\u70b9\\\\u51fb\\\\u201c\\\\u6211\\\\u540c\\\\u610f\\\\u201d\\\\u6309\\\\u94ae\\\\u3002 \\\\u5982\\\\u679c\\\\u60a8\\\\u4e0d\\\\u63a5\\\\u53d7\\\\uff0c\\\\u5219\\\\u53ca\\\\u65f6\\\\u53d6\\\\u6d88\\\\u60a8\\\\u7684\\\\u7528\\\\u6237\\\\u4f7f\\\\u7528\\\\u670d\\\\u52a1\\\\u8d44\\\\u683c\\\\u3002\\\\r\\\\n4\\\\uff0e \\\\u670d\\\\u52a1\\\\u4fee\\\\u8ba2\\\\r\\\\n\\\\u3000\\\\u3000phpcms\\\\u4fdd\\\\u7559\\\\u968f\\\\u65f6\\\\u4fee\\\\u6539\\\\u6216\\\\u4e2d\\\\u65ad\\\\u670d\\\\u52a1\\\\u800c\\\\u4e0d\\\\u9700\\\\u77e5\\\\u7167\\\\u7528\\\\u6237\\\\u7684\\\\u6743\\\\u5229\\\\u3002phpcms\\\\u884c\\\\u4f7f\\\\u4fee\\\\u6539\\\\u6216\\\\u4e2d\\\\u65ad\\\\u670d\\\\u52a1\\\\u7684\\\\u6743\\\\u5229\\\\uff0c\\\\u4e0d\\\\u9700\\\\u5bf9\\\\u7528\\\\u6237\\\\u6216\\\\u7b2c\\\\u4e09\\\\u65b9\\\\u8d1f\\\\u8d23\\\\u3002\\\\r\\\\n5\\\\uff0e \\\\u7528\\\\u6237\\\\u9690\\\\u79c1\\\\u5236\\\\u5ea6\\\\r\\\\n\\\\u3000\\\\u3000\\\\u5c0a\\\\u91cd\\\\u7528\\\\u6237\\\\u4e2a\\\\u4eba\\\\u9690\\\\u79c1\\\\u662fphpcms\\\\u7684 \\\\u57fa\\\\u672c\\\\u653f\\\\u7b56\\\\u3002phpcms\\\\u4e0d\\\\u4f1a\\\\u516c\\\\u5f00\\\\u3001\\\\u7f16\\\\u8f91\\\\u6216\\\\u900f\\\\u9732\\\\u7528\\\\u6237\\\\u7684\\\\u6ce8\\\\u518c\\\\u4fe1\\\\u606f\\\\uff0c\\\\u9664\\\\u975e\\\\u6709\\\\u6cd5\\\\u5f8b\\\\u8bb8\\\\u53ef\\\\u8981\\\\u6c42\\\\uff0c\\\\u6216phpcms\\\\u5728\\\\u8bda\\\\u4fe1\\\\u7684\\\\u57fa\\\\u7840\\\\u4e0a\\\\u8ba4\\\\u4e3a\\\\u900f\\\\u9732\\\\u8fd9\\\\u4e9b\\\\u4fe1\\\\u606f\\\\u5728\\\\u4ee5\\\\u4e0b\\\\u4e09\\\\u79cd\\\\u60c5\\\\u51b5\\\\u662f\\\\u5fc5\\\\u8981\\\\u7684\\\\uff1a \\\\r\\\\n\\\\u3000\\\\u30001)\\\\u9075\\\\u5b88\\\\u6709\\\\u5173\\\\u6cd5\\\\u5f8b\\\\u89c4\\\\u5b9a\\\\uff0c\\\\u9075\\\\u4ece\\\\u5408\\\\u6cd5\\\\u670d\\\\u52a1\\\\u7a0b\\\\u5e8f\\\\u3002 \\\\r\\\\n\\\\u3000\\\\u30002)\\\\u4fdd\\\\u6301\\\\u7ef4\\\\u62a4phpcms\\\\u7684\\\\u5546\\\\u6807\\\\u6240\\\\u6709\\\\u6743\\\\u3002 \\\\r\\\\n\\\\u3000\\\\u30003)\\\\u5728\\\\u7d27\\\\u6025\\\\u60c5\\\\u51b5\\\\u4e0b\\\\u7aed\\\\u529b\\\\u7ef4\\\\u62a4\\\\u7528\\\\u6237\\\\u4e2a\\\\u4eba\\\\u548c\\\\u793e\\\\u4f1a\\\\u5927\\\\u4f17\\\\u7684\\\\u9690\\\\u79c1\\\\u5b89\\\\u5168\\\\u3002 \\\\r\\\\n\\\\u3000\\\\u30004)\\\\u7b26\\\\u5408\\\\u5176\\\\u4ed6\\\\u76f8\\\\u5173\\\\u7684\\\\u8981\\\\u6c42\\\\u3002 \\\\r\\\\n6\\\\uff0e\\\\u7528\\\\u6237\\\\u7684\\\\u5e10\\\\u53f7\\\\uff0c\\\\u5bc6\\\\u7801\\\\u548c\\\\u5b89\\\\u5168\\\\u6027\\\\r\\\\n\\\\u3000\\\\u3000\\\\u4e00\\\\u65e6\\\\u6ce8\\\\u518c\\\\u6210\\\\u529f\\\\u6210\\\\u4e3aphpcms\\\\u7528\\\\u6237\\\\uff0c\\\\u60a8\\\\u5c06\\\\u5f97\\\\u5230\\\\u4e00\\\\u4e2a\\\\u5bc6\\\\u7801\\\\u548c\\\\u5e10\\\\u53f7\\\\u3002\\\\u5982\\\\u679c\\\\u60a8\\\\u4e0d\\\\u4fdd\\\\u7ba1\\\\u597d\\\\u81ea\\\\u5df1\\\\u7684\\\\u5e10\\\\u53f7\\\\u548c\\\\u5bc6\\\\u7801\\\\u5b89\\\\u5168\\\\uff0c\\\\u5c06\\\\u5bf9\\\\u56e0\\\\u6b64\\\\u4ea7\\\\u751f\\\\u7684\\\\u540e\\\\u679c\\\\u8d1f\\\\u5168\\\\u90e8\\\\u8d23\\\\u4efb\\\\u3002\\\\u53e6\\\\u5916\\\\uff0c\\\\u6bcf\\\\u4e2a\\\\u7528\\\\u6237\\\\u90fd\\\\u8981\\\\u5bf9\\\\u5176\\\\u5e10\\\\u6237\\\\u4e2d\\\\u7684\\\\u6240\\\\u6709\\\\u6d3b\\\\u52a8\\\\u548c\\\\u4e8b\\\\u4ef6\\\\u8d1f\\\\u5168\\\\u8d23\\\\u3002\\\\u60a8\\\\u53ef\\\\u968f\\\\u65f6\\\\u6839\\\\u636e\\\\u6307\\\\u793a\\\\u6539\\\\u53d8\\\\u60a8\\\\u7684\\\\u5bc6\\\\u7801\\\\uff0c\\\\u4e5f\\\\u53ef\\\\u4ee5\\\\u7ed3\\\\u675f\\\\u65e7\\\\u7684\\\\u5e10\\\\u6237\\\\u91cd\\\\u5f00\\\\u4e00\\\\u4e2a\\\\u65b0\\\\u5e10\\\\u6237\\\\u3002\\\\u7528\\\\u6237\\\\u540c\\\\u610f\\\\u82e5\\\\u53d1\\\\u73b0\\\\u4efb\\\\u4f55\\\\u975e\\\\u6cd5\\\\u4f7f\\\\u7528\\\\u7528\\\\u6237\\\\u5e10\\\\u53f7\\\\u6216\\\\u5b89\\\\u5168\\\\u6f0f\\\\u6d1e\\\\u7684\\\\u60c5\\\\u51b5\\\\uff0c\\\\u7acb\\\\u5373\\\\u901a\\\\u77e5phpcms\\\\u3002\\\\r\\\\n7\\\\uff0e \\\\u514d\\\\u8d23\\\\u6761\\\\u6b3e\\\\r\\\\n\\\\u3000\\\\u3000\\\\u7528\\\\u6237\\\\u660e\\\\u786e\\\\u540c\\\\u610f\\\\u7f51\\\\u7ad9\\\\u670d\\\\u52a1\\\\u7684\\\\u4f7f\\\\u7528\\\\u7531\\\\u7528\\\\u6237\\\\u4e2a\\\\u4eba\\\\u627f\\\\u62c5\\\\u98ce\\\\u9669\\\\u3002 \\\\u3000\\\\u3000 \\\\r\\\\n\\\\u3000\\\\u3000phpcms\\\\u4e0d\\\\u4f5c\\\\u4efb\\\\u4f55\\\\u7c7b\\\\u578b\\\\u7684\\\\u62c5\\\\u4fdd\\\\uff0c\\\\u4e0d\\\\u62c5\\\\u4fdd\\\\u670d\\\\u52a1\\\\u4e00\\\\u5b9a\\\\u80fd\\\\u6ee1\\\\u8db3\\\\u7528\\\\u6237\\\\u7684\\\\u8981\\\\u6c42\\\\uff0c\\\\u4e5f\\\\u4e0d\\\\u62c5\\\\u4fdd\\\\u670d\\\\u52a1\\\\u4e0d\\\\u4f1a\\\\u53d7\\\\u4e2d\\\\u65ad\\\\uff0c\\\\u5bf9\\\\u670d\\\\u52a1\\\\u7684\\\\u53ca\\\\u65f6\\\\u6027\\\\uff0c\\\\u5b89\\\\u5168\\\\u6027\\\\uff0c\\\\u51fa\\\\u9519\\\\u53d1\\\\u751f\\\\u90fd\\\\u4e0d\\\\u4f5c\\\\u62c5\\\\u4fdd\\\\u3002\\\\u7528\\\\u6237\\\\u7406\\\\u89e3\\\\u5e76\\\\u63a5\\\\u53d7\\\\uff1a\\\\u4efb\\\\u4f55\\\\u901a\\\\u8fc7phpcms\\\\u670d\\\\u52a1\\\\u53d6\\\\u5f97\\\\u7684\\\\u4fe1\\\\u606f\\\\u8d44\\\\u6599\\\\u7684\\\\u53ef\\\\u9760\\\\u6027\\\\u53d6\\\\u51b3\\\\u4e8e\\\\u7528\\\\u6237\\\\u81ea\\\\u5df1\\\\uff0c\\\\u7528\\\\u6237\\\\u81ea\\\\u5df1\\\\u627f\\\\u62c5\\\\u6240\\\\u6709\\\\u98ce\\\\u9669\\\\u548c\\\\u8d23\\\\u4efb\\\\u3002 \\\\r\\\\n8\\\\uff0e\\\\u6709\\\\u9650\\\\u8d23\\\\u4efb\\\\r\\\\n\\\\u3000\\\\u3000phpcms\\\\u5bf9\\\\u4efb\\\\u4f55\\\\u76f4\\\\u63a5\\\\u3001\\\\u95f4\\\\u63a5\\\\u3001\\\\u5076\\\\u7136\\\\u3001\\\\u7279\\\\u6b8a\\\\u53ca\\\\u7ee7\\\\u8d77\\\\u7684\\\\u635f\\\\u5bb3\\\\u4e0d\\\\u8d1f\\\\u8d23\\\\u4efb\\\\u3002\\\\r\\\\n9\\\\uff0e \\\\u4e0d\\\\u63d0\\\\u4f9b\\\\u96f6\\\\u552e\\\\u548c\\\\u5546\\\\u4e1a\\\\u6027\\\\u670d\\\\u52a1 \\\\r\\\\n\\\\u3000\\\\u3000\\\\u7528\\\\u6237\\\\u4f7f\\\\u7528\\\\u7f51\\\\u7ad9\\\\u670d\\\\u52a1\\\\u7684\\\\u6743\\\\u5229\\\\u662f\\\\u4e2a\\\\u4eba\\\\u7684\\\\u3002\\\\u7528\\\\u6237\\\\u53ea\\\\u80fd\\\\u662f\\\\u4e00\\\\u4e2a\\\\u5355\\\\u72ec\\\\u7684\\\\u4e2a\\\\u4f53\\\\u800c\\\\u4e0d\\\\u80fd\\\\u662f\\\\u4e00\\\\u4e2a\\\\u516c\\\\u53f8\\\\u6216\\\\u5b9e\\\\u4f53\\\\u5546\\\\u4e1a\\\\u6027\\\\u7ec4\\\\u7ec7\\\\u3002\\\\u7528\\\\u6237\\\\u627f\\\\u8bfa\\\\u4e0d\\\\u7ecfphpcms\\\\u540c\\\\u610f\\\\uff0c\\\\u4e0d\\\\u80fd\\\\u5229\\\\u7528\\\\u7f51\\\\u7ad9\\\\u670d\\\\u52a1\\\\u8fdb\\\\u884c\\\\u9500\\\\u552e\\\\u6216\\\\u5176\\\\u4ed6\\\\u5546\\\\u4e1a\\\\u7528\\\\u9014\\\\u3002\\\\r\\\\n10\\\\uff0e\\\\u7528\\\\u6237\\\\u8d23\\\\u4efb \\\\r\\\\n\\\\u3000\\\\u3000\\\\u7528\\\\u6237\\\\u5355\\\\u72ec\\\\u627f\\\\u62c5\\\\u4f20\\\\u8f93\\\\u5185\\\\u5bb9\\\\u7684\\\\u8d23\\\\u4efb\\\\u3002\\\\u7528\\\\u6237\\\\u5fc5\\\\u987b\\\\u9075\\\\u5faa\\\\uff1a \\\\r\\\\n\\\\u3000\\\\u30001)\\\\u4ece\\\\u4e2d\\\\u56fd\\\\u5883\\\\u5185\\\\u5411\\\\u5916\\\\u4f20\\\\u8f93\\\\u6280\\\\u672f\\\\u6027\\\\u8d44\\\\u6599\\\\u65f6\\\\u5fc5\\\\u987b\\\\u7b26\\\\u5408\\\\u4e2d\\\\u56fd\\\\u6709\\\\u5173\\\\u6cd5\\\\u89c4\\\\u3002 \\\\r\\\\n\\\\u3000\\\\u30002)\\\\u4f7f\\\\u7528\\\\u7f51\\\\u7ad9\\\\u670d\\\\u52a1\\\\u4e0d\\\\u4f5c\\\\u975e\\\\u6cd5\\\\u7528\\\\u9014\\\\u3002 \\\\r\\\\n\\\\u3000\\\\u30003)\\\\u4e0d\\\\u5e72\\\\u6270\\\\u6216\\\\u6df7\\\\u4e71\\\\u7f51\\\\u7edc\\\\u670d\\\\u52a1\\\\u3002 \\\\r\\\\n\\\\u3000\\\\u30004)\\\\u4e0d\\\\u5728\\\\u8bba\\\\u575bBBS\\\\u6216\\\\u7559\\\\u8a00\\\\u7c3f\\\\u53d1\\\\u8868\\\\u4efb\\\\u4f55\\\\u4e0e\\\\u653f\\\\u6cbb\\\\u76f8\\\\u5173\\\\u7684\\\\u4fe1\\\\u606f\\\\u3002 \\\\r\\\\n\\\\u3000\\\\u30005)\\\\u9075\\\\u5b88\\\\u6240\\\\u6709\\\\u4f7f\\\\u7528\\\\u7f51\\\\u7ad9\\\\u670d\\\\u52a1\\\\u7684\\\\u7f51\\\\u7edc\\\\u534f\\\\u8bae\\\\u3001\\\\u89c4\\\\u5b9a\\\\u3001\\\\u7a0b\\\\u5e8f\\\\u548c\\\\u60ef\\\\u4f8b\\\\u3002\\\\r\\\\n\\\\u3000\\\\u30006)\\\\u4e0d\\\\u5f97\\\\u5229\\\\u7528\\\\u672c\\\\u7ad9\\\\u5371\\\\u5bb3\\\\u56fd\\\\u5bb6\\\\u5b89\\\\u5168\\\\u3001\\\\u6cc4\\\\u9732\\\\u56fd\\\\u5bb6\\\\u79d8\\\\u5bc6\\\\uff0c\\\\u4e0d\\\\u5f97\\\\u4fb5\\\\u72af\\\\u56fd\\\\u5bb6\\\\u793e\\\\u4f1a\\\\u96c6\\\\u4f53\\\\u7684\\\\u548c\\\\u516c\\\\u6c11\\\\u7684\\\\u5408\\\\u6cd5\\\\u6743\\\\u76ca\\\\u3002\\\\r\\\\n\\\\u3000\\\\u30007)\\\\u4e0d\\\\u5f97\\\\u5229\\\\u7528\\\\u672c\\\\u7ad9\\\\u5236\\\\u4f5c\\\\u3001\\\\u590d\\\\u5236\\\\u548c\\\\u4f20\\\\u64ad\\\\u4e0b\\\\u5217\\\\u4fe1\\\\u606f\\\\uff1a \\\\r\\\\n\\\\u3000\\\\u3000\\\\u30001\\\\u3001\\\\u717d\\\\u52a8\\\\u6297\\\\u62d2\\\\u3001\\\\u7834\\\\u574f\\\\u5baa\\\\u6cd5\\\\u548c\\\\u6cd5\\\\u5f8b\\\\u3001\\\\u884c\\\\u653f\\\\u6cd5\\\\u89c4\\\\u5b9e\\\\u65bd\\\\u7684\\\\uff1b\\\\r\\\\n\\\\u3000\\\\u3000\\\\u30002\\\\u3001\\\\u717d\\\\u52a8\\\\u98a0\\\\u8986\\\\u56fd\\\\u5bb6\\\\u653f\\\\u6743\\\\uff0c\\\\u63a8\\\\u7ffb\\\\u793e\\\\u4f1a\\\\u4e3b\\\\u4e49\\\\u5236\\\\u5ea6\\\\u7684\\\\uff1b\\\\r\\\\n\\\\u3000\\\\u3000\\\\u30003\\\\u3001\\\\u717d\\\\u52a8\\\\u5206\\\\u88c2\\\\u56fd\\\\u5bb6\\\\u3001\\\\u7834\\\\u574f\\\\u56fd\\\\u5bb6\\\\u7edf\\\\u4e00\\\\u7684\\\\uff1b\\\\r\\\\n\\\\u3000\\\\u3000\\\\u30004\\\\u3001\\\\u717d\\\\u52a8\\\\u6c11\\\\u65cf\\\\u4ec7\\\\u6068\\\\u3001\\\\u6c11\\\\u65cf\\\\u6b67\\\\u89c6\\\\uff0c\\\\u7834\\\\u574f\\\\u6c11\\\\u65cf\\\\u56e2\\\\u7ed3\\\\u7684\\\\uff1b\\\\r\\\\n\\\\u3000\\\\u3000\\\\u30005\\\\u3001\\\\u634f\\\\u9020\\\\u6216\\\\u8005\\\\u6b6a\\\\u66f2\\\\u4e8b\\\\u5b9e\\\\uff0c\\\\u6563\\\\u5e03\\\\u8c23\\\\u8a00\\\\uff0c\\\\u6270\\\\u4e71\\\\u793e\\\\u4f1a\\\\u79e9\\\\u5e8f\\\\u7684\\\\uff1b\\\\r\\\\n\\\\u3000\\\\u3000\\\\u30006\\\\u3001\\\\u5ba3\\\\u626c\\\\u5c01\\\\u5efa\\\\u8ff7\\\\u4fe1\\\\u3001\\\\u6deb\\\\u79fd\\\\u3001\\\\u8272\\\\u60c5\\\\u3001\\\\u8d4c\\\\u535a\\\\u3001\\\\u66b4\\\\u529b\\\\u3001\\\\u51f6\\\\u6740\\\\u3001\\\\u6050\\\\u6016\\\\u3001\\\\u6559\\\\u5506\\\\u72af\\\\u7f6a\\\\u7684\\\\uff1b\\\\r\\\\n\\\\u3000\\\\u3000\\\\u30007\\\\u3001\\\\u516c\\\\u7136\\\\u4fae\\\\u8fb1\\\\u4ed6\\\\u4eba\\\\u6216\\\\u8005\\\\u634f\\\\u9020\\\\u4e8b\\\\u5b9e\\\\u8bfd\\\\u8c24\\\\u4ed6\\\\u4eba\\\\u7684\\\\uff0c\\\\u6216\\\\u8005\\\\u8fdb\\\\u884c\\\\u5176\\\\u4ed6\\\\u6076\\\\u610f\\\\u653b\\\\u51fb\\\\u7684\\\\uff1b\\\\r\\\\n\\\\u3000\\\\u3000\\\\u30008\\\\u3001\\\\u635f\\\\u5bb3\\\\u56fd\\\\u5bb6\\\\u673a\\\\u5173\\\\u4fe1\\\\u8a89\\\\u7684\\\\uff1b\\\\r\\\\n\\\\u3000\\\\u3000\\\\u30009\\\\u3001\\\\u5176\\\\u4ed6\\\\u8fdd\\\\u53cd\\\\u5baa\\\\u6cd5\\\\u548c\\\\u6cd5\\\\u5f8b\\\\u884c\\\\u653f\\\\u6cd5\\\\u89c4\\\\u7684\\\\uff1b\\\\r\\\\n\\\\u3000\\\\u3000\\\\u300010\\\\u3001\\\\u8fdb\\\\u884c\\\\u5546\\\\u4e1a\\\\u5e7f\\\\u544a\\\\u884c\\\\u4e3a\\\\u7684\\\\u3002\\\\r\\\\n\\\\u3000\\\\u3000\\\\u7528\\\\u6237\\\\u4e0d\\\\u80fd\\\\u4f20\\\\u8f93\\\\u4efb\\\\u4f55\\\\u6559\\\\u5506\\\\u4ed6\\\\u4eba\\\\u6784\\\\u6210\\\\u72af\\\\u7f6a\\\\u884c\\\\u4e3a\\\\u7684\\\\u8d44\\\\u6599\\\\uff1b\\\\u4e0d\\\\u80fd\\\\u4f20\\\\u8f93\\\\u957f\\\\u56fd\\\\u5185\\\\u4e0d\\\\u5229\\\\u6761\\\\u4ef6\\\\u548c\\\\u6d89\\\\u53ca\\\\u56fd\\\\u5bb6\\\\u5b89\\\\u5168\\\\u7684\\\\u8d44\\\\u6599\\\\uff1b\\\\u4e0d\\\\u80fd\\\\u4f20\\\\u8f93\\\\u4efb\\\\u4f55\\\\u4e0d\\\\u7b26\\\\u5408\\\\u5f53\\\\u5730\\\\u6cd5\\\\u89c4\\\\u3001\\\\u56fd\\\\u5bb6\\\\u6cd5\\\\u5f8b\\\\u548c\\\\u56fd\\\\u9645\\\\u6cd5 \\\\u5f8b\\\\u7684\\\\u8d44\\\\u6599\\\\u3002\\\\u672a\\\\u7ecf\\\\u8bb8\\\\u53ef\\\\u800c\\\\u975e\\\\u6cd5\\\\u8fdb\\\\u5165\\\\u5176\\\\u5b83\\\\u7535\\\\u8111\\\\u7cfb\\\\u7edf\\\\u662f\\\\u7981\\\\u6b62\\\\u7684\\\\u3002\\\\u82e5\\\\u7528\\\\u6237\\\\u7684\\\\u884c\\\\u4e3a\\\\u4e0d\\\\u7b26\\\\u5408\\\\u4ee5\\\\u4e0a\\\\u7684\\\\u6761\\\\u6b3e\\\\uff0cphpcms\\\\u5c06\\\\u53d6\\\\u6d88\\\\u7528\\\\u6237\\\\u670d\\\\u52a1\\\\u5e10\\\\u53f7\\\\u3002\\\\r\\\\n11\\\\uff0e\\\\u7f51\\\\u7ad9\\\\u5185\\\\u5bb9\\\\u7684\\\\u6240\\\\u6709\\\\u6743\\\\r\\\\n\\\\u3000\\\\u3000phpcms\\\\u5b9a\\\\u4e49\\\\u7684\\\\u5185\\\\u5bb9\\\\u5305\\\\u62ec\\\\uff1a\\\\u6587\\\\u5b57\\\\u3001\\\\u8f6f\\\\u4ef6\\\\u3001\\\\u58f0\\\\u97f3\\\\u3001\\\\u76f8\\\\u7247\\\\u3001\\\\u5f55\\\\u8c61\\\\u3001\\\\u56fe\\\\u8868\\\\uff1b\\\\u5728\\\\u5e7f\\\\u544a\\\\u4e2d\\\\u5168\\\\u90e8\\\\u5185\\\\u5bb9\\\\uff1b\\\\u7535\\\\u5b50\\\\u90ae\\\\u4ef6\\\\u7684\\\\u5168\\\\u90e8\\\\u5185\\\\u5bb9\\\\uff1bphpcms\\\\u4e3a\\\\u7528\\\\u6237\\\\u63d0\\\\u4f9b\\\\u7684\\\\u5546\\\\u4e1a\\\\u4fe1\\\\u606f\\\\u3002\\\\u6240\\\\u6709\\\\u8fd9\\\\u4e9b\\\\u5185\\\\u5bb9\\\\u53d7\\\\u7248\\\\u6743\\\\u3001\\\\u5546\\\\u6807\\\\u3001\\\\u6807\\\\u7b7e\\\\u548c\\\\u5176\\\\u5b83\\\\u8d22\\\\u4ea7\\\\u6240\\\\u6709\\\\u6743\\\\u6cd5\\\\u5f8b\\\\u7684\\\\u4fdd\\\\u62a4\\\\u3002\\\\u6240\\\\u4ee5\\\\uff0c\\\\u7528\\\\u6237\\\\u53ea\\\\u80fd\\\\u5728phpcms\\\\u548c\\\\u5e7f\\\\u544a\\\\u5546\\\\u6388\\\\u6743\\\\u4e0b\\\\u624d\\\\u80fd\\\\u4f7f\\\\u7528\\\\u8fd9\\\\u4e9b\\\\u5185\\\\u5bb9\\\\uff0c\\\\u800c\\\\u4e0d\\\\u80fd\\\\u64c5\\\\u81ea\\\\u590d\\\\u5236\\\\u3001\\\\u7be1\\\\u6539\\\\u8fd9\\\\u4e9b\\\\u5185\\\\u5bb9\\\\u3001\\\\u6216\\\\u521b\\\\u9020\\\\u4e0e\\\\u5185\\\\u5bb9\\\\u6709\\\\u5173\\\\u7684\\\\u6d3e\\\\u751f\\\\u4ea7\\\\u54c1\\\\u3002\\\\r\\\\n12\\\\uff0e\\\\u9644\\\\u52a0\\\\u4fe1\\\\u606f\\\\u670d\\\\u52a1\\\\r\\\\n\\\\u3000\\\\u3000\\\\u7528\\\\u6237\\\\u5728\\\\u4eab\\\\u7528phpcms\\\\u63d0\\\\u4f9b\\\\u7684\\\\u514d\\\\u8d39\\\\u670d\\\\u52a1\\\\u7684\\\\u540c\\\\u65f6\\\\uff0c\\\\u540c\\\\u610f\\\\u63a5\\\\u53d7phpcms\\\\u63d0\\\\u4f9b\\\\u7684\\\\u5404\\\\u7c7b\\\\u9644\\\\u52a0\\\\u4fe1\\\\u606f\\\\u670d\\\\u52a1\\\\u3002\\\\r\\\\n13\\\\uff0e\\\\u89e3\\\\u91ca\\\\u6743\\\\r\\\\n\\\\u3000\\\\u3000\\\\u672c\\\\u6ce8\\\\u518c\\\\u534f\\\\u8bae\\\\u7684\\\\u89e3\\\\u91ca\\\\u6743\\\\u5f52phpcms\\\\u6240\\\\u6709\\\\u3002\\\\u5982\\\\u679c\\\\u5176\\\\u4e2d\\\\u6709\\\\u4efb\\\\u4f55\\\\u6761\\\\u6b3e\\\\u4e0e\\\\u56fd\\\\u5bb6\\\\u7684\\\\u6709\\\\u5173\\\\u6cd5\\\\u5f8b\\\\u76f8\\\\u62b5\\\\u89e6\\\\uff0c\\\\u5219\\\\u4ee5\\\\u56fd\\\\u5bb6\\\\u6cd5\\\\u5f8b\\\\u7684\\\\u660e\\\\u6587\\\\u89c4\\\\u5b9a\\\\u4e3a\\\\u51c6\\\\u3002 \",\"registerverifymessage\":\" \\\\u6b22\\\\u8fce\\\\u60a8\\\\u6ce8\\\\u518c\\\\u6210\\\\u4e3aphpcms\\\\u7528\\\\u6237\\\\uff0c\\\\u60a8\\\\u7684\\\\u8d26\\\\u53f7\\\\u9700\\\\u8981\\\\u90ae\\\\u7bb1\\\\u8ba4\\\\u8bc1\\\\uff0c\\\\u70b9\\\\u51fb\\\\u4e0b\\\\u9762\\\\u94fe\\\\u63a5\\\\u8fdb\\\\u884c\\\\u8ba4\\\\u8bc1\\\\uff1a{click}\\\\r\\\\n\\\\u6216\\\\u8005\\\\u5c06\\\\u7f51\\\\u5740\\\\u590d\\\\u5236\\\\u5230\\\\u6d4f\\\\u89c8\\\\u5668\\\\uff1a{url}\",\"forgetpassword\":\" phpcms\\\\u5bc6\\\\u7801\\\\u627e\\\\u56de\\\\uff0c\\\\u8bf7\\\\u5728\\\\u4e00\\\\u5c0f\\\\u65f6\\\\u5185\\\\u70b9\\\\u51fb\\\\u4e0b\\\\u9762\\\\u94fe\\\\u63a5\\\\u8fdb\\\\u884c\\\\u64cd\\\\u4f5c\\\\uff1a{click}\\\\r\\\\n\\\\u6216\\\\u8005\\\\u5c06\\\\u7f51\\\\u5740\\\\u590d\\\\u5236\\\\u5230\\\\u6d4f\\\\u89c8\\\\u5668\\\\uff1a{url}\"}\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-06\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'pay\' => \n  array (\n    \'module\' => \'pay\',\n    \'name\' => \'支付\',\n    \'url\' => \'\',\n    \'iscore\' => \'1\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-06\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'digg\' => \n  array (\n    \'module\' => \'digg\',\n    \'name\' => \'顶一下\',\n    \'url\' => \'\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-06\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'special\' => \n  array (\n    \'module\' => \'special\',\n    \'name\' => \'专题\',\n    \'url\' => \'\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-06\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'content\' => \n  array (\n    \'module\' => \'content\',\n    \'name\' => \'内容模块\',\n    \'url\' => \'\',\n    \'iscore\' => \'1\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-06\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'search\' => \n  array (\n    \'module\' => \'search\',\n    \'name\' => \'全站搜索\',\n    \'url\' => \'\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'array (\n  \\\'fulltextenble\\\' => \\\'1\\\',\n  \\\'relationenble\\\' => \\\'1\\\',\n  \\\'suggestenable\\\' => \\\'1\\\',\n  \\\'sphinxenable\\\' => \\\'0\\\',\n  \\\'sphinxhost\\\' => \\\'10.228.134.102\\\',\n  \\\'sphinxport\\\' => \\\'9312\\\',\n)\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-06\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'scan\' => \n  array (\n    \'module\' => \'scan\',\n    \'name\' => \'木马扫描\',\n    \'url\' => \'scan\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-01\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'attachment\' => \n  array (\n    \'module\' => \'attachment\',\n    \'name\' => \'附件\',\n    \'url\' => \'attachment\',\n    \'iscore\' => \'1\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-01\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'block\' => \n  array (\n    \'module\' => \'block\',\n    \'name\' => \'碎片\',\n    \'url\' => \'\',\n    \'iscore\' => \'1\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-01\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'collection\' => \n  array (\n    \'module\' => \'collection\',\n    \'name\' => \'采集模块\',\n    \'url\' => \'collection\',\n    \'iscore\' => \'1\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-01\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'dbsource\' => \n  array (\n    \'module\' => \'dbsource\',\n    \'name\' => \'数据源\',\n    \'url\' => \'\',\n    \'iscore\' => \'1\',\n    \'version\' => \'\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-01\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'template\' => \n  array (\n    \'module\' => \'template\',\n    \'name\' => \'模板风格\',\n    \'url\' => \'\',\n    \'iscore\' => \'1\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-01\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'release\' => \n  array (\n    \'module\' => \'release\',\n    \'name\' => \'发布点\',\n    \'url\' => \'\',\n    \'iscore\' => \'1\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-01\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'video\' => \n  array (\n    \'module\' => \'video\',\n    \'name\' => \'视频库\',\n    \'url\' => \'\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2012-09-28\',\n    \'updatedate\' => \'2012-09-28\',\n  ),\n  \'announce\' => \n  array (\n    \'module\' => \'announce\',\n    \'name\' => \'公告\',\n    \'url\' => \'announce/\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'公告\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2016-06-06\',\n    \'updatedate\' => \'2016-06-06\',\n  ),\n  \'comment\' => \n  array (\n    \'module\' => \'comment\',\n    \'name\' => \'评论\',\n    \'url\' => \'comment/\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'评论\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2016-06-06\',\n    \'updatedate\' => \'2016-06-06\',\n  ),\n  \'link\' => \n  array (\n    \'module\' => \'link\',\n    \'name\' => \'友情链接\',\n    \'url\' => \'\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'array (\n  1 => \n  array (\n    \\\'is_post\\\' => \\\'1\\\',\n    \\\'enablecheckcode\\\' => \\\'0\\\',\n  ),\n)\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-06\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'vote\' => \n  array (\n    \'module\' => \'vote\',\n    \'name\' => \'投票\',\n    \'url\' => \'\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'array (\r\n  1 => \r\n  array (\r\n    \\\'default_style\\\' => \\\'default\\\',\r\n    \\\'vote_tp_template\\\' => \\\'vote_tp\\\',\r\n    \\\'allowguest\\\' => \\\'1\\\',\r\n    \\\'enabled\\\' => \\\'1\\\',\r\n    \\\'interval\\\' => \\\'1\\\',\r\n    \\\'credit\\\' => \\\'1\\\',\r\n  ),\r\n)\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-06\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'message\' => \n  array (\n    \'module\' => \'message\',\n    \'name\' => \'短消息\',\n    \'url\' => \'\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-06\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'mood\' => \n  array (\n    \'module\' => \'mood\',\n    \'name\' => \'新闻心情\',\n    \'url\' => \'mood/\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'新闻心情\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2016-06-06\',\n    \'updatedate\' => \'2016-06-06\',\n  ),\n  \'poster\' => \n  array (\n    \'module\' => \'poster\',\n    \'name\' => \'广告模块\',\n    \'url\' => \'poster/\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'广告模块\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2016-06-06\',\n    \'updatedate\' => \'2016-06-06\',\n  ),\n  \'formguide\' => \n  array (\n    \'module\' => \'formguide\',\n    \'name\' => \'表单向导\',\n    \'url\' => \'formguide/\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'formguide\',\n    \'setting\' => \'array (\n  \\\'allowmultisubmit\\\' => \\\'1\\\',\n  \\\'interval\\\' => \\\'30\\\',\n  \\\'allowunreg\\\' => \\\'0\\\',\n  \\\'mailmessage\\\' => \\\'用户向我们提交了表单数据，赶快去看看吧。\\\',\n)\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-10-20\',\n    \'updatedate\' => \'2010-10-20\',\n  ),\n  \'wap\' => \n  array (\n    \'module\' => \'wap\',\n    \'name\' => \'手机门户\',\n    \'url\' => \'wap/\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'手机门户\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2016-06-06\',\n    \'updatedate\' => \'2016-06-06\',\n  ),\n  \'upgrade\' => \n  array (\n    \'module\' => \'upgrade\',\n    \'name\' => \'在线升级\',\n    \'url\' => \'\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2011-05-18\',\n    \'updatedate\' => \'2011-05-18\',\n  ),\n  \'tag\' => \n  array (\n    \'module\' => \'tag\',\n    \'name\' => \'标签向导\',\n    \'url\' => \'tag/\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'标签向导\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2016-06-06\',\n    \'updatedate\' => \'2016-06-06\',\n  ),\n  \'sms\' => \n  array (\n    \'module\' => \'sms\',\n    \'name\' => \'短信平台\',\n    \'url\' => \'sms/\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'短信平台\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2011-09-02\',\n    \'updatedate\' => \'2011-09-02\',\n  ),\n);\n?>');
insert  into `v9_cache`(`filename`,`path`,`data`) values ('model.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n  1 => \n  array (\n    \'modelid\' => \'1\',\n    \'siteid\' => \'1\',\n    \'name\' => \'文章模型\',\n    \'description\' => \'\',\n    \'tablename\' => \'news\',\n    \'setting\' => \'\',\n    \'addtime\' => \'0\',\n    \'items\' => \'0\',\n    \'enablesearch\' => \'1\',\n    \'disabled\' => \'0\',\n    \'default_style\' => \'default\',\n    \'category_template\' => \'category\',\n    \'list_template\' => \'list\',\n    \'show_template\' => \'show\',\n    \'js_template\' => \'\',\n    \'admin_list_template\' => \'\',\n    \'member_add_template\' => \'\',\n    \'member_list_template\' => \'\',\n    \'sort\' => \'0\',\n    \'type\' => \'0\',\n  ),\n  2 => \n  array (\n    \'modelid\' => \'2\',\n    \'siteid\' => \'1\',\n    \'name\' => \'下载模型\',\n    \'description\' => \'\',\n    \'tablename\' => \'download\',\n    \'setting\' => \'\',\n    \'addtime\' => \'0\',\n    \'items\' => \'0\',\n    \'enablesearch\' => \'1\',\n    \'disabled\' => \'0\',\n    \'default_style\' => \'default\',\n    \'category_template\' => \'category_download\',\n    \'list_template\' => \'list_download\',\n    \'show_template\' => \'show_download\',\n    \'js_template\' => \'\',\n    \'admin_list_template\' => \'\',\n    \'member_add_template\' => \'\',\n    \'member_list_template\' => \'\',\n    \'sort\' => \'0\',\n    \'type\' => \'0\',\n  ),\n  3 => \n  array (\n    \'modelid\' => \'3\',\n    \'siteid\' => \'1\',\n    \'name\' => \'图片模型\',\n    \'description\' => \'\',\n    \'tablename\' => \'picture\',\n    \'setting\' => \'\',\n    \'addtime\' => \'0\',\n    \'items\' => \'0\',\n    \'enablesearch\' => \'1\',\n    \'disabled\' => \'0\',\n    \'default_style\' => \'default\',\n    \'category_template\' => \'category_picture\',\n    \'list_template\' => \'list_picture\',\n    \'show_template\' => \'show_picture\',\n    \'js_template\' => \'\',\n    \'admin_list_template\' => \'\',\n    \'member_add_template\' => \'\',\n    \'member_list_template\' => \'\',\n    \'sort\' => \'0\',\n    \'type\' => \'0\',\n  ),\n  11 => \n  array (\n    \'modelid\' => \'11\',\n    \'siteid\' => \'1\',\n    \'name\' => \'视频模型\',\n    \'description\' => \'\',\n    \'tablename\' => \'video\',\n    \'setting\' => \'\',\n    \'addtime\' => \'0\',\n    \'items\' => \'0\',\n    \'enablesearch\' => \'1\',\n    \'disabled\' => \'0\',\n    \'default_style\' => \'default\',\n    \'category_template\' => \'category_video\',\n    \'list_template\' => \'list_video\',\n    \'show_template\' => \'show_video\',\n    \'js_template\' => \'\',\n    \'admin_list_template\' => \'\',\n    \'member_add_template\' => \'\',\n    \'member_list_template\' => \'\',\n    \'sort\' => \'0\',\n    \'type\' => \'0\',\n  ),\n);\n?>');
insert  into `v9_cache`(`filename`,`path`,`data`) values ('workflow_1.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n  1 => \n  array (\n    \'workflowid\' => \'1\',\n    \'siteid\' => \'1\',\n    \'steps\' => \'1\',\n    \'workname\' => \'一级审核\',\n    \'description\' => \'审核一次\',\n    \'setting\' => \'\',\n    \'flag\' => \'0\',\n  ),\n  2 => \n  array (\n    \'workflowid\' => \'2\',\n    \'siteid\' => \'1\',\n    \'steps\' => \'2\',\n    \'workname\' => \'二级审核\',\n    \'description\' => \'审核两次\',\n    \'setting\' => \'\',\n    \'flag\' => \'0\',\n  ),\n  3 => \n  array (\n    \'workflowid\' => \'3\',\n    \'siteid\' => \'1\',\n    \'steps\' => \'3\',\n    \'workname\' => \'三级审核\',\n    \'description\' => \'审核三次\',\n    \'setting\' => \'\',\n    \'flag\' => \'0\',\n  ),\n  4 => \n  array (\n    \'workflowid\' => \'4\',\n    \'siteid\' => \'1\',\n    \'steps\' => \'4\',\n    \'workname\' => \'四级审核\',\n    \'description\' => \'四级审核\',\n    \'setting\' => \'\',\n    \'flag\' => \'0\',\n  ),\n);\n?>');
insert  into `v9_cache`(`filename`,`path`,`data`) values ('member_model.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n  10 => \n  array (\n    \'modelid\' => \'10\',\n    \'siteid\' => \'1\',\n    \'name\' => \'普通会员\',\n    \'description\' => \'普通会员\',\n    \'tablename\' => \'member_detail\',\n    \'setting\' => \'\',\n    \'addtime\' => \'0\',\n    \'items\' => \'0\',\n    \'enablesearch\' => \'1\',\n    \'disabled\' => \'0\',\n    \'default_style\' => \'\',\n    \'category_template\' => \'\',\n    \'list_template\' => \'\',\n    \'show_template\' => \'\',\n    \'js_template\' => \'\',\n    \'admin_list_template\' => \'\',\n    \'member_add_template\' => \'\',\n    \'member_list_template\' => \'\',\n    \'sort\' => \'0\',\n    \'type\' => \'2\',\n  ),\n);\n?>');
insert  into `v9_cache`(`filename`,`path`,`data`) values ('special.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n  1 => \n  array (\n    \'id\' => \'1\',\n    \'siteid\' => \'1\',\n    \'title\' => \'fdffdfdfdfd\',\n    \'url\' => \'http://phpcms_centos.com/html/special/444/\',\n    \'thumb\' => \'http://phpcms_centos.com/uploadfile/2016/0607/20160607114205720.png\',\n    \'banner\' => \'http://phpcms_centos.com/uploadfile/2016/0607/20160607114205720.png\',\n    \'ishtml\' => \'1\',\n  ),\n);\n?>');
insert  into `v9_cache`(`filename`,`path`,`data`) values ('common.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n  \'admin_email\' => \'phpcms@phpcms.cn\',\n  \'adminaccessip\' => \'0\',\n  \'maxloginfailedtimes\' => \'8\',\n  \'maxiplockedtime\' => \'15\',\n  \'minrefreshtime\' => \'2\',\n  \'mail_type\' => \'1\',\n  \'mail_server\' => \'smtp.qq.com\',\n  \'mail_port\' => \'25\',\n  \'mail_user\' => \'phpcms.cn@foxmail.com\',\n  \'mail_auth\' => \'1\',\n  \'mail_from\' => \'phpcms.cn@foxmail.com\',\n  \'mail_password\' => \'\',\n  \'errorlog_size\' => \'20\',\n);\n?>');
insert  into `v9_cache`(`filename`,`path`,`data`) values ('category_items_2.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n);\n?>');
insert  into `v9_cache`(`filename`,`path`,`data`) values ('category_items_3.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n);\n?>');
insert  into `v9_cache`(`filename`,`path`,`data`) values ('category_items_11.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n);\n?>');
insert  into `v9_cache`(`filename`,`path`,`data`) values ('type_content.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n);\n?>');
insert  into `v9_cache`(`filename`,`path`,`data`) values ('vote.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n  1 => \n  array (\n    \'default_style\' => \'default\',\n    \'vote_tp_template\' => \'vote_tp\',\n    \'allowguest\' => \'1\',\n    \'enabled\' => \'1\',\n    \'interval\' => \'1\',\n    \'credit\' => \'1\',\n  ),\n);\n?>');
insert  into `v9_cache`(`filename`,`path`,`data`) values ('link.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n  1 => \n  array (\n    \'is_post\' => \'1\',\n    \'enablecheckcode\' => \'0\',\n  ),\n);\n?>');

/*Table structure for table `v9_category` */

CREATE TABLE `v9_category` (
  `catid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `module` varchar(15) NOT NULL,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `modelid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `parentid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `arrparentid` varchar(255) NOT NULL,
  `child` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `arrchildid` mediumtext NOT NULL,
  `catname` varchar(30) NOT NULL,
  `style` varchar(5) NOT NULL,
  `image` varchar(100) NOT NULL,
  `description` mediumtext NOT NULL,
  `parentdir` varchar(100) NOT NULL,
  `catdir` varchar(30) NOT NULL,
  `url` varchar(100) NOT NULL,
  `items` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `setting` mediumtext NOT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ismenu` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `sethtml` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `letter` varchar(30) NOT NULL,
  `usable_type` varchar(255) NOT NULL,
  PRIMARY KEY (`catid`),
  KEY `module` (`module`,`parentid`,`listorder`,`catid`),
  KEY `siteid` (`siteid`,`type`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `v9_category` */

insert  into `v9_category`(`catid`,`siteid`,`module`,`type`,`modelid`,`parentid`,`arrparentid`,`child`,`arrchildid`,`catname`,`style`,`image`,`description`,`parentdir`,`catdir`,`url`,`items`,`hits`,`setting`,`listorder`,`ismenu`,`sethtml`,`letter`,`usable_type`) values (1,1,'content',1,0,0,'0',1,'1,2,3,4,5','网站介绍','','','','','about','/html/about/',0,0,'array (\n  \'ishtml\' => \'1\',\n  \'template_list\' => \'default\',\n  \'page_template\' => \'page\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'category_ruleid\' => \'1\',\n  \'show_ruleid\' => \'\',\n  \'repeatchargedays\' => \'1\',\n)',1,0,0,'wangzhanjieshao','');
insert  into `v9_category`(`catid`,`siteid`,`module`,`type`,`modelid`,`parentid`,`arrparentid`,`child`,`arrchildid`,`catname`,`style`,`image`,`description`,`parentdir`,`catdir`,`url`,`items`,`hits`,`setting`,`listorder`,`ismenu`,`sethtml`,`letter`,`usable_type`) values (2,1,'content',1,0,1,'0,1',0,'2','关于我们','','','','about/','aboutus','/html/about/aboutus/',0,0,'array (\n  \'ishtml\' => \'1\',\n  \'template_list\' => \'default\',\n  \'page_template\' => \'page\',\n  \'meta_title\' => \'关于我们\',\n  \'meta_keywords\' => \'关于我们\',\n  \'meta_description\' => \'关于我们\',\n  \'category_ruleid\' => \'1\',\n  \'show_ruleid\' => \'\',\n  \'repeatchargedays\' => \'1\',\n)',1,1,0,'guanyuwomen','');
insert  into `v9_category`(`catid`,`siteid`,`module`,`type`,`modelid`,`parentid`,`arrparentid`,`child`,`arrchildid`,`catname`,`style`,`image`,`description`,`parentdir`,`catdir`,`url`,`items`,`hits`,`setting`,`listorder`,`ismenu`,`sethtml`,`letter`,`usable_type`) values (3,1,'content',1,0,1,'0,1',0,'3','联系方式','','','','about/','contactus','/html/about/contactus/',0,0,'array (\n  \'ishtml\' => \'1\',\n  \'template_list\' => \'default\',\n  \'page_template\' => \'page\',\n  \'meta_title\' => \'联系方式\',\n  \'meta_keywords\' => \'联系方式\',\n  \'meta_description\' => \'联系方式\',\n  \'category_ruleid\' => \'1\',\n  \'show_ruleid\' => \'\',\n  \'repeatchargedays\' => \'1\',\n)',2,1,0,'lianxifangshi','');
insert  into `v9_category`(`catid`,`siteid`,`module`,`type`,`modelid`,`parentid`,`arrparentid`,`child`,`arrchildid`,`catname`,`style`,`image`,`description`,`parentdir`,`catdir`,`url`,`items`,`hits`,`setting`,`listorder`,`ismenu`,`sethtml`,`letter`,`usable_type`) values (4,1,'content',1,0,1,'0,1',0,'4','版权声明','','','','about/','copyright','http://phpcms_centos.com/index.php?m=content&c=index&a=lists&catid=4',0,0,'array (\n  \'ishtml\' => \'0\',\n  \'template_list\' => \'default\',\n  \'page_template\' => \'page\',\n  \'meta_title\' => \'版权声明\',\n  \'meta_keywords\' => \'版权声明\',\n  \'meta_description\' => \'版权声明\',\n  \'category_ruleid\' => \'6\',\n  \'show_ruleid\' => \'\',\n  \'repeatchargedays\' => \'1\',\n)',3,1,0,'banquanshengming','');
insert  into `v9_category`(`catid`,`siteid`,`module`,`type`,`modelid`,`parentid`,`arrparentid`,`child`,`arrchildid`,`catname`,`style`,`image`,`description`,`parentdir`,`catdir`,`url`,`items`,`hits`,`setting`,`listorder`,`ismenu`,`sethtml`,`letter`,`usable_type`) values (5,1,'content',1,0,1,'0,1',0,'5','招聘信息','','','','about/','hr','/html/about/hr/',0,0,'array (\n  \'ishtml\' => \'1\',\n  \'template_list\' => \'default\',\n  \'page_template\' => \'page\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'category_ruleid\' => \'1\',\n  \'show_ruleid\' => \'\',\n  \'repeatchargedays\' => \'1\',\n)',4,1,0,'zhaopinxinxi','');
insert  into `v9_category`(`catid`,`siteid`,`module`,`type`,`modelid`,`parentid`,`arrparentid`,`child`,`arrchildid`,`catname`,`style`,`image`,`description`,`parentdir`,`catdir`,`url`,`items`,`hits`,`setting`,`listorder`,`ismenu`,`sethtml`,`letter`,`usable_type`) values (6,1,'content',0,1,0,'',0,'','a','','','aa','','aa','',1,0,'{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category\",\"list_template\":\"list\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}',0,1,0,'a','');

/*Table structure for table `v9_category_priv` */

CREATE TABLE `v9_category_priv` (
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `roleid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `is_admin` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `action` char(30) NOT NULL,
  KEY `catid` (`catid`,`roleid`,`is_admin`,`action`),
  KEY `siteid` (`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_category_priv` */

/*Table structure for table `v9_collection_content` */

CREATE TABLE `v9_collection_content` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nodeid` int(10) unsigned NOT NULL DEFAULT '0',
  `siteid` mediumint(5) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` char(255) NOT NULL,
  `title` char(100) NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nodeid` (`nodeid`,`siteid`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_collection_content` */

/*Table structure for table `v9_collection_history` */

CREATE TABLE `v9_collection_history` (
  `md5` char(32) NOT NULL,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`md5`,`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_collection_history` */

/*Table structure for table `v9_collection_node` */

CREATE TABLE `v9_collection_node` (
  `nodeid` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `lastdate` int(10) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `sourcecharset` varchar(8) NOT NULL,
  `sourcetype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `urlpage` text NOT NULL,
  `pagesize_start` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `pagesize_end` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `page_base` char(255) NOT NULL,
  `par_num` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `url_contain` char(100) NOT NULL,
  `url_except` char(100) NOT NULL,
  `url_start` char(100) NOT NULL DEFAULT '',
  `url_end` char(100) NOT NULL DEFAULT '',
  `title_rule` char(100) NOT NULL,
  `title_html_rule` text NOT NULL,
  `author_rule` char(100) NOT NULL,
  `author_html_rule` text NOT NULL,
  `comeform_rule` char(100) NOT NULL,
  `comeform_html_rule` text NOT NULL,
  `time_rule` char(100) NOT NULL,
  `time_html_rule` text NOT NULL,
  `content_rule` char(100) NOT NULL,
  `content_html_rule` text NOT NULL,
  `content_page_start` char(100) NOT NULL,
  `content_page_end` char(100) NOT NULL,
  `content_page_rule` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `content_page` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `content_nextpage` char(100) NOT NULL,
  `down_attachment` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `watermark` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `coll_order` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `customize_config` text NOT NULL,
  PRIMARY KEY (`nodeid`),
  KEY `siteid` (`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_collection_node` */

/*Table structure for table `v9_collection_program` */

CREATE TABLE `v9_collection_program` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `nodeid` int(10) unsigned NOT NULL DEFAULT '0',
  `modelid` mediumint(6) unsigned NOT NULL DEFAULT '0',
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `config` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `siteid` (`siteid`),
  KEY `nodeid` (`nodeid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_collection_program` */

/*Table structure for table `v9_comment` */

CREATE TABLE `v9_comment` (
  `commentid` char(30) NOT NULL,
  `siteid` smallint(5) NOT NULL DEFAULT '0',
  `title` char(255) NOT NULL,
  `url` char(255) NOT NULL,
  `total` int(8) unsigned DEFAULT '0',
  `square` mediumint(8) unsigned DEFAULT '0',
  `anti` mediumint(8) unsigned DEFAULT '0',
  `neutral` mediumint(8) unsigned DEFAULT '0',
  `display_type` tinyint(1) DEFAULT '0',
  `tableid` mediumint(8) unsigned DEFAULT '0',
  `lastupdate` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`commentid`),
  KEY `lastupdate` (`lastupdate`),
  KEY `siteid` (`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_comment` */

/*Table structure for table `v9_comment_check` */

CREATE TABLE `v9_comment_check` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `comment_data_id` int(10) DEFAULT '0' COMMENT '论评ID号',
  `siteid` smallint(5) NOT NULL DEFAULT '0' COMMENT '站点ID',
  `tableid` mediumint(8) DEFAULT '0' COMMENT '数据存储表ID',
  PRIMARY KEY (`id`),
  KEY `siteid` (`siteid`),
  KEY `comment_data_id` (`comment_data_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_comment_check` */

/*Table structure for table `v9_comment_data_1` */

CREATE TABLE `v9_comment_data_1` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '评论ID',
  `commentid` char(30) NOT NULL DEFAULT '' COMMENT '评论ID号',
  `siteid` smallint(5) NOT NULL DEFAULT '0' COMMENT '站点ID',
  `userid` int(10) unsigned DEFAULT '0' COMMENT '用户ID',
  `username` varchar(20) DEFAULT NULL COMMENT '用户名',
  `creat_at` int(10) DEFAULT NULL COMMENT '发布时间',
  `ip` varchar(15) DEFAULT NULL COMMENT '用户IP地址',
  `status` tinyint(1) DEFAULT '0' COMMENT '评论状态{0:未审核,-1:未通过审核,1:通过审核}',
  `content` text COMMENT '评论内容',
  `direction` tinyint(1) DEFAULT '0' COMMENT '评论方向{0:无方向,1:正文,2:反方,3:中立}',
  `support` mediumint(8) unsigned DEFAULT '0' COMMENT '支持数',
  `reply` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否为回复',
  PRIMARY KEY (`id`),
  KEY `commentid` (`commentid`),
  KEY `direction` (`direction`),
  KEY `siteid` (`siteid`),
  KEY `support` (`support`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_comment_data_1` */

/*Table structure for table `v9_comment_setting` */

CREATE TABLE `v9_comment_setting` (
  `siteid` smallint(5) NOT NULL DEFAULT '0' COMMENT '站点ID',
  `guest` tinyint(1) DEFAULT '0' COMMENT '是否允许游客评论',
  `check` tinyint(1) DEFAULT '0' COMMENT '是否需要审核',
  `code` tinyint(1) DEFAULT '0' COMMENT '是否开启验证码',
  `add_point` tinyint(3) unsigned DEFAULT '0' COMMENT '添加的积分数',
  `del_point` tinyint(3) unsigned DEFAULT '0' COMMENT '扣除的积分数',
  PRIMARY KEY (`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_comment_setting` */

insert  into `v9_comment_setting`(`siteid`,`guest`,`check`,`code`,`add_point`,`del_point`) values (1,0,0,0,0,0);

/*Table structure for table `v9_comment_table` */

CREATE TABLE `v9_comment_table` (
  `tableid` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '表ID号',
  `total` int(10) unsigned DEFAULT '0' COMMENT '数据总量',
  `creat_at` int(10) DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`tableid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `v9_comment_table` */

insert  into `v9_comment_table`(`tableid`,`total`,`creat_at`) values (1,0,0);

/*Table structure for table `v9_content_check` */

CREATE TABLE `v9_content_check` (
  `checkid` char(15) NOT NULL,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `title` char(80) NOT NULL,
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  KEY `username` (`username`),
  KEY `checkid` (`checkid`),
  KEY `status` (`status`,`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_content_check` */

/*Table structure for table `v9_copyfrom` */

CREATE TABLE `v9_copyfrom` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `sitename` varchar(30) NOT NULL,
  `siteurl` varchar(100) NOT NULL,
  `thumb` varchar(100) NOT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_copyfrom` */

/*Table structure for table `v9_datacall` */

CREATE TABLE `v9_datacall` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` char(40) DEFAULT NULL,
  `dis_type` tinyint(1) unsigned DEFAULT '0',
  `type` tinyint(1) DEFAULT '0',
  `module` char(20) DEFAULT NULL,
  `action` char(20) DEFAULT NULL,
  `data` text,
  `template` text,
  `cache` mediumint(8) DEFAULT NULL,
  `num` smallint(6) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_datacall` */

/*Table structure for table `v9_dbsource` */

CREATE TABLE `v9_dbsource` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL,
  `host` varchar(20) NOT NULL,
  `port` int(5) NOT NULL DEFAULT '3306',
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `dbname` varchar(50) NOT NULL,
  `dbtablepre` varchar(30) NOT NULL,
  `charset` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `siteid` (`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_dbsource` */

/*Table structure for table `v9_download` */

CREATE TABLE `v9_download` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `typeid` smallint(5) unsigned NOT NULL,
  `title` char(80) NOT NULL DEFAULT '',
  `style` char(24) NOT NULL DEFAULT '',
  `thumb` varchar(100) NOT NULL DEFAULT '',
  `keywords` char(40) NOT NULL DEFAULT '',
  `description` char(255) NOT NULL DEFAULT '',
  `posids` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` char(100) NOT NULL,
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `sysadd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `islink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  `systems` varchar(100) NOT NULL DEFAULT 'Win2000/WinXP/Win2003',
  `copytype` varchar(15) NOT NULL DEFAULT '',
  `language` varchar(10) NOT NULL DEFAULT '',
  `classtype` varchar(20) NOT NULL DEFAULT '',
  `version` varchar(20) NOT NULL DEFAULT '',
  `filesize` varchar(10) NOT NULL DEFAULT 'Unkown',
  `stars` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `status` (`status`,`listorder`,`id`),
  KEY `listorder` (`catid`,`status`,`listorder`,`id`),
  KEY `catid` (`catid`,`status`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_download` */

/*Table structure for table `v9_download_data` */

CREATE TABLE `v9_download_data` (
  `id` mediumint(8) unsigned DEFAULT '0',
  `content` text NOT NULL,
  `readpoint` smallint(5) unsigned NOT NULL DEFAULT '0',
  `groupids_view` varchar(100) NOT NULL,
  `paginationtype` tinyint(1) NOT NULL,
  `maxcharperpage` mediumint(6) NOT NULL,
  `template` varchar(30) NOT NULL,
  `paytype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `relation` varchar(255) NOT NULL DEFAULT '',
  `allow_comment` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `downfiles` mediumtext NOT NULL,
  `downfile` varchar(255) NOT NULL DEFAULT '',
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_download_data` */

/*Table structure for table `v9_downservers` */

CREATE TABLE `v9_downservers` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `sitename` varchar(100) DEFAULT NULL,
  `siteurl` varchar(255) DEFAULT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_downservers` */

/*Table structure for table `v9_extend_setting` */

CREATE TABLE `v9_extend_setting` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `key` char(30) NOT NULL,
  `data` mediumtext,
  PRIMARY KEY (`id`),
  KEY `key` (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_extend_setting` */

/*Table structure for table `v9_favorite` */

CREATE TABLE `v9_favorite` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `title` char(100) NOT NULL,
  `url` char(100) NOT NULL,
  `adddate` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_favorite` */

/*Table structure for table `v9_hits` */

CREATE TABLE `v9_hits` (
  `hitsid` char(30) NOT NULL,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `views` int(10) unsigned NOT NULL DEFAULT '0',
  `yesterdayviews` int(10) unsigned NOT NULL DEFAULT '0',
  `dayviews` int(10) unsigned NOT NULL DEFAULT '0',
  `weekviews` int(10) unsigned NOT NULL DEFAULT '0',
  `monthviews` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`hitsid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_hits` */

insert  into `v9_hits`(`hitsid`,`catid`,`views`,`yesterdayviews`,`dayviews`,`weekviews`,`monthviews`,`updatetime`) values ('special-c-1-1',0,1,0,1,1,1,1465275428);
insert  into `v9_hits`(`hitsid`,`catid`,`views`,`yesterdayviews`,`dayviews`,`weekviews`,`monthviews`,`updatetime`) values ('c-1-1',6,0,0,0,0,0,1465276251);

/*Table structure for table `v9_ipbanned` */

CREATE TABLE `v9_ipbanned` (
  `ipbannedid` smallint(5) NOT NULL AUTO_INCREMENT,
  `ip` char(15) NOT NULL,
  `expires` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ipbannedid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_ipbanned` */

/*Table structure for table `v9_keylink` */

CREATE TABLE `v9_keylink` (
  `keylinkid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `word` char(40) NOT NULL,
  `url` char(100) NOT NULL,
  PRIMARY KEY (`keylinkid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_keylink` */

/*Table structure for table `v9_keyword` */

CREATE TABLE `v9_keyword` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `keyword` char(100) NOT NULL,
  `pinyin` char(100) NOT NULL,
  `videonum` int(11) NOT NULL DEFAULT '0',
  `searchnums` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `keyword` (`keyword`,`siteid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `v9_keyword` */

insert  into `v9_keyword`(`id`,`siteid`,`keyword`,`pinyin`,`videonum`,`searchnums`) values (1,1,'aaa','aaa',1,0);

/*Table structure for table `v9_keyword_data` */

CREATE TABLE `v9_keyword_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tagid` int(10) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `contentid` char(30) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tagid` (`tagid`,`siteid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `v9_keyword_data` */

insert  into `v9_keyword_data`(`id`,`tagid`,`siteid`,`contentid`) values (1,1,1,'1-1');

/*Table structure for table `v9_link` */

CREATE TABLE `v9_link` (
  `linkid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned DEFAULT '0',
  `typeid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `linktype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `logo` varchar(255) NOT NULL DEFAULT '',
  `introduce` text NOT NULL,
  `username` varchar(30) NOT NULL DEFAULT '',
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `elite` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `passed` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`linkid`),
  KEY `typeid` (`typeid`,`passed`,`listorder`,`linkid`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `v9_link` */

insert  into `v9_link`(`linkid`,`siteid`,`typeid`,`linktype`,`name`,`url`,`logo`,`introduce`,`username`,`listorder`,`elite`,`passed`,`addtime`) values (1,1,0,1,'PHPCMS','http://www.phpcms.cn','http://www.phpcms.cn/images/logo_88_31.gif','','',0,0,1,1465219615);
insert  into `v9_link`(`linkid`,`siteid`,`typeid`,`linktype`,`name`,`url`,`logo`,`introduce`,`username`,`listorder`,`elite`,`passed`,`addtime`) values (3,1,53,0,'33','http://333','','33','33',0,1,1,1465269201);
insert  into `v9_link`(`linkid`,`siteid`,`typeid`,`linktype`,`name`,`url`,`logo`,`introduce`,`username`,`listorder`,`elite`,`passed`,`addtime`) values (4,1,53,0,'555','http://3333333','','eee','eeee',0,0,1,1465269275);
insert  into `v9_link`(`linkid`,`siteid`,`typeid`,`linktype`,`name`,`url`,`logo`,`introduce`,`username`,`listorder`,`elite`,`passed`,`addtime`) values (5,1,54,0,'rrrr','http://rrr','','444','444',0,0,1,1465269326);

/*Table structure for table `v9_linkage` */

CREATE TABLE `v9_linkage` (
  `linkageid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `style` varchar(35) NOT NULL,
  `parentid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `child` tinyint(1) NOT NULL,
  `arrchildid` mediumtext NOT NULL,
  `keyid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `description` varchar(255) DEFAULT NULL,
  `setting` varchar(255) DEFAULT NULL,
  `siteid` smallint(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`linkageid`,`keyid`),
  KEY `parentid` (`parentid`,`listorder`)
) ENGINE=MyISAM AUTO_INCREMENT=3360 DEFAULT CHARSET=utf8;

/*Data for the table `v9_linkage` */

insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1,'中国','1',0,0,'',0,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2,'北京市','0',0,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3,'上海市','0',0,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (4,'天津市','0',0,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (5,'重庆市','0',0,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (6,'河北省','0',0,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (7,'山西省','0',0,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (8,'内蒙古','0',0,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (9,'辽宁省','0',0,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (10,'吉林省','0',0,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (11,'黑龙江省','0',0,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (12,'江苏省','0',0,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (13,'浙江省','0',0,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (14,'安徽省','0',0,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (15,'福建省','0',0,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (16,'江西省','0',0,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (17,'山东省','0',0,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (18,'河南省','0',0,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (19,'湖北省','0',0,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (20,'湖南省','0',0,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (21,'广东省','0',0,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (22,'广西','0',0,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (23,'海南省','0',0,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (24,'四川省','0',0,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (25,'贵州省','0',0,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (26,'云南省','0',0,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (27,'西藏','0',0,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (28,'陕西省','0',0,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (29,'甘肃省','0',0,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (30,'青海省','0',0,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (31,'宁夏','0',0,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (32,'新疆','0',0,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (33,'台湾省','0',0,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (34,'香港','0',0,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (35,'澳门','0',0,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (36,'东城区','0',2,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (37,'西城区','0',2,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (38,'崇文区','0',2,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (39,'宣武区','0',2,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (40,'朝阳区','0',2,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (41,'石景山区','0',2,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (42,'海淀区','0',2,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (43,'门头沟区','0',2,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (44,'房山区','0',2,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (45,'通州区','0',2,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (46,'顺义区','0',2,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (47,'昌平区','0',2,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (48,'大兴区','0',2,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (49,'怀柔区','0',2,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (50,'平谷区','0',2,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (51,'密云县','0',2,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (52,'延庆县','0',2,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (53,'黄浦区','0',3,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (54,'卢湾区','0',3,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (55,'徐汇区','0',3,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (56,'长宁区','0',3,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (57,'静安区','0',3,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (58,'普陀区','0',3,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (59,'闸北区','0',3,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (60,'虹口区','0',3,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (61,'杨浦区','0',3,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (62,'闵行区','0',3,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (63,'宝山区','0',3,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (64,'嘉定区','0',3,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (65,'浦东新区','0',3,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (66,'金山区','0',3,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (67,'松江区','0',3,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (68,'青浦区','0',3,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (69,'南汇区','0',3,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (70,'奉贤区','0',3,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (71,'崇明县','0',3,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (72,'和平区','0',4,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (73,'河东区','0',4,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (74,'河西区','0',4,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (75,'南开区','0',4,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (76,'河北区','0',4,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (77,'红桥区','0',4,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (78,'塘沽区','0',4,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (79,'汉沽区','0',4,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (80,'大港区','0',4,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (81,'东丽区','0',4,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (82,'西青区','0',4,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (83,'津南区','0',4,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (84,'北辰区','0',4,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (85,'武清区','0',4,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (86,'宝坻区','0',4,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (87,'宁河县','0',4,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (88,'静海县','0',4,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (89,'蓟县','0',4,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (90,'万州区','0',5,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (91,'涪陵区','0',5,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (92,'渝中区','0',5,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (93,'大渡口区','0',5,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (94,'江北区','0',5,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (95,'沙坪坝区','0',5,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (96,'九龙坡区','0',5,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (97,'南岸区','0',5,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (98,'北碚区','0',5,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (99,'万盛区','0',5,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (100,'双桥区','0',5,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (101,'渝北区','0',5,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (102,'巴南区','0',5,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (103,'黔江区','0',5,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (104,'长寿区','0',5,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (105,'綦江县','0',5,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (106,'潼南县','0',5,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (107,'铜梁县','0',5,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (108,'大足县','0',5,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (109,'荣昌县','0',5,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (110,'璧山县','0',5,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (111,'梁平县','0',5,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (112,'城口县','0',5,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (113,'丰都县','0',5,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (114,'垫江县','0',5,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (115,'武隆县','0',5,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (116,'忠县','0',5,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (117,'开县','0',5,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (118,'云阳县','0',5,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (119,'奉节县','0',5,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (120,'巫山县','0',5,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (121,'巫溪县','0',5,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (122,'石柱县','0',5,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (123,'秀山县','0',5,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (124,'酉阳县','0',5,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (125,'彭水县','0',5,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (126,'江津区','0',5,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (127,'合川区','0',5,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (128,'永川区','0',5,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (129,'南川区','0',5,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (130,'石家庄市','0',6,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (131,'唐山市','0',6,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (132,'秦皇岛市','0',6,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (133,'邯郸市','0',6,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (134,'邢台市','0',6,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (135,'保定市','0',6,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (136,'张家口市','0',6,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (137,'承德市','0',6,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (138,'沧州市','0',6,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (139,'廊坊市','0',6,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (140,'衡水市','0',6,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (141,'太原市','0',7,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (142,'大同市','0',7,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (143,'阳泉市','0',7,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (144,'长治市','0',7,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (145,'晋城市','0',7,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (146,'朔州市','0',7,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (147,'晋中市','0',7,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (148,'运城市','0',7,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (149,'忻州市','0',7,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (150,'临汾市','0',7,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (151,'吕梁市','0',7,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (152,'呼和浩特市','0',8,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (153,'包头市','0',8,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (154,'乌海市','0',8,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (155,'赤峰市','0',8,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (156,'通辽市','0',8,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (157,'鄂尔多斯市','0',8,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (158,'呼伦贝尔市','0',8,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (159,'巴彦淖尔市','0',8,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (160,'乌兰察布市','0',8,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (161,'兴安盟','0',8,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (162,'锡林郭勒盟','0',8,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (163,'阿拉善盟','0',8,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (164,'沈阳市','0',9,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (165,'大连市','0',9,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (166,'鞍山市','0',9,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (167,'抚顺市','0',9,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (168,'本溪市','0',9,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (169,'丹东市','0',9,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (170,'锦州市','0',9,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (171,'营口市','0',9,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (172,'阜新市','0',9,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (173,'辽阳市','0',9,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (174,'盘锦市','0',9,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (175,'铁岭市','0',9,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (176,'朝阳市','0',9,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (177,'葫芦岛市','0',9,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (178,'长春市','0',10,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (179,'吉林市','0',10,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (180,'四平市','0',10,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (181,'辽源市','0',10,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (182,'通化市','0',10,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (183,'白山市','0',10,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (184,'松原市','0',10,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (185,'白城市','0',10,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (186,'延边','0',10,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (187,'哈尔滨市','0',11,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (188,'齐齐哈尔市','0',11,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (189,'鸡西市','0',11,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (190,'鹤岗市','0',11,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (191,'双鸭山市','0',11,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (192,'大庆市','0',11,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (193,'伊春市','0',11,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (194,'佳木斯市','0',11,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (195,'七台河市','0',11,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (196,'牡丹江市','0',11,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (197,'黑河市','0',11,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (198,'绥化市','0',11,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (199,'大兴安岭地区','0',11,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (200,'南京市','0',12,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (201,'无锡市','0',12,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (202,'徐州市','0',12,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (203,'常州市','0',12,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (204,'苏州市','0',12,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (205,'南通市','0',12,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (206,'连云港市','0',12,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (207,'淮安市','0',12,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (208,'盐城市','0',12,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (209,'扬州市','0',12,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (210,'镇江市','0',12,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (211,'泰州市','0',12,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (212,'宿迁市','0',12,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (213,'杭州市','0',13,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (214,'宁波市','0',13,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (215,'温州市','0',13,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (216,'嘉兴市','0',13,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (217,'湖州市','0',13,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (218,'绍兴市','0',13,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (219,'金华市','0',13,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (220,'衢州市','0',13,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (221,'舟山市','0',13,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (222,'台州市','0',13,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (223,'丽水市','0',13,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (224,'合肥市','0',14,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (225,'芜湖市','0',14,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (226,'蚌埠市','0',14,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (227,'淮南市','0',14,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (228,'马鞍山市','0',14,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (229,'淮北市','0',14,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (230,'铜陵市','0',14,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (231,'安庆市','0',14,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (232,'黄山市','0',14,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (233,'滁州市','0',14,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (234,'阜阳市','0',14,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (235,'宿州市','0',14,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (236,'巢湖市','0',14,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (237,'六安市','0',14,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (238,'亳州市','0',14,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (239,'池州市','0',14,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (240,'宣城市','0',14,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (241,'福州市','0',15,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (242,'厦门市','0',15,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (243,'莆田市','0',15,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (244,'三明市','0',15,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (245,'泉州市','0',15,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (246,'漳州市','0',15,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (247,'南平市','0',15,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (248,'龙岩市','0',15,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (249,'宁德市','0',15,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (250,'南昌市','0',16,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (251,'景德镇市','0',16,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (252,'萍乡市','0',16,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (253,'九江市','0',16,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (254,'新余市','0',16,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (255,'鹰潭市','0',16,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (256,'赣州市','0',16,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (257,'吉安市','0',16,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (258,'宜春市','0',16,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (259,'抚州市','0',16,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (260,'上饶市','0',16,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (261,'济南市','0',17,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (262,'青岛市','0',17,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (263,'淄博市','0',17,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (264,'枣庄市','0',17,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (265,'东营市','0',17,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (266,'烟台市','0',17,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (267,'潍坊市','0',17,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (268,'济宁市','0',17,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (269,'泰安市','0',17,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (270,'威海市','0',17,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (271,'日照市','0',17,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (272,'莱芜市','0',17,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (273,'临沂市','0',17,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (274,'德州市','0',17,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (275,'聊城市','0',17,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (276,'滨州市','0',17,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (277,'荷泽市','0',17,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (278,'郑州市','0',18,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (279,'开封市','0',18,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (280,'洛阳市','0',18,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (281,'平顶山市','0',18,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (282,'安阳市','0',18,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (283,'鹤壁市','0',18,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (284,'新乡市','0',18,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (285,'焦作市','0',18,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (286,'濮阳市','0',18,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (287,'许昌市','0',18,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (288,'漯河市','0',18,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (289,'三门峡市','0',18,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (290,'南阳市','0',18,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (291,'商丘市','0',18,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (292,'信阳市','0',18,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (293,'周口市','0',18,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (294,'驻马店市','0',18,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (295,'武汉市','0',19,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (296,'黄石市','0',19,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (297,'十堰市','0',19,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (298,'宜昌市','0',19,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (299,'襄樊市','0',19,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (300,'鄂州市','0',19,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (301,'荆门市','0',19,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (302,'孝感市','0',19,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (303,'荆州市','0',19,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (304,'黄冈市','0',19,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (305,'咸宁市','0',19,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (306,'随州市','0',19,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (307,'恩施土家族苗族自治州','0',19,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (308,'仙桃市','0',19,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (309,'潜江市','0',19,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (310,'天门市','0',19,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (311,'神农架林区','0',19,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (312,'长沙市','0',20,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (313,'株洲市','0',20,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (314,'湘潭市','0',20,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (315,'衡阳市','0',20,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (316,'邵阳市','0',20,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (317,'岳阳市','0',20,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (318,'常德市','0',20,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (319,'张家界市','0',20,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (320,'益阳市','0',20,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (321,'郴州市','0',20,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (322,'永州市','0',20,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (323,'怀化市','0',20,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (324,'娄底市','0',20,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (325,'湘西土家族苗族自治州','0',20,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (326,'广州市','0',21,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (327,'韶关市','0',21,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (328,'深圳市','0',21,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (329,'珠海市','0',21,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (330,'汕头市','0',21,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (331,'佛山市','0',21,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (332,'江门市','0',21,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (333,'湛江市','0',21,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (334,'茂名市','0',21,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (335,'肇庆市','0',21,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (336,'惠州市','0',21,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (337,'梅州市','0',21,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (338,'汕尾市','0',21,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (339,'河源市','0',21,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (340,'阳江市','0',21,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (341,'清远市','0',21,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (342,'东莞市','0',21,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (343,'中山市','0',21,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (344,'潮州市','0',21,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (345,'揭阳市','0',21,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (346,'云浮市','0',21,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (347,'南宁市','0',22,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (348,'柳州市','0',22,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (349,'桂林市','0',22,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (350,'梧州市','0',22,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (351,'北海市','0',22,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (352,'防城港市','0',22,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (353,'钦州市','0',22,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (354,'贵港市','0',22,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (355,'玉林市','0',22,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (356,'百色市','0',22,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (357,'贺州市','0',22,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (358,'河池市','0',22,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (359,'来宾市','0',22,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (360,'崇左市','0',22,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (361,'海口市','0',23,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (362,'三亚市','0',23,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (363,'五指山市','0',23,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (364,'琼海市','0',23,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (365,'儋州市','0',23,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (366,'文昌市','0',23,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (367,'万宁市','0',23,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (368,'东方市','0',23,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (369,'定安县','0',23,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (370,'屯昌县','0',23,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (371,'澄迈县','0',23,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (372,'临高县','0',23,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (373,'白沙黎族自治县','0',23,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (374,'昌江黎族自治县','0',23,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (375,'乐东黎族自治县','0',23,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (376,'陵水黎族自治县','0',23,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (377,'保亭黎族苗族自治县','0',23,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (378,'琼中黎族苗族自治县','0',23,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (379,'西沙群岛','0',23,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (380,'南沙群岛','0',23,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (381,'中沙群岛的岛礁及其海域','0',23,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (382,'成都市','0',24,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (383,'自贡市','0',24,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (384,'攀枝花市','0',24,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (385,'泸州市','0',24,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (386,'德阳市','0',24,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (387,'绵阳市','0',24,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (388,'广元市','0',24,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (389,'遂宁市','0',24,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (390,'内江市','0',24,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (391,'乐山市','0',24,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (392,'南充市','0',24,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (393,'眉山市','0',24,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (394,'宜宾市','0',24,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (395,'广安市','0',24,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (396,'达州市','0',24,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (397,'雅安市','0',24,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (398,'巴中市','0',24,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (399,'资阳市','0',24,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (400,'阿坝州','0',24,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (401,'甘孜州','0',24,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (402,'凉山州','0',24,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (403,'贵阳市','0',25,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (404,'六盘水市','0',25,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (405,'遵义市','0',25,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (406,'安顺市','0',25,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (407,'铜仁地区','0',25,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (408,'黔西南州','0',25,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (409,'毕节地区','0',25,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (410,'黔东南州','0',25,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (411,'黔南州','0',25,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (412,'昆明市','0',26,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (413,'曲靖市','0',26,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (414,'玉溪市','0',26,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (415,'保山市','0',26,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (416,'昭通市','0',26,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (417,'丽江市','0',26,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (418,'思茅市','0',26,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (419,'临沧市','0',26,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (420,'楚雄州','0',26,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (421,'红河州','0',26,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (422,'文山州','0',26,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (423,'西双版纳','0',26,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (424,'大理','0',26,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (425,'德宏','0',26,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (426,'怒江','0',26,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (427,'迪庆','0',26,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (428,'拉萨市','0',27,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (429,'昌都','0',27,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (430,'山南','0',27,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (431,'日喀则','0',27,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (432,'那曲','0',27,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (433,'阿里','0',27,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (434,'林芝','0',27,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (435,'西安市','0',28,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (436,'铜川市','0',28,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (437,'宝鸡市','0',28,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (438,'咸阳市','0',28,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (439,'渭南市','0',28,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (440,'延安市','0',28,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (441,'汉中市','0',28,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (442,'榆林市','0',28,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (443,'安康市','0',28,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (444,'商洛市','0',28,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (445,'兰州市','0',29,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (446,'嘉峪关市','0',29,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (447,'金昌市','0',29,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (448,'白银市','0',29,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (449,'天水市','0',29,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (450,'武威市','0',29,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (451,'张掖市','0',29,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (452,'平凉市','0',29,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (453,'酒泉市','0',29,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (454,'庆阳市','0',29,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (455,'定西市','0',29,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (456,'陇南市','0',29,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (457,'临夏州','0',29,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (458,'甘州','0',29,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (459,'西宁市','0',30,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (460,'海东地区','0',30,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (461,'海州','0',30,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (462,'黄南州','0',30,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (463,'海南州','0',30,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (464,'果洛州','0',30,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (465,'玉树州','0',30,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (466,'海西州','0',30,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (467,'银川市','0',31,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (468,'石嘴山市','0',31,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (469,'吴忠市','0',31,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (470,'固原市','0',31,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (471,'中卫市','0',31,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (472,'乌鲁木齐市','0',32,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (473,'克拉玛依市','0',32,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (474,'吐鲁番地区','0',32,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (475,'哈密地区','0',32,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (476,'昌吉州','0',32,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (477,'博尔州','0',32,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (478,'巴音郭楞州','0',32,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (479,'阿克苏地区','0',32,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (480,'克孜勒苏柯尔克孜自治州','0',32,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (481,'喀什地区','0',32,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (482,'和田地区','0',32,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (483,'伊犁州','0',32,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (484,'塔城地区','0',32,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (485,'阿勒泰地区','0',32,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (486,'石河子市','0',32,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (487,'阿拉尔市','0',32,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (488,'图木舒克市','0',32,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (489,'五家渠市','0',32,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (490,'台北市','0',33,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (491,'高雄市','0',33,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (492,'基隆市','0',33,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (493,'新竹市','0',33,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (494,'台中市','0',33,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (495,'嘉义市','0',33,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (496,'台南市','0',33,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (497,'台北县','0',33,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (498,'桃园县','0',33,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (499,'新竹县','0',33,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (500,'苗栗县','0',33,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (501,'台中县','0',33,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (502,'彰化县','0',33,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (503,'南投县','0',33,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (504,'云林县','0',33,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (505,'嘉义县','0',33,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (506,'台南县','0',33,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (507,'高雄县','0',33,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (508,'屏东县','0',33,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (509,'宜兰县','0',33,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (510,'花莲县','0',33,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (511,'台东县','0',33,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (512,'澎湖县','0',33,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (513,'金门县','0',33,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (514,'连江县','0',33,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (515,'中西区','0',34,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (516,'东区','0',34,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (517,'南区','0',34,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (518,'湾仔区','0',34,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (519,'九龙城区','0',34,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (520,'观塘区','0',34,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (521,'深水埗区','0',34,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (522,'黄大仙区','0',34,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (523,'油尖旺区','0',34,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (524,'离岛区','0',34,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (525,'葵青区','0',34,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (526,'北区','0',34,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (527,'西贡区','0',34,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (528,'沙田区','0',34,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (529,'大埔区','0',34,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (530,'荃湾区','0',34,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (531,'屯门区','0',34,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (532,'元朗区','0',34,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (533,'花地玛堂区','0',35,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (534,'市圣安多尼堂区','0',35,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (535,'大堂区','0',35,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (536,'望德堂区','0',35,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (537,'风顺堂区','0',35,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (538,'嘉模堂区','0',35,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (539,'圣方济各堂区','0',35,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (540,'长安区','0',130,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (541,'桥东区','0',130,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (542,'桥西区','0',130,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (543,'新华区','0',130,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (544,'井陉矿区','0',130,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (545,'裕华区','0',130,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (546,'井陉县','0',130,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (547,'正定县','0',130,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (548,'栾城县','0',130,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (549,'行唐县','0',130,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (550,'灵寿县','0',130,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (551,'高邑县','0',130,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (552,'深泽县','0',130,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (553,'赞皇县','0',130,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (554,'无极县','0',130,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (555,'平山县','0',130,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (556,'元氏县','0',130,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (557,'赵县','0',130,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (558,'辛集市','0',130,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (559,'藁城市','0',130,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (560,'晋州市','0',130,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (561,'新乐市','0',130,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (562,'鹿泉市','0',130,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (563,'路南区','0',131,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (564,'路北区','0',131,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (565,'古冶区','0',131,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (566,'开平区','0',131,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (567,'丰南区','0',131,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (568,'丰润区','0',131,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (569,'滦县','0',131,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (570,'滦南县','0',131,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (571,'乐亭县','0',131,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (572,'迁西县','0',131,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (573,'玉田县','0',131,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (574,'唐海县','0',131,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (575,'遵化市','0',131,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (576,'迁安市','0',131,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (577,'海港区','0',132,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (578,'山海关区','0',132,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (579,'北戴河区','0',132,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (580,'青龙县','0',132,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (581,'昌黎县','0',132,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (582,'抚宁县','0',132,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (583,'卢龙县','0',132,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (584,'邯山区','0',133,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (585,'丛台区','0',133,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (586,'复兴区','0',133,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (587,'峰峰矿区','0',133,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (588,'邯郸县','0',133,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (589,'临漳县','0',133,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (590,'成安县','0',133,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (591,'大名县','0',133,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (592,'涉县','0',133,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (593,'磁县','0',133,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (594,'肥乡县','0',133,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (595,'永年县','0',133,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (596,'邱县','0',133,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (597,'鸡泽县','0',133,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (598,'广平县','0',133,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (599,'馆陶县','0',133,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (600,'魏县','0',133,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (601,'曲周县','0',133,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (602,'武安市','0',133,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (603,'桥东区','0',134,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (604,'桥西区','0',134,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (605,'邢台县','0',134,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (606,'临城县','0',134,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (607,'内丘县','0',134,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (608,'柏乡县','0',134,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (609,'隆尧县','0',134,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (610,'任县','0',134,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (611,'南和县','0',134,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (612,'宁晋县','0',134,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (613,'巨鹿县','0',134,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (614,'新河县','0',134,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (615,'广宗县','0',134,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (616,'平乡县','0',134,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (617,'威县','0',134,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (618,'清河县','0',134,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (619,'临西县','0',134,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (620,'南宫市','0',134,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (621,'沙河市','0',134,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (622,'新市区','0',135,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (623,'北市区','0',135,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (624,'南市区','0',135,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (625,'满城县','0',135,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (626,'清苑县','0',135,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (627,'涞水县','0',135,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (628,'阜平县','0',135,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (629,'徐水县','0',135,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (630,'定兴县','0',135,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (631,'唐县','0',135,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (632,'高阳县','0',135,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (633,'容城县','0',135,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (634,'涞源县','0',135,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (635,'望都县','0',135,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (636,'安新县','0',135,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (637,'易县','0',135,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (638,'曲阳县','0',135,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (639,'蠡县','0',135,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (640,'顺平县','0',135,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (641,'博野县','0',135,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (642,'雄县','0',135,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (643,'涿州市','0',135,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (644,'定州市','0',135,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (645,'安国市','0',135,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (646,'高碑店市','0',135,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (647,'桥东区','0',136,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (648,'桥西区','0',136,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (649,'宣化区','0',136,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (650,'下花园区','0',136,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (651,'宣化县','0',136,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (652,'张北县','0',136,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (653,'康保县','0',136,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (654,'沽源县','0',136,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (655,'尚义县','0',136,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (656,'蔚县','0',136,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (657,'阳原县','0',136,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (658,'怀安县','0',136,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (659,'万全县','0',136,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (660,'怀来县','0',136,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (661,'涿鹿县','0',136,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (662,'赤城县','0',136,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (663,'崇礼县','0',136,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (664,'双桥区','0',137,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (665,'双滦区','0',137,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (666,'鹰手营子矿区','0',137,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (667,'承德县','0',137,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (668,'兴隆县','0',137,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (669,'平泉县','0',137,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (670,'滦平县','0',137,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (671,'隆化县','0',137,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (672,'丰宁县','0',137,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (673,'宽城县','0',137,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (674,'围场县','0',137,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (675,'新华区','0',138,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (676,'运河区','0',138,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (677,'沧县','0',138,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (678,'青县','0',138,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (679,'东光县','0',138,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (680,'海兴县','0',138,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (681,'盐山县','0',138,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (682,'肃宁县','0',138,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (683,'南皮县','0',138,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (684,'吴桥县','0',138,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (685,'献县','0',138,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (686,'孟村县','0',138,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (687,'泊头市','0',138,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (688,'任丘市','0',138,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (689,'黄骅市','0',138,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (690,'河间市','0',138,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (691,'安次区','0',139,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (692,'广阳区','0',139,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (693,'固安县','0',139,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (694,'永清县','0',139,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (695,'香河县','0',139,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (696,'大城县','0',139,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (697,'文安县','0',139,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (698,'大厂县','0',139,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (699,'霸州市','0',139,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (700,'三河市','0',139,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (701,'桃城区','0',140,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (702,'枣强县','0',140,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (703,'武邑县','0',140,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (704,'武强县','0',140,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (705,'饶阳县','0',140,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (706,'安平县','0',140,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (707,'故城县','0',140,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (708,'景县','0',140,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (709,'阜城县','0',140,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (710,'冀州市','0',140,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (711,'深州市','0',140,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (712,'小店区','0',141,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (713,'迎泽区','0',141,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (714,'杏花岭区','0',141,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (715,'尖草坪区','0',141,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (716,'万柏林区','0',141,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (717,'晋源区','0',141,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (718,'清徐县','0',141,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (719,'阳曲县','0',141,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (720,'娄烦县','0',141,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (721,'古交市','0',141,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (722,'城区','0',142,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (723,'矿区','0',142,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (724,'南郊区','0',142,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (725,'新荣区','0',142,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (726,'阳高县','0',142,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (727,'天镇县','0',142,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (728,'广灵县','0',142,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (729,'灵丘县','0',142,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (730,'浑源县','0',142,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (731,'左云县','0',142,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (732,'大同县','0',142,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (733,'城区','0',143,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (734,'矿区','0',143,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (735,'郊区','0',143,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (736,'平定县','0',143,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (737,'盂县','0',143,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (738,'城区','0',144,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (739,'郊区','0',144,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (740,'长治县','0',144,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (741,'襄垣县','0',144,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (742,'屯留县','0',144,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (743,'平顺县','0',144,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (744,'黎城县','0',144,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (745,'壶关县','0',144,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (746,'长子县','0',144,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (747,'武乡县','0',144,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (748,'沁县','0',144,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (749,'沁源县','0',144,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (750,'潞城市','0',144,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (751,'城区','0',145,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (752,'沁水县','0',145,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (753,'阳城县','0',145,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (754,'陵川县','0',145,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (755,'泽州县','0',145,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (756,'高平市','0',145,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (757,'朔城区','0',146,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (758,'平鲁区','0',146,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (759,'山阴县','0',146,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (760,'应县','0',146,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (761,'右玉县','0',146,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (762,'怀仁县','0',146,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (763,'榆次区','0',147,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (764,'榆社县','0',147,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (765,'左权县','0',147,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (766,'和顺县','0',147,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (767,'昔阳县','0',147,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (768,'寿阳县','0',147,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (769,'太谷县','0',147,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (770,'祁县','0',147,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (771,'平遥县','0',147,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (772,'灵石县','0',147,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (773,'介休市','0',147,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (774,'盐湖区','0',148,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (775,'临猗县','0',148,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (776,'万荣县','0',148,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (777,'闻喜县','0',148,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (778,'稷山县','0',148,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (779,'新绛县','0',148,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (780,'绛县','0',148,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (781,'垣曲县','0',148,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (782,'夏县','0',148,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (783,'平陆县','0',148,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (784,'芮城县','0',148,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (785,'永济市','0',148,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (786,'河津市','0',148,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (787,'忻府区','0',149,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (788,'定襄县','0',149,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (789,'五台县','0',149,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (790,'代县','0',149,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (791,'繁峙县','0',149,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (792,'宁武县','0',149,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (793,'静乐县','0',149,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (794,'神池县','0',149,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (795,'五寨县','0',149,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (796,'岢岚县','0',149,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (797,'河曲县','0',149,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (798,'保德县','0',149,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (799,'偏关县','0',149,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (800,'原平市','0',149,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (801,'尧都区','0',150,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (802,'曲沃县','0',150,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (803,'翼城县','0',150,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (804,'襄汾县','0',150,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (805,'洪洞县','0',150,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (806,'古县','0',150,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (807,'安泽县','0',150,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (808,'浮山县','0',150,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (809,'吉县','0',150,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (810,'乡宁县','0',150,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (811,'大宁县','0',150,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (812,'隰县','0',150,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (813,'永和县','0',150,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (814,'蒲县','0',150,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (815,'汾西县','0',150,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (816,'侯马市','0',150,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (817,'霍州市','0',150,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (818,'离石区','0',151,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (819,'文水县','0',151,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (820,'交城县','0',151,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (821,'兴县','0',151,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (822,'临县','0',151,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (823,'柳林县','0',151,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (824,'石楼县','0',151,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (825,'岚县','0',151,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (826,'方山县','0',151,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (827,'中阳县','0',151,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (828,'交口县','0',151,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (829,'孝义市','0',151,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (830,'汾阳市','0',151,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (831,'新城区','0',152,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (832,'回民区','0',152,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (833,'玉泉区','0',152,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (834,'赛罕区','0',152,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (835,'土默特左旗','0',152,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (836,'托克托县','0',152,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (837,'和林格尔县','0',152,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (838,'清水河县','0',152,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (839,'武川县','0',152,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (840,'东河区','0',153,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (841,'昆都仑区','0',153,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (842,'青山区','0',153,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (843,'石拐区','0',153,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (844,'白云矿区','0',153,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (845,'九原区','0',153,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (846,'土默特右旗','0',153,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (847,'固阳县','0',153,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (848,'达尔罕茂明安联合旗','0',153,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (849,'海勃湾区','0',154,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (850,'海南区','0',154,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (851,'乌达区','0',154,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (852,'红山区','0',155,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (853,'元宝山区','0',155,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (854,'松山区','0',155,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (855,'阿鲁科尔沁旗','0',155,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (856,'巴林左旗','0',155,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (857,'巴林右旗','0',155,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (858,'林西县','0',155,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (859,'克什克腾旗','0',155,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (860,'翁牛特旗','0',155,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (861,'喀喇沁旗','0',155,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (862,'宁城县','0',155,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (863,'敖汉旗','0',155,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (864,'科尔沁区','0',156,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (865,'科尔沁左翼中旗','0',156,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (866,'科尔沁左翼后旗','0',156,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (867,'开鲁县','0',156,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (868,'库伦旗','0',156,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (869,'奈曼旗','0',156,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (870,'扎鲁特旗','0',156,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (871,'霍林郭勒市','0',156,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (872,'东胜区','0',157,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (873,'达拉特旗','0',157,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (874,'准格尔旗','0',157,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (875,'鄂托克前旗','0',157,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (876,'鄂托克旗','0',157,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (877,'杭锦旗','0',157,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (878,'乌审旗','0',157,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (879,'伊金霍洛旗','0',157,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (880,'海拉尔区','0',158,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (881,'阿荣旗','0',158,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (882,'莫力达瓦达斡尔族自治旗','0',158,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (883,'鄂伦春自治旗','0',158,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (884,'鄂温克族自治旗','0',158,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (885,'陈巴尔虎旗','0',158,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (886,'新巴尔虎左旗','0',158,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (887,'新巴尔虎右旗','0',158,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (888,'满洲里市','0',158,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (889,'牙克石市','0',158,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (890,'扎兰屯市','0',158,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (891,'额尔古纳市','0',158,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (892,'根河市','0',158,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (893,'临河区','0',159,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (894,'五原县','0',159,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (895,'磴口县','0',159,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (896,'乌拉特前旗','0',159,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (897,'乌拉特中旗','0',159,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (898,'乌拉特后旗','0',159,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (899,'杭锦后旗','0',159,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (900,'集宁区','0',160,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (901,'卓资县','0',160,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (902,'化德县','0',160,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (903,'商都县','0',160,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (904,'兴和县','0',160,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (905,'凉城县','0',160,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (906,'察哈尔右翼前旗','0',160,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (907,'察哈尔右翼中旗','0',160,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (908,'察哈尔右翼后旗','0',160,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (909,'四子王旗','0',160,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (910,'丰镇市','0',160,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (911,'乌兰浩特市','0',161,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (912,'阿尔山市','0',161,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (913,'科尔沁右翼前旗','0',161,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (914,'科尔沁右翼中旗','0',161,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (915,'扎赉特旗','0',161,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (916,'突泉县','0',161,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (917,'二连浩特市','0',162,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (918,'锡林浩特市','0',162,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (919,'阿巴嘎旗','0',162,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (920,'苏尼特左旗','0',162,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (921,'苏尼特右旗','0',162,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (922,'东乌珠穆沁旗','0',162,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (923,'西乌珠穆沁旗','0',162,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (924,'太仆寺旗','0',162,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (925,'镶黄旗','0',162,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (926,'正镶白旗','0',162,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (927,'正蓝旗','0',162,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (928,'多伦县','0',162,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (929,'阿拉善左旗','0',163,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (930,'阿拉善右旗','0',163,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (931,'额济纳旗','0',163,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (932,'和平区','0',164,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (933,'沈河区','0',164,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (934,'大东区','0',164,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (935,'皇姑区','0',164,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (936,'铁西区','0',164,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (937,'苏家屯区','0',164,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (938,'东陵区','0',164,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (939,'新城子区','0',164,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (940,'于洪区','0',164,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (941,'辽中县','0',164,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (942,'康平县','0',164,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (943,'法库县','0',164,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (944,'新民市','0',164,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (945,'中山区','0',165,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (946,'西岗区','0',165,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (947,'沙河口区','0',165,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (948,'甘井子区','0',165,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (949,'旅顺口区','0',165,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (950,'金州区','0',165,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (951,'长海县','0',165,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (952,'瓦房店市','0',165,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (953,'普兰店市','0',165,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (954,'庄河市','0',165,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (955,'铁东区','0',166,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (956,'铁西区','0',166,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (957,'立山区','0',166,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (958,'千山区','0',166,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (959,'台安县','0',166,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (960,'岫岩满族自治县','0',166,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (961,'海城市','0',166,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (962,'新抚区','0',167,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (963,'东洲区','0',167,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (964,'望花区','0',167,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (965,'顺城区','0',167,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (966,'抚顺县','0',167,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (967,'新宾满族自治县','0',167,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (968,'清原满族自治县','0',167,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (969,'平山区','0',168,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (970,'溪湖区','0',168,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (971,'明山区','0',168,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (972,'南芬区','0',168,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (973,'本溪满族自治县','0',168,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (974,'桓仁满族自治县','0',168,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (975,'元宝区','0',169,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (976,'振兴区','0',169,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (977,'振安区','0',169,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (978,'宽甸满族自治县','0',169,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (979,'东港市','0',169,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (980,'凤城市','0',169,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (981,'古塔区','0',170,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (982,'凌河区','0',170,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (983,'太和区','0',170,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (984,'黑山县','0',170,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (985,'义县','0',170,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (986,'凌海市','0',170,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (987,'北镇市','0',170,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (988,'站前区','0',171,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (989,'西市区','0',171,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (990,'鲅鱼圈区','0',171,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (991,'老边区','0',171,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (992,'盖州市','0',171,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (993,'大石桥市','0',171,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (994,'海州区','0',172,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (995,'新邱区','0',172,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (996,'太平区','0',172,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (997,'清河门区','0',172,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (998,'细河区','0',172,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (999,'阜新蒙古族自治县','0',172,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1000,'彰武县','0',172,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1001,'白塔区','0',173,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1002,'文圣区','0',173,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1003,'宏伟区','0',173,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1004,'弓长岭区','0',173,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1005,'太子河区','0',173,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1006,'辽阳县','0',173,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1007,'灯塔市','0',173,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1008,'双台子区','0',174,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1009,'兴隆台区','0',174,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1010,'大洼县','0',174,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1011,'盘山县','0',174,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1012,'银州区','0',175,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1013,'清河区','0',175,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1014,'铁岭县','0',175,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1015,'西丰县','0',175,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1016,'昌图县','0',175,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1017,'调兵山市','0',175,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1018,'开原市','0',175,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1019,'双塔区','0',176,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1020,'龙城区','0',176,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1021,'朝阳县','0',176,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1022,'建平县','0',176,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1023,'喀喇沁左翼蒙古族自治县','0',176,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1024,'北票市','0',176,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1025,'凌源市','0',176,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1026,'连山区','0',177,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1027,'龙港区','0',177,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1028,'南票区','0',177,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1029,'绥中县','0',177,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1030,'建昌县','0',177,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1031,'兴城市','0',177,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1032,'南关区','0',178,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1033,'宽城区','0',178,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1034,'朝阳区','0',178,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1035,'二道区','0',178,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1036,'绿园区','0',178,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1037,'双阳区','0',178,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1038,'农安县','0',178,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1039,'九台市','0',178,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1040,'榆树市','0',178,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1041,'德惠市','0',178,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1042,'昌邑区','0',179,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1043,'龙潭区','0',179,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1044,'船营区','0',179,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1045,'丰满区','0',179,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1046,'永吉县','0',179,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1047,'蛟河市','0',179,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1048,'桦甸市','0',179,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1049,'舒兰市','0',179,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1050,'磐石市','0',179,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1051,'铁西区','0',180,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1052,'铁东区','0',180,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1053,'梨树县','0',180,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1054,'伊通满族自治县','0',180,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1055,'公主岭市','0',180,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1056,'双辽市','0',180,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1057,'龙山区','0',181,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1058,'西安区','0',181,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1059,'东丰县','0',181,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1060,'东辽县','0',181,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1061,'东昌区','0',182,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1062,'二道江区','0',182,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1063,'通化县','0',182,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1064,'辉南县','0',182,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1065,'柳河县','0',182,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1066,'梅河口市','0',182,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1067,'集安市','0',182,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1068,'八道江区','0',183,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1069,'抚松县','0',183,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1070,'靖宇县','0',183,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1071,'长白朝鲜族自治县','0',183,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1072,'江源县','0',183,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1073,'临江市','0',183,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1074,'宁江区','0',184,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1075,'前郭尔罗斯蒙古族自治县','0',184,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1076,'长岭县','0',184,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1077,'乾安县','0',184,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1078,'扶余县','0',184,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1079,'洮北区','0',185,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1080,'镇赉县','0',185,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1081,'通榆县','0',185,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1082,'洮南市','0',185,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1083,'大安市','0',185,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1084,'延吉市','0',186,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1085,'图们市','0',186,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1086,'敦化市','0',186,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1087,'珲春市','0',186,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1088,'龙井市','0',186,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1089,'和龙市','0',186,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1090,'汪清县','0',186,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1091,'安图县','0',186,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1092,'道里区','0',187,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1093,'南岗区','0',187,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1094,'道外区','0',187,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1095,'香坊区','0',187,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1096,'动力区','0',187,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1097,'平房区','0',187,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1098,'松北区','0',187,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1099,'呼兰区','0',187,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1100,'依兰县','0',187,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1101,'方正县','0',187,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1102,'宾县','0',187,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1103,'巴彦县','0',187,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1104,'木兰县','0',187,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1105,'通河县','0',187,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1106,'延寿县','0',187,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1107,'阿城市','0',187,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1108,'双城市','0',187,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1109,'尚志市','0',187,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1110,'五常市','0',187,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1111,'龙沙区','0',188,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1112,'建华区','0',188,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1113,'铁锋区','0',188,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1114,'昂昂溪区','0',188,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1115,'富拉尔基区','0',188,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1116,'碾子山区','0',188,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1117,'梅里斯达斡尔族区','0',188,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1118,'龙江县','0',188,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1119,'依安县','0',188,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1120,'泰来县','0',188,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1121,'甘南县','0',188,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1122,'富裕县','0',188,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1123,'克山县','0',188,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1124,'克东县','0',188,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1125,'拜泉县','0',188,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1126,'讷河市','0',188,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1127,'鸡冠区','0',189,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1128,'恒山区','0',189,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1129,'滴道区','0',189,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1130,'梨树区','0',189,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1131,'城子河区','0',189,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1132,'麻山区','0',189,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1133,'鸡东县','0',189,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1134,'虎林市','0',189,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1135,'密山市','0',189,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1136,'向阳区','0',190,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1137,'工农区','0',190,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1138,'南山区','0',190,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1139,'兴安区','0',190,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1140,'东山区','0',190,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1141,'兴山区','0',190,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1142,'萝北县','0',190,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1143,'绥滨县','0',190,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1144,'尖山区','0',191,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1145,'岭东区','0',191,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1146,'四方台区','0',191,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1147,'宝山区','0',191,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1148,'集贤县','0',191,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1149,'友谊县','0',191,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1150,'宝清县','0',191,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1151,'饶河县','0',191,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1152,'萨尔图区','0',192,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1153,'龙凤区','0',192,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1154,'让胡路区','0',192,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1155,'红岗区','0',192,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1156,'大同区','0',192,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1157,'肇州县','0',192,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1158,'肇源县','0',192,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1159,'林甸县','0',192,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1160,'杜尔伯特蒙古族自治县','0',192,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1161,'伊春区','0',193,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1162,'南岔区','0',193,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1163,'友好区','0',193,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1164,'西林区','0',193,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1165,'翠峦区','0',193,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1166,'新青区','0',193,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1167,'美溪区','0',193,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1168,'金山屯区','0',193,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1169,'五营区','0',193,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1170,'乌马河区','0',193,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1171,'汤旺河区','0',193,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1172,'带岭区','0',193,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1173,'乌伊岭区','0',193,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1174,'红星区','0',193,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1175,'上甘岭区','0',193,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1176,'嘉荫县','0',193,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1177,'铁力市','0',193,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1178,'永红区','0',194,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1179,'向阳区','0',194,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1180,'前进区','0',194,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1181,'东风区','0',194,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1182,'郊区','0',194,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1183,'桦南县','0',194,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1184,'桦川县','0',194,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1185,'汤原县','0',194,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1186,'抚远县','0',194,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1187,'同江市','0',194,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1188,'富锦市','0',194,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1189,'新兴区','0',195,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1190,'桃山区','0',195,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1191,'茄子河区','0',195,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1192,'勃利县','0',195,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1193,'东安区','0',196,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1194,'阳明区','0',196,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1195,'爱民区','0',196,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1196,'西安区','0',196,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1197,'东宁县','0',196,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1198,'林口县','0',196,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1199,'绥芬河市','0',196,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1200,'海林市','0',196,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1201,'宁安市','0',196,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1202,'穆棱市','0',196,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1203,'爱辉区','0',197,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1204,'嫩江县','0',197,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1205,'逊克县','0',197,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1206,'孙吴县','0',197,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1207,'北安市','0',197,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1208,'五大连池市','0',197,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1209,'北林区','0',198,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1210,'望奎县','0',198,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1211,'兰西县','0',198,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1212,'青冈县','0',198,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1213,'庆安县','0',198,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1214,'明水县','0',198,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1215,'绥棱县','0',198,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1216,'安达市','0',198,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1217,'肇东市','0',198,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1218,'海伦市','0',198,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1219,'呼玛县','0',199,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1220,'塔河县','0',199,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1221,'漠河县','0',199,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1222,'玄武区','0',200,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1223,'白下区','0',200,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1224,'秦淮区','0',200,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1225,'建邺区','0',200,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1226,'鼓楼区','0',200,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1227,'下关区','0',200,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1228,'浦口区','0',200,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1229,'栖霞区','0',200,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1230,'雨花台区','0',200,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1231,'江宁区','0',200,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1232,'六合区','0',200,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1233,'溧水县','0',200,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1234,'高淳县','0',200,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1235,'崇安区','0',201,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1236,'南长区','0',201,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1237,'北塘区','0',201,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1238,'锡山区','0',201,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1239,'惠山区','0',201,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1240,'滨湖区','0',201,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1241,'江阴市','0',201,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1242,'宜兴市','0',201,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1243,'鼓楼区','0',202,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1244,'云龙区','0',202,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1245,'九里区','0',202,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1246,'贾汪区','0',202,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1247,'泉山区','0',202,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1248,'丰县','0',202,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1249,'沛县','0',202,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1250,'铜山县','0',202,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1251,'睢宁县','0',202,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1252,'新沂市','0',202,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1253,'邳州市','0',202,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1254,'天宁区','0',203,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1255,'钟楼区','0',203,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1256,'戚墅堰区','0',203,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1257,'新北区','0',203,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1258,'武进区','0',203,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1259,'溧阳市','0',203,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1260,'金坛市','0',203,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1261,'沧浪区','0',204,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1262,'平江区','0',204,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1263,'金阊区','0',204,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1264,'虎丘区','0',204,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1265,'吴中区','0',204,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1266,'相城区','0',204,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1267,'常熟市','0',204,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1268,'张家港市','0',204,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1269,'昆山市','0',204,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1270,'吴江市','0',204,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1271,'太仓市','0',204,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1272,'崇川区','0',205,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1273,'港闸区','0',205,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1274,'海安县','0',205,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1275,'如东县','0',205,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1276,'启东市','0',205,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1277,'如皋市','0',205,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1278,'通州市','0',205,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1279,'海门市','0',205,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1280,'连云区','0',206,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1281,'新浦区','0',206,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1282,'海州区','0',206,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1283,'赣榆县','0',206,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1284,'东海县','0',206,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1285,'灌云县','0',206,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1286,'灌南县','0',206,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1287,'清河区','0',207,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1288,'楚州区','0',207,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1289,'淮阴区','0',207,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1290,'清浦区','0',207,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1291,'涟水县','0',207,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1292,'洪泽县','0',207,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1293,'盱眙县','0',207,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1294,'金湖县','0',207,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1295,'亭湖区','0',208,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1296,'盐都区','0',208,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1297,'响水县','0',208,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1298,'滨海县','0',208,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1299,'阜宁县','0',208,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1300,'射阳县','0',208,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1301,'建湖县','0',208,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1302,'东台市','0',208,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1303,'大丰市','0',208,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1304,'广陵区','0',209,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1305,'邗江区','0',209,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1306,'维扬区','0',209,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1307,'宝应县','0',209,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1308,'仪征市','0',209,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1309,'高邮市','0',209,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1310,'江都市','0',209,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1311,'京口区','0',210,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1312,'润州区','0',210,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1313,'丹徒区','0',210,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1314,'丹阳市','0',210,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1315,'扬中市','0',210,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1316,'句容市','0',210,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1317,'海陵区','0',211,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1318,'高港区','0',211,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1319,'兴化市','0',211,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1320,'靖江市','0',211,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1321,'泰兴市','0',211,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1322,'姜堰市','0',211,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1323,'宿城区','0',212,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1324,'宿豫区','0',212,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1325,'沭阳县','0',212,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1326,'泗阳县','0',212,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1327,'泗洪县','0',212,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1328,'上城区','0',213,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1329,'下城区','0',213,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1330,'江干区','0',213,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1331,'拱墅区','0',213,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1332,'西湖区','0',213,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1333,'滨江区','0',213,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1334,'萧山区','0',213,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1335,'余杭区','0',213,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1336,'桐庐县','0',213,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1337,'淳安县','0',213,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1338,'建德市','0',213,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1339,'富阳市','0',213,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1340,'临安市','0',213,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1341,'海曙区','0',214,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1342,'江东区','0',214,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1343,'江北区','0',214,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1344,'北仑区','0',214,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1345,'镇海区','0',214,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1346,'鄞州区','0',214,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1347,'象山县','0',214,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1348,'宁海县','0',214,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1349,'余姚市','0',214,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1350,'慈溪市','0',214,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1351,'奉化市','0',214,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1352,'鹿城区','0',215,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1353,'龙湾区','0',215,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1354,'瓯海区','0',215,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1355,'洞头县','0',215,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1356,'永嘉县','0',215,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1357,'平阳县','0',215,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1358,'苍南县','0',215,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1359,'文成县','0',215,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1360,'泰顺县','0',215,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1361,'瑞安市','0',215,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1362,'乐清市','0',215,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1363,'秀城区','0',216,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1364,'秀洲区','0',216,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1365,'嘉善县','0',216,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1366,'海盐县','0',216,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1367,'海宁市','0',216,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1368,'平湖市','0',216,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1369,'桐乡市','0',216,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1370,'吴兴区','0',217,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1371,'南浔区','0',217,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1372,'德清县','0',217,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1373,'长兴县','0',217,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1374,'安吉县','0',217,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1375,'越城区','0',218,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1376,'绍兴县','0',218,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1377,'新昌县','0',218,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1378,'诸暨市','0',218,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1379,'上虞市','0',218,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1380,'嵊州市','0',218,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1381,'婺城区','0',219,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1382,'金东区','0',219,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1383,'武义县','0',219,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1384,'浦江县','0',219,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1385,'磐安县','0',219,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1386,'兰溪市','0',219,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1387,'义乌市','0',219,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1388,'东阳市','0',219,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1389,'永康市','0',219,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1390,'柯城区','0',220,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1391,'衢江区','0',220,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1392,'常山县','0',220,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1393,'开化县','0',220,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1394,'龙游县','0',220,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1395,'江山市','0',220,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1396,'定海区','0',221,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1397,'普陀区','0',221,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1398,'岱山县','0',221,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1399,'嵊泗县','0',221,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1400,'椒江区','0',222,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1401,'黄岩区','0',222,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1402,'路桥区','0',222,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1403,'玉环县','0',222,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1404,'三门县','0',222,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1405,'天台县','0',222,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1406,'仙居县','0',222,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1407,'温岭市','0',222,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1408,'临海市','0',222,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1409,'莲都区','0',223,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1410,'青田县','0',223,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1411,'缙云县','0',223,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1412,'遂昌县','0',223,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1413,'松阳县','0',223,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1414,'云和县','0',223,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1415,'庆元县','0',223,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1416,'景宁畲族自治县','0',223,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1417,'龙泉市','0',223,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1418,'瑶海区','0',224,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1419,'庐阳区','0',224,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1420,'蜀山区','0',224,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1421,'包河区','0',224,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1422,'长丰县','0',224,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1423,'肥东县','0',224,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1424,'肥西县','0',224,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1425,'镜湖区','0',225,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1426,'弋江区','0',225,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1427,'鸠江区','0',225,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1428,'三山区','0',225,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1429,'芜湖县','0',225,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1430,'繁昌县','0',225,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1431,'南陵县','0',225,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1432,'龙子湖区','0',226,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1433,'蚌山区','0',226,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1434,'禹会区','0',226,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1435,'淮上区','0',226,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1436,'怀远县','0',226,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1437,'五河县','0',226,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1438,'固镇县','0',226,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1439,'大通区','0',227,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1440,'田家庵区','0',227,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1441,'谢家集区','0',227,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1442,'八公山区','0',227,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1443,'潘集区','0',227,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1444,'凤台县','0',227,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1445,'金家庄区','0',228,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1446,'花山区','0',228,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1447,'雨山区','0',228,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1448,'当涂县','0',228,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1449,'杜集区','0',229,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1450,'相山区','0',229,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1451,'烈山区','0',229,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1452,'濉溪县','0',229,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1453,'铜官山区','0',230,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1454,'狮子山区','0',230,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1455,'郊区','0',230,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1456,'铜陵县','0',230,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1457,'迎江区','0',231,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1458,'大观区','0',231,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1459,'宜秀区','0',231,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1460,'怀宁县','0',231,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1461,'枞阳县','0',231,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1462,'潜山县','0',231,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1463,'太湖县','0',231,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1464,'宿松县','0',231,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1465,'望江县','0',231,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1466,'岳西县','0',231,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1467,'桐城市','0',231,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1468,'屯溪区','0',232,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1469,'黄山区','0',232,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1470,'徽州区','0',232,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1471,'歙县','0',232,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1472,'休宁县','0',232,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1473,'黟县','0',232,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1474,'祁门县','0',232,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1475,'琅琊区','0',233,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1476,'南谯区','0',233,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1477,'来安县','0',233,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1478,'全椒县','0',233,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1479,'定远县','0',233,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1480,'凤阳县','0',233,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1481,'天长市','0',233,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1482,'明光市','0',233,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1483,'颍州区','0',234,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1484,'颍东区','0',234,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1485,'颍泉区','0',234,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1486,'临泉县','0',234,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1487,'太和县','0',234,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1488,'阜南县','0',234,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1489,'颍上县','0',234,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1490,'界首市','0',234,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1491,'埇桥区','0',235,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1492,'砀山县','0',235,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1493,'萧县','0',235,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1494,'灵璧县','0',235,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1495,'泗县','0',235,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1496,'居巢区','0',236,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1497,'庐江县','0',236,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1498,'无为县','0',236,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1499,'含山县','0',236,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1500,'和县','0',236,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1501,'金安区','0',237,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1502,'裕安区','0',237,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1503,'寿县','0',237,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1504,'霍邱县','0',237,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1505,'舒城县','0',237,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1506,'金寨县','0',237,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1507,'霍山县','0',237,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1508,'谯城区','0',238,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1509,'涡阳县','0',238,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1510,'蒙城县','0',238,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1511,'利辛县','0',238,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1512,'贵池区','0',239,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1513,'东至县','0',239,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1514,'石台县','0',239,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1515,'青阳县','0',239,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1516,'宣州区','0',240,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1517,'郎溪县','0',240,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1518,'广德县','0',240,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1519,'泾县','0',240,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1520,'绩溪县','0',240,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1521,'旌德县','0',240,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1522,'宁国市','0',240,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1523,'鼓楼区','0',241,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1524,'台江区','0',241,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1525,'仓山区','0',241,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1526,'马尾区','0',241,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1527,'晋安区','0',241,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1528,'闽侯县','0',241,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1529,'连江县','0',241,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1530,'罗源县','0',241,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1531,'闽清县','0',241,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1532,'永泰县','0',241,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1533,'平潭县','0',241,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1534,'福清市','0',241,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1535,'长乐市','0',241,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1536,'思明区','0',242,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1537,'海沧区','0',242,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1538,'湖里区','0',242,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1539,'集美区','0',242,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1540,'同安区','0',242,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1541,'翔安区','0',242,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1542,'城厢区','0',243,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1543,'涵江区','0',243,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1544,'荔城区','0',243,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1545,'秀屿区','0',243,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1546,'仙游县','0',243,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1547,'梅列区','0',244,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1548,'三元区','0',244,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1549,'明溪县','0',244,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1550,'清流县','0',244,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1551,'宁化县','0',244,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1552,'大田县','0',244,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1553,'尤溪县','0',244,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1554,'沙县','0',244,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1555,'将乐县','0',244,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1556,'泰宁县','0',244,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1557,'建宁县','0',244,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1558,'永安市','0',244,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1559,'鲤城区','0',245,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1560,'丰泽区','0',245,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1561,'洛江区','0',245,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1562,'泉港区','0',245,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1563,'惠安县','0',245,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1564,'安溪县','0',245,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1565,'永春县','0',245,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1566,'德化县','0',245,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1567,'金门县','0',245,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1568,'石狮市','0',245,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1569,'晋江市','0',245,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1570,'南安市','0',245,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1571,'芗城区','0',246,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1572,'龙文区','0',246,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1573,'云霄县','0',246,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1574,'漳浦县','0',246,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1575,'诏安县','0',246,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1576,'长泰县','0',246,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1577,'东山县','0',246,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1578,'南靖县','0',246,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1579,'平和县','0',246,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1580,'华安县','0',246,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1581,'龙海市','0',246,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1582,'延平区','0',247,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1583,'顺昌县','0',247,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1584,'浦城县','0',247,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1585,'光泽县','0',247,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1586,'松溪县','0',247,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1587,'政和县','0',247,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1588,'邵武市','0',247,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1589,'武夷山市','0',247,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1590,'建瓯市','0',247,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1591,'建阳市','0',247,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1592,'新罗区','0',248,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1593,'长汀县','0',248,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1594,'永定县','0',248,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1595,'上杭县','0',248,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1596,'武平县','0',248,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1597,'连城县','0',248,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1598,'漳平市','0',248,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1599,'蕉城区','0',249,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1600,'霞浦县','0',249,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1601,'古田县','0',249,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1602,'屏南县','0',249,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1603,'寿宁县','0',249,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1604,'周宁县','0',249,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1605,'柘荣县','0',249,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1606,'福安市','0',249,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1607,'福鼎市','0',249,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1608,'东湖区','0',250,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1609,'西湖区','0',250,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1610,'青云谱区','0',250,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1611,'湾里区','0',250,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1612,'青山湖区','0',250,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1613,'南昌县','0',250,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1614,'新建县','0',250,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1615,'安义县','0',250,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1616,'进贤县','0',250,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1617,'昌江区','0',251,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1618,'珠山区','0',251,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1619,'浮梁县','0',251,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1620,'乐平市','0',251,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1621,'安源区','0',252,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1622,'湘东区','0',252,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1623,'莲花县','0',252,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1624,'上栗县','0',252,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1625,'芦溪县','0',252,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1626,'庐山区','0',253,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1627,'浔阳区','0',253,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1628,'九江县','0',253,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1629,'武宁县','0',253,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1630,'修水县','0',253,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1631,'永修县','0',253,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1632,'德安县','0',253,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1633,'星子县','0',253,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1634,'都昌县','0',253,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1635,'湖口县','0',253,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1636,'彭泽县','0',253,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1637,'瑞昌市','0',253,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1638,'渝水区','0',254,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1639,'分宜县','0',254,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1640,'月湖区','0',255,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1641,'余江县','0',255,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1642,'贵溪市','0',255,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1643,'章贡区','0',256,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1644,'赣县','0',256,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1645,'信丰县','0',256,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1646,'大余县','0',256,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1647,'上犹县','0',256,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1648,'崇义县','0',256,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1649,'安远县','0',256,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1650,'龙南县','0',256,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1651,'定南县','0',256,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1652,'全南县','0',256,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1653,'宁都县','0',256,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1654,'于都县','0',256,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1655,'兴国县','0',256,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1656,'会昌县','0',256,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1657,'寻乌县','0',256,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1658,'石城县','0',256,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1659,'瑞金市','0',256,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1660,'南康市','0',256,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1661,'吉州区','0',257,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1662,'青原区','0',257,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1663,'吉安县','0',257,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1664,'吉水县','0',257,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1665,'峡江县','0',257,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1666,'新干县','0',257,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1667,'永丰县','0',257,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1668,'泰和县','0',257,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1669,'遂川县','0',257,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1670,'万安县','0',257,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1671,'安福县','0',257,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1672,'永新县','0',257,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1673,'井冈山市','0',257,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1674,'袁州区','0',258,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1675,'奉新县','0',258,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1676,'万载县','0',258,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1677,'上高县','0',258,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1678,'宜丰县','0',258,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1679,'靖安县','0',258,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1680,'铜鼓县','0',258,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1681,'丰城市','0',258,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1682,'樟树市','0',258,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1683,'高安市','0',258,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1684,'临川区','0',259,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1685,'南城县','0',259,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1686,'黎川县','0',259,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1687,'南丰县','0',259,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1688,'崇仁县','0',259,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1689,'乐安县','0',259,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1690,'宜黄县','0',259,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1691,'金溪县','0',259,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1692,'资溪县','0',259,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1693,'东乡县','0',259,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1694,'广昌县','0',259,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1695,'信州区','0',260,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1696,'上饶县','0',260,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1697,'广丰县','0',260,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1698,'玉山县','0',260,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1699,'铅山县','0',260,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1700,'横峰县','0',260,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1701,'弋阳县','0',260,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1702,'余干县','0',260,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1703,'鄱阳县','0',260,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1704,'万年县','0',260,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1705,'婺源县','0',260,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1706,'德兴市','0',260,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1707,'历下区','0',261,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1708,'市中区','0',261,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1709,'槐荫区','0',261,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1710,'天桥区','0',261,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1711,'历城区','0',261,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1712,'长清区','0',261,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1713,'平阴县','0',261,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1714,'济阳县','0',261,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1715,'商河县','0',261,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1716,'章丘市','0',261,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1717,'市南区','0',262,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1718,'市北区','0',262,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1719,'四方区','0',262,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1720,'黄岛区','0',262,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1721,'崂山区','0',262,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1722,'李沧区','0',262,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1723,'城阳区','0',262,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1724,'胶州市','0',262,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1725,'即墨市','0',262,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1726,'平度市','0',262,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1727,'胶南市','0',262,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1728,'莱西市','0',262,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1729,'淄川区','0',263,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1730,'张店区','0',263,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1731,'博山区','0',263,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1732,'临淄区','0',263,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1733,'周村区','0',263,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1734,'桓台县','0',263,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1735,'高青县','0',263,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1736,'沂源县','0',263,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1737,'市中区','0',264,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1738,'薛城区','0',264,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1739,'峄城区','0',264,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1740,'台儿庄区','0',264,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1741,'山亭区','0',264,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1742,'滕州市','0',264,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1743,'东营区','0',265,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1744,'河口区','0',265,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1745,'垦利县','0',265,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1746,'利津县','0',265,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1747,'广饶县','0',265,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1748,'芝罘区','0',266,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1749,'福山区','0',266,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1750,'牟平区','0',266,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1751,'莱山区','0',266,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1752,'长岛县','0',266,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1753,'龙口市','0',266,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1754,'莱阳市','0',266,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1755,'莱州市','0',266,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1756,'蓬莱市','0',266,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1757,'招远市','0',266,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1758,'栖霞市','0',266,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1759,'海阳市','0',266,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1760,'潍城区','0',267,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1761,'寒亭区','0',267,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1762,'坊子区','0',267,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1763,'奎文区','0',267,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1764,'临朐县','0',267,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1765,'昌乐县','0',267,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1766,'青州市','0',267,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1767,'诸城市','0',267,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1768,'寿光市','0',267,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1769,'安丘市','0',267,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1770,'高密市','0',267,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1771,'昌邑市','0',267,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1772,'市中区','0',268,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1773,'任城区','0',268,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1774,'微山县','0',268,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1775,'鱼台县','0',268,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1776,'金乡县','0',268,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1777,'嘉祥县','0',268,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1778,'汶上县','0',268,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1779,'泗水县','0',268,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1780,'梁山县','0',268,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1781,'曲阜市','0',268,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1782,'兖州市','0',268,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1783,'邹城市','0',268,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1784,'泰山区','0',269,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1785,'岱岳区','0',269,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1786,'宁阳县','0',269,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1787,'东平县','0',269,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1788,'新泰市','0',269,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1789,'肥城市','0',269,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1790,'环翠区','0',270,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1791,'文登市','0',270,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1792,'荣成市','0',270,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1793,'乳山市','0',270,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1794,'东港区','0',271,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1795,'岚山区','0',271,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1796,'五莲县','0',271,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1797,'莒县','0',271,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1798,'莱城区','0',272,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1799,'钢城区','0',272,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1800,'兰山区','0',273,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1801,'罗庄区','0',273,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1802,'河东区','0',273,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1803,'沂南县','0',273,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1804,'郯城县','0',273,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1805,'沂水县','0',273,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1806,'苍山县','0',273,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1807,'费县','0',273,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1808,'平邑县','0',273,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1809,'莒南县','0',273,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1810,'蒙阴县','0',273,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1811,'临沭县','0',273,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1812,'德城区','0',274,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1813,'陵县','0',274,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1814,'宁津县','0',274,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1815,'庆云县','0',274,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1816,'临邑县','0',274,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1817,'齐河县','0',274,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1818,'平原县','0',274,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1819,'夏津县','0',274,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1820,'武城县','0',274,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1821,'乐陵市','0',274,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1822,'禹城市','0',274,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1823,'东昌府区','0',275,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1824,'阳谷县','0',275,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1825,'莘县','0',275,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1826,'茌平县','0',275,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1827,'东阿县','0',275,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1828,'冠县','0',275,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1829,'高唐县','0',275,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1830,'临清市','0',275,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1831,'滨城区','0',276,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1832,'惠民县','0',276,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1833,'阳信县','0',276,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1834,'无棣县','0',276,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1835,'沾化县','0',276,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1836,'博兴县','0',276,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1837,'邹平县','0',276,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1838,'牡丹区','0',277,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1839,'曹县','0',277,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1840,'单县','0',277,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1841,'成武县','0',277,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1842,'巨野县','0',277,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1843,'郓城县','0',277,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1844,'鄄城县','0',277,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1845,'定陶县','0',277,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1846,'东明县','0',277,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1847,'中原区','0',278,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1848,'二七区','0',278,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1849,'管城回族区','0',278,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1850,'金水区','0',278,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1851,'上街区','0',278,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1852,'惠济区','0',278,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1853,'中牟县','0',278,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1854,'巩义市','0',278,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1855,'荥阳市','0',278,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1856,'新密市','0',278,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1857,'新郑市','0',278,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1858,'登封市','0',278,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1859,'龙亭区','0',279,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1860,'顺河回族区','0',279,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1861,'鼓楼区','0',279,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1862,'禹王台区','0',279,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1863,'金明区','0',279,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1864,'杞县','0',279,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1865,'通许县','0',279,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1866,'尉氏县','0',279,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1867,'开封县','0',279,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1868,'兰考县','0',279,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1869,'老城区','0',280,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1870,'西工区','0',280,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1871,'廛河回族区','0',280,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1872,'涧西区','0',280,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1873,'吉利区','0',280,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1874,'洛龙区','0',280,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1875,'孟津县','0',280,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1876,'新安县','0',280,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1877,'栾川县','0',280,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1878,'嵩县','0',280,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1879,'汝阳县','0',280,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1880,'宜阳县','0',280,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1881,'洛宁县','0',280,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1882,'伊川县','0',280,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1883,'偃师市','0',280,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1884,'新华区','0',281,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1885,'卫东区','0',281,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1886,'石龙区','0',281,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1887,'湛河区','0',281,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1888,'宝丰县','0',281,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1889,'叶县','0',281,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1890,'鲁山县','0',281,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1891,'郏县','0',281,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1892,'舞钢市','0',281,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1893,'汝州市','0',281,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1894,'文峰区','0',282,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1895,'北关区','0',282,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1896,'殷都区','0',282,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1897,'龙安区','0',282,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1898,'安阳县','0',282,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1899,'汤阴县','0',282,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1900,'滑县','0',282,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1901,'内黄县','0',282,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1902,'林州市','0',282,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1903,'鹤山区','0',283,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1904,'山城区','0',283,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1905,'淇滨区','0',283,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1906,'浚县','0',283,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1907,'淇县','0',283,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1908,'红旗区','0',284,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1909,'卫滨区','0',284,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1910,'凤泉区','0',284,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1911,'牧野区','0',284,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1912,'新乡县','0',284,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1913,'获嘉县','0',284,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1914,'原阳县','0',284,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1915,'延津县','0',284,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1916,'封丘县','0',284,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1917,'长垣县','0',284,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1918,'卫辉市','0',284,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1919,'辉县市','0',284,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1920,'解放区','0',285,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1921,'中站区','0',285,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1922,'马村区','0',285,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1923,'山阳区','0',285,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1924,'修武县','0',285,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1925,'博爱县','0',285,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1926,'武陟县','0',285,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1927,'温县','0',285,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1928,'济源市','0',285,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1929,'沁阳市','0',285,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1930,'孟州市','0',285,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1931,'华龙区','0',286,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1932,'清丰县','0',286,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1933,'南乐县','0',286,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1934,'范县','0',286,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1935,'台前县','0',286,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1936,'濮阳县','0',286,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1937,'魏都区','0',287,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1938,'许昌县','0',287,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1939,'鄢陵县','0',287,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1940,'襄城县','0',287,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1941,'禹州市','0',287,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1942,'长葛市','0',287,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1943,'源汇区','0',288,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1944,'郾城区','0',288,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1945,'召陵区','0',288,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1946,'舞阳县','0',288,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1947,'临颍县','0',288,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1948,'湖滨区','0',289,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1949,'渑池县','0',289,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1950,'陕县','0',289,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1951,'卢氏县','0',289,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1952,'义马市','0',289,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1953,'灵宝市','0',289,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1954,'宛城区','0',290,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1955,'卧龙区','0',290,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1956,'南召县','0',290,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1957,'方城县','0',290,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1958,'西峡县','0',290,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1959,'镇平县','0',290,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1960,'内乡县','0',290,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1961,'淅川县','0',290,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1962,'社旗县','0',290,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1963,'唐河县','0',290,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1964,'新野县','0',290,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1965,'桐柏县','0',290,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1966,'邓州市','0',290,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1967,'梁园区','0',291,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1968,'睢阳区','0',291,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1969,'民权县','0',291,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1970,'睢县','0',291,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1971,'宁陵县','0',291,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1972,'柘城县','0',291,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1973,'虞城县','0',291,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1974,'夏邑县','0',291,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1975,'永城市','0',291,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1976,'浉河区','0',292,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1977,'平桥区','0',292,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1978,'罗山县','0',292,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1979,'光山县','0',292,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1980,'新县','0',292,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1981,'商城县','0',292,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1982,'固始县','0',292,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1983,'潢川县','0',292,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1984,'淮滨县','0',292,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1985,'息县','0',292,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1986,'川汇区','0',293,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1987,'扶沟县','0',293,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1988,'西华县','0',293,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1989,'商水县','0',293,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1990,'沈丘县','0',293,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1991,'郸城县','0',293,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1992,'淮阳县','0',293,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1993,'太康县','0',293,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1994,'鹿邑县','0',293,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1995,'项城市','0',293,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1996,'驿城区','0',294,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1997,'西平县','0',294,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1998,'上蔡县','0',294,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (1999,'平舆县','0',294,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2000,'正阳县','0',294,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2001,'确山县','0',294,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2002,'泌阳县','0',294,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2003,'汝南县','0',294,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2004,'遂平县','0',294,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2005,'新蔡县','0',294,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2006,'江岸区','0',295,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2007,'江汉区','0',295,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2008,'硚口区','0',295,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2009,'汉阳区','0',295,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2010,'武昌区','0',295,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2011,'青山区','0',295,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2012,'洪山区','0',295,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2013,'东西湖区','0',295,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2014,'汉南区','0',295,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2015,'蔡甸区','0',295,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2016,'江夏区','0',295,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2017,'黄陂区','0',295,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2018,'新洲区','0',295,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2019,'黄石港区','0',296,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2020,'西塞山区','0',296,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2021,'下陆区','0',296,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2022,'铁山区','0',296,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2023,'阳新县','0',296,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2024,'大冶市','0',296,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2025,'茅箭区','0',297,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2026,'张湾区','0',297,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2027,'郧县','0',297,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2028,'郧西县','0',297,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2029,'竹山县','0',297,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2030,'竹溪县','0',297,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2031,'房县','0',297,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2032,'丹江口市','0',297,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2033,'西陵区','0',298,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2034,'伍家岗区','0',298,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2035,'点军区','0',298,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2036,'猇亭区','0',298,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2037,'夷陵区','0',298,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2038,'远安县','0',298,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2039,'兴山县','0',298,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2040,'秭归县','0',298,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2041,'长阳土家族自治县','0',298,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2042,'五峰土家族自治县','0',298,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2043,'宜都市','0',298,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2044,'当阳市','0',298,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2045,'枝江市','0',298,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2046,'襄城区','0',299,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2047,'樊城区','0',299,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2048,'襄阳区','0',299,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2049,'南漳县','0',299,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2050,'谷城县','0',299,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2051,'保康县','0',299,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2052,'老河口市','0',299,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2053,'枣阳市','0',299,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2054,'宜城市','0',299,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2055,'梁子湖区','0',300,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2056,'华容区','0',300,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2057,'鄂城区','0',300,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2058,'东宝区','0',301,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2059,'掇刀区','0',301,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2060,'京山县','0',301,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2061,'沙洋县','0',301,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2062,'钟祥市','0',301,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2063,'孝南区','0',302,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2064,'孝昌县','0',302,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2065,'大悟县','0',302,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2066,'云梦县','0',302,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2067,'应城市','0',302,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2068,'安陆市','0',302,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2069,'汉川市','0',302,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2070,'沙市区','0',303,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2071,'荆州区','0',303,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2072,'公安县','0',303,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2073,'监利县','0',303,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2074,'江陵县','0',303,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2075,'石首市','0',303,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2076,'洪湖市','0',303,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2077,'松滋市','0',303,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2078,'黄州区','0',304,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2079,'团风县','0',304,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2080,'红安县','0',304,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2081,'罗田县','0',304,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2082,'英山县','0',304,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2083,'浠水县','0',304,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2084,'蕲春县','0',304,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2085,'黄梅县','0',304,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2086,'麻城市','0',304,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2087,'武穴市','0',304,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2088,'咸安区','0',305,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2089,'嘉鱼县','0',305,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2090,'通城县','0',305,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2091,'崇阳县','0',305,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2092,'通山县','0',305,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2093,'赤壁市','0',305,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2094,'曾都区','0',306,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2095,'广水市','0',306,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2096,'恩施市','0',307,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2097,'利川市','0',307,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2098,'建始县','0',307,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2099,'巴东县','0',307,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2100,'宣恩县','0',307,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2101,'咸丰县','0',307,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2102,'来凤县','0',307,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2103,'鹤峰县','0',307,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2104,'芙蓉区','0',312,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2105,'天心区','0',312,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2106,'岳麓区','0',312,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2107,'开福区','0',312,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2108,'雨花区','0',312,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2109,'长沙县','0',312,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2110,'望城县','0',312,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2111,'宁乡县','0',312,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2112,'浏阳市','0',312,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2113,'荷塘区','0',313,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2114,'芦淞区','0',313,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2115,'石峰区','0',313,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2116,'天元区','0',313,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2117,'株洲县','0',313,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2118,'攸县','0',313,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2119,'茶陵县','0',313,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2120,'炎陵县','0',313,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2121,'醴陵市','0',313,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2122,'雨湖区','0',314,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2123,'岳塘区','0',314,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2124,'湘潭县','0',314,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2125,'湘乡市','0',314,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2126,'韶山市','0',314,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2127,'珠晖区','0',315,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2128,'雁峰区','0',315,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2129,'石鼓区','0',315,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2130,'蒸湘区','0',315,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2131,'南岳区','0',315,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2132,'衡阳县','0',315,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2133,'衡南县','0',315,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2134,'衡山县','0',315,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2135,'衡东县','0',315,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2136,'祁东县','0',315,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2137,'耒阳市','0',315,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2138,'常宁市','0',315,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2139,'双清区','0',316,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2140,'大祥区','0',316,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2141,'北塔区','0',316,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2142,'邵东县','0',316,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2143,'新邵县','0',316,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2144,'邵阳县','0',316,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2145,'隆回县','0',316,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2146,'洞口县','0',316,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2147,'绥宁县','0',316,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2148,'新宁县','0',316,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2149,'城步苗族自治县','0',316,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2150,'武冈市','0',316,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2151,'岳阳楼区','0',317,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2152,'云溪区','0',317,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2153,'君山区','0',317,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2154,'岳阳县','0',317,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2155,'华容县','0',317,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2156,'湘阴县','0',317,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2157,'平江县','0',317,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2158,'汨罗市','0',317,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2159,'临湘市','0',317,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2160,'武陵区','0',318,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2161,'鼎城区','0',318,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2162,'安乡县','0',318,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2163,'汉寿县','0',318,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2164,'澧县','0',318,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2165,'临澧县','0',318,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2166,'桃源县','0',318,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2167,'石门县','0',318,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2168,'津市市','0',318,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2169,'永定区','0',319,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2170,'武陵源区','0',319,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2171,'慈利县','0',319,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2172,'桑植县','0',319,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2173,'资阳区','0',320,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2174,'赫山区','0',320,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2175,'南县','0',320,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2176,'桃江县','0',320,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2177,'安化县','0',320,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2178,'沅江市','0',320,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2179,'北湖区','0',321,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2180,'苏仙区','0',321,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2181,'桂阳县','0',321,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2182,'宜章县','0',321,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2183,'永兴县','0',321,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2184,'嘉禾县','0',321,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2185,'临武县','0',321,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2186,'汝城县','0',321,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2187,'桂东县','0',321,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2188,'安仁县','0',321,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2189,'资兴市','0',321,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2190,'零陵区','0',322,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2191,'冷水滩区','0',322,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2192,'祁阳县','0',322,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2193,'东安县','0',322,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2194,'双牌县','0',322,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2195,'道县','0',322,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2196,'江永县','0',322,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2197,'宁远县','0',322,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2198,'蓝山县','0',322,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2199,'新田县','0',322,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2200,'江华瑶族自治县','0',322,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2201,'鹤城区','0',323,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2202,'中方县','0',323,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2203,'沅陵县','0',323,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2204,'辰溪县','0',323,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2205,'溆浦县','0',323,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2206,'会同县','0',323,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2207,'麻阳苗族自治县','0',323,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2208,'新晃侗族自治县','0',323,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2209,'芷江侗族自治县','0',323,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2210,'靖州苗族侗族自治县','0',323,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2211,'通道侗族自治县','0',323,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2212,'洪江市','0',323,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2213,'娄星区','0',324,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2214,'双峰县','0',324,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2215,'新化县','0',324,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2216,'冷水江市','0',324,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2217,'涟源市','0',324,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2218,'吉首市','0',325,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2219,'泸溪县','0',325,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2220,'凤凰县','0',325,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2221,'花垣县','0',325,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2222,'保靖县','0',325,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2223,'古丈县','0',325,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2224,'永顺县','0',325,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2225,'龙山县','0',325,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2226,'荔湾区','0',326,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2227,'越秀区','0',326,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2228,'海珠区','0',326,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2229,'天河区','0',326,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2230,'白云区','0',326,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2231,'黄埔区','0',326,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2232,'番禺区','0',326,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2233,'花都区','0',326,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2234,'南沙区','0',326,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2235,'萝岗区','0',326,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2236,'增城市','0',326,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2237,'从化市','0',326,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2238,'武江区','0',327,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2239,'浈江区','0',327,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2240,'曲江区','0',327,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2241,'始兴县','0',327,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2242,'仁化县','0',327,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2243,'翁源县','0',327,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2244,'乳源瑶族自治县','0',327,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2245,'新丰县','0',327,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2246,'乐昌市','0',327,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2247,'南雄市','0',327,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2248,'罗湖区','0',328,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2249,'福田区','0',328,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2250,'南山区','0',328,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2251,'宝安区','0',328,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2252,'龙岗区','0',328,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2253,'盐田区','0',328,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2254,'香洲区','0',329,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2255,'斗门区','0',329,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2256,'金湾区','0',329,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2257,'龙湖区','0',330,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2258,'金平区','0',330,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2259,'濠江区','0',330,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2260,'潮阳区','0',330,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2261,'潮南区','0',330,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2262,'澄海区','0',330,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2263,'南澳县','0',330,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2264,'禅城区','0',331,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2265,'南海区','0',331,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2266,'顺德区','0',331,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2267,'三水区','0',331,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2268,'高明区','0',331,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2269,'蓬江区','0',332,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2270,'江海区','0',332,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2271,'新会区','0',332,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2272,'台山市','0',332,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2273,'开平市','0',332,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2274,'鹤山市','0',332,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2275,'恩平市','0',332,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2276,'赤坎区','0',333,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2277,'霞山区','0',333,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2278,'坡头区','0',333,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2279,'麻章区','0',333,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2280,'遂溪县','0',333,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2281,'徐闻县','0',333,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2282,'廉江市','0',333,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2283,'雷州市','0',333,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2284,'吴川市','0',333,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2285,'茂南区','0',334,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2286,'茂港区','0',334,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2287,'电白县','0',334,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2288,'高州市','0',334,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2289,'化州市','0',334,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2290,'信宜市','0',334,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2291,'端州区','0',335,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2292,'鼎湖区','0',335,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2293,'广宁县','0',335,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2294,'怀集县','0',335,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2295,'封开县','0',335,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2296,'德庆县','0',335,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2297,'高要市','0',335,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2298,'四会市','0',335,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2299,'惠城区','0',336,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2300,'惠阳区','0',336,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2301,'博罗县','0',336,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2302,'惠东县','0',336,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2303,'龙门县','0',336,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2304,'梅江区','0',337,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2305,'梅县','0',337,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2306,'大埔县','0',337,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2307,'丰顺县','0',337,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2308,'五华县','0',337,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2309,'平远县','0',337,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2310,'蕉岭县','0',337,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2311,'兴宁市','0',337,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2312,'城区','0',338,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2313,'海丰县','0',338,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2314,'陆河县','0',338,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2315,'陆丰市','0',338,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2316,'源城区','0',339,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2317,'紫金县','0',339,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2318,'龙川县','0',339,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2319,'连平县','0',339,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2320,'和平县','0',339,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2321,'东源县','0',339,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2322,'江城区','0',340,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2323,'阳西县','0',340,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2324,'阳东县','0',340,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2325,'阳春市','0',340,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2326,'清城区','0',341,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2327,'佛冈县','0',341,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2328,'阳山县','0',341,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2329,'连山壮族瑶族自治县','0',341,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2330,'连南瑶族自治县','0',341,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2331,'清新县','0',341,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2332,'英德市','0',341,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2333,'连州市','0',341,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2334,'湘桥区','0',344,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2335,'潮安县','0',344,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2336,'饶平县','0',344,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2337,'榕城区','0',345,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2338,'揭东县','0',345,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2339,'揭西县','0',345,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2340,'惠来县','0',345,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2341,'普宁市','0',345,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2342,'云城区','0',346,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2343,'新兴县','0',346,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2344,'郁南县','0',346,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2345,'云安县','0',346,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2346,'罗定市','0',346,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2347,'兴宁区','0',347,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2348,'青秀区','0',347,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2349,'江南区','0',347,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2350,'西乡塘区','0',347,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2351,'良庆区','0',347,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2352,'邕宁区','0',347,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2353,'武鸣县','0',347,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2354,'隆安县','0',347,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2355,'马山县','0',347,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2356,'上林县','0',347,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2357,'宾阳县','0',347,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2358,'横县','0',347,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2359,'城中区','0',348,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2360,'鱼峰区','0',348,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2361,'柳南区','0',348,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2362,'柳北区','0',348,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2363,'柳江县','0',348,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2364,'柳城县','0',348,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2365,'鹿寨县','0',348,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2366,'融安县','0',348,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2367,'融水苗族自治县','0',348,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2368,'三江侗族自治县','0',348,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2369,'秀峰区','0',349,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2370,'叠彩区','0',349,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2371,'象山区','0',349,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2372,'七星区','0',349,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2373,'雁山区','0',349,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2374,'阳朔县','0',349,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2375,'临桂县','0',349,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2376,'灵川县','0',349,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2377,'全州县','0',349,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2378,'兴安县','0',349,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2379,'永福县','0',349,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2380,'灌阳县','0',349,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2381,'龙胜各族自治县','0',349,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2382,'资源县','0',349,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2383,'平乐县','0',349,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2384,'荔蒲县','0',349,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2385,'恭城瑶族自治县','0',349,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2386,'万秀区','0',350,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2387,'蝶山区','0',350,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2388,'长洲区','0',350,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2389,'苍梧县','0',350,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2390,'藤县','0',350,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2391,'蒙山县','0',350,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2392,'岑溪市','0',350,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2393,'海城区','0',351,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2394,'银海区','0',351,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2395,'铁山港区','0',351,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2396,'合浦县','0',351,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2397,'港口区','0',352,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2398,'防城区','0',352,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2399,'上思县','0',352,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2400,'东兴市','0',352,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2401,'钦南区','0',353,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2402,'钦北区','0',353,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2403,'灵山县','0',353,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2404,'浦北县','0',353,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2405,'港北区','0',354,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2406,'港南区','0',354,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2407,'覃塘区','0',354,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2408,'平南县','0',354,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2409,'桂平市','0',354,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2410,'玉州区','0',355,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2411,'容县','0',355,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2412,'陆川县','0',355,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2413,'博白县','0',355,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2414,'兴业县','0',355,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2415,'北流市','0',355,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2416,'右江区','0',356,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2417,'田阳县','0',356,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2418,'田东县','0',356,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2419,'平果县','0',356,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2420,'德保县','0',356,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2421,'靖西县','0',356,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2422,'那坡县','0',356,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2423,'凌云县','0',356,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2424,'乐业县','0',356,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2425,'田林县','0',356,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2426,'西林县','0',356,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2427,'隆林各族自治县','0',356,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2428,'八步区','0',357,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2429,'昭平县','0',357,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2430,'钟山县','0',357,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2431,'富川瑶族自治县','0',357,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2432,'金城江区','0',358,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2433,'南丹县','0',358,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2434,'天峨县','0',358,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2435,'凤山县','0',358,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2436,'东兰县','0',358,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2437,'罗城仫佬族自治县','0',358,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2438,'环江毛南族自治县','0',358,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2439,'巴马瑶族自治县','0',358,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2440,'都安瑶族自治县','0',358,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2441,'大化瑶族自治县','0',358,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2442,'宜州市','0',358,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2443,'兴宾区','0',359,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2444,'忻城县','0',359,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2445,'象州县','0',359,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2446,'武宣县','0',359,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2447,'金秀瑶族自治县','0',359,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2448,'合山市','0',359,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2449,'江洲区','0',360,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2450,'扶绥县','0',360,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2451,'宁明县','0',360,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2452,'龙州县','0',360,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2453,'大新县','0',360,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2454,'天等县','0',360,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2455,'凭祥市','0',360,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2456,'秀英区','0',361,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2457,'龙华区','0',361,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2458,'琼山区','0',361,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2459,'美兰区','0',361,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2460,'锦江区','0',382,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2461,'青羊区','0',382,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2462,'金牛区','0',382,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2463,'武侯区','0',382,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2464,'成华区','0',382,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2465,'龙泉驿区','0',382,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2466,'青白江区','0',382,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2467,'新都区','0',382,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2468,'温江区','0',382,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2469,'金堂县','0',382,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2470,'双流县','0',382,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2471,'郫县','0',382,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2472,'大邑县','0',382,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2473,'蒲江县','0',382,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2474,'新津县','0',382,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2475,'都江堰市','0',382,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2476,'彭州市','0',382,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2477,'邛崃市','0',382,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2478,'崇州市','0',382,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2479,'自流井区','0',383,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2480,'贡井区','0',383,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2481,'大安区','0',383,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2482,'沿滩区','0',383,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2483,'荣县','0',383,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2484,'富顺县','0',383,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2485,'东区','0',384,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2486,'西区','0',384,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2487,'仁和区','0',384,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2488,'米易县','0',384,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2489,'盐边县','0',384,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2490,'江阳区','0',385,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2491,'纳溪区','0',385,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2492,'龙马潭区','0',385,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2493,'泸县','0',385,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2494,'合江县','0',385,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2495,'叙永县','0',385,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2496,'古蔺县','0',385,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2497,'旌阳区','0',386,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2498,'中江县','0',386,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2499,'罗江县','0',386,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2500,'广汉市','0',386,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2501,'什邡市','0',386,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2502,'绵竹市','0',386,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2503,'涪城区','0',387,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2504,'游仙区','0',387,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2505,'三台县','0',387,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2506,'盐亭县','0',387,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2507,'安县','0',387,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2508,'梓潼县','0',387,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2509,'北川羌族自治县','0',387,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2510,'平武县','0',387,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2511,'江油市','0',387,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2512,'市中区','0',388,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2513,'元坝区','0',388,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2514,'朝天区','0',388,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2515,'旺苍县','0',388,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2516,'青川县','0',388,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2517,'剑阁县','0',388,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2518,'苍溪县','0',388,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2519,'船山区','0',389,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2520,'安居区','0',389,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2521,'蓬溪县','0',389,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2522,'射洪县','0',389,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2523,'大英县','0',389,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2524,'市中区','0',390,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2525,'东兴区','0',390,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2526,'威远县','0',390,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2527,'资中县','0',390,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2528,'隆昌县','0',390,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2529,'市中区','0',391,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2530,'沙湾区','0',391,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2531,'五通桥区','0',391,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2532,'金口河区','0',391,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2533,'犍为县','0',391,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2534,'井研县','0',391,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2535,'夹江县','0',391,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2536,'沐川县','0',391,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2537,'峨边彝族自治县','0',391,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2538,'马边彝族自治县','0',391,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2539,'峨眉山市','0',391,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2540,'顺庆区','0',392,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2541,'高坪区','0',392,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2542,'嘉陵区','0',392,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2543,'南部县','0',392,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2544,'营山县','0',392,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2545,'蓬安县','0',392,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2546,'仪陇县','0',392,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2547,'西充县','0',392,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2548,'阆中市','0',392,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2549,'东坡区','0',393,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2550,'仁寿县','0',393,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2551,'彭山县','0',393,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2552,'洪雅县','0',393,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2553,'丹棱县','0',393,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2554,'青神县','0',393,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2555,'翠屏区','0',394,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2556,'宜宾县','0',394,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2557,'南溪县','0',394,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2558,'江安县','0',394,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2559,'长宁县','0',394,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2560,'高县','0',394,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2561,'珙县','0',394,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2562,'筠连县','0',394,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2563,'兴文县','0',394,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2564,'屏山县','0',394,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2565,'广安区','0',395,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2566,'岳池县','0',395,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2567,'武胜县','0',395,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2568,'邻水县','0',395,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2569,'华蓥市','0',395,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2570,'通川区','0',396,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2571,'达县','0',396,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2572,'宣汉县','0',396,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2573,'开江县','0',396,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2574,'大竹县','0',396,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2575,'渠县','0',396,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2576,'万源市','0',396,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2577,'雨城区','0',397,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2578,'名山县','0',397,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2579,'荥经县','0',397,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2580,'汉源县','0',397,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2581,'石棉县','0',397,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2582,'天全县','0',397,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2583,'芦山县','0',397,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2584,'宝兴县','0',397,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2585,'巴州区','0',398,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2586,'通江县','0',398,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2587,'南江县','0',398,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2588,'平昌县','0',398,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2589,'雁江区','0',399,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2590,'安岳县','0',399,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2591,'乐至县','0',399,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2592,'简阳市','0',399,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2593,'汶川县','0',400,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2594,'理县','0',400,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2595,'茂县','0',400,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2596,'松潘县','0',400,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2597,'九寨沟县','0',400,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2598,'金川县','0',400,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2599,'小金县','0',400,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2600,'黑水县','0',400,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2601,'马尔康县','0',400,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2602,'壤塘县','0',400,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2603,'阿坝县','0',400,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2604,'若尔盖县','0',400,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2605,'红原县','0',400,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2606,'康定县','0',401,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2607,'泸定县','0',401,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2608,'丹巴县','0',401,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2609,'九龙县','0',401,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2610,'雅江县','0',401,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2611,'道孚县','0',401,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2612,'炉霍县','0',401,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2613,'甘孜县','0',401,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2614,'新龙县','0',401,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2615,'德格县','0',401,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2616,'白玉县','0',401,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2617,'石渠县','0',401,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2618,'色达县','0',401,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2619,'理塘县','0',401,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2620,'巴塘县','0',401,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2621,'乡城县','0',401,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2622,'稻城县','0',401,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2623,'得荣县','0',401,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2624,'西昌市','0',402,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2625,'木里藏族自治县','0',402,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2626,'盐源县','0',402,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2627,'德昌县','0',402,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2628,'会理县','0',402,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2629,'会东县','0',402,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2630,'宁南县','0',402,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2631,'普格县','0',402,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2632,'布拖县','0',402,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2633,'金阳县','0',402,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2634,'昭觉县','0',402,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2635,'喜德县','0',402,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2636,'冕宁县','0',402,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2637,'越西县','0',402,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2638,'甘洛县','0',402,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2639,'美姑县','0',402,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2640,'雷波县','0',402,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2641,'南明区','0',403,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2642,'云岩区','0',403,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2643,'花溪区','0',403,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2644,'乌当区','0',403,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2645,'白云区','0',403,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2646,'小河区','0',403,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2647,'开阳县','0',403,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2648,'息烽县','0',403,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2649,'修文县','0',403,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2650,'清镇市','0',403,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2651,'钟山区','0',404,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2652,'六枝特区','0',404,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2653,'水城县','0',404,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2654,'盘县','0',404,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2655,'红花岗区','0',405,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2656,'汇川区','0',405,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2657,'遵义县','0',405,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2658,'桐梓县','0',405,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2659,'绥阳县','0',405,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2660,'正安县','0',405,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2661,'道真仡佬族苗族自治县','0',405,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2662,'务川仡佬族苗族自治县','0',405,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2663,'凤冈县','0',405,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2664,'湄潭县','0',405,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2665,'余庆县','0',405,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2666,'习水县','0',405,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2667,'赤水市','0',405,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2668,'仁怀市','0',405,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2669,'西秀区','0',406,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2670,'平坝县','0',406,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2671,'普定县','0',406,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2672,'镇宁布依族苗族自治县','0',406,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2673,'关岭布依族苗族自治县','0',406,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2674,'紫云苗族布依族自治县','0',406,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2675,'铜仁市','0',407,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2676,'江口县','0',407,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2677,'玉屏侗族自治县','0',407,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2678,'石阡县','0',407,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2679,'思南县','0',407,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2680,'印江土家族苗族自治县','0',407,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2681,'德江县','0',407,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2682,'沿河土家族自治县','0',407,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2683,'松桃苗族自治县','0',407,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2684,'万山特区','0',407,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2685,'兴义市','0',408,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2686,'兴仁县','0',408,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2687,'普安县','0',408,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2688,'晴隆县','0',408,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2689,'贞丰县','0',408,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2690,'望谟县','0',408,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2691,'册亨县','0',408,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2692,'安龙县','0',408,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2693,'毕节市','0',409,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2694,'大方县','0',409,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2695,'黔西县','0',409,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2696,'金沙县','0',409,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2697,'织金县','0',409,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2698,'纳雍县','0',409,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2699,'威宁彝族回族苗族自治县','0',409,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2700,'赫章县','0',409,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2701,'凯里市','0',410,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2702,'黄平县','0',410,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2703,'施秉县','0',410,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2704,'三穗县','0',410,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2705,'镇远县','0',410,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2706,'岑巩县','0',410,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2707,'天柱县','0',410,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2708,'锦屏县','0',410,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2709,'剑河县','0',410,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2710,'台江县','0',410,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2711,'黎平县','0',410,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2712,'榕江县','0',410,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2713,'从江县','0',410,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2714,'雷山县','0',410,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2715,'麻江县','0',410,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2716,'丹寨县','0',410,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2717,'都匀市','0',411,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2718,'福泉市','0',411,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2719,'荔波县','0',411,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2720,'贵定县','0',411,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2721,'瓮安县','0',411,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2722,'独山县','0',411,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2723,'平塘县','0',411,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2724,'罗甸县','0',411,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2725,'长顺县','0',411,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2726,'龙里县','0',411,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2727,'惠水县','0',411,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2728,'三都水族自治县','0',411,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2729,'五华区','0',412,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2730,'盘龙区','0',412,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2731,'官渡区','0',412,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2732,'西山区','0',412,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2733,'东川区','0',412,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2734,'呈贡县','0',412,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2735,'晋宁县','0',412,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2736,'富民县','0',412,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2737,'宜良县','0',412,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2738,'石林彝族自治县','0',412,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2739,'嵩明县','0',412,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2740,'禄劝彝族苗族自治县','0',412,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2741,'寻甸回族彝族自治县','0',412,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2742,'安宁市','0',412,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2743,'麒麟区','0',413,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2744,'马龙县','0',413,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2745,'陆良县','0',413,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2746,'师宗县','0',413,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2747,'罗平县','0',413,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2748,'富源县','0',413,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2749,'会泽县','0',413,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2750,'沾益县','0',413,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2751,'宣威市','0',413,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2752,'红塔区','0',414,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2753,'江川县','0',414,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2754,'澄江县','0',414,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2755,'通海县','0',414,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2756,'华宁县','0',414,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2757,'易门县','0',414,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2758,'峨山彝族自治县','0',414,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2759,'新平彝族傣族自治县','0',414,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2760,'元江哈尼族彝族傣族自治县','0',414,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2761,'隆阳区','0',415,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2762,'施甸县','0',415,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2763,'腾冲县','0',415,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2764,'龙陵县','0',415,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2765,'昌宁县','0',415,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2766,'昭阳区','0',416,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2767,'鲁甸县','0',416,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2768,'巧家县','0',416,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2769,'盐津县','0',416,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2770,'大关县','0',416,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2771,'永善县','0',416,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2772,'绥江县','0',416,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2773,'镇雄县','0',416,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2774,'彝良县','0',416,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2775,'威信县','0',416,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2776,'水富县','0',416,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2777,'古城区','0',417,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2778,'玉龙纳西族自治县','0',417,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2779,'永胜县','0',417,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2780,'华坪县','0',417,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2781,'宁蒗彝族自治县','0',417,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2782,'翠云区','0',418,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2783,'普洱哈尼族彝族自治县','0',418,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2784,'墨江哈尼族自治县','0',418,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2785,'景东彝族自治县','0',418,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2786,'景谷傣族彝族自治县','0',418,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2787,'镇沅彝族哈尼族拉祜族自治县','0',418,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2788,'江城哈尼族彝族自治县','0',418,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2789,'孟连傣族拉祜族佤族自治县','0',418,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2790,'澜沧拉祜族自治县','0',418,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2791,'西盟佤族自治县','0',418,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2792,'临翔区','0',419,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2793,'凤庆县','0',419,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2794,'云县','0',419,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2795,'永德县','0',419,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2796,'镇康县','0',419,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2797,'双江拉祜族佤族布朗族傣族自治县','0',419,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2798,'耿马傣族佤族自治县','0',419,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2799,'沧源佤族自治县','0',420,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2800,'楚雄市','0',420,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2801,'双柏县','0',420,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2802,'牟定县','0',420,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2803,'南华县','0',420,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2804,'姚安县','0',420,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2805,'大姚县','0',420,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2806,'永仁县','0',420,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2807,'元谋县','0',420,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2808,'武定县','0',420,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2809,'禄丰县','0',420,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2810,'个旧市','0',421,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2811,'开远市','0',421,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2812,'蒙自县','0',421,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2813,'屏边苗族自治县','0',421,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2814,'建水县','0',421,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2815,'石屏县','0',421,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2816,'弥勒县','0',421,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2817,'泸西县','0',421,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2818,'元阳县','0',421,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2819,'红河县','0',421,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2820,'金平苗族瑶族傣族自治县','0',421,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2821,'绿春县','0',421,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2822,'河口瑶族自治县','0',421,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2823,'文山县','0',422,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2824,'砚山县','0',422,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2825,'西畴县','0',422,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2826,'麻栗坡县','0',422,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2827,'马关县','0',422,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2828,'丘北县','0',422,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2829,'广南县','0',422,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2830,'富宁县','0',422,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2831,'景洪市','0',423,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2832,'勐海县','0',423,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2833,'勐腊县','0',423,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2834,'大理市','0',424,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2835,'漾濞彝族自治县','0',424,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2836,'祥云县','0',424,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2837,'宾川县','0',424,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2838,'弥渡县','0',424,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2839,'南涧彝族自治县','0',424,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2840,'巍山彝族回族自治县','0',424,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2841,'永平县','0',424,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2842,'云龙县','0',424,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2843,'洱源县','0',424,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2844,'剑川县','0',424,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2845,'鹤庆县','0',424,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2846,'瑞丽市','0',425,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2847,'潞西市','0',425,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2848,'梁河县','0',425,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2849,'盈江县','0',425,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2850,'陇川县','0',425,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2851,'泸水县','0',426,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2852,'福贡县','0',426,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2853,'贡山独龙族怒族自治县','0',426,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2854,'兰坪白族普米族自治县','0',426,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2855,'香格里拉县','0',427,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2856,'德钦县','0',427,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2857,'维西傈僳族自治县','0',427,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2858,'城关区','0',428,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2859,'林周县','0',428,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2860,'当雄县','0',428,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2861,'尼木县','0',428,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2862,'曲水县','0',428,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2863,'堆龙德庆县','0',428,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2864,'达孜县','0',428,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2865,'墨竹工卡县','0',428,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2866,'昌都县','0',429,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2867,'江达县','0',429,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2868,'贡觉县','0',429,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2869,'类乌齐县','0',429,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2870,'丁青县','0',429,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2871,'察雅县','0',429,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2872,'八宿县','0',429,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2873,'左贡县','0',429,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2874,'芒康县','0',429,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2875,'洛隆县','0',429,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2876,'边坝县','0',429,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2877,'乃东县','0',430,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2878,'扎囊县','0',430,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2879,'贡嘎县','0',430,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2880,'桑日县','0',430,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2881,'琼结县','0',430,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2882,'曲松县','0',430,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2883,'措美县','0',430,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2884,'洛扎县','0',430,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2885,'加查县','0',430,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2886,'隆子县','0',430,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2887,'错那县','0',430,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2888,'浪卡子县','0',430,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2889,'日喀则市','0',431,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2890,'南木林县','0',431,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2891,'江孜县','0',431,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2892,'定日县','0',431,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2893,'萨迦县','0',431,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2894,'拉孜县','0',431,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2895,'昂仁县','0',431,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2896,'谢通门县','0',431,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2897,'白朗县','0',431,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2898,'仁布县','0',431,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2899,'康马县','0',431,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2900,'定结县','0',431,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2901,'仲巴县','0',431,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2902,'亚东县','0',431,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2903,'吉隆县','0',431,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2904,'聂拉木县','0',431,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2905,'萨嘎县','0',431,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2906,'岗巴县','0',431,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2907,'那曲县','0',432,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2908,'嘉黎县','0',432,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2909,'比如县','0',432,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2910,'聂荣县','0',432,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2911,'安多县','0',432,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2912,'申扎县','0',432,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2913,'索县','0',432,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2914,'班戈县','0',432,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2915,'巴青县','0',432,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2916,'尼玛县','0',432,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2917,'普兰县','0',433,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2918,'札达县','0',433,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2919,'噶尔县','0',433,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2920,'日土县','0',433,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2921,'革吉县','0',433,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2922,'改则县','0',433,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2923,'措勤县','0',433,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2924,'林芝县','0',434,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2925,'工布江达县','0',434,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2926,'米林县','0',434,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2927,'墨脱县','0',434,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2928,'波密县','0',434,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2929,'察隅县','0',434,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2930,'朗县','0',434,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2931,'新城区','0',435,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2932,'碑林区','0',435,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2933,'莲湖区','0',435,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2934,'灞桥区','0',435,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2935,'未央区','0',435,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2936,'雁塔区','0',435,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2937,'阎良区','0',435,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2938,'临潼区','0',435,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2939,'长安区','0',435,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2940,'蓝田县','0',435,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2941,'周至县','0',435,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2942,'户县','0',435,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2943,'高陵县','0',435,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2944,'王益区','0',436,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2945,'印台区','0',436,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2946,'耀州区','0',436,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2947,'宜君县','0',436,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2948,'渭滨区','0',437,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2949,'金台区','0',437,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2950,'陈仓区','0',437,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2951,'凤翔县','0',437,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2952,'岐山县','0',437,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2953,'扶风县','0',437,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2954,'眉县','0',437,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2955,'陇县','0',437,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2956,'千阳县','0',437,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2957,'麟游县','0',437,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2958,'凤县','0',437,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2959,'太白县','0',437,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2960,'秦都区','0',438,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2961,'杨凌区','0',438,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2962,'渭城区','0',438,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2963,'三原县','0',438,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2964,'泾阳县','0',438,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2965,'乾县','0',438,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2966,'礼泉县','0',438,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2967,'永寿县','0',438,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2968,'彬县','0',438,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2969,'长武县','0',438,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2970,'旬邑县','0',438,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2971,'淳化县','0',438,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2972,'武功县','0',438,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2973,'兴平市','0',438,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2974,'临渭区','0',439,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2975,'华县','0',439,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2976,'潼关县','0',439,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2977,'大荔县','0',439,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2978,'合阳县','0',439,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2979,'澄城县','0',439,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2980,'蒲城县','0',439,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2981,'白水县','0',439,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2982,'富平县','0',439,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2983,'韩城市','0',439,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2984,'华阴市','0',439,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2985,'宝塔区','0',440,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2986,'延长县','0',440,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2987,'延川县','0',440,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2988,'子长县','0',440,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2989,'安塞县','0',440,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2990,'志丹县','0',440,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2991,'吴起县','0',440,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2992,'甘泉县','0',440,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2993,'富县','0',440,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2994,'洛川县','0',440,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2995,'宜川县','0',440,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2996,'黄龙县','0',440,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2997,'黄陵县','0',440,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2998,'汉台区','0',441,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (2999,'南郑县','0',441,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3000,'城固县','0',441,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3001,'洋县','0',441,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3002,'西乡县','0',441,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3003,'勉县','0',441,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3004,'宁强县','0',441,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3005,'略阳县','0',441,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3006,'镇巴县','0',441,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3007,'留坝县','0',441,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3008,'佛坪县','0',441,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3009,'榆阳区','0',442,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3010,'神木县','0',442,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3011,'府谷县','0',442,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3012,'横山县','0',442,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3013,'靖边县','0',442,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3014,'定边县','0',442,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3015,'绥德县','0',442,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3016,'米脂县','0',442,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3017,'佳县','0',442,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3018,'吴堡县','0',442,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3019,'清涧县','0',442,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3020,'子洲县','0',442,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3021,'汉滨区','0',443,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3022,'汉阴县','0',443,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3023,'石泉县','0',443,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3024,'宁陕县','0',443,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3025,'紫阳县','0',443,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3026,'岚皋县','0',443,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3027,'平利县','0',443,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3028,'镇坪县','0',443,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3029,'旬阳县','0',443,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3030,'白河县','0',443,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3031,'商州区','0',444,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3032,'洛南县','0',444,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3033,'丹凤县','0',444,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3034,'商南县','0',444,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3035,'山阳县','0',444,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3036,'镇安县','0',444,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3037,'柞水县','0',444,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3038,'城关区','0',445,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3039,'七里河区','0',445,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3040,'西固区','0',445,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3041,'安宁区','0',445,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3042,'红古区','0',445,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3043,'永登县','0',445,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3044,'皋兰县','0',445,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3045,'榆中县','0',445,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3046,'金川区','0',447,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3047,'永昌县','0',447,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3048,'白银区','0',448,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3049,'平川区','0',448,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3050,'靖远县','0',448,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3051,'会宁县','0',448,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3052,'景泰县','0',448,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3053,'秦城区','0',449,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3054,'北道区','0',449,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3055,'清水县','0',449,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3056,'秦安县','0',449,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3057,'甘谷县','0',449,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3058,'武山县','0',449,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3059,'张家川回族自治县','0',449,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3060,'凉州区','0',450,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3061,'民勤县','0',450,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3062,'古浪县','0',450,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3063,'天祝藏族自治县','0',450,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3064,'甘州区','0',451,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3065,'肃南裕固族自治县','0',451,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3066,'民乐县','0',451,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3067,'临泽县','0',451,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3068,'高台县','0',451,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3069,'山丹县','0',451,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3070,'崆峒区','0',452,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3071,'泾川县','0',452,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3072,'灵台县','0',452,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3073,'崇信县','0',452,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3074,'华亭县','0',452,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3075,'庄浪县','0',452,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3076,'静宁县','0',452,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3077,'肃州区','0',453,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3078,'金塔县','0',453,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3079,'瓜州县','0',453,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3080,'肃北蒙古族自治县','0',453,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3081,'阿克塞哈萨克族自治县','0',453,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3082,'玉门市','0',453,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3083,'敦煌市','0',453,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3084,'西峰区','0',454,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3085,'庆城县','0',454,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3086,'环县','0',454,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3087,'华池县','0',454,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3088,'合水县','0',454,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3089,'正宁县','0',454,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3090,'宁县','0',454,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3091,'镇原县','0',454,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3092,'安定区','0',455,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3093,'通渭县','0',455,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3094,'陇西县','0',455,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3095,'渭源县','0',455,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3096,'临洮县','0',455,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3097,'漳县','0',455,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3098,'岷县','0',455,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3099,'武都区','0',456,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3100,'成县','0',456,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3101,'文县','0',456,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3102,'宕昌县','0',456,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3103,'康县','0',456,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3104,'西和县','0',456,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3105,'礼县','0',456,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3106,'徽县','0',456,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3107,'两当县','0',456,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3108,'临夏市','0',457,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3109,'临夏县','0',457,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3110,'康乐县','0',457,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3111,'永靖县','0',457,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3112,'广河县','0',457,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3113,'和政县','0',457,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3114,'东乡族自治县','0',457,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3115,'积石山保安族东乡族撒拉族自治县','0',457,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3116,'合作市','0',458,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3117,'临潭县','0',458,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3118,'卓尼县','0',458,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3119,'舟曲县','0',458,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3120,'迭部县','0',458,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3121,'玛曲县','0',458,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3122,'碌曲县','0',458,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3123,'夏河县','0',458,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3124,'城东区','0',459,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3125,'城中区','0',459,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3126,'城西区','0',459,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3127,'城北区','0',459,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3128,'大通回族土族自治县','0',459,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3129,'湟中县','0',459,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3130,'湟源县','0',459,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3131,'平安县','0',460,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3132,'民和回族土族自治县','0',460,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3133,'乐都县','0',460,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3134,'互助土族自治县','0',460,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3135,'化隆回族自治县','0',460,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3136,'循化撒拉族自治县','0',460,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3137,'门源回族自治县','0',461,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3138,'祁连县','0',461,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3139,'海晏县','0',461,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3140,'刚察县','0',461,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3141,'同仁县','0',462,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3142,'尖扎县','0',462,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3143,'泽库县','0',462,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3144,'河南蒙古族自治县','0',462,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3145,'共和县','0',463,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3146,'同德县','0',463,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3147,'贵德县','0',463,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3148,'兴海县','0',463,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3149,'贵南县','0',463,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3150,'玛沁县','0',464,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3151,'班玛县','0',464,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3152,'甘德县','0',464,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3153,'达日县','0',464,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3154,'久治县','0',464,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3155,'玛多县','0',464,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3156,'玉树县','0',465,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3157,'杂多县','0',465,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3158,'称多县','0',465,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3159,'治多县','0',465,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3160,'囊谦县','0',465,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3161,'曲麻莱县','0',465,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3162,'格尔木市','0',466,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3163,'德令哈市','0',466,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3164,'乌兰县','0',466,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3165,'都兰县','0',466,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3166,'天峻县','0',466,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3167,'兴庆区','0',467,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3168,'西夏区','0',467,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3169,'金凤区','0',467,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3170,'永宁县','0',467,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3171,'贺兰县','0',467,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3172,'灵武市','0',467,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3173,'大武口区','0',468,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3174,'惠农区','0',468,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3175,'平罗县','0',468,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3176,'利通区','0',469,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3177,'盐池县','0',469,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3178,'同心县','0',469,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3179,'青铜峡市','0',469,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3180,'原州区','0',470,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3181,'西吉县','0',470,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3182,'隆德县','0',470,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3183,'泾源县','0',470,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3184,'彭阳县','0',470,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3185,'沙坡头区','0',471,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3186,'中宁县','0',471,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3187,'海原县','0',471,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3188,'天山区','0',472,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3189,'沙依巴克区','0',472,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3190,'新市区','0',472,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3191,'水磨沟区','0',472,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3192,'头屯河区','0',472,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3193,'达坂城区','0',472,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3194,'东山区','0',472,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3195,'乌鲁木齐县','0',472,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3196,'独山子区','0',473,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3197,'克拉玛依区','0',473,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3198,'白碱滩区','0',473,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3199,'乌尔禾区','0',473,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3200,'吐鲁番市','0',474,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3201,'鄯善县','0',474,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3202,'托克逊县','0',474,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3203,'哈密市','0',475,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3204,'巴里坤哈萨克自治县','0',475,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3205,'伊吾县','0',475,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3206,'昌吉市','0',476,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3207,'阜康市','0',476,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3208,'米泉市','0',476,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3209,'呼图壁县','0',476,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3210,'玛纳斯县','0',476,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3211,'奇台县','0',476,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3212,'吉木萨尔县','0',476,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3213,'木垒哈萨克自治县','0',476,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3214,'博乐市','0',477,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3215,'精河县','0',477,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3216,'温泉县','0',477,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3217,'库尔勒市','0',478,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3218,'轮台县','0',478,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3219,'尉犁县','0',478,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3220,'若羌县','0',478,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3221,'且末县','0',478,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3222,'焉耆回族自治县','0',478,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3223,'和静县','0',478,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3224,'和硕县','0',478,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3225,'博湖县','0',478,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3226,'阿克苏市','0',479,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3227,'温宿县','0',479,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3228,'库车县','0',479,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3229,'沙雅县','0',479,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3230,'新和县','0',479,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3231,'拜城县','0',479,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3232,'乌什县','0',479,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3233,'阿瓦提县','0',479,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3234,'柯坪县','0',479,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3235,'阿图什市','0',480,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3236,'阿克陶县','0',480,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3237,'阿合奇县','0',480,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3238,'乌恰县','0',480,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3239,'喀什市','0',481,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3240,'疏附县','0',481,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3241,'疏勒县','0',481,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3242,'英吉沙县','0',481,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3243,'泽普县','0',481,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3244,'莎车县','0',481,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3245,'叶城县','0',481,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3246,'麦盖提县','0',481,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3247,'岳普湖县','0',481,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3248,'伽师县','0',481,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3249,'巴楚县','0',481,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3250,'塔什库尔干塔吉克自治县','0',481,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3251,'和田市','0',482,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3252,'和田县','0',482,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3253,'墨玉县','0',482,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3254,'皮山县','0',482,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3255,'洛浦县','0',482,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3256,'策勒县','0',482,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3257,'于田县','0',482,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3258,'民丰县','0',482,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3259,'伊宁市','0',483,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3260,'奎屯市','0',483,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3261,'伊宁县','0',483,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3262,'察布查尔锡伯自治县','0',483,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3263,'霍城县','0',483,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3264,'巩留县','0',483,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3265,'新源县','0',483,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3266,'昭苏县','0',483,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3267,'特克斯县','0',483,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3268,'尼勒克县','0',483,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3269,'塔城市','0',484,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3270,'乌苏市','0',484,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3271,'额敏县','0',484,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3272,'沙湾县','0',484,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3273,'托里县','0',484,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3274,'裕民县','0',484,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3275,'和布克赛尔蒙古自治县','0',484,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3276,'阿勒泰市','0',485,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3277,'布尔津县','0',485,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3278,'富蕴县','0',485,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3279,'福海县','0',485,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3280,'哈巴河县','0',485,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3281,'青河县','0',485,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3282,'吉木乃县','0',485,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3358,'钓鱼岛','',0,0,'',1,0,'',NULL,0);
insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`setting`,`siteid`) values (3359,'钓鱼岛','',3358,0,'',1,0,'',NULL,0);

/*Table structure for table `v9_log` */

CREATE TABLE `v9_log` (
  `logid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `field` varchar(15) NOT NULL,
  `value` int(10) unsigned NOT NULL DEFAULT '0',
  `module` varchar(15) NOT NULL,
  `file` varchar(20) NOT NULL,
  `action` varchar(20) NOT NULL,
  `querystring` varchar(255) NOT NULL,
  `data` mediumtext NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(20) NOT NULL,
  `ip` varchar(15) NOT NULL,
  `time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`logid`),
  KEY `module` (`module`,`file`,`action`),
  KEY `username` (`username`,`action`)
) ENGINE=MyISAM AUTO_INCREMENT=100 DEFAULT CHARSET=utf8;

/*Data for the table `v9_log` */

insert  into `v9_log`(`logid`,`field`,`value`,`module`,`file`,`action`,`querystring`,`data`,`userid`,`username`,`ip`,`time`) values (1,'',0,'admin','','index','?m=admin&c=index&a=login','',0,'','192.168.56.1','2016-06-06 21:27:01');
insert  into `v9_log`(`logid`,`field`,`value`,`module`,`file`,`action`,`querystring`,`data`,`userid`,`username`,`ip`,`time`) values (2,'',0,'admin','','index','?m=admin&c=index&a=login','',0,'','192.168.56.1','2016-06-06 21:27:08');
insert  into `v9_log`(`logid`,`field`,`value`,`module`,`file`,`action`,`querystring`,`data`,`userid`,`username`,`ip`,`time`) values (3,'',0,'admin','','site','?m=admin&c=site&a=edit','',1,'phpcms','192.168.56.1','2016-06-06 21:27:38');
insert  into `v9_log`(`logid`,`field`,`value`,`module`,`file`,`action`,`querystring`,`data`,`userid`,`username`,`ip`,`time`) values (4,'',0,'admin','','site','?m=admin&c=site&a=edit','',1,'phpcms','192.168.56.1','2016-06-06 21:27:46');
insert  into `v9_log`(`logid`,`field`,`value`,`module`,`file`,`action`,`querystring`,`data`,`userid`,`username`,`ip`,`time`) values (5,'',0,'content','','create_html','?m=content&c=create_html&a=category','',1,'phpcms','192.168.56.1','2016-06-06 21:29:13');
insert  into `v9_log`(`logid`,`field`,`value`,`module`,`file`,`action`,`querystring`,`data`,`userid`,`username`,`ip`,`time`) values (6,'',0,'content','','create_html','?m=content&c=create_html&a=category','',1,'phpcms','192.168.56.1','2016-06-06 21:29:16');
insert  into `v9_log`(`logid`,`field`,`value`,`module`,`file`,`action`,`querystring`,`data`,`userid`,`username`,`ip`,`time`) values (7,'',0,'content','','create_html','?m=content&c=create_html&a=category','',1,'phpcms','192.168.56.1','2016-06-06 21:29:17');
insert  into `v9_log`(`logid`,`field`,`value`,`module`,`file`,`action`,`querystring`,`data`,`userid`,`username`,`ip`,`time`) values (8,'',0,'content','','create_html','?m=content&c=create_html&a=category','',1,'phpcms','192.168.56.1','2016-06-06 21:29:17');
insert  into `v9_log`(`logid`,`field`,`value`,`module`,`file`,`action`,`querystring`,`data`,`userid`,`username`,`ip`,`time`) values (9,'',0,'content','','create_html','?m=content&c=create_html&a=category','',1,'phpcms','192.168.56.1','2016-06-06 21:29:18');
insert  into `v9_log`(`logid`,`field`,`value`,`module`,`file`,`action`,`querystring`,`data`,`userid`,`username`,`ip`,`time`) values (10,'',0,'content','','create_html','?m=content&c=create_html&a=category','',1,'phpcms','192.168.56.1','2016-06-06 21:29:18');
insert  into `v9_log`(`logid`,`field`,`value`,`module`,`file`,`action`,`querystring`,`data`,`userid`,`username`,`ip`,`time`) values (11,'',0,'content','','create_html','?m=content&c=create_html&a=category','',1,'phpcms','192.168.56.1','2016-06-06 21:29:18');
insert  into `v9_log`(`logid`,`field`,`value`,`module`,`file`,`action`,`querystring`,`data`,`userid`,`username`,`ip`,`time`) values (12,'',0,'content','','create_html','?m=content&c=create_html&a=category','',1,'phpcms','192.168.56.1','2016-06-06 21:29:18');
insert  into `v9_log`(`logid`,`field`,`value`,`module`,`file`,`action`,`querystring`,`data`,`userid`,`username`,`ip`,`time`) values (13,'',0,'content','','content','?m=content&c=content&a=add','',1,'phpcms','192.168.56.1','2016-06-06 21:29:22');
insert  into `v9_log`(`logid`,`field`,`value`,`module`,`file`,`action`,`querystring`,`data`,`userid`,`username`,`ip`,`time`) values (14,'',0,'content','','content','?m=content&c=content&a=add','',1,'phpcms','192.168.56.1','2016-06-06 21:29:28');
insert  into `v9_log`(`logid`,`field`,`value`,`module`,`file`,`action`,`querystring`,`data`,`userid`,`username`,`ip`,`time`) values (15,'',0,'content','','content','?m=content&c=content&a=add','',1,'phpcms','192.168.56.1','2016-06-06 21:29:29');
insert  into `v9_log`(`logid`,`field`,`value`,`module`,`file`,`action`,`querystring`,`data`,`userid`,`username`,`ip`,`time`) values (16,'',0,'content','','content','?m=content&c=content&a=add','',1,'phpcms','192.168.56.1','2016-06-06 21:31:39');
insert  into `v9_log`(`logid`,`field`,`value`,`module`,`file`,`action`,`querystring`,`data`,`userid`,`username`,`ip`,`time`) values (17,'',0,'content','','content','?m=content&c=content&a=add','',1,'phpcms','192.168.56.1','2016-06-06 21:31:49');
insert  into `v9_log`(`logid`,`field`,`value`,`module`,`file`,`action`,`querystring`,`data`,`userid`,`username`,`ip`,`time`) values (18,'',0,'content','','content','?m=content&c=content&a=add','',1,'phpcms','192.168.56.1','2016-06-06 21:31:50');
insert  into `v9_log`(`logid`,`field`,`value`,`module`,`file`,`action`,`querystring`,`data`,`userid`,`username`,`ip`,`time`) values (19,'',0,'content','','content','?m=content&c=content&a=add','',1,'phpcms','192.168.56.1','2016-06-06 21:31:52');
insert  into `v9_log`(`logid`,`field`,`value`,`module`,`file`,`action`,`querystring`,`data`,`userid`,`username`,`ip`,`time`) values (20,'',0,'content','','content','?m=content&c=content&a=add','',1,'phpcms','192.168.56.1','2016-06-06 21:31:58');
insert  into `v9_log`(`logid`,`field`,`value`,`module`,`file`,`action`,`querystring`,`data`,`userid`,`username`,`ip`,`time`) values (21,'',0,'content','','content','?m=content&c=content&a=add','',1,'phpcms','192.168.56.1','2016-06-06 21:31:59');
insert  into `v9_log`(`logid`,`field`,`value`,`module`,`file`,`action`,`querystring`,`data`,`userid`,`username`,`ip`,`time`) values (22,'',0,'content','','content','?m=content&c=content&a=add','',1,'phpcms','192.168.56.1','2016-06-06 21:32:01');
insert  into `v9_log`(`logid`,`field`,`value`,`module`,`file`,`action`,`querystring`,`data`,`userid`,`username`,`ip`,`time`) values (23,'',0,'content','','content','?m=content&c=content&a=add','',1,'phpcms','192.168.56.1','2016-06-06 21:32:06');
insert  into `v9_log`(`logid`,`field`,`value`,`module`,`file`,`action`,`querystring`,`data`,`userid`,`username`,`ip`,`time`) values (24,'',0,'content','','content','?m=content&c=content&a=add','',1,'phpcms','192.168.56.1','2016-06-06 21:32:08');
insert  into `v9_log`(`logid`,`field`,`value`,`module`,`file`,`action`,`querystring`,`data`,`userid`,`username`,`ip`,`time`) values (25,'',0,'content','','content','?m=content&c=content&a=add','',1,'phpcms','192.168.56.1','2016-06-06 21:32:09');
insert  into `v9_log`(`logid`,`field`,`value`,`module`,`file`,`action`,`querystring`,`data`,`userid`,`username`,`ip`,`time`) values (26,'',0,'content','','content','?m=content&c=content&a=add','',1,'phpcms','192.168.56.1','2016-06-06 21:32:14');
insert  into `v9_log`(`logid`,`field`,`value`,`module`,`file`,`action`,`querystring`,`data`,`userid`,`username`,`ip`,`time`) values (27,'',0,'content','','content','?m=content&c=content&a=add','',1,'phpcms','192.168.56.1','2016-06-06 21:32:15');
insert  into `v9_log`(`logid`,`field`,`value`,`module`,`file`,`action`,`querystring`,`data`,`userid`,`username`,`ip`,`time`) values (28,'',0,'content','','content','?m=content&c=content&a=add','',1,'phpcms','192.168.56.1','2016-06-06 21:32:18');
insert  into `v9_log`(`logid`,`field`,`value`,`module`,`file`,`action`,`querystring`,`data`,`userid`,`username`,`ip`,`time`) values (29,'',0,'content','','content','?m=content&c=content&a=add','',1,'phpcms','192.168.56.1','2016-06-06 21:32:19');
insert  into `v9_log`(`logid`,`field`,`value`,`module`,`file`,`action`,`querystring`,`data`,`userid`,`username`,`ip`,`time`) values (30,'',0,'content','','create_html','?m=content&c=create_html&a=category','',1,'phpcms','192.168.56.1','2016-06-06 21:34:02');
insert  into `v9_log`(`logid`,`field`,`value`,`module`,`file`,`action`,`querystring`,`data`,`userid`,`username`,`ip`,`time`) values (31,'',0,'content','','create_html','?m=content&c=create_html&a=category','',1,'phpcms','192.168.56.1','2016-06-06 21:34:09');
insert  into `v9_log`(`logid`,`field`,`value`,`module`,`file`,`action`,`querystring`,`data`,`userid`,`username`,`ip`,`time`) values (32,'',0,'content','','create_html','?m=content&c=create_html&a=category','',1,'phpcms','192.168.56.1','2016-06-06 21:34:10');
insert  into `v9_log`(`logid`,`field`,`value`,`module`,`file`,`action`,`querystring`,`data`,`userid`,`username`,`ip`,`time`) values (33,'',0,'content','','create_html','?m=content&c=create_html&a=category','',1,'phpcms','192.168.56.1','2016-06-06 21:34:10');
insert  into `v9_log`(`logid`,`field`,`value`,`module`,`file`,`action`,`querystring`,`data`,`userid`,`username`,`ip`,`time`) values (34,'',0,'content','','create_html','?m=content&c=create_html&a=category','',1,'phpcms','192.168.56.1','2016-06-06 21:34:10');
insert  into `v9_log`(`logid`,`field`,`value`,`module`,`file`,`action`,`querystring`,`data`,`userid`,`username`,`ip`,`time`) values (35,'',0,'content','','content','?m=content&c=content&a=add','',1,'phpcms','192.168.56.1','2016-06-06 21:36:14');
insert  into `v9_log`(`logid`,`field`,`value`,`module`,`file`,`action`,`querystring`,`data`,`userid`,`username`,`ip`,`time`) values (36,'',0,'content','','content','?m=content&c=content&a=add','',1,'phpcms','192.168.56.1','2016-06-06 21:36:42');
insert  into `v9_log`(`logid`,`field`,`value`,`module`,`file`,`action`,`querystring`,`data`,`userid`,`username`,`ip`,`time`) values (37,'',0,'content','','content','?m=content&c=content&a=add','',1,'phpcms','192.168.56.1','2016-06-06 21:36:44');
insert  into `v9_log`(`logid`,`field`,`value`,`module`,`file`,`action`,`querystring`,`data`,`userid`,`username`,`ip`,`time`) values (38,'',0,'content','','content','?m=content&c=content&a=add','',1,'phpcms','192.168.56.1','2016-06-06 21:36:47');
insert  into `v9_log`(`logid`,`field`,`value`,`module`,`file`,`action`,`querystring`,`data`,`userid`,`username`,`ip`,`time`) values (39,'',0,'content','','content','?m=content&c=content&a=add','',1,'phpcms','192.168.56.1','2016-06-06 21:36:49');
insert  into `v9_log`(`logid`,`field`,`value`,`module`,`file`,`action`,`querystring`,`data`,`userid`,`username`,`ip`,`time`) values (40,'',0,'content','','content','?m=content&c=content&a=add','',1,'phpcms','192.168.56.1','2016-06-06 21:36:50');
insert  into `v9_log`(`logid`,`field`,`value`,`module`,`file`,`action`,`querystring`,`data`,`userid`,`username`,`ip`,`time`) values (41,'',0,'content','','content','?m=content&c=content&a=add','',1,'phpcms','192.168.56.1','2016-06-06 21:36:52');
insert  into `v9_log`(`logid`,`field`,`value`,`module`,`file`,`action`,`querystring`,`data`,`userid`,`username`,`ip`,`time`) values (42,'',0,'content','','content','?m=content&c=content&a=add','',1,'phpcms','192.168.56.1','2016-06-06 21:37:00');
insert  into `v9_log`(`logid`,`field`,`value`,`module`,`file`,`action`,`querystring`,`data`,`userid`,`username`,`ip`,`time`) values (43,'',0,'admin','','category','?m=admin&c=category&a=edit','',1,'phpcms','192.168.56.1','2016-06-06 21:37:16');
insert  into `v9_log`(`logid`,`field`,`value`,`module`,`file`,`action`,`querystring`,`data`,`userid`,`username`,`ip`,`time`) values (44,'',0,'content','','content','?m=content&c=content&a=clear_data','',1,'phpcms','192.168.56.1','2016-06-06 21:41:46');
insert  into `v9_log`(`logid`,`field`,`value`,`module`,`file`,`action`,`querystring`,`data`,`userid`,`username`,`ip`,`time`) values (45,'',0,'content','','create_html','?m=content&c=create_html&a=update_urls','',1,'phpcms','192.168.56.1','2016-06-06 21:41:55');
insert  into `v9_log`(`logid`,`field`,`value`,`module`,`file`,`action`,`querystring`,`data`,`userid`,`username`,`ip`,`time`) values (46,'',0,'content','','content','?m=content&c=content&a=clear_data','',1,'phpcms','192.168.56.1','2016-06-06 21:41:56');
insert  into `v9_log`(`logid`,`field`,`value`,`module`,`file`,`action`,`querystring`,`data`,`userid`,`username`,`ip`,`time`) values (47,'',0,'admin','','category','?m=admin&c=category&a=edit','',1,'phpcms','192.168.56.1','2016-06-06 21:42:25');
insert  into `v9_log`(`logid`,`field`,`value`,`module`,`file`,`action`,`querystring`,`data`,`userid`,`username`,`ip`,`time`) values (48,'',0,'content','','create_html','?m=content&c=create_html&a=category','',1,'phpcms','192.168.56.1','2016-06-06 21:46:18');
insert  into `v9_log`(`logid`,`field`,`value`,`module`,`file`,`action`,`querystring`,`data`,`userid`,`username`,`ip`,`time`) values (49,'',0,'admin','','category','?m=admin&c=category&a=edit','',1,'phpcms','192.168.56.1','2016-06-06 21:46:47');
insert  into `v9_log`(`logid`,`field`,`value`,`module`,`file`,`action`,`querystring`,`data`,`userid`,`username`,`ip`,`time`) values (50,'',0,'content','','content','?m=content&c=content&a=add','',1,'phpcms','192.168.56.1','2016-06-06 21:46:54');
insert  into `v9_log`(`logid`,`field`,`value`,`module`,`file`,`action`,`querystring`,`data`,`userid`,`username`,`ip`,`time`) values (51,'',0,'content','','content','?m=content&c=content&a=add','',1,'phpcms','192.168.56.1','2016-06-06 21:47:12');
insert  into `v9_log`(`logid`,`field`,`value`,`module`,`file`,`action`,`querystring`,`data`,`userid`,`username`,`ip`,`time`) values (52,'',0,'content','','content','?m=content&c=content&a=add','',1,'phpcms','192.168.56.1','2016-06-06 21:47:13');
insert  into `v9_log`(`logid`,`field`,`value`,`module`,`file`,`action`,`querystring`,`data`,`userid`,`username`,`ip`,`time`) values (53,'',0,'content','','content','?m=content&c=content&a=add','',1,'phpcms','192.168.56.1','2016-06-06 22:03:15');
insert  into `v9_log`(`logid`,`field`,`value`,`module`,`file`,`action`,`querystring`,`data`,`userid`,`username`,`ip`,`time`) values (54,'',0,'content','','content','?m=content&c=content&a=add','',1,'phpcms','192.168.56.1','2016-06-06 22:03:17');
insert  into `v9_log`(`logid`,`field`,`value`,`module`,`file`,`action`,`querystring`,`data`,`userid`,`username`,`ip`,`time`) values (55,'',0,'admin','','index','?m=admin&c=index&a=login','',0,'','192.168.56.1','2016-06-07 11:09:13');
insert  into `v9_log`(`logid`,`field`,`value`,`module`,`file`,`action`,`querystring`,`data`,`userid`,`username`,`ip`,`time`) values (56,'',0,'admin','','index','?m=admin&c=index&a=login','',0,'','192.168.56.1','2016-06-07 11:09:30');
insert  into `v9_log`(`logid`,`field`,`value`,`module`,`file`,`action`,`querystring`,`data`,`userid`,`username`,`ip`,`time`) values (57,'',0,'admin','','index','?m=admin&c=index&a=login','',0,'','192.168.56.1','2016-06-07 11:09:32');
insert  into `v9_log`(`logid`,`field`,`value`,`module`,`file`,`action`,`querystring`,`data`,`userid`,`username`,`ip`,`time`) values (58,'',0,'admin','','index','?m=admin&c=index&a=login','',0,'','192.168.56.1','2016-06-07 11:09:41');
insert  into `v9_log`(`logid`,`field`,`value`,`module`,`file`,`action`,`querystring`,`data`,`userid`,`username`,`ip`,`time`) values (59,'',0,'link','','link','?m=link&c=link&a=delete','',1,'phpcms','192.168.56.1','2016-06-07 11:12:09');
insert  into `v9_log`(`logid`,`field`,`value`,`module`,`file`,`action`,`querystring`,`data`,`userid`,`username`,`ip`,`time`) values (60,'',0,'link','','link','?m=link&c=link&a=setting','',1,'phpcms','192.168.56.1','2016-06-07 11:12:21');
insert  into `v9_log`(`logid`,`field`,`value`,`module`,`file`,`action`,`querystring`,`data`,`userid`,`username`,`ip`,`time`) values (61,'',0,'link','','link','?m=link&c=link&a=add_type','',1,'phpcms','192.168.56.1','2016-06-07 11:12:30');
insert  into `v9_log`(`logid`,`field`,`value`,`module`,`file`,`action`,`querystring`,`data`,`userid`,`username`,`ip`,`time`) values (62,'',0,'link','','link','?m=link&c=link&a=add_type','',1,'phpcms','192.168.56.1','2016-06-07 11:12:34');
insert  into `v9_log`(`logid`,`field`,`value`,`module`,`file`,`action`,`querystring`,`data`,`userid`,`username`,`ip`,`time`) values (63,'',0,'link','','link','?m=link&c=link&a=add_type','',1,'phpcms','192.168.56.1','2016-06-07 11:12:35');
insert  into `v9_log`(`logid`,`field`,`value`,`module`,`file`,`action`,`querystring`,`data`,`userid`,`username`,`ip`,`time`) values (64,'',0,'link','','link','?m=link&c=link&a=add_type','',1,'phpcms','192.168.56.1','2016-06-07 11:12:39');
insert  into `v9_log`(`logid`,`field`,`value`,`module`,`file`,`action`,`querystring`,`data`,`userid`,`username`,`ip`,`time`) values (65,'',0,'link','','link','?m=link&c=link&a=add_type','',1,'phpcms','192.168.56.1','2016-06-07 11:12:40');
insert  into `v9_log`(`logid`,`field`,`value`,`module`,`file`,`action`,`querystring`,`data`,`userid`,`username`,`ip`,`time`) values (66,'',0,'link','','link','?m=link&c=link&a=add','',1,'phpcms','192.168.56.1','2016-06-07 11:12:57');
insert  into `v9_log`(`logid`,`field`,`value`,`module`,`file`,`action`,`querystring`,`data`,`userid`,`username`,`ip`,`time`) values (67,'',0,'link','','link','?m=link&c=link&a=add','',1,'phpcms','192.168.56.1','2016-06-07 11:13:21');
insert  into `v9_log`(`logid`,`field`,`value`,`module`,`file`,`action`,`querystring`,`data`,`userid`,`username`,`ip`,`time`) values (68,'',0,'link','','link','?m=link&c=link&a=add','',1,'phpcms','192.168.56.1','2016-06-07 11:14:12');
insert  into `v9_log`(`logid`,`field`,`value`,`module`,`file`,`action`,`querystring`,`data`,`userid`,`username`,`ip`,`time`) values (69,'',0,'link','','link','?m=link&c=link&a=add','',1,'phpcms','192.168.56.1','2016-06-07 11:14:35');
insert  into `v9_log`(`logid`,`field`,`value`,`module`,`file`,`action`,`querystring`,`data`,`userid`,`username`,`ip`,`time`) values (70,'',0,'link','','link','?m=link&c=link&a=add','',1,'phpcms','192.168.56.1','2016-06-07 11:15:06');
insert  into `v9_log`(`logid`,`field`,`value`,`module`,`file`,`action`,`querystring`,`data`,`userid`,`username`,`ip`,`time`) values (71,'',0,'link','','link','?m=link&c=link&a=add','',1,'phpcms','192.168.56.1','2016-06-07 11:15:26');
insert  into `v9_log`(`logid`,`field`,`value`,`module`,`file`,`action`,`querystring`,`data`,`userid`,`username`,`ip`,`time`) values (72,'',0,'member','','member_model','?m=member&c=member_model&a=manage','',1,'phpcms','192.168.56.1','2016-06-07 11:38:27');
insert  into `v9_log`(`logid`,`field`,`value`,`module`,`file`,`action`,`querystring`,`data`,`userid`,`username`,`ip`,`time`) values (73,'',0,'member','','member','?m=member&c=member&a=manage','',1,'phpcms','192.168.56.1','2016-06-07 11:38:35');
insert  into `v9_log`(`logid`,`field`,`value`,`module`,`file`,`action`,`querystring`,`data`,`userid`,`username`,`ip`,`time`) values (74,'',0,'member','','member_verify','?m=member&c=member_verify&a=manage','',1,'phpcms','192.168.56.1','2016-06-07 11:38:38');
insert  into `v9_log`(`logid`,`field`,`value`,`module`,`file`,`action`,`querystring`,`data`,`userid`,`username`,`ip`,`time`) values (75,'',0,'member','','member_setting','?m=member&c=member_setting&a=manage','',1,'phpcms','192.168.56.1','2016-06-07 11:38:43');
insert  into `v9_log`(`logid`,`field`,`value`,`module`,`file`,`action`,`querystring`,`data`,`userid`,`username`,`ip`,`time`) values (76,'',0,'member','','member_setting','?m=member&c=member_setting&a=manage','',1,'phpcms','192.168.56.1','2016-06-07 11:39:09');
insert  into `v9_log`(`logid`,`field`,`value`,`module`,`file`,`action`,`querystring`,`data`,`userid`,`username`,`ip`,`time`) values (77,'',0,'member','','member_setting','?m=member&c=member_setting&a=manage','',1,'phpcms','192.168.56.1','2016-06-07 11:39:10');
insert  into `v9_log`(`logid`,`field`,`value`,`module`,`file`,`action`,`querystring`,`data`,`userid`,`username`,`ip`,`time`) values (78,'',0,'member','','member_group','?m=member&c=member_group&a=manage','',1,'phpcms','192.168.56.1','2016-06-07 11:39:13');
insert  into `v9_log`(`logid`,`field`,`value`,`module`,`file`,`action`,`querystring`,`data`,`userid`,`username`,`ip`,`time`) values (79,'',0,'member','','member','?m=member&c=member&a=manage','',1,'phpcms','192.168.56.1','2016-06-07 11:39:35');
insert  into `v9_log`(`logid`,`field`,`value`,`module`,`file`,`action`,`querystring`,`data`,`userid`,`username`,`ip`,`time`) values (80,'',0,'member','','member_verify','?m=member&c=member_verify&a=manage','',1,'phpcms','192.168.56.1','2016-06-07 11:39:38');
insert  into `v9_log`(`logid`,`field`,`value`,`module`,`file`,`action`,`querystring`,`data`,`userid`,`username`,`ip`,`time`) values (81,'',0,'member','','member','?m=member&c=member&a=manage','',1,'phpcms','192.168.56.1','2016-06-07 11:39:42');
insert  into `v9_log`(`logid`,`field`,`value`,`module`,`file`,`action`,`querystring`,`data`,`userid`,`username`,`ip`,`time`) values (82,'',0,'member','','member_group','?m=member&c=member_group&a=manage','',1,'phpcms','192.168.56.1','2016-06-07 11:39:43');
insert  into `v9_log`(`logid`,`field`,`value`,`module`,`file`,`action`,`querystring`,`data`,`userid`,`username`,`ip`,`time`) values (83,'',0,'member','','member','?m=member&c=member&a=manage','',1,'phpcms','192.168.56.1','2016-06-07 11:40:10');
insert  into `v9_log`(`logid`,`field`,`value`,`module`,`file`,`action`,`querystring`,`data`,`userid`,`username`,`ip`,`time`) values (84,'',0,'member','','member','?m=member&c=member&a=add','',1,'phpcms','192.168.56.1','2016-06-07 11:40:14');
insert  into `v9_log`(`logid`,`field`,`value`,`module`,`file`,`action`,`querystring`,`data`,`userid`,`username`,`ip`,`time`) values (85,'',0,'member','','member_group','?m=member&c=member_group&a=manage','',1,'phpcms','192.168.56.1','2016-06-07 11:40:24');
insert  into `v9_log`(`logid`,`field`,`value`,`module`,`file`,`action`,`querystring`,`data`,`userid`,`username`,`ip`,`time`) values (86,'',0,'member','','member_group','?m=member&c=member_group&a=edit','',1,'phpcms','192.168.56.1','2016-06-07 11:40:28');
insert  into `v9_log`(`logid`,`field`,`value`,`module`,`file`,`action`,`querystring`,`data`,`userid`,`username`,`ip`,`time`) values (87,'',0,'admin','','release_point','?m=admin&c=release_point&a=add','',1,'phpcms','192.168.56.1','2016-06-07 11:40:59');
insert  into `v9_log`(`logid`,`field`,`value`,`module`,`file`,`action`,`querystring`,`data`,`userid`,`username`,`ip`,`time`) values (88,'',0,'special','','special','?m=special&c=special&a=add','',1,'phpcms','192.168.56.1','2016-06-07 11:41:35');
insert  into `v9_log`(`logid`,`field`,`value`,`module`,`file`,`action`,`querystring`,`data`,`userid`,`username`,`ip`,`time`) values (89,'',0,'special','','special','?m=special&c=special&a=add','',1,'phpcms','192.168.56.1','2016-06-07 11:42:46');
insert  into `v9_log`(`logid`,`field`,`value`,`module`,`file`,`action`,`querystring`,`data`,`userid`,`username`,`ip`,`time`) values (90,'',0,'special','','special','?m=special&c=special&a=add','',1,'phpcms','192.168.56.1','2016-06-07 11:42:48');
insert  into `v9_log`(`logid`,`field`,`value`,`module`,`file`,`action`,`querystring`,`data`,`userid`,`username`,`ip`,`time`) values (91,'',0,'special','','content','?m=special&c=content&a=add','',1,'phpcms','192.168.56.1','2016-06-07 11:43:53');
insert  into `v9_log`(`logid`,`field`,`value`,`module`,`file`,`action`,`querystring`,`data`,`userid`,`username`,`ip`,`time`) values (92,'',0,'special','','content','?m=special&c=content&a=add','',1,'phpcms','192.168.56.1','2016-06-07 11:44:04');
insert  into `v9_log`(`logid`,`field`,`value`,`module`,`file`,`action`,`querystring`,`data`,`userid`,`username`,`ip`,`time`) values (93,'',0,'admin','','index','?m=admin&c=index&a=login','',0,'phpcms','192.168.56.1','2016-06-07 11:45:12');
insert  into `v9_log`(`logid`,`field`,`value`,`module`,`file`,`action`,`querystring`,`data`,`userid`,`username`,`ip`,`time`) values (94,'',0,'special','','special','?m=special&c=special&a=elite','',1,'phpcms','192.168.56.1','2016-06-07 13:04:02');
insert  into `v9_log`(`logid`,`field`,`value`,`module`,`file`,`action`,`querystring`,`data`,`userid`,`username`,`ip`,`time`) values (95,'',0,'admin','','category','?m=admin&c=category&a=add','',1,'phpcms','192.168.56.1','2016-06-07 13:09:57');
insert  into `v9_log`(`logid`,`field`,`value`,`module`,`file`,`action`,`querystring`,`data`,`userid`,`username`,`ip`,`time`) values (96,'',0,'admin','','category','?m=admin&c=category&a=add','',1,'phpcms','192.168.56.1','2016-06-07 13:10:15');
insert  into `v9_log`(`logid`,`field`,`value`,`module`,`file`,`action`,`querystring`,`data`,`userid`,`username`,`ip`,`time`) values (97,'',0,'content','','content','?m=content&c=content&a=add','',1,'phpcms','192.168.56.1','2016-06-07 13:10:31');
insert  into `v9_log`(`logid`,`field`,`value`,`module`,`file`,`action`,`querystring`,`data`,`userid`,`username`,`ip`,`time`) values (98,'',0,'content','','content','?m=content&c=content&a=add','',1,'phpcms','192.168.56.1','2016-06-07 13:10:51');
insert  into `v9_log`(`logid`,`field`,`value`,`module`,`file`,`action`,`querystring`,`data`,`userid`,`username`,`ip`,`time`) values (99,'',0,'admin','','category','?m=admin&c=category&a=edit','',1,'phpcms','192.168.56.1','2016-06-07 13:11:55');

/*Table structure for table `v9_member` */

CREATE TABLE `v9_member` (
  `userid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `phpssouid` mediumint(8) unsigned NOT NULL,
  `username` char(20) NOT NULL DEFAULT '',
  `password` char(32) NOT NULL DEFAULT '',
  `encrypt` char(6) NOT NULL,
  `nickname` char(20) NOT NULL,
  `regdate` int(10) unsigned NOT NULL DEFAULT '0',
  `lastdate` int(10) unsigned NOT NULL DEFAULT '0',
  `regip` char(15) NOT NULL DEFAULT '',
  `lastip` char(15) NOT NULL DEFAULT '',
  `loginnum` smallint(5) unsigned NOT NULL DEFAULT '0',
  `email` char(32) NOT NULL DEFAULT '',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `areaid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `amount` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `point` smallint(5) unsigned NOT NULL DEFAULT '0',
  `modelid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `message` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `islock` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `vip` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `overduedate` int(10) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '1',
  `connectid` char(40) NOT NULL DEFAULT '',
  `from` char(10) NOT NULL DEFAULT '',
  `mobile` char(11) NOT NULL DEFAULT '',
  PRIMARY KEY (`userid`),
  UNIQUE KEY `username` (`username`),
  KEY `email` (`email`(20)),
  KEY `phpssouid` (`phpssouid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_member` */

/*Table structure for table `v9_member_detail` */

CREATE TABLE `v9_member_detail` (
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `birthday` date DEFAULT NULL,
  UNIQUE KEY `userid` (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_member_detail` */

/*Table structure for table `v9_member_group` */

CREATE TABLE `v9_member_group` (
  `groupid` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(15) NOT NULL,
  `issystem` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `starnum` tinyint(2) unsigned NOT NULL,
  `point` smallint(6) unsigned NOT NULL,
  `allowmessage` smallint(5) unsigned NOT NULL DEFAULT '0',
  `allowvisit` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allowpost` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allowpostverify` tinyint(1) unsigned NOT NULL,
  `allowsearch` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allowupgrade` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `allowsendmessage` tinyint(1) unsigned NOT NULL,
  `allowpostnum` smallint(5) unsigned NOT NULL DEFAULT '0',
  `allowattachment` tinyint(1) NOT NULL,
  `price_y` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `price_m` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `price_d` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `icon` char(30) NOT NULL,
  `usernamecolor` char(7) NOT NULL,
  `description` char(100) NOT NULL,
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`groupid`),
  KEY `disabled` (`disabled`),
  KEY `listorder` (`sort`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `v9_member_group` */

insert  into `v9_member_group`(`groupid`,`name`,`issystem`,`starnum`,`point`,`allowmessage`,`allowvisit`,`allowpost`,`allowpostverify`,`allowsearch`,`allowupgrade`,`allowsendmessage`,`allowpostnum`,`allowattachment`,`price_y`,`price_m`,`price_d`,`icon`,`usernamecolor`,`description`,`sort`,`disabled`) values (8,'游客',1,0,0,0,0,0,0,1,0,0,0,0,'0.00','0.00','0.00','','','',0,0);
insert  into `v9_member_group`(`groupid`,`name`,`issystem`,`starnum`,`point`,`allowmessage`,`allowvisit`,`allowpost`,`allowpostverify`,`allowsearch`,`allowupgrade`,`allowsendmessage`,`allowpostnum`,`allowattachment`,`price_y`,`price_m`,`price_d`,`icon`,`usernamecolor`,`description`,`sort`,`disabled`) values (2,'新手上路',1,1,50,100,1,1,0,0,0,1,0,0,'50.00','10.00','1.00','','','',2,0);
insert  into `v9_member_group`(`groupid`,`name`,`issystem`,`starnum`,`point`,`allowmessage`,`allowvisit`,`allowpost`,`allowpostverify`,`allowsearch`,`allowupgrade`,`allowsendmessage`,`allowpostnum`,`allowattachment`,`price_y`,`price_m`,`price_d`,`icon`,`usernamecolor`,`description`,`sort`,`disabled`) values (6,'注册会员',1,2,100,150,0,1,0,0,1,1,0,0,'300.00','30.00','1.00','','','',6,0);
insert  into `v9_member_group`(`groupid`,`name`,`issystem`,`starnum`,`point`,`allowmessage`,`allowvisit`,`allowpost`,`allowpostverify`,`allowsearch`,`allowupgrade`,`allowsendmessage`,`allowpostnum`,`allowattachment`,`price_y`,`price_m`,`price_d`,`icon`,`usernamecolor`,`description`,`sort`,`disabled`) values (4,'中级会员',1,3,150,500,1,1,0,1,1,1,0,0,'500.00','60.00','1.00','','','',4,0);
insert  into `v9_member_group`(`groupid`,`name`,`issystem`,`starnum`,`point`,`allowmessage`,`allowvisit`,`allowpost`,`allowpostverify`,`allowsearch`,`allowupgrade`,`allowsendmessage`,`allowpostnum`,`allowattachment`,`price_y`,`price_m`,`price_d`,`icon`,`usernamecolor`,`description`,`sort`,`disabled`) values (5,'高级会员',1,5,300,999,1,1,0,1,1,1,0,0,'360.00','90.00','5.00','','','',5,0);
insert  into `v9_member_group`(`groupid`,`name`,`issystem`,`starnum`,`point`,`allowmessage`,`allowvisit`,`allowpost`,`allowpostverify`,`allowsearch`,`allowupgrade`,`allowsendmessage`,`allowpostnum`,`allowattachment`,`price_y`,`price_m`,`price_d`,`icon`,`usernamecolor`,`description`,`sort`,`disabled`) values (1,'禁止访问',1,0,0,0,1,1,0,1,0,0,0,0,'0.00','0.00','0.00','','','0',0,0);
insert  into `v9_member_group`(`groupid`,`name`,`issystem`,`starnum`,`point`,`allowmessage`,`allowvisit`,`allowpost`,`allowpostverify`,`allowsearch`,`allowupgrade`,`allowsendmessage`,`allowpostnum`,`allowattachment`,`price_y`,`price_m`,`price_d`,`icon`,`usernamecolor`,`description`,`sort`,`disabled`) values (7,'邮件认证',1,0,0,0,0,0,0,0,0,0,0,0,'0.00','0.00','0.00','images/group/vip.jpg','#000000','',7,0);

/*Table structure for table `v9_member_menu` */

CREATE TABLE `v9_member_menu` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(40) NOT NULL DEFAULT '',
  `parentid` smallint(6) NOT NULL DEFAULT '0',
  `m` char(20) NOT NULL DEFAULT '',
  `c` char(20) NOT NULL DEFAULT '',
  `a` char(20) NOT NULL DEFAULT '',
  `data` char(100) NOT NULL DEFAULT '',
  `listorder` smallint(6) unsigned NOT NULL DEFAULT '0',
  `display` enum('1','0') NOT NULL DEFAULT '1',
  `isurl` enum('1','0') NOT NULL DEFAULT '0',
  `url` char(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `listorder` (`listorder`),
  KEY `parentid` (`parentid`),
  KEY `module` (`m`,`c`,`a`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `v9_member_menu` */

insert  into `v9_member_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`isurl`,`url`) values (1,'member_init',0,'member','index','init','t=0',0,'1','','');
insert  into `v9_member_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`isurl`,`url`) values (2,'account_manage',0,'member','index','account_manage','t=1',0,'1','','');
insert  into `v9_member_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`isurl`,`url`) values (3,'favorite',0,'member','index','favorite','t=2',0,'1','','');

/*Table structure for table `v9_member_verify` */

CREATE TABLE `v9_member_verify` (
  `userid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `username` char(20) NOT NULL,
  `password` char(32) NOT NULL,
  `encrypt` char(6) NOT NULL,
  `nickname` char(20) NOT NULL,
  `regdate` int(10) unsigned NOT NULL,
  `regip` char(15) NOT NULL,
  `email` char(32) NOT NULL,
  `modelid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `point` smallint(5) unsigned NOT NULL DEFAULT '0',
  `amount` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `modelinfo` char(255) NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `siteid` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `message` char(100) DEFAULT NULL,
  `mobile` char(11) NOT NULL DEFAULT '',
  PRIMARY KEY (`userid`),
  UNIQUE KEY `username` (`username`),
  KEY `email` (`email`(20))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_member_verify` */

/*Table structure for table `v9_member_vip` */

CREATE TABLE `v9_member_vip` (
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `userid` (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_member_vip` */

/*Table structure for table `v9_menu` */

CREATE TABLE `v9_menu` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(40) NOT NULL DEFAULT '',
  `parentid` smallint(6) NOT NULL DEFAULT '0',
  `m` char(20) NOT NULL DEFAULT '',
  `c` char(20) NOT NULL DEFAULT '',
  `a` char(20) NOT NULL DEFAULT '',
  `data` char(100) NOT NULL DEFAULT '',
  `listorder` smallint(6) unsigned NOT NULL DEFAULT '0',
  `display` enum('1','0') NOT NULL DEFAULT '1',
  `project1` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `project2` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `project3` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `project4` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `project5` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `listorder` (`listorder`),
  KEY `parentid` (`parentid`),
  KEY `module` (`m`,`c`,`a`)
) ENGINE=MyISAM AUTO_INCREMENT=1669 DEFAULT CHARSET=utf8;

/*Data for the table `v9_menu` */

insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1,'sys_setting',0,'admin','setting','init','',1,'1',0,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (2,'module',0,'admin','module','init','',2,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (872,'sync_release_point',873,'release','index','init','',3,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (4,'content',0,'content','content','init','',4,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (5,'members',0,'member','member','init','',5,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (6,'userinterface',0,'template','style','init','',6,'1',0,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (30,'correlative_setting',1,'admin','admin','admin','',0,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (31,'menu_manage',977,'admin','menu','init','',8,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (32,'posid_manage',975,'admin','position','init','',7,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (29,'module_list',2,'admin','module','','',0,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (82,'module_manage',2,'admin','module','','',0,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (10,'panel',0,'admin','index','public_main','',0,'1',0,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (35,'menu_add',31,'admin','menu','add','',0,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (826,'template_manager',6,'','','','',0,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (54,'admin_manage',49,'admin','admin_manage','init','',0,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (43,'category_manage',975,'admin','category','init','module=admin',4,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (42,'add_category',43,'admin','category','add','s=0',1,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (44,'edit_category',43,'admin','category','edit','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (45,'badword_manage',977,'admin','badword','init','',10,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (46,'posid_add',32,'admin','position','add','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (49,'admin_setting',1,'admin','','','',0,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (50,'role_manage',49,'admin','role','init','',0,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (51,'role_add',50,'admin','role','add','',0,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (52,'category_cache',43,'admin','category','public_cache','module=admin',4,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (55,'manage_member',5,'member','member','manage','',0,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (58,'admin_add',54,'admin','admin_manage','add','',0,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (59,'model_manage',975,'content','sitemodel','init','',5,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (64,'site_management',30,'admin','site','init','',2,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (81,'member_add',72,'member','member','add','',2,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (62,'add_model',59,'content','sitemodel','add','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (65,'release_point_management',30,'admin','release_point','init','',3,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (66,'badword_export',45,'admin','badword','export','',0,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (67,'add_site',64,'admin','site','add','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (68,'badword_import',45,'admin','badword','import','',0,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (812,'member_group_manage',76,'member','member_group','manage','',0,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (74,'member_verify',55,'member','member_verify','manage','s=0',3,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (76,'manage_member_group',5,'member','member_group','manage','',0,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (77,'manage_member_model',5,'member','member_model','manage','',0,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (78,'member_group_add',812,'member','member_group','add','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (79,'member_model_add',813,'member','member_model','add','',1,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (80,'member_model_import',77,'member','member_model','import','',2,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (72,'member_manage',55,'member','member','manage','',1,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (813,'member_model_manage',77,'member','member_model','manage','',0,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (814,'site_edit',64,'admin','site','edit','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (815,'site_del',64,'admin','site','del','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (816,'release_point_add',65,'admin','release_point','add','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (817,'release_point_del',65,'admin','release_point','del','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (818,'release_point_edit',65,'admin','release_point','edit','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (821,'content_publish',4,'content','content','init','',0,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (822,'content_manage',821,'content','content','init','',0,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (867,'linkage',977,'admin','linkage','init','',13,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (827,'template_style',826,'template','style','init','',0,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (828,'import_style',827,'template','style','import','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (831,'template_export',827,'template','style','export','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (830,'template_file',827,'template','file','init','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (832,'template_onoff',827,'template','style','disable','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (833,'template_updatename',827,'template','style','updatename','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (834,'member_lock',72,'member','member','lock','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (835,'member_unlock',72,'member','member','unlock','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (836,'member_move',72,'member','member','move','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (837,'member_delete',72,'member','member','delete','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (842,'verify_ignore',74,'member','member_verify','manage','s=2',0,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (839,'member_setting',55,'member','member_setting','manage','',4,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (841,'verify_pass',74,'member','member_verify','manage','s=1',0,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (843,'verify_delete',74,'member','member_verify','manage','s=3',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (844,'verify_deny',74,'member','member_verify','manage','s=4',0,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (845,'never_pass',74,'member','member_verify','manage','s=5',0,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (846,'template_file_list',827,'template','file','init','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (847,'template_file_edit',827,'template','file','edit_file','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (848,'file_add_file',827,'template','file','add_file','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (850,'listorder',76,'member','member_group','sort','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (852,'priv_setting',50,'admin','role','priv_setting','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (853,'role_priv',50,'admin','role','role_priv','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (857,'attachment_manage',821,'attachment','manage','init','',0,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (868,'special',821,'special','special','init','',0,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (869,'template_editor',827,'template','file','edit_file','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (870,'template_visualization',827,'template','file','visualization','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (871,'pc_tag_edit',827,'template','file','edit_pc_tag','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (873,'release_manage',4,'release','html','init','',0,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (874,'type_manage',975,'content','type_manage','init','',6,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (875,'add_type',874,'content','type_manage','add','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (876,'linkageadd',867,'admin','linkage','add','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (877,'failure_list',872,'release','index','failed','',0,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (879,'member_search',72,'member','member','search','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (880,'queue_del',872,'release','index','del','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (881,'member_model_delete',813,'member','member_model','delete','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (882,'member_model_edit',813,'member','member_model','edit','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (885,'workflow',977,'content','workflow','init','',15,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (888,'add_workflow',885,'content','workflow','add','',0,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (889,'member_modelfield_add',813,'member','member_modelfield','add','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (890,'member_modelfield_edit',813,'member','member_modelfield','edit','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (891,'member_modelfield_delete',813,'member','member_modelfield','delete','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (892,'member_modelfield_manage',813,'member','member_modelfield','manage','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (895,'sitemodel_import',59,'content','sitemodel','import','',0,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (896,'pay',29,'pay','payment','pay_list','s=3',0,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (897,'payments',896,'pay','payment','init','',0,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (898,'paylist',896,'pay','payment','pay_list','',0,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (899,'add_content',822,'content','content','add','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (900,'modify_deposit',896,'pay','payment','modify_deposit','s=1',0,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (901,'check_content',822,'content','content','pass','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (902,'dbsource',29,'dbsource','data','init','',0,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (905,'create_content_html',873,'content','create_html','show','',2,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (904,'external_data_sources',902,'dbsource','dbsource_admin','init','',0,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (906,'update_urls',873,'content','create_html','update_urls','',1,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (960,'node_add',957,'collection','node','add','',0,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (909,'fulltext_search',29,'search','search_type','init','',0,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (910,'manage_type',909,'search','search_type','init','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (911,'search_setting',909,'search','search_admin','setting','',0,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (912,'createindex',909,'search','search_admin','createindex','',0,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (913,'add_search_type',909,'search','search_type','add','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (914,'database_toos',977,'admin','database','export','',6,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (915,'database_export',914,'admin','database','export','',0,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (916,'database_import',914,'admin','database','import','',0,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (917,'dbsource_add',902,'dbsource','dbsource_admin','add','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (918,'dbsource_edit',902,'dbsource','dbsource_admin','edit','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (919,'dbsource_del',902,'dbsource','dbsource_admin','del','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (920,'dbsource_data_add',902,'dbsource','data','add','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (921,'dbsource_data_edit',902,'dbsource','data','edit','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (922,'dbsource_data_del',902,'dbsource','data','del','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (926,'add_special',868,'special','special','add','',0,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (927,'edit_special',868,'special','special','edit','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (928,'special_list',868,'special','special','init','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (929,'special_elite',868,'special','special','elite','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (930,'delete_special',868,'special','special','delete','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (931,'badword_add',45,'admin','badword','add','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (932,'badword_edit',45,'admin','badword','edit','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (933,'badword_delete',45,'admin','badword','delete','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (934,'special_listorder',868,'special','special','listorder','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (935,'special_content_list',868,'special','content','init','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (936,'special_content_add',935,'special','content','add','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (937,'special_content_list',935,'special','content','init','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (938,'special_content_edit',935,'special','content','edit','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (939,'special_content_delete',935,'special','content','delete','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (940,'special_content_listorder',935,'special','content','listorder','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (941,'special_content_import',935,'special','special','import','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (942,'history_version',827,'template','template_bak','init','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (943,'restore_version',827,'template','template_bak','restore','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (944,'del_history_version',827,'template','template_bak','del','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (945,'block',821,'block','block_admin','init','',0,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (946,'block_add',945,'block','block_admin','add','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (950,'block_edit',945,'block','block_admin','edit','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (951,'block_del',945,'block','block_admin','del','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (952,'block_update',945,'block','block_admin','block_update','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (953,'block_restore',945,'block','block_admin','history_restore','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (954,'history_del',945,'block','block_admin','history_del','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (978,'urlrule_manage',977,'admin','urlrule','init','',0,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (957,'collection_node',821,'collection','node','manage','',0,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (979,'safe_config',30,'admin','setting','init','&tab=2',11,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (959,'basic_config',30,'admin','setting','init','',10,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (961,'position_edit',32,'admin','position','edit','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (962,'collection_node_edit',957,'collection','node','edit','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (963,'collection_node_delete',957,'collection','node','del','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (990,'col_url_list',957,'collection','node','col_url_list','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (965,'collection_node_publish',957,'collection','node','publist','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (966,'collection_node_import',957,'collection','node','node_import','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (967,'collection_node_export',957,'collection','node','export','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (968,'collection_node_collection_content',957,'collection','node','col_content','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (969,'googlesitemap',977,'admin','googlesitemap','set','',11,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (970,'admininfo',10,'admin','admin_manage','init','',0,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (971,'editpwd',970,'admin','admin_manage','public_edit_pwd','',1,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (972,'editinfo',970,'admin','admin_manage','public_edit_info','',0,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (973,'keylink',977,'admin','keylink','init','',12,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (974,'add_keylink',973,'admin','keylink','add','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (975,'content_settings',4,'content','content_settings','init','',0,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (7,'extend',0,'admin','extend','init_extend','',7,'1',0,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (977,'extend_all',7,'admin','extend_all','init','',0,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (980,'sso_config',30,'admin','setting','init','&tab=3',12,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (981,'email_config',30,'admin','setting','init','&tab=4',13,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (982,'module_manage',82,'admin','module','init','',0,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (983,'ipbanned',977,'admin','ipbanned','init','',0,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (984,'add_ipbanned',983,'admin','ipbanned','add','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (993,'collection_content_import',957,'collection','node','import','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (991,'copy_node',957,'collection','node','copy','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (992,'content_del',957,'collection','node','content_del','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (989,'downsites',977,'admin','downservers','init','',0,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (994,'import_program_add',957,'collection','node','import_program_add','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (995,'import_program_del',957,'collection','node','import_program_del','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (996,'import_content',957,'collection','node','import_content','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (997,'log',977,'admin','log','init','',0,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (998,'add_page',43,'admin','category','add','s=1',2,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (999,'add_cat_link',43,'admin','category','add','s=2',2,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1000,'count_items',43,'admin','category','count_items','',5,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1001,'cache_all',977,'admin','cache_all','init','',0,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1002,'create_list_html',873,'content','create_html','category','',0,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1003,'create_html_quick',10,'content','create_html_opt','index','',0,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1004,'create_index',1003,'content','create_html','public_index','',0,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1005,'scan',977,'scan','index','init','',0,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1006,'scan_report',1005,'scan','index','scan_report','',0,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1007,'md5_creat',1005,'scan','index','md5_creat','',0,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1008,'album_import',868,'special','album','import','',0,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (8,'phpsso',0,'admin','phpsso','menu','',7,'1',0,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1011,'edit_content',822,'content','content','edit','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1012,'push_to_special',822,'content','push','init','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1023,'delete_log',997,'admin','log','delete','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1024,'delete_ip',983,'admin','ipbanned','delete','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1026,'delete_keylink',973,'admin','keylink','delete','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1027,'edit_keylink',973,'admin','keylink','edit','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1034,'operation_pass',74,'member','member_verify','pass','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1035,'operation_delete',74,'member','member_verify','delete','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1039,'operation_ignore',74,'member','member_verify','ignore','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1038,'settingsave',30,'admin','setting','save','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1040,'admin_edit',54,'admin','admin_manage','edit','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1041,'operation_reject',74,'member','member_verify','reject','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1042,'admin_delete',54,'admin','admin_manage','delete','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1043,'card',54,'admin','admin_manage','card','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1044,'creat_card',54,'admin','admin_manage','creat_card','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1045,'remove_card',54,'admin','admin_manage','remove_card','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1049,'member_group_edit',812,'member','member_group','edit','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1048,'member_edit',72,'member','member','edit','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1050,'role_edit',50,'admin','role','edit','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1051,'member_group_delete',812,'member','member_group','delete','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1052,'member_manage',50,'admin','role','member_manage','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1053,'role_delete',50,'admin','role','delete','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1054,'member_model_export',77,'member','member_model','export','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1055,'member_model_sort',77,'member','member_model','sort','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1056,'member_model_move',77,'member','member_model','move','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1057,'payment_add',897,'pay','payment','add','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1058,'payment_delete',897,'pay','payment','delete','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1059,'payment_edit',897,'pay','payment','edit','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1060,'spend_record',896,'pay','spend','init','',0,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1061,'pay_stat',896,'pay','payment','pay_stat','',0,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1062,'fields_manage',59,'content','sitemodel_field','init','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1063,'edit_model_content',59,'content','sitemodel','edit','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1064,'disabled_model',59,'content','sitemodel','disabled','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1065,'delete_model',59,'content','sitemodel','delete','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1066,'export_model',59,'content','sitemodel','export','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1067,'delete',874,'content','type_manage','delete','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1068,'edit',874,'content','type_manage','edit','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1069,'add_urlrule',978,'admin','urlrule','add','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1070,'edit_urlrule',978,'admin','urlrule','edit','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1071,'delete_urlrule',978,'admin','urlrule','delete','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1072,'edit_menu',31,'admin','menu','edit','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1073,'delete_menu',31,'admin','menu','delete','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1074,'edit_workflow',885,'content','workflow','edit','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1075,'delete_workflow',885,'content','workflow','delete','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1076,'creat_html',868,'special','special','html','',0,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1093,'connect_config',30,'admin','setting','init','&tab=5',14,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1102,'view_modelinfo',74,'member','member_verify','modelinfo','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1202,'create_special_list',868,'special','special','create_special_list','',0,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1240,'view_memberlinfo',72,'member','member','memberinfo','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1239,'copyfrom_manage',977,'admin','copyfrom','init','',0,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1241,'move_content',822,'content','content','remove','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1242,'poster_template',56,'poster','space','poster_template','',0,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1243,'create_index',873,'content','create_html','public_index','',0,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1244,'add_othors',822,'content','content','add_othors','',0,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1295,'attachment_manager_dir',857,'attachment','manage','dir','',2,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1296,'attachment_manager_db',857,'attachment','manage','init','',1,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1346,'attachment_address_replace',857,'attachment','address','init','',3,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1347,'attachment_address_update',857,'attachment','address','update','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1348,'delete_content',822,'content','content','delete','',0,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1349,'member_menu_manage',977,'member','member_menu','manage','',0,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1350,'member_menu_add',1349,'member','member_menu','add','',0,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1351,'member_menu_edit',1349,'member','member_menu','edit','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1352,'member_menu_delete',1349,'member','member_menu','delete','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1353,'batch_show',822,'content','create_html','batch_show','',0,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1354,'pay_delete',898,'pay','payment','pay_del','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1355,'pay_cancel',898,'pay','payment','pay_cancel','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1356,'discount',898,'pay','payment','discount','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1360,'category_batch_edit',43,'admin','category','batch_edit','',6,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1500,'listorder',822,'content','content','listorder','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1501,'a_clean_data',873,'content','content','clear_data','',0,'1',0,0,0,0,0);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (9,'video',0,'video','video','init','',11,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1589,'video',9,'video','video','init','',0,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1583,'sub_delete',1589,'video','video','sub_del','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1582,'subscribe_manage',1589,'video','video','subscribe_list','',0,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1581,'video_open',1589,'video','video','open','',0,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1592,'complete_info',1581,'video','video','complete_info','',0,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1591,'video_inputinfo',1581,'video','video','open','',0,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1577,'video_manage',1589,'video','video','init','',0,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1590,'player_manage',1589,'video','player','init','',0,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1585,'import_ku6_video',1589,'video','video','import_ku6video','',0,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1579,'video_edit',1589,'video','video','edit','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1580,'video_delete',1589,'video','video','delete','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1578,'video_upload',1589,'video','video','add','',0,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1593,'video_stat',1589,'video','stat','init','',0,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1586,'video_store',1589,'video','video','video2content','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1594,'announce',29,'announce','admin_announce','init','s=1',0,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1595,'announce_add',1594,'announce','admin_announce','add','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1596,'edit_announce',1594,'announce','admin_announce','edit','s=1',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1597,'check_announce',1594,'announce','admin_announce','init','s=2',0,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1598,'overdue',1594,'announce','admin_announce','init','s=3',0,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1599,'del_announce',1594,'announce','admin_announce','delete','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1600,'comment',29,'comment','comment_admin','init','',0,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1601,'comment_manage',821,'comment','comment_admin','listinfo','',0,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1602,'comment_check',1601,'comment','check','checks','',0,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1603,'comment_list',1600,'comment','comment_admin','lists','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1604,'link',29,'link','link','init','',0,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1605,'add_link',1604,'link','link','add','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1606,'edit_link',1604,'link','link','edit','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1607,'delete_link',1604,'link','link','delete','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1608,'link_setting',1604,'link','link','setting','',0,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1609,'add_type',1604,'link','link','add_type','',0,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1610,'list_type',1604,'link','link','list_type','',0,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1611,'check_register',1604,'link','link','check_register','',0,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1612,'vote',29,'vote','vote','init','',0,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1613,'add_vote',1612,'vote','vote','add','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1614,'edit_vote',1612,'vote','vote','edit','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1615,'delete_vote',1612,'vote','vote','delete','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1616,'vote_setting',1612,'vote','vote','setting','',0,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1617,'statistics_vote',1612,'vote','vote','statistics','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1618,'statistics_userlist',1612,'vote','vote','statistics_userlist','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1619,'create_js',1612,'vote','vote','create_js','',0,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1620,'message',29,'message','message','init','',0,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1621,'send_one',1620,'message','message','send_one','',0,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1622,'delete_message',1620,'message','message','delete','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1623,'message_send',1620,'message','message','message_send','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1624,'message_group_manage',1620,'message','message','message_group_manage','',0,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1625,'mood',29,'mood','mood_admin','init','',0,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1626,'mood_setting',1625,'mood','mood_admin','setting','',0,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1627,'poster',29,'poster','space','init','',0,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1628,'add_space',1627,'poster','space','add','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1629,'edit_space',1627,'poster','space','edit','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1630,'del_space',1627,'poster','space','delete','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1631,'poster_list',1627,'poster','poster','init','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1632,'add_poster',1627,'poster','poster','add','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1633,'edit_poster',1627,'poster','poster','edit','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1634,'del_poster',1627,'poster','poster','delete','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1635,'poster_stat',1627,'poster','poster','stat','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1636,'poster_setting',1627,'poster','space','setting','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1637,'create_poster_js',1627,'poster','space','create_js','',0,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1638,'poster_template',1627,'poster','space','poster_template','',0,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1639,'formguide',29,'formguide','formguide','init','',0,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1640,'formguide_add',1639,'formguide','formguide','add','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1641,'formguide_edit',1639,'formguide','formguide','edit','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1642,'form_info_list',1639,'formguide','formguide_info','init','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1643,'formguide_disabled',1639,'formguide','formguide','disabled','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1644,'formguide_delete',1639,'formguide','formguide','delete','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1645,'formguide_stat',1639,'formguide','formguide','stat','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1646,'add_public_field',1639,'formguide','formguide_field','add','',0,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1647,'list_public_field',1639,'formguide','formguide_field','init','',0,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1648,'module_setting',1639,'formguide','formguide','setting','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1649,'wap',29,'wap','wap_admin','init','',0,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1650,'wap_add',1649,'wap','wap_admin','add','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1651,'wap_edit',1649,'wap','wap_admin','edit','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1652,'wap_delete',1649,'wap','wap_admin','delete','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1653,'wap_type_manage',1649,'wap','wap_admin','type_manage','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1654,'wap_type_edit',1649,'wap','wap_admin','type_edit','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1655,'wap_type_delete',1649,'wap','wap_admin','type_delete','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1656,'upgrade',977,'upgrade','index','init','',0,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1657,'checkfile',1656,'upgrade','index','checkfile','',0,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1658,'tag',826,'tag','tag','init','',0,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1659,'add_tag',1658,'tag','tag','add','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1660,'edit_tag',1658,'tag','tag','edit','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1661,'delete_tag',1658,'tag','tag','del','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1662,'tag_lists',1658,'tag','tag','lists','',0,'0',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1663,'sms',29,'sms','sms','init','',0,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1664,'sms_setting',1663,'sms','sms','sms_setting','',0,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1665,'sms_pay_history',1663,'sms','sms','sms_pay_history','',0,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1666,'sms_buy_history',1663,'sms','sms','sms_buy_history','',0,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1667,'sms_api',1663,'sms','sms','sms_api','',0,'1',1,1,1,1,1);
insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`project1`,`project2`,`project3`,`project4`,`project5`) values (1668,'sms_sent',1663,'sms','sms','sms_sent','',0,'1',1,1,1,1,1);

/*Table structure for table `v9_message` */

CREATE TABLE `v9_message` (
  `messageid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `send_from_id` char(30) NOT NULL DEFAULT '0',
  `send_to_id` char(30) NOT NULL DEFAULT '0',
  `folder` enum('all','inbox','outbox') NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `message_time` int(10) unsigned NOT NULL DEFAULT '0',
  `subject` char(80) DEFAULT NULL,
  `content` text NOT NULL,
  `replyid` int(10) unsigned NOT NULL DEFAULT '0',
  `del_type` tinyint(1) unsigned DEFAULT '0',
  PRIMARY KEY (`messageid`),
  KEY `msgtoid` (`send_to_id`,`folder`),
  KEY `replyid` (`replyid`),
  KEY `folder` (`send_from_id`,`folder`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_message` */

/*Table structure for table `v9_message_data` */

CREATE TABLE `v9_message_data` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `userid` mediumint(8) NOT NULL,
  `group_message_id` int(5) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `message` (`userid`,`group_message_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_message_data` */

/*Table structure for table `v9_message_group` */

CREATE TABLE `v9_message_group` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `typeid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `groupid` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '用户组id',
  `subject` char(80) DEFAULT NULL,
  `content` text NOT NULL COMMENT '内容',
  `inputtime` int(10) unsigned DEFAULT '0',
  `status` tinyint(2) unsigned DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_message_group` */

/*Table structure for table `v9_model` */

CREATE TABLE `v9_model` (
  `modelid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` char(30) NOT NULL,
  `description` char(100) NOT NULL,
  `tablename` char(20) NOT NULL,
  `setting` text NOT NULL,
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `items` smallint(5) unsigned NOT NULL DEFAULT '0',
  `enablesearch` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `default_style` char(30) NOT NULL,
  `category_template` char(30) NOT NULL,
  `list_template` char(30) NOT NULL,
  `show_template` char(30) NOT NULL,
  `js_template` varchar(30) NOT NULL,
  `admin_list_template` char(30) NOT NULL,
  `member_add_template` varchar(30) NOT NULL,
  `member_list_template` varchar(30) NOT NULL,
  `sort` tinyint(3) NOT NULL,
  `type` tinyint(1) NOT NULL,
  PRIMARY KEY (`modelid`),
  KEY `type` (`type`,`siteid`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `v9_model` */

insert  into `v9_model`(`modelid`,`siteid`,`name`,`description`,`tablename`,`setting`,`addtime`,`items`,`enablesearch`,`disabled`,`default_style`,`category_template`,`list_template`,`show_template`,`js_template`,`admin_list_template`,`member_add_template`,`member_list_template`,`sort`,`type`) values (1,1,'文章模型','','news','',0,0,1,0,'default','category','list','show','','','','',0,0);
insert  into `v9_model`(`modelid`,`siteid`,`name`,`description`,`tablename`,`setting`,`addtime`,`items`,`enablesearch`,`disabled`,`default_style`,`category_template`,`list_template`,`show_template`,`js_template`,`admin_list_template`,`member_add_template`,`member_list_template`,`sort`,`type`) values (2,1,'下载模型','','download','',0,0,1,0,'default','category_download','list_download','show_download','','','','',0,0);
insert  into `v9_model`(`modelid`,`siteid`,`name`,`description`,`tablename`,`setting`,`addtime`,`items`,`enablesearch`,`disabled`,`default_style`,`category_template`,`list_template`,`show_template`,`js_template`,`admin_list_template`,`member_add_template`,`member_list_template`,`sort`,`type`) values (3,1,'图片模型','','picture','',0,0,1,0,'default','category_picture','list_picture','show_picture','','','','',0,0);
insert  into `v9_model`(`modelid`,`siteid`,`name`,`description`,`tablename`,`setting`,`addtime`,`items`,`enablesearch`,`disabled`,`default_style`,`category_template`,`list_template`,`show_template`,`js_template`,`admin_list_template`,`member_add_template`,`member_list_template`,`sort`,`type`) values (10,1,'普通会员','普通会员','member_detail','',0,0,1,0,'','','','','','','','',0,2);
insert  into `v9_model`(`modelid`,`siteid`,`name`,`description`,`tablename`,`setting`,`addtime`,`items`,`enablesearch`,`disabled`,`default_style`,`category_template`,`list_template`,`show_template`,`js_template`,`admin_list_template`,`member_add_template`,`member_list_template`,`sort`,`type`) values (11,1,'视频模型','','video','',0,0,1,0,'default','category_video','list_video','show_video','','','','',0,0);

/*Table structure for table `v9_model_field` */

CREATE TABLE `v9_model_field` (
  `fieldid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `modelid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `field` varchar(20) NOT NULL,
  `name` varchar(30) NOT NULL,
  `tips` text NOT NULL,
  `css` varchar(30) NOT NULL,
  `minlength` int(10) unsigned NOT NULL DEFAULT '0',
  `maxlength` int(10) unsigned NOT NULL DEFAULT '0',
  `pattern` varchar(255) NOT NULL,
  `errortips` varchar(255) NOT NULL,
  `formtype` varchar(20) NOT NULL,
  `setting` mediumtext NOT NULL,
  `formattribute` varchar(255) NOT NULL,
  `unsetgroupids` varchar(255) NOT NULL,
  `unsetroleids` varchar(255) NOT NULL,
  `iscore` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `issystem` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isunique` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isbase` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `issearch` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isadd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isfulltext` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isposition` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `listorder` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isomnipotent` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`fieldid`),
  KEY `modelid` (`modelid`,`disabled`),
  KEY `field` (`field`,`modelid`)
) ENGINE=MyISAM AUTO_INCREMENT=108 DEFAULT CHARSET=utf8;

/*Data for the table `v9_model_field` */

insert  into `v9_model_field`(`fieldid`,`modelid`,`siteid`,`field`,`name`,`tips`,`css`,`minlength`,`maxlength`,`pattern`,`errortips`,`formtype`,`setting`,`formattribute`,`unsetgroupids`,`unsetroleids`,`iscore`,`issystem`,`isunique`,`isbase`,`issearch`,`isadd`,`isfulltext`,`isposition`,`listorder`,`disabled`,`isomnipotent`) values (1,1,1,'catid','栏目','','',1,6,'/^[0-9]{1,6}$/','请选择栏目','catid','array (\n  \'defaultvalue\' => \'\',\n)','','-99','-99',0,1,0,1,1,1,0,0,1,0,0);
insert  into `v9_model_field`(`fieldid`,`modelid`,`siteid`,`field`,`name`,`tips`,`css`,`minlength`,`maxlength`,`pattern`,`errortips`,`formtype`,`setting`,`formattribute`,`unsetgroupids`,`unsetroleids`,`iscore`,`issystem`,`isunique`,`isbase`,`issearch`,`isadd`,`isfulltext`,`isposition`,`listorder`,`disabled`,`isomnipotent`) values (2,1,1,'typeid','类别','','',0,0,'','','typeid','array (\n  \'minnumber\' => \'\',\n  \'defaultvalue\' => \'\',\n)','','','',0,1,0,1,1,1,0,0,2,0,0);
insert  into `v9_model_field`(`fieldid`,`modelid`,`siteid`,`field`,`name`,`tips`,`css`,`minlength`,`maxlength`,`pattern`,`errortips`,`formtype`,`setting`,`formattribute`,`unsetgroupids`,`unsetroleids`,`iscore`,`issystem`,`isunique`,`isbase`,`issearch`,`isadd`,`isfulltext`,`isposition`,`listorder`,`disabled`,`isomnipotent`) values (3,1,1,'title','标题','','inputtitle',1,80,'','请输入标题','title','','','','',0,1,0,1,1,1,1,1,4,0,0);
insert  into `v9_model_field`(`fieldid`,`modelid`,`siteid`,`field`,`name`,`tips`,`css`,`minlength`,`maxlength`,`pattern`,`errortips`,`formtype`,`setting`,`formattribute`,`unsetgroupids`,`unsetroleids`,`iscore`,`issystem`,`isunique`,`isbase`,`issearch`,`isadd`,`isfulltext`,`isposition`,`listorder`,`disabled`,`isomnipotent`) values (4,1,1,'thumb','缩略图','','',0,100,'','','image','array (\n  \'size\' => \'50\',\n  \'defaultvalue\' => \'\',\n  \'show_type\' => \'1\',\n  \'upload_maxsize\' => \'1024\',\n  \'upload_allowext\' => \'jpg|jpeg|gif|png|bmp\',\n  \'watermark\' => \'0\',\n  \'isselectimage\' => \'1\',\n  \'images_width\' => \'\',\n  \'images_height\' => \'\',\n)','','','',0,1,0,0,0,1,0,1,14,0,0);
insert  into `v9_model_field`(`fieldid`,`modelid`,`siteid`,`field`,`name`,`tips`,`css`,`minlength`,`maxlength`,`pattern`,`errortips`,`formtype`,`setting`,`formattribute`,`unsetgroupids`,`unsetroleids`,`iscore`,`issystem`,`isunique`,`isbase`,`issearch`,`isadd`,`isfulltext`,`isposition`,`listorder`,`disabled`,`isomnipotent`) values (5,1,1,'keywords','关键词','多关键词之间用空格或者“,”隔开','',0,40,'','','keyword','array (\r\n  \'size\' => \'100\',\r\n  \'defaultvalue\' => \'\',\r\n)','','-99','-99',0,1,0,1,1,1,1,0,7,0,0);
insert  into `v9_model_field`(`fieldid`,`modelid`,`siteid`,`field`,`name`,`tips`,`css`,`minlength`,`maxlength`,`pattern`,`errortips`,`formtype`,`setting`,`formattribute`,`unsetgroupids`,`unsetroleids`,`iscore`,`issystem`,`isunique`,`isbase`,`issearch`,`isadd`,`isfulltext`,`isposition`,`listorder`,`disabled`,`isomnipotent`) values (6,1,1,'description','摘要','','',0,255,'','','textarea','array (\r\n  \'width\' => \'98\',\r\n  \'height\' => \'46\',\r\n  \'defaultvalue\' => \'\',\r\n  \'enablehtml\' => \'0\',\r\n)','','','',0,1,0,1,0,1,1,1,10,0,0);
insert  into `v9_model_field`(`fieldid`,`modelid`,`siteid`,`field`,`name`,`tips`,`css`,`minlength`,`maxlength`,`pattern`,`errortips`,`formtype`,`setting`,`formattribute`,`unsetgroupids`,`unsetroleids`,`iscore`,`issystem`,`isunique`,`isbase`,`issearch`,`isadd`,`isfulltext`,`isposition`,`listorder`,`disabled`,`isomnipotent`) values (7,1,1,'updatetime','更新时间','','',0,0,'','','datetime','array (\r\n  \'dateformat\' => \'int\',\r\n  \'format\' => \'Y-m-d H:i:s\',\r\n  \'defaulttype\' => \'1\',\r\n  \'defaultvalue\' => \'\',\r\n)','','','',1,1,0,1,0,0,0,0,12,0,0);
insert  into `v9_model_field`(`fieldid`,`modelid`,`siteid`,`field`,`name`,`tips`,`css`,`minlength`,`maxlength`,`pattern`,`errortips`,`formtype`,`setting`,`formattribute`,`unsetgroupids`,`unsetroleids`,`iscore`,`issystem`,`isunique`,`isbase`,`issearch`,`isadd`,`isfulltext`,`isposition`,`listorder`,`disabled`,`isomnipotent`) values (8,1,1,'content','内容','<div class=\"content_attr\"><label><input name=\"add_introduce\" type=\"checkbox\"  value=\"1\" checked>是否截取内容</label><input type=\"text\" name=\"introcude_length\" value=\"200\" size=\"3\">字符至内容摘要\r\n<label><input type=\'checkbox\' name=\'auto_thumb\' value=\"1\" checked>是否获取内容第</label><input type=\"text\" name=\"auto_thumb_no\" value=\"1\" size=\"2\" class=\"\">张图片作为标题图片\r\n</div>','',1,999999,'','内容不能为空','editor','array (\n  \'toolbar\' => \'full\',\n  \'defaultvalue\' => \'\',\n  \'enablekeylink\' => \'1\',\n  \'replacenum\' => \'2\',\n  \'link_mode\' => \'0\',\n  \'enablesaveimage\' => \'1\',\n)','','','',0,0,0,1,0,1,1,0,13,0,0);
insert  into `v9_model_field`(`fieldid`,`modelid`,`siteid`,`field`,`name`,`tips`,`css`,`minlength`,`maxlength`,`pattern`,`errortips`,`formtype`,`setting`,`formattribute`,`unsetgroupids`,`unsetroleids`,`iscore`,`issystem`,`isunique`,`isbase`,`issearch`,`isadd`,`isfulltext`,`isposition`,`listorder`,`disabled`,`isomnipotent`) values (9,1,1,'voteid','添加投票','','',0,0,'','','omnipotent','array (\n  \'formtext\' => \'<input type=\\\'text\\\' name=\\\'info[voteid]\\\' id=\\\'voteid\\\' value=\\\'{FIELD_VALUE}\\\' size=\\\'3\\\'> \r\n<input type=\\\'button\\\' value=\"选择已有投票\" onclick=\"omnipotent(\\\'selectid\\\',\\\'?m=vote&c=vote&a=public_get_votelist&from_api=1\\\',\\\'选择已有投票\\\')\" class=\"button\">\r\n<input type=\\\'button\\\' value=\"新增投票\" onclick=\"omnipotent(\\\'addvote\\\',\\\'?m=vote&c=vote&a=add&from_api=1\\\',\\\'添加投票\\\',0)\" class=\"button\">\',\n  \'fieldtype\' => \'mediumint\',\n  \'minnumber\' => \'1\',\n)','','','',0,0,0,1,0,0,1,0,21,0,0);
insert  into `v9_model_field`(`fieldid`,`modelid`,`siteid`,`field`,`name`,`tips`,`css`,`minlength`,`maxlength`,`pattern`,`errortips`,`formtype`,`setting`,`formattribute`,`unsetgroupids`,`unsetroleids`,`iscore`,`issystem`,`isunique`,`isbase`,`issearch`,`isadd`,`isfulltext`,`isposition`,`listorder`,`disabled`,`isomnipotent`) values (10,1,1,'pages','分页方式','','',0,0,'','','pages','','','-99','-99',0,0,0,1,0,0,0,0,16,0,0);
insert  into `v9_model_field`(`fieldid`,`modelid`,`siteid`,`field`,`name`,`tips`,`css`,`minlength`,`maxlength`,`pattern`,`errortips`,`formtype`,`setting`,`formattribute`,`unsetgroupids`,`unsetroleids`,`iscore`,`issystem`,`isunique`,`isbase`,`issearch`,`isadd`,`isfulltext`,`isposition`,`listorder`,`disabled`,`isomnipotent`) values (11,1,1,'inputtime','发布时间','','',0,0,'','','datetime','array (\n  \'fieldtype\' => \'int\',\n  \'format\' => \'Y-m-d H:i:s\',\n  \'defaulttype\' => \'0\',\n)','','','',0,1,0,0,0,0,0,1,17,0,0);
insert  into `v9_model_field`(`fieldid`,`modelid`,`siteid`,`field`,`name`,`tips`,`css`,`minlength`,`maxlength`,`pattern`,`errortips`,`formtype`,`setting`,`formattribute`,`unsetgroupids`,`unsetroleids`,`iscore`,`issystem`,`isunique`,`isbase`,`issearch`,`isadd`,`isfulltext`,`isposition`,`listorder`,`disabled`,`isomnipotent`) values (12,1,1,'posids','推荐位','','',0,0,'','','posid','array (\n  \'cols\' => \'4\',\n  \'width\' => \'125\',\n)','','','',0,1,0,1,0,0,0,0,18,0,0);
insert  into `v9_model_field`(`fieldid`,`modelid`,`siteid`,`field`,`name`,`tips`,`css`,`minlength`,`maxlength`,`pattern`,`errortips`,`formtype`,`setting`,`formattribute`,`unsetgroupids`,`unsetroleids`,`iscore`,`issystem`,`isunique`,`isbase`,`issearch`,`isadd`,`isfulltext`,`isposition`,`listorder`,`disabled`,`isomnipotent`) values (13,1,1,'url','URL','','',0,100,'','','text','','','','',1,1,0,1,0,0,0,0,50,0,0);
insert  into `v9_model_field`(`fieldid`,`modelid`,`siteid`,`field`,`name`,`tips`,`css`,`minlength`,`maxlength`,`pattern`,`errortips`,`formtype`,`setting`,`formattribute`,`unsetgroupids`,`unsetroleids`,`iscore`,`issystem`,`isunique`,`isbase`,`issearch`,`isadd`,`isfulltext`,`isposition`,`listorder`,`disabled`,`isomnipotent`) values (14,1,1,'listorder','排序','','',0,6,'','','number','','','','',1,1,0,1,0,0,0,0,51,0,0);
insert  into `v9_model_field`(`fieldid`,`modelid`,`siteid`,`field`,`name`,`tips`,`css`,`minlength`,`maxlength`,`pattern`,`errortips`,`formtype`,`setting`,`formattribute`,`unsetgroupids`,`unsetroleids`,`iscore`,`issystem`,`isunique`,`isbase`,`issearch`,`isadd`,`isfulltext`,`isposition`,`listorder`,`disabled`,`isomnipotent`) values (15,1,1,'status','状态','','',0,2,'','','box','','','','',1,1,0,1,0,0,0,0,55,0,0);
insert  into `v9_model_field`(`fieldid`,`modelid`,`siteid`,`field`,`name`,`tips`,`css`,`minlength`,`maxlength`,`pattern`,`errortips`,`formtype`,`setting`,`formattribute`,`unsetgroupids`,`unsetroleids`,`iscore`,`issystem`,`isunique`,`isbase`,`issearch`,`isadd`,`isfulltext`,`isposition`,`listorder`,`disabled`,`isomnipotent`) values (16,1,1,'template','内容页模板','','',0,30,'','','template','array (\n  \'size\' => \'\',\n  \'defaultvalue\' => \'\',\n)','','-99','-99',0,0,0,0,0,0,0,0,53,0,0);
insert  into `v9_model_field`(`fieldid`,`modelid`,`siteid`,`field`,`name`,`tips`,`css`,`minlength`,`maxlength`,`pattern`,`errortips`,`formtype`,`setting`,`formattribute`,`unsetgroupids`,`unsetroleids`,`iscore`,`issystem`,`isunique`,`isbase`,`issearch`,`isadd`,`isfulltext`,`isposition`,`listorder`,`disabled`,`isomnipotent`) values (17,1,1,'groupids_view','阅读权限','','',0,0,'','','groupid','array (\n  \'groupids\' => \'\',\n)','','','',0,0,0,1,0,0,0,0,19,0,0);
insert  into `v9_model_field`(`fieldid`,`modelid`,`siteid`,`field`,`name`,`tips`,`css`,`minlength`,`maxlength`,`pattern`,`errortips`,`formtype`,`setting`,`formattribute`,`unsetgroupids`,`unsetroleids`,`iscore`,`issystem`,`isunique`,`isbase`,`issearch`,`isadd`,`isfulltext`,`isposition`,`listorder`,`disabled`,`isomnipotent`) values (18,1,1,'readpoint','阅读收费','','',0,5,'','','readpoint','array (\n  \'minnumber\' => \'1\',\n  \'maxnumber\' => \'99999\',\n  \'decimaldigits\' => \'0\',\n  \'defaultvalue\' => \'\',\n)','','-99','-99',0,0,0,0,0,0,0,0,55,0,0);
insert  into `v9_model_field`(`fieldid`,`modelid`,`siteid`,`field`,`name`,`tips`,`css`,`minlength`,`maxlength`,`pattern`,`errortips`,`formtype`,`setting`,`formattribute`,`unsetgroupids`,`unsetroleids`,`iscore`,`issystem`,`isunique`,`isbase`,`issearch`,`isadd`,`isfulltext`,`isposition`,`listorder`,`disabled`,`isomnipotent`) values (19,1,1,'relation','相关文章','','',0,0,'','','omnipotent','array (\n  \'formtext\' => \'<input type=\\\'hidden\\\' name=\\\'info[relation]\\\' id=\\\'relation\\\' value=\\\'{FIELD_VALUE}\\\' style=\\\'50\\\' >\r\n<ul class=\"list-dot\" id=\"relation_text\"></ul>\r\n<div>\r\n<input type=\\\'button\\\' value=\"添加相关\" onclick=\"omnipotent(\\\'selectid\\\',\\\'?m=content&c=content&a=public_relationlist&modelid={MODELID}\\\',\\\'添加相关文章\\\',1)\" class=\"button\" style=\"width:66px;\">\r\n<span class=\"edit_content\">\r\n<input type=\\\'button\\\' value=\"显示已有\" onclick=\"show_relation({MODELID},{ID})\" class=\"button\" style=\"width:66px;\">\r\n</span>\r\n</div>\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n)','','2,6,4,5,1,17,18,7','',0,0,0,0,0,0,1,0,15,0,0);
insert  into `v9_model_field`(`fieldid`,`modelid`,`siteid`,`field`,`name`,`tips`,`css`,`minlength`,`maxlength`,`pattern`,`errortips`,`formtype`,`setting`,`formattribute`,`unsetgroupids`,`unsetroleids`,`iscore`,`issystem`,`isunique`,`isbase`,`issearch`,`isadd`,`isfulltext`,`isposition`,`listorder`,`disabled`,`isomnipotent`) values (20,1,1,'allow_comment','允许评论','','',0,0,'','','box','array (\n  \'options\' => \'允许评论|1\r\n不允许评论|0\',\n  \'boxtype\' => \'radio\',\n  \'fieldtype\' => \'tinyint\',\n  \'minnumber\' => \'1\',\n  \'width\' => \'88\',\n  \'size\' => \'1\',\n  \'defaultvalue\' => \'1\',\n  \'outputtype\' => \'1\',\n  \'filtertype\' => \'0\',\n)','','','',0,0,0,0,0,0,0,0,54,0,0);
insert  into `v9_model_field`(`fieldid`,`modelid`,`siteid`,`field`,`name`,`tips`,`css`,`minlength`,`maxlength`,`pattern`,`errortips`,`formtype`,`setting`,`formattribute`,`unsetgroupids`,`unsetroleids`,`iscore`,`issystem`,`isunique`,`isbase`,`issearch`,`isadd`,`isfulltext`,`isposition`,`listorder`,`disabled`,`isomnipotent`) values (21,1,1,'copyfrom','来源','','',0,100,'','','copyfrom','array (\n  \'defaultvalue\' => \'\',\n)','','','',0,0,0,1,0,1,0,0,8,0,0);
insert  into `v9_model_field`(`fieldid`,`modelid`,`siteid`,`field`,`name`,`tips`,`css`,`minlength`,`maxlength`,`pattern`,`errortips`,`formtype`,`setting`,`formattribute`,`unsetgroupids`,`unsetroleids`,`iscore`,`issystem`,`isunique`,`isbase`,`issearch`,`isadd`,`isfulltext`,`isposition`,`listorder`,`disabled`,`isomnipotent`) values (80,1,1,'username','用户名','','',0,20,'','','text','','','','',1,1,0,1,0,0,0,0,98,0,0);
insert  into `v9_model_field`(`fieldid`,`modelid`,`siteid`,`field`,`name`,`tips`,`css`,`minlength`,`maxlength`,`pattern`,`errortips`,`formtype`,`setting`,`formattribute`,`unsetgroupids`,`unsetroleids`,`iscore`,`issystem`,`isunique`,`isbase`,`issearch`,`isadd`,`isfulltext`,`isposition`,`listorder`,`disabled`,`isomnipotent`) values (22,2,1,'catid','栏目','','',1,6,'/^[0-9]{1,6}$/','请选择栏目','catid','array (\n  \'defaultvalue\' => \'\',\n)','','-99','-99',0,1,0,1,1,1,0,0,1,0,0);
insert  into `v9_model_field`(`fieldid`,`modelid`,`siteid`,`field`,`name`,`tips`,`css`,`minlength`,`maxlength`,`pattern`,`errortips`,`formtype`,`setting`,`formattribute`,`unsetgroupids`,`unsetroleids`,`iscore`,`issystem`,`isunique`,`isbase`,`issearch`,`isadd`,`isfulltext`,`isposition`,`listorder`,`disabled`,`isomnipotent`) values (23,2,1,'typeid','类别','','',0,0,'','','typeid','array (\n  \'minnumber\' => \'\',\n  \'defaultvalue\' => \'\',\n)','','','',0,1,0,1,1,1,0,0,2,1,0);
insert  into `v9_model_field`(`fieldid`,`modelid`,`siteid`,`field`,`name`,`tips`,`css`,`minlength`,`maxlength`,`pattern`,`errortips`,`formtype`,`setting`,`formattribute`,`unsetgroupids`,`unsetroleids`,`iscore`,`issystem`,`isunique`,`isbase`,`issearch`,`isadd`,`isfulltext`,`isposition`,`listorder`,`disabled`,`isomnipotent`) values (24,2,1,'title','标题','','inputtitle',1,80,'','请输入标题','title','','','','',0,1,0,1,1,1,1,1,4,0,0);
insert  into `v9_model_field`(`fieldid`,`modelid`,`siteid`,`field`,`name`,`tips`,`css`,`minlength`,`maxlength`,`pattern`,`errortips`,`formtype`,`setting`,`formattribute`,`unsetgroupids`,`unsetroleids`,`iscore`,`issystem`,`isunique`,`isbase`,`issearch`,`isadd`,`isfulltext`,`isposition`,`listorder`,`disabled`,`isomnipotent`) values (25,2,1,'keywords','关键词','多关键词之间用空格或者“,”隔开','',0,40,'','','keyword','array (\r\n  \'size\' => \'100\',\r\n  \'defaultvalue\' => \'\',\r\n)','','-99','-99',0,1,0,1,1,1,1,0,7,0,0);
insert  into `v9_model_field`(`fieldid`,`modelid`,`siteid`,`field`,`name`,`tips`,`css`,`minlength`,`maxlength`,`pattern`,`errortips`,`formtype`,`setting`,`formattribute`,`unsetgroupids`,`unsetroleids`,`iscore`,`issystem`,`isunique`,`isbase`,`issearch`,`isadd`,`isfulltext`,`isposition`,`listorder`,`disabled`,`isomnipotent`) values (26,2,1,'description','摘要','','',0,255,'','','textarea','array (\r\n  \'width\' => \'98\',\r\n  \'height\' => \'46\',\r\n  \'defaultvalue\' => \'\',\r\n  \'enablehtml\' => \'0\',\r\n)','','','',0,1,0,1,0,1,1,1,10,0,0);
insert  into `v9_model_field`(`fieldid`,`modelid`,`siteid`,`field`,`name`,`tips`,`css`,`minlength`,`maxlength`,`pattern`,`errortips`,`formtype`,`setting`,`formattribute`,`unsetgroupids`,`unsetroleids`,`iscore`,`issystem`,`isunique`,`isbase`,`issearch`,`isadd`,`isfulltext`,`isposition`,`listorder`,`disabled`,`isomnipotent`) values (27,2,1,'updatetime','更新时间','','',0,0,'','','datetime','array (\r\n  \'dateformat\' => \'int\',\r\n  \'format\' => \'Y-m-d H:i:s\',\r\n  \'defaulttype\' => \'1\',\r\n  \'defaultvalue\' => \'\',\r\n)','','','',1,1,0,1,0,0,0,0,12,0,0);
insert  into `v9_model_field`(`fieldid`,`modelid`,`siteid`,`field`,`name`,`tips`,`css`,`minlength`,`maxlength`,`pattern`,`errortips`,`formtype`,`setting`,`formattribute`,`unsetgroupids`,`unsetroleids`,`iscore`,`issystem`,`isunique`,`isbase`,`issearch`,`isadd`,`isfulltext`,`isposition`,`listorder`,`disabled`,`isomnipotent`) values (28,2,1,'content','内容','<div class=\"content_attr\"><label><input name=\"add_introduce\" type=\"checkbox\"  value=\"1\" checked>是否截取内容</label><input type=\"text\" name=\"introcude_length\" value=\"200\" size=\"3\">字符至内容摘要\r\n<label><input type=\'checkbox\' name=\'auto_thumb\' value=\"1\" checked>是否获取内容第</label><input type=\"text\" name=\"auto_thumb_no\" value=\"1\" size=\"2\" class=\"\">张图片作为标题图片\r\n</div>','',1,999999,'','内容不能为空','editor','array (\n  \'toolbar\' => \'full\',\n  \'defaultvalue\' => \'\',\n  \'enablekeylink\' => \'1\',\n  \'replacenum\' => \'2\',\n  \'link_mode\' => \'0\',\n  \'enablesaveimage\' => \'1\',\n  \'height\' => \'\',\n  \'disabled_page\' => \'1\',\n)','','','',0,0,0,1,0,1,1,0,13,0,0);
insert  into `v9_model_field`(`fieldid`,`modelid`,`siteid`,`field`,`name`,`tips`,`css`,`minlength`,`maxlength`,`pattern`,`errortips`,`formtype`,`setting`,`formattribute`,`unsetgroupids`,`unsetroleids`,`iscore`,`issystem`,`isunique`,`isbase`,`issearch`,`isadd`,`isfulltext`,`isposition`,`listorder`,`disabled`,`isomnipotent`) values (29,2,1,'thumb','缩略图','','',0,100,'','','image','array (\n  \'size\' => \'50\',\n  \'defaultvalue\' => \'\',\n  \'show_type\' => \'1\',\n  \'upload_maxsize\' => \'1024\',\n  \'upload_allowext\' => \'jpg|jpeg|gif|png|bmp\',\n  \'watermark\' => \'0\',\n  \'isselectimage\' => \'1\',\n  \'images_width\' => \'\',\n  \'images_height\' => \'\',\n)','','','',0,1,0,0,0,1,0,1,14,0,0);
insert  into `v9_model_field`(`fieldid`,`modelid`,`siteid`,`field`,`name`,`tips`,`css`,`minlength`,`maxlength`,`pattern`,`errortips`,`formtype`,`setting`,`formattribute`,`unsetgroupids`,`unsetroleids`,`iscore`,`issystem`,`isunique`,`isbase`,`issearch`,`isadd`,`isfulltext`,`isposition`,`listorder`,`disabled`,`isomnipotent`) values (30,2,1,'relation','相关文章','','',0,0,'','','omnipotent','array (\n  \'formtext\' => \'<input type=\\\'hidden\\\' name=\\\'info[relation]\\\' id=\\\'relation\\\' value=\\\'{FIELD_VALUE}\\\' style=\\\'50\\\' >\r\n<ul class=\"list-dot\" id=\"relation_text\"></ul>\r\n<div>\r\n<input type=\\\'button\\\' value=\"添加相关\" onclick=\"omnipotent(\\\'selectid\\\',\\\'?m=content&c=content&a=public_relationlist&modelid={MODELID}\\\',\\\'添加相关文章\\\',1)\" class=\"button\" style=\"width:66px;\">\r\n<span class=\"edit_content\">\r\n<input type=\\\'button\\\' value=\"显示已有\" onclick=\"show_relation({MODELID},{ID})\" class=\"button\" style=\"width:66px;\">\r\n</span>\r\n</div>\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n)','','2,6,4,5,1,17,18,7','',0,0,0,0,0,0,1,0,15,0,0);
insert  into `v9_model_field`(`fieldid`,`modelid`,`siteid`,`field`,`name`,`tips`,`css`,`minlength`,`maxlength`,`pattern`,`errortips`,`formtype`,`setting`,`formattribute`,`unsetgroupids`,`unsetroleids`,`iscore`,`issystem`,`isunique`,`isbase`,`issearch`,`isadd`,`isfulltext`,`isposition`,`listorder`,`disabled`,`isomnipotent`) values (31,2,1,'pages','分页方式','','',0,0,'','','pages','','','-99','-99',0,0,0,1,0,0,0,0,16,1,0);
insert  into `v9_model_field`(`fieldid`,`modelid`,`siteid`,`field`,`name`,`tips`,`css`,`minlength`,`maxlength`,`pattern`,`errortips`,`formtype`,`setting`,`formattribute`,`unsetgroupids`,`unsetroleids`,`iscore`,`issystem`,`isunique`,`isbase`,`issearch`,`isadd`,`isfulltext`,`isposition`,`listorder`,`disabled`,`isomnipotent`) values (32,2,1,'inputtime','发布时间','','',0,0,'','','datetime','array (\n  \'fieldtype\' => \'int\',\n  \'format\' => \'Y-m-d H:i:s\',\n  \'defaulttype\' => \'0\',\n)','','','',0,1,0,0,0,0,0,1,17,0,0);
insert  into `v9_model_field`(`fieldid`,`modelid`,`siteid`,`field`,`name`,`tips`,`css`,`minlength`,`maxlength`,`pattern`,`errortips`,`formtype`,`setting`,`formattribute`,`unsetgroupids`,`unsetroleids`,`iscore`,`issystem`,`isunique`,`isbase`,`issearch`,`isadd`,`isfulltext`,`isposition`,`listorder`,`disabled`,`isomnipotent`) values (33,2,1,'posids','推荐位','','',0,0,'','','posid','array (\n  \'cols\' => \'4\',\n  \'width\' => \'125\',\n)','','','',0,1,0,1,0,0,0,0,18,0,0);
insert  into `v9_model_field`(`fieldid`,`modelid`,`siteid`,`field`,`name`,`tips`,`css`,`minlength`,`maxlength`,`pattern`,`errortips`,`formtype`,`setting`,`formattribute`,`unsetgroupids`,`unsetroleids`,`iscore`,`issystem`,`isunique`,`isbase`,`issearch`,`isadd`,`isfulltext`,`isposition`,`listorder`,`disabled`,`isomnipotent`) values (34,2,1,'groupids_view','阅读权限','','',0,0,'','','groupid','array (\n  \'groupids\' => \'\',\n)','','','',0,0,0,1,0,0,0,0,19,0,0);
insert  into `v9_model_field`(`fieldid`,`modelid`,`siteid`,`field`,`name`,`tips`,`css`,`minlength`,`maxlength`,`pattern`,`errortips`,`formtype`,`setting`,`formattribute`,`unsetgroupids`,`unsetroleids`,`iscore`,`issystem`,`isunique`,`isbase`,`issearch`,`isadd`,`isfulltext`,`isposition`,`listorder`,`disabled`,`isomnipotent`) values (35,2,1,'url','URL','','',0,100,'','','text','','','','',1,1,0,1,0,0,0,0,50,0,0);
insert  into `v9_model_field`(`fieldid`,`modelid`,`siteid`,`field`,`name`,`tips`,`css`,`minlength`,`maxlength`,`pattern`,`errortips`,`formtype`,`setting`,`formattribute`,`unsetgroupids`,`unsetroleids`,`iscore`,`issystem`,`isunique`,`isbase`,`issearch`,`isadd`,`isfulltext`,`isposition`,`listorder`,`disabled`,`isomnipotent`) values (36,2,1,'listorder','排序','','',0,6,'','','number','','','','',1,1,0,1,0,0,0,0,51,0,0);
insert  into `v9_model_field`(`fieldid`,`modelid`,`siteid`,`field`,`name`,`tips`,`css`,`minlength`,`maxlength`,`pattern`,`errortips`,`formtype`,`setting`,`formattribute`,`unsetgroupids`,`unsetroleids`,`iscore`,`issystem`,`isunique`,`isbase`,`issearch`,`isadd`,`isfulltext`,`isposition`,`listorder`,`disabled`,`isomnipotent`) values (37,2,1,'template','内容页模板','','',0,30,'','','template','array (\n  \'size\' => \'\',\n  \'defaultvalue\' => \'\',\n)','','-99','-99',0,0,0,0,0,0,0,0,53,0,0);
insert  into `v9_model_field`(`fieldid`,`modelid`,`siteid`,`field`,`name`,`tips`,`css`,`minlength`,`maxlength`,`pattern`,`errortips`,`formtype`,`setting`,`formattribute`,`unsetgroupids`,`unsetroleids`,`iscore`,`issystem`,`isunique`,`isbase`,`issearch`,`isadd`,`isfulltext`,`isposition`,`listorder`,`disabled`,`isomnipotent`) values (38,2,1,'allow_comment','允许评论','','',0,0,'','','box','array (\n  \'options\' => \'允许评论|1\r\n不允许评论|0\',\n  \'boxtype\' => \'radio\',\n  \'fieldtype\' => \'tinyint\',\n  \'minnumber\' => \'1\',\n  \'width\' => \'88\',\n  \'size\' => \'1\',\n  \'defaultvalue\' => \'1\',\n  \'outputtype\' => \'1\',\n  \'filtertype\' => \'0\',\n)','','','',0,0,0,0,0,0,0,0,54,0,0);
insert  into `v9_model_field`(`fieldid`,`modelid`,`siteid`,`field`,`name`,`tips`,`css`,`minlength`,`maxlength`,`pattern`,`errortips`,`formtype`,`setting`,`formattribute`,`unsetgroupids`,`unsetroleids`,`iscore`,`issystem`,`isunique`,`isbase`,`issearch`,`isadd`,`isfulltext`,`isposition`,`listorder`,`disabled`,`isomnipotent`) values (39,2,1,'status','状态','','',0,2,'','','box','','','','',1,1,0,1,0,0,0,0,55,0,0);
insert  into `v9_model_field`(`fieldid`,`modelid`,`siteid`,`field`,`name`,`tips`,`css`,`minlength`,`maxlength`,`pattern`,`errortips`,`formtype`,`setting`,`formattribute`,`unsetgroupids`,`unsetroleids`,`iscore`,`issystem`,`isunique`,`isbase`,`issearch`,`isadd`,`isfulltext`,`isposition`,`listorder`,`disabled`,`isomnipotent`) values (40,2,1,'readpoint','阅读收费','','',0,5,'','','readpoint','array (\n  \'minnumber\' => \'1\',\n  \'maxnumber\' => \'99999\',\n  \'decimaldigits\' => \'0\',\n  \'defaultvalue\' => \'\',\n)','','-99','-99',0,0,0,0,0,0,0,0,55,0,0);
insert  into `v9_model_field`(`fieldid`,`modelid`,`siteid`,`field`,`name`,`tips`,`css`,`minlength`,`maxlength`,`pattern`,`errortips`,`formtype`,`setting`,`formattribute`,`unsetgroupids`,`unsetroleids`,`iscore`,`issystem`,`isunique`,`isbase`,`issearch`,`isadd`,`isfulltext`,`isposition`,`listorder`,`disabled`,`isomnipotent`) values (41,2,1,'username','用户名','','',0,20,'','','text','','','','',1,1,0,1,0,0,0,0,98,0,0);
insert  into `v9_model_field`(`fieldid`,`modelid`,`siteid`,`field`,`name`,`tips`,`css`,`minlength`,`maxlength`,`pattern`,`errortips`,`formtype`,`setting`,`formattribute`,`unsetgroupids`,`unsetroleids`,`iscore`,`issystem`,`isunique`,`isbase`,`issearch`,`isadd`,`isfulltext`,`isposition`,`listorder`,`disabled`,`isomnipotent`) values (42,2,1,'downfiles','本地下载','','',0,0,'','','downfiles','array (\n  \'upload_allowext\' => \'rar|zip\',\n  \'isselectimage\' => \'0\',\n  \'upload_number\' => \'10\',\n  \'downloadlink\' => \'1\',\n  \'downloadtype\' => \'1\',\n)','','','',0,0,0,1,0,1,0,0,8,0,0);
insert  into `v9_model_field`(`fieldid`,`modelid`,`siteid`,`field`,`name`,`tips`,`css`,`minlength`,`maxlength`,`pattern`,`errortips`,`formtype`,`setting`,`formattribute`,`unsetgroupids`,`unsetroleids`,`iscore`,`issystem`,`isunique`,`isbase`,`issearch`,`isadd`,`isfulltext`,`isposition`,`listorder`,`disabled`,`isomnipotent`) values (43,2,1,'downfile','镜像下载','','',0,0,'','','downfile','array (\n  \'downloadlink\' => \'1\',\n  \'downloadtype\' => \'1\',\n  \'upload_allowext\' => \'rar|zip\',\n  \'isselectimage\' => \'0\',\n  \'upload_number\' => \'1\',\n)','','','',0,0,0,1,0,1,0,0,9,0,0);
insert  into `v9_model_field`(`fieldid`,`modelid`,`siteid`,`field`,`name`,`tips`,`css`,`minlength`,`maxlength`,`pattern`,`errortips`,`formtype`,`setting`,`formattribute`,`unsetgroupids`,`unsetroleids`,`iscore`,`issystem`,`isunique`,`isbase`,`issearch`,`isadd`,`isfulltext`,`isposition`,`listorder`,`disabled`,`isomnipotent`) values (44,2,1,'systems','软件平台','<select name=\'selectSystem\' onchange=\"ChangeInput(this,document.myform.systems,\'/\')\">\r\n	<option value=\'WinXP\'>WinXP</option>\r\n	<option value=\'Vista\'>Windows 7</option>\r\n	<option value=\'Win2000\'>Win2000</option>\r\n	<option value=\'Win2003\'>Win2003</option>\r\n	<option value=\'Unix\'>Unix</option>\r\n	<option value=\'Linux\'>Linux</option>\r\n	<option value=\'MacOS\'>MacOS</option>\r\n</select>','',0,100,'','','text','array (\n  \'size\' => \'50\',\n  \'defaultvalue\' => \'Win2000/WinXP/Win2003\',\n  \'ispassword\' => \'0\',\n)','','','',0,1,0,1,0,1,1,0,14,0,0);
insert  into `v9_model_field`(`fieldid`,`modelid`,`siteid`,`field`,`name`,`tips`,`css`,`minlength`,`maxlength`,`pattern`,`errortips`,`formtype`,`setting`,`formattribute`,`unsetgroupids`,`unsetroleids`,`iscore`,`issystem`,`isunique`,`isbase`,`issearch`,`isadd`,`isfulltext`,`isposition`,`listorder`,`disabled`,`isomnipotent`) values (45,2,1,'copytype','软件授权形式','','',0,15,'','','box','array (\n  \'options\' => \'免费版|免费版\r\n共享版|共享版\r\n试用版|试用版\r\n演示版|演示版\r\n注册版|注册版\r\n破解版|破解版\r\n零售版|零售版\r\nOEM版|OEM版\',\n  \'boxtype\' => \'select\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n  \'cols\' => \'5\',\n  \'width\' => \'80\',\n  \'size\' => \'1\',\n  \'default_select_value\' => \'免费版\',\n)','','','',0,1,0,1,0,1,0,0,12,0,0);
insert  into `v9_model_field`(`fieldid`,`modelid`,`siteid`,`field`,`name`,`tips`,`css`,`minlength`,`maxlength`,`pattern`,`errortips`,`formtype`,`setting`,`formattribute`,`unsetgroupids`,`unsetroleids`,`iscore`,`issystem`,`isunique`,`isbase`,`issearch`,`isadd`,`isfulltext`,`isposition`,`listorder`,`disabled`,`isomnipotent`) values (46,2,1,'language','软件语言','','',0,16,'','','box','array (\n  \'options\' => \'英文|英文\r\n简体中文|简体中文\r\n繁体中文|繁体中文\r\n简繁中文|简繁中文\r\n多国语言|多国语言\r\n其他语言|其他语言\',\n  \'boxtype\' => \'select\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n  \'cols\' => \'5\',\n  \'width\' => \'80\',\n  \'size\' => \'1\',\n  \'default_select_value\' => \'简体中文\',\n)','','','',0,1,0,1,0,1,0,0,13,0,0);
insert  into `v9_model_field`(`fieldid`,`modelid`,`siteid`,`field`,`name`,`tips`,`css`,`minlength`,`maxlength`,`pattern`,`errortips`,`formtype`,`setting`,`formattribute`,`unsetgroupids`,`unsetroleids`,`iscore`,`issystem`,`isunique`,`isbase`,`issearch`,`isadd`,`isfulltext`,`isposition`,`listorder`,`disabled`,`isomnipotent`) values (47,2,1,'classtype','软件类型','','',0,20,'','','box','array (\n  \'options\' => \'国产软件|国产软件\r\n国外软件|国外软件\r\n汉化补丁|汉化补丁\r\n程序源码|程序源码\r\n其他|其他\',\n  \'boxtype\' => \'radio\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n  \'cols\' => \'5\',\n  \'width\' => \'80\',\n  \'size\' => \'1\',\n  \'default_select_value\' => \'国产软件\',\n)','','','',0,1,0,1,0,1,0,0,17,0,0);
insert  into `v9_model_field`(`fieldid`,`modelid`,`siteid`,`field`,`name`,`tips`,`css`,`minlength`,`maxlength`,`pattern`,`errortips`,`formtype`,`setting`,`formattribute`,`unsetgroupids`,`unsetroleids`,`iscore`,`issystem`,`isunique`,`isbase`,`issearch`,`isadd`,`isfulltext`,`isposition`,`listorder`,`disabled`,`isomnipotent`) values (48,2,1,'version','版本号','','',0,20,'','','text','array (\n  \'size\' => \'10\',\n  \'defaultvalue\' => \'\',\n  \'ispassword\' => \'0\',\n)','','','',0,1,0,0,0,1,1,0,13,0,0);
insert  into `v9_model_field`(`fieldid`,`modelid`,`siteid`,`field`,`name`,`tips`,`css`,`minlength`,`maxlength`,`pattern`,`errortips`,`formtype`,`setting`,`formattribute`,`unsetgroupids`,`unsetroleids`,`iscore`,`issystem`,`isunique`,`isbase`,`issearch`,`isadd`,`isfulltext`,`isposition`,`listorder`,`disabled`,`isomnipotent`) values (49,2,1,'filesize','文件大小','','',0,10,'','','text','array (\n  \'size\' => \'10\',\n  \'defaultvalue\' => \'未知\',\n  \'ispassword\' => \'0\',\n)','','','',0,1,0,0,0,1,1,0,14,0,0);
insert  into `v9_model_field`(`fieldid`,`modelid`,`siteid`,`field`,`name`,`tips`,`css`,`minlength`,`maxlength`,`pattern`,`errortips`,`formtype`,`setting`,`formattribute`,`unsetgroupids`,`unsetroleids`,`iscore`,`issystem`,`isunique`,`isbase`,`issearch`,`isadd`,`isfulltext`,`isposition`,`listorder`,`disabled`,`isomnipotent`) values (50,2,1,'stars','评分等级','','',0,20,'','','box','array (\n  \'options\' => \'★☆☆☆☆|★☆☆☆☆\r\n★★☆☆☆|★★☆☆☆\r\n★★★☆☆|★★★☆☆\r\n★★★★☆|★★★★☆\r\n★★★★★|★★★★★\',\n  \'boxtype\' => \'radio\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n  \'cols\' => \'5\',\n  \'width\' => \'88\',\n  \'size\' => \'1\',\n  \'default_select_value\' => \'★★★☆☆\',\n)','','','',0,1,0,1,0,1,0,0,17,0,0);
insert  into `v9_model_field`(`fieldid`,`modelid`,`siteid`,`field`,`name`,`tips`,`css`,`minlength`,`maxlength`,`pattern`,`errortips`,`formtype`,`setting`,`formattribute`,`unsetgroupids`,`unsetroleids`,`iscore`,`issystem`,`isunique`,`isbase`,`issearch`,`isadd`,`isfulltext`,`isposition`,`listorder`,`disabled`,`isomnipotent`) values (51,3,1,'allow_comment','允许评论','','',0,0,'','','box','array (\n  \'options\' => \'允许评论|1\r\n不允许评论|0\',\n  \'boxtype\' => \'radio\',\n  \'fieldtype\' => \'tinyint\',\n  \'minnumber\' => \'1\',\n  \'width\' => \'88\',\n  \'size\' => \'1\',\n  \'defaultvalue\' => \'1\',\n  \'outputtype\' => \'1\',\n  \'filtertype\' => \'0\',\n)','','','',0,0,0,0,0,0,0,0,54,0,0);
insert  into `v9_model_field`(`fieldid`,`modelid`,`siteid`,`field`,`name`,`tips`,`css`,`minlength`,`maxlength`,`pattern`,`errortips`,`formtype`,`setting`,`formattribute`,`unsetgroupids`,`unsetroleids`,`iscore`,`issystem`,`isunique`,`isbase`,`issearch`,`isadd`,`isfulltext`,`isposition`,`listorder`,`disabled`,`isomnipotent`) values (52,3,1,'template','内容页模板','','',0,30,'','','template','array (\n  \'size\' => \'\',\n  \'defaultvalue\' => \'\',\n)','','-99','-99',0,0,0,0,0,0,0,0,53,0,0);
insert  into `v9_model_field`(`fieldid`,`modelid`,`siteid`,`field`,`name`,`tips`,`css`,`minlength`,`maxlength`,`pattern`,`errortips`,`formtype`,`setting`,`formattribute`,`unsetgroupids`,`unsetroleids`,`iscore`,`issystem`,`isunique`,`isbase`,`issearch`,`isadd`,`isfulltext`,`isposition`,`listorder`,`disabled`,`isomnipotent`) values (53,3,1,'url','URL','','',0,100,'','','text','','','','',1,1,0,1,0,0,0,0,50,0,0);
insert  into `v9_model_field`(`fieldid`,`modelid`,`siteid`,`field`,`name`,`tips`,`css`,`minlength`,`maxlength`,`pattern`,`errortips`,`formtype`,`setting`,`formattribute`,`unsetgroupids`,`unsetroleids`,`iscore`,`issystem`,`isunique`,`isbase`,`issearch`,`isadd`,`isfulltext`,`isposition`,`listorder`,`disabled`,`isomnipotent`) values (54,3,1,'listorder','排序','','',0,6,'','','number','','','','',1,1,0,1,0,0,0,0,51,0,0);
insert  into `v9_model_field`(`fieldid`,`modelid`,`siteid`,`field`,`name`,`tips`,`css`,`minlength`,`maxlength`,`pattern`,`errortips`,`formtype`,`setting`,`formattribute`,`unsetgroupids`,`unsetroleids`,`iscore`,`issystem`,`isunique`,`isbase`,`issearch`,`isadd`,`isfulltext`,`isposition`,`listorder`,`disabled`,`isomnipotent`) values (55,3,1,'posids','推荐位','','',0,0,'','','posid','array (\n  \'cols\' => \'4\',\n  \'width\' => \'125\',\n)','','','',0,1,0,1,0,0,0,0,18,0,0);
insert  into `v9_model_field`(`fieldid`,`modelid`,`siteid`,`field`,`name`,`tips`,`css`,`minlength`,`maxlength`,`pattern`,`errortips`,`formtype`,`setting`,`formattribute`,`unsetgroupids`,`unsetroleids`,`iscore`,`issystem`,`isunique`,`isbase`,`issearch`,`isadd`,`isfulltext`,`isposition`,`listorder`,`disabled`,`isomnipotent`) values (56,3,1,'groupids_view','阅读权限','','',0,0,'','','groupid','array (\n  \'groupids\' => \'\',\n)','','','',0,0,0,1,0,0,0,0,19,0,0);
insert  into `v9_model_field`(`fieldid`,`modelid`,`siteid`,`field`,`name`,`tips`,`css`,`minlength`,`maxlength`,`pattern`,`errortips`,`formtype`,`setting`,`formattribute`,`unsetgroupids`,`unsetroleids`,`iscore`,`issystem`,`isunique`,`isbase`,`issearch`,`isadd`,`isfulltext`,`isposition`,`listorder`,`disabled`,`isomnipotent`) values (57,3,1,'inputtime','发布时间','','',0,0,'','','datetime','array (\n  \'fieldtype\' => \'int\',\n  \'format\' => \'Y-m-d H:i:s\',\n  \'defaulttype\' => \'0\',\n)','','','',0,1,0,0,0,0,0,1,17,0,0);
insert  into `v9_model_field`(`fieldid`,`modelid`,`siteid`,`field`,`name`,`tips`,`css`,`minlength`,`maxlength`,`pattern`,`errortips`,`formtype`,`setting`,`formattribute`,`unsetgroupids`,`unsetroleids`,`iscore`,`issystem`,`isunique`,`isbase`,`issearch`,`isadd`,`isfulltext`,`isposition`,`listorder`,`disabled`,`isomnipotent`) values (58,3,1,'pages','分页方式','','',0,0,'','','pages','','','-99','-99',0,0,0,1,0,0,0,0,16,0,0);
insert  into `v9_model_field`(`fieldid`,`modelid`,`siteid`,`field`,`name`,`tips`,`css`,`minlength`,`maxlength`,`pattern`,`errortips`,`formtype`,`setting`,`formattribute`,`unsetgroupids`,`unsetroleids`,`iscore`,`issystem`,`isunique`,`isbase`,`issearch`,`isadd`,`isfulltext`,`isposition`,`listorder`,`disabled`,`isomnipotent`) values (59,3,1,'relation','相关组图','','',0,0,'','','omnipotent','array (\n  \'formtext\' => \'<input type=\\\'hidden\\\' name=\\\'info[relation]\\\' id=\\\'relation\\\' value=\\\'{FIELD_VALUE}\\\' style=\\\'50\\\' >\r\n<ul class=\"list-dot\" id=\"relation_text\"></ul>\r\n<div>\r\n<input type=\\\'button\\\' value=\"添加相关\" onclick=\"omnipotent(\\\'selectid\\\',\\\'?m=content&c=content&a=public_relationlist&modelid={MODELID}\\\',\\\'添加相关文章\\\',1)\" class=\"button\" style=\"width:66px;\">\r\n<span class=\"edit_content\">\r\n<input type=\\\'button\\\' value=\"显示已有\" onclick=\"show_relation({MODELID},{ID})\" class=\"button\" style=\"width:66px;\">\r\n</span>\r\n</div>\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n)','','2,6,4,5,1,17,18,7','',0,0,0,0,0,0,1,0,15,0,0);
insert  into `v9_model_field`(`fieldid`,`modelid`,`siteid`,`field`,`name`,`tips`,`css`,`minlength`,`maxlength`,`pattern`,`errortips`,`formtype`,`setting`,`formattribute`,`unsetgroupids`,`unsetroleids`,`iscore`,`issystem`,`isunique`,`isbase`,`issearch`,`isadd`,`isfulltext`,`isposition`,`listorder`,`disabled`,`isomnipotent`) values (60,3,1,'thumb','缩略图','','',0,100,'','','image','array (\n  \'size\' => \'50\',\n  \'defaultvalue\' => \'\',\n  \'show_type\' => \'1\',\n  \'upload_maxsize\' => \'1024\',\n  \'upload_allowext\' => \'jpg|jpeg|gif|png|bmp\',\n  \'watermark\' => \'0\',\n  \'isselectimage\' => \'1\',\n  \'images_width\' => \'\',\n  \'images_height\' => \'\',\n)','','','',0,1,0,0,0,1,0,1,14,0,0);
insert  into `v9_model_field`(`fieldid`,`modelid`,`siteid`,`field`,`name`,`tips`,`css`,`minlength`,`maxlength`,`pattern`,`errortips`,`formtype`,`setting`,`formattribute`,`unsetgroupids`,`unsetroleids`,`iscore`,`issystem`,`isunique`,`isbase`,`issearch`,`isadd`,`isfulltext`,`isposition`,`listorder`,`disabled`,`isomnipotent`) values (61,3,1,'content','内容','<div class=\"content_attr\"><label><input name=\"add_introduce\" type=\"checkbox\"  value=\"1\" checked>是否截取内容</label><input type=\"text\" name=\"introcude_length\" value=\"200\" size=\"3\">字符至内容摘要\r\n<label><input type=\'checkbox\' name=\'auto_thumb\' value=\"1\" checked>是否获取内容第</label><input type=\"text\" name=\"auto_thumb_no\" value=\"1\" size=\"2\" class=\"\">张图片作为标题图片\r\n</div>','',0,999999,'','','editor','array (\n  \'toolbar\' => \'full\',\n  \'defaultvalue\' => \'\',\n  \'enablekeylink\' => \'1\',\n  \'replacenum\' => \'2\',\n  \'link_mode\' => \'0\',\n  \'enablesaveimage\' => \'1\',\n  \'height\' => \'\',\n  \'disabled_page\' => \'1\',\n)','','','',0,0,0,1,0,1,1,0,13,0,0);
insert  into `v9_model_field`(`fieldid`,`modelid`,`siteid`,`field`,`name`,`tips`,`css`,`minlength`,`maxlength`,`pattern`,`errortips`,`formtype`,`setting`,`formattribute`,`unsetgroupids`,`unsetroleids`,`iscore`,`issystem`,`isunique`,`isbase`,`issearch`,`isadd`,`isfulltext`,`isposition`,`listorder`,`disabled`,`isomnipotent`) values (62,3,1,'updatetime','更新时间','','',0,0,'','','datetime','array (\r\n  \'dateformat\' => \'int\',\r\n  \'format\' => \'Y-m-d H:i:s\',\r\n  \'defaulttype\' => \'1\',\r\n  \'defaultvalue\' => \'\',\r\n)','','','',1,1,0,1,0,0,0,0,12,0,0);
insert  into `v9_model_field`(`fieldid`,`modelid`,`siteid`,`field`,`name`,`tips`,`css`,`minlength`,`maxlength`,`pattern`,`errortips`,`formtype`,`setting`,`formattribute`,`unsetgroupids`,`unsetroleids`,`iscore`,`issystem`,`isunique`,`isbase`,`issearch`,`isadd`,`isfulltext`,`isposition`,`listorder`,`disabled`,`isomnipotent`) values (63,3,1,'description','摘要','','',0,255,'','','textarea','array (\r\n  \'width\' => \'98\',\r\n  \'height\' => \'46\',\r\n  \'defaultvalue\' => \'\',\r\n  \'enablehtml\' => \'0\',\r\n)','','','',0,1,0,1,0,1,1,1,10,0,0);
insert  into `v9_model_field`(`fieldid`,`modelid`,`siteid`,`field`,`name`,`tips`,`css`,`minlength`,`maxlength`,`pattern`,`errortips`,`formtype`,`setting`,`formattribute`,`unsetgroupids`,`unsetroleids`,`iscore`,`issystem`,`isunique`,`isbase`,`issearch`,`isadd`,`isfulltext`,`isposition`,`listorder`,`disabled`,`isomnipotent`) values (64,3,1,'title','标题','','inputtitle',1,80,'','请输入标题','title','','','','',0,1,0,1,1,1,1,1,4,0,0);
insert  into `v9_model_field`(`fieldid`,`modelid`,`siteid`,`field`,`name`,`tips`,`css`,`minlength`,`maxlength`,`pattern`,`errortips`,`formtype`,`setting`,`formattribute`,`unsetgroupids`,`unsetroleids`,`iscore`,`issystem`,`isunique`,`isbase`,`issearch`,`isadd`,`isfulltext`,`isposition`,`listorder`,`disabled`,`isomnipotent`) values (65,3,1,'keywords','关键词','多关键词之间用空格或者“,”隔开','',0,40,'','','keyword','array (\r\n  \'size\' => \'100\',\r\n  \'defaultvalue\' => \'\',\r\n)','','-99','-99',0,1,0,1,1,1,1,0,7,0,0);
insert  into `v9_model_field`(`fieldid`,`modelid`,`siteid`,`field`,`name`,`tips`,`css`,`minlength`,`maxlength`,`pattern`,`errortips`,`formtype`,`setting`,`formattribute`,`unsetgroupids`,`unsetroleids`,`iscore`,`issystem`,`isunique`,`isbase`,`issearch`,`isadd`,`isfulltext`,`isposition`,`listorder`,`disabled`,`isomnipotent`) values (66,3,1,'typeid','类别','','',0,0,'','','typeid','array (\n  \'minnumber\' => \'\',\n  \'defaultvalue\' => \'\',\n)','','','',0,1,0,1,1,1,0,0,2,0,0);
insert  into `v9_model_field`(`fieldid`,`modelid`,`siteid`,`field`,`name`,`tips`,`css`,`minlength`,`maxlength`,`pattern`,`errortips`,`formtype`,`setting`,`formattribute`,`unsetgroupids`,`unsetroleids`,`iscore`,`issystem`,`isunique`,`isbase`,`issearch`,`isadd`,`isfulltext`,`isposition`,`listorder`,`disabled`,`isomnipotent`) values (67,3,1,'catid','栏目','','',1,6,'/^[0-9]{1,6}$/','请选择栏目','catid','array (\n  \'defaultvalue\' => \'\',\n)','','-99','-99',0,1,0,1,1,1,0,0,1,0,0);
insert  into `v9_model_field`(`fieldid`,`modelid`,`siteid`,`field`,`name`,`tips`,`css`,`minlength`,`maxlength`,`pattern`,`errortips`,`formtype`,`setting`,`formattribute`,`unsetgroupids`,`unsetroleids`,`iscore`,`issystem`,`isunique`,`isbase`,`issearch`,`isadd`,`isfulltext`,`isposition`,`listorder`,`disabled`,`isomnipotent`) values (68,3,1,'status','状态','','',0,2,'','','box','','','','',1,1,0,1,0,0,0,0,55,0,0);
insert  into `v9_model_field`(`fieldid`,`modelid`,`siteid`,`field`,`name`,`tips`,`css`,`minlength`,`maxlength`,`pattern`,`errortips`,`formtype`,`setting`,`formattribute`,`unsetgroupids`,`unsetroleids`,`iscore`,`issystem`,`isunique`,`isbase`,`issearch`,`isadd`,`isfulltext`,`isposition`,`listorder`,`disabled`,`isomnipotent`) values (69,3,1,'readpoint','阅读收费','','',0,5,'','','readpoint','array (\n  \'minnumber\' => \'1\',\n  \'maxnumber\' => \'99999\',\n  \'decimaldigits\' => \'0\',\n  \'defaultvalue\' => \'\',\n)','','-99','-99',0,0,0,0,0,0,0,0,55,0,0);
insert  into `v9_model_field`(`fieldid`,`modelid`,`siteid`,`field`,`name`,`tips`,`css`,`minlength`,`maxlength`,`pattern`,`errortips`,`formtype`,`setting`,`formattribute`,`unsetgroupids`,`unsetroleids`,`iscore`,`issystem`,`isunique`,`isbase`,`issearch`,`isadd`,`isfulltext`,`isposition`,`listorder`,`disabled`,`isomnipotent`) values (70,3,1,'username','用户名','','',0,20,'','','text','','','','',1,1,0,1,0,0,0,0,98,0,0);
insert  into `v9_model_field`(`fieldid`,`modelid`,`siteid`,`field`,`name`,`tips`,`css`,`minlength`,`maxlength`,`pattern`,`errortips`,`formtype`,`setting`,`formattribute`,`unsetgroupids`,`unsetroleids`,`iscore`,`issystem`,`isunique`,`isbase`,`issearch`,`isadd`,`isfulltext`,`isposition`,`listorder`,`disabled`,`isomnipotent`) values (71,3,1,'pictureurls','组图','','',0,0,'','','images','array (\n  \'upload_allowext\' => \'gif|jpg|jpeg|png|bmp\',\n  \'isselectimage\' => \'1\',\n  \'upload_number\' => \'50\',\n)','','','',0,0,0,1,0,1,0,0,15,0,0);
insert  into `v9_model_field`(`fieldid`,`modelid`,`siteid`,`field`,`name`,`tips`,`css`,`minlength`,`maxlength`,`pattern`,`errortips`,`formtype`,`setting`,`formattribute`,`unsetgroupids`,`unsetroleids`,`iscore`,`issystem`,`isunique`,`isbase`,`issearch`,`isadd`,`isfulltext`,`isposition`,`listorder`,`disabled`,`isomnipotent`) values (72,3,1,'copyfrom','来源','','',0,0,'','','copyfrom','array (\n  \'defaultvalue\' => \'\',\n)','','','',0,0,0,1,0,1,0,0,8,0,0);
insert  into `v9_model_field`(`fieldid`,`modelid`,`siteid`,`field`,`name`,`tips`,`css`,`minlength`,`maxlength`,`pattern`,`errortips`,`formtype`,`setting`,`formattribute`,`unsetgroupids`,`unsetroleids`,`iscore`,`issystem`,`isunique`,`isbase`,`issearch`,`isadd`,`isfulltext`,`isposition`,`listorder`,`disabled`,`isomnipotent`) values (73,1,1,'islink','转向链接','','',0,0,'','','islink','','','','',0,1,0,0,0,1,0,0,30,0,0);
insert  into `v9_model_field`(`fieldid`,`modelid`,`siteid`,`field`,`name`,`tips`,`css`,`minlength`,`maxlength`,`pattern`,`errortips`,`formtype`,`setting`,`formattribute`,`unsetgroupids`,`unsetroleids`,`iscore`,`issystem`,`isunique`,`isbase`,`issearch`,`isadd`,`isfulltext`,`isposition`,`listorder`,`disabled`,`isomnipotent`) values (74,2,1,'islink','转向链接','','',0,0,'','','islink','','','','',0,1,0,0,0,1,0,0,30,0,0);
insert  into `v9_model_field`(`fieldid`,`modelid`,`siteid`,`field`,`name`,`tips`,`css`,`minlength`,`maxlength`,`pattern`,`errortips`,`formtype`,`setting`,`formattribute`,`unsetgroupids`,`unsetroleids`,`iscore`,`issystem`,`isunique`,`isbase`,`issearch`,`isadd`,`isfulltext`,`isposition`,`listorder`,`disabled`,`isomnipotent`) values (75,3,1,'islink','转向链接','','',0,0,'','','islink','','','','',0,1,0,0,0,1,0,0,30,0,0);
insert  into `v9_model_field`(`fieldid`,`modelid`,`siteid`,`field`,`name`,`tips`,`css`,`minlength`,`maxlength`,`pattern`,`errortips`,`formtype`,`setting`,`formattribute`,`unsetgroupids`,`unsetroleids`,`iscore`,`issystem`,`isunique`,`isbase`,`issearch`,`isadd`,`isfulltext`,`isposition`,`listorder`,`disabled`,`isomnipotent`) values (83,10,1,'birthday','生日','','',0,0,'','生日格式错误','datetime','array (\n  \'fieldtype\' => \'date\',\n  \'format\' => \'Y-m-d\',\n  \'defaulttype\' => \'0\',\n)','','','',0,0,0,0,0,1,1,0,0,0,0);
insert  into `v9_model_field`(`fieldid`,`modelid`,`siteid`,`field`,`name`,`tips`,`css`,`minlength`,`maxlength`,`pattern`,`errortips`,`formtype`,`setting`,`formattribute`,`unsetgroupids`,`unsetroleids`,`iscore`,`issystem`,`isunique`,`isbase`,`issearch`,`isadd`,`isfulltext`,`isposition`,`listorder`,`disabled`,`isomnipotent`) values (84,11,1,'catid','栏目','','',1,6,'/^[0-9]{1,6}$/','请选择栏目','catid','array (\n  \'defaultvalue\' => \'\',\n)','','-99','-99',0,1,0,1,1,1,0,0,1,0,0);
insert  into `v9_model_field`(`fieldid`,`modelid`,`siteid`,`field`,`name`,`tips`,`css`,`minlength`,`maxlength`,`pattern`,`errortips`,`formtype`,`setting`,`formattribute`,`unsetgroupids`,`unsetroleids`,`iscore`,`issystem`,`isunique`,`isbase`,`issearch`,`isadd`,`isfulltext`,`isposition`,`listorder`,`disabled`,`isomnipotent`) values (85,11,1,'typeid','类别','','',0,0,'','','typeid','array (\n  \'minnumber\' => \'\',\n  \'defaultvalue\' => \'\',\n)','','','',0,1,0,1,1,1,0,0,2,0,0);
insert  into `v9_model_field`(`fieldid`,`modelid`,`siteid`,`field`,`name`,`tips`,`css`,`minlength`,`maxlength`,`pattern`,`errortips`,`formtype`,`setting`,`formattribute`,`unsetgroupids`,`unsetroleids`,`iscore`,`issystem`,`isunique`,`isbase`,`issearch`,`isadd`,`isfulltext`,`isposition`,`listorder`,`disabled`,`isomnipotent`) values (86,11,1,'title','标题','','inputtitle',1,80,'','请输入标题','title','array (\n)','','','',0,1,0,1,1,1,1,1,4,0,0);
insert  into `v9_model_field`(`fieldid`,`modelid`,`siteid`,`field`,`name`,`tips`,`css`,`minlength`,`maxlength`,`pattern`,`errortips`,`formtype`,`setting`,`formattribute`,`unsetgroupids`,`unsetroleids`,`iscore`,`issystem`,`isunique`,`isbase`,`issearch`,`isadd`,`isfulltext`,`isposition`,`listorder`,`disabled`,`isomnipotent`) values (87,11,1,'keywords','关键词','多关键词之间用空格或者“,”隔开','',0,40,'','','keyword','array (\n  \'size\' => \'100\',\n  \'defaultvalue\' => \'\',\n)','','-99','-99',0,1,0,1,1,1,1,0,7,0,0);
insert  into `v9_model_field`(`fieldid`,`modelid`,`siteid`,`field`,`name`,`tips`,`css`,`minlength`,`maxlength`,`pattern`,`errortips`,`formtype`,`setting`,`formattribute`,`unsetgroupids`,`unsetroleids`,`iscore`,`issystem`,`isunique`,`isbase`,`issearch`,`isadd`,`isfulltext`,`isposition`,`listorder`,`disabled`,`isomnipotent`) values (88,11,1,'description','摘要','','',0,255,'','','textarea','array (\n  \'width\' => \'98\',\n  \'height\' => \'46\',\n  \'defaultvalue\' => \'\',\n  \'enablehtml\' => \'0\',\n)','','','',0,1,0,1,0,1,1,1,10,0,0);
insert  into `v9_model_field`(`fieldid`,`modelid`,`siteid`,`field`,`name`,`tips`,`css`,`minlength`,`maxlength`,`pattern`,`errortips`,`formtype`,`setting`,`formattribute`,`unsetgroupids`,`unsetroleids`,`iscore`,`issystem`,`isunique`,`isbase`,`issearch`,`isadd`,`isfulltext`,`isposition`,`listorder`,`disabled`,`isomnipotent`) values (89,11,1,'updatetime','更新时间','','',0,0,'','','datetime','array (\n  \'dateformat\' => \'int\',\n  \'format\' => \'Y-m-d H:i:s\',\n  \'defaulttype\' => \'1\',\n  \'defaultvalue\' => \'\',\n)','','','',1,1,0,1,0,0,0,0,12,0,0);
insert  into `v9_model_field`(`fieldid`,`modelid`,`siteid`,`field`,`name`,`tips`,`css`,`minlength`,`maxlength`,`pattern`,`errortips`,`formtype`,`setting`,`formattribute`,`unsetgroupids`,`unsetroleids`,`iscore`,`issystem`,`isunique`,`isbase`,`issearch`,`isadd`,`isfulltext`,`isposition`,`listorder`,`disabled`,`isomnipotent`) values (90,11,1,'content','内容','<div class=\"content_attr\"><label><input name=\"add_introduce\" type=\"checkbox\"  value=\"1\" checked>是否截取内容</label><input type=\"text\" name=\"introcude_length\" value=\"200\" size=\"3\">字符至内容摘要\r\n<label><input type=\'checkbox\' name=\'auto_thumb\' value=\"1\" checked>是否获取内容第</label><input type=\"text\" name=\"auto_thumb_no\" value=\"1\" size=\"2\" class=\"\">张图片作为标题图片\r\n</div>','',0,999999,'','内容不能为空','editor','array (\n  \'toolbar\' => \'full\',\n  \'defaultvalue\' => \'\',\n  \'enablekeylink\' => \'1\',\n  \'replacenum\' => \'2\',\n  \'link_mode\' => \'0\',\n  \'enablesaveimage\' => \'1\',\n  \'height\' => \'\',\n  \'disabled_page\' => \'0\',\n)','','','',0,0,0,1,0,1,1,0,13,0,0);
insert  into `v9_model_field`(`fieldid`,`modelid`,`siteid`,`field`,`name`,`tips`,`css`,`minlength`,`maxlength`,`pattern`,`errortips`,`formtype`,`setting`,`formattribute`,`unsetgroupids`,`unsetroleids`,`iscore`,`issystem`,`isunique`,`isbase`,`issearch`,`isadd`,`isfulltext`,`isposition`,`listorder`,`disabled`,`isomnipotent`) values (91,11,1,'thumb','缩略图','','',0,100,'','','image','array (\n  \'size\' => \'50\',\n  \'defaultvalue\' => \'\',\n  \'show_type\' => \'1\',\n  \'upload_maxsize\' => \'1024\',\n  \'upload_allowext\' => \'jpg|jpeg|gif|png|bmp\',\n  \'watermark\' => \'0\',\n  \'isselectimage\' => \'1\',\n  \'images_width\' => \'\',\n  \'images_height\' => \'\',\n)','','','',0,1,0,0,0,1,0,1,14,0,0);
insert  into `v9_model_field`(`fieldid`,`modelid`,`siteid`,`field`,`name`,`tips`,`css`,`minlength`,`maxlength`,`pattern`,`errortips`,`formtype`,`setting`,`formattribute`,`unsetgroupids`,`unsetroleids`,`iscore`,`issystem`,`isunique`,`isbase`,`issearch`,`isadd`,`isfulltext`,`isposition`,`listorder`,`disabled`,`isomnipotent`) values (92,11,1,'relation','相关文章','','',0,0,'','','omnipotent','array (\n  \'formtext\' => \'<input type=\\\'hidden\\\' name=\\\'info[relation]\\\' id=\\\'relation\\\' value=\\\'{FIELD_VALUE}\\\' style=\\\'50\\\' >\r\n<ul class=\"list-dot\" id=\"relation_text\"></ul>\r\n<div>\r\n<input type=\\\'button\\\' value=\"添加相关\" onclick=\"omnipotent(\\\'selectid\\\',\\\'?m=content&c=content&a=public_relationlist&modelid={MODELID}\\\',\\\'添加相关文章\\\',1)\" class=\"button\" style=\"width:66px;\">\r\n<span class=\"edit_content\">\r\n<input type=\\\'button\\\' value=\"显示已有\" onclick=\"show_relation({MODELID},{ID})\" class=\"button\" style=\"width:66px;\">\r\n</span>\r\n</div>\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n)','','2,6,4,5,1,17,18,7','',0,0,0,0,0,0,1,0,15,0,0);
insert  into `v9_model_field`(`fieldid`,`modelid`,`siteid`,`field`,`name`,`tips`,`css`,`minlength`,`maxlength`,`pattern`,`errortips`,`formtype`,`setting`,`formattribute`,`unsetgroupids`,`unsetroleids`,`iscore`,`issystem`,`isunique`,`isbase`,`issearch`,`isadd`,`isfulltext`,`isposition`,`listorder`,`disabled`,`isomnipotent`) values (93,11,1,'pages','分页方式','','',0,0,'','','pages','array (\n)','','-99','-99',0,0,0,1,0,0,0,0,16,0,0);
insert  into `v9_model_field`(`fieldid`,`modelid`,`siteid`,`field`,`name`,`tips`,`css`,`minlength`,`maxlength`,`pattern`,`errortips`,`formtype`,`setting`,`formattribute`,`unsetgroupids`,`unsetroleids`,`iscore`,`issystem`,`isunique`,`isbase`,`issearch`,`isadd`,`isfulltext`,`isposition`,`listorder`,`disabled`,`isomnipotent`) values (94,11,1,'inputtime','发布时间','','',0,0,'','','datetime','array (\n  \'fieldtype\' => \'int\',\n  \'format\' => \'Y-m-d H:i:s\',\n  \'defaulttype\' => \'0\',\n)','','','',0,1,0,0,0,0,0,1,17,0,0);
insert  into `v9_model_field`(`fieldid`,`modelid`,`siteid`,`field`,`name`,`tips`,`css`,`minlength`,`maxlength`,`pattern`,`errortips`,`formtype`,`setting`,`formattribute`,`unsetgroupids`,`unsetroleids`,`iscore`,`issystem`,`isunique`,`isbase`,`issearch`,`isadd`,`isfulltext`,`isposition`,`listorder`,`disabled`,`isomnipotent`) values (95,11,1,'posids','推荐位','','',0,0,'','','posid','array (\n  \'cols\' => \'4\',\n  \'width\' => \'125\',\n)','','','',0,1,0,1,0,0,0,0,18,0,0);
insert  into `v9_model_field`(`fieldid`,`modelid`,`siteid`,`field`,`name`,`tips`,`css`,`minlength`,`maxlength`,`pattern`,`errortips`,`formtype`,`setting`,`formattribute`,`unsetgroupids`,`unsetroleids`,`iscore`,`issystem`,`isunique`,`isbase`,`issearch`,`isadd`,`isfulltext`,`isposition`,`listorder`,`disabled`,`isomnipotent`) values (96,11,1,'groupids_view','阅读权限','','',0,100,'','','groupid','array (\n  \'groupids\' => \'\',\n)','','','',0,0,0,1,0,0,0,0,19,0,0);
insert  into `v9_model_field`(`fieldid`,`modelid`,`siteid`,`field`,`name`,`tips`,`css`,`minlength`,`maxlength`,`pattern`,`errortips`,`formtype`,`setting`,`formattribute`,`unsetgroupids`,`unsetroleids`,`iscore`,`issystem`,`isunique`,`isbase`,`issearch`,`isadd`,`isfulltext`,`isposition`,`listorder`,`disabled`,`isomnipotent`) values (97,11,1,'url','URL','','',0,100,'','','text','array (\n)','','','',1,1,0,1,0,0,0,0,50,0,0);
insert  into `v9_model_field`(`fieldid`,`modelid`,`siteid`,`field`,`name`,`tips`,`css`,`minlength`,`maxlength`,`pattern`,`errortips`,`formtype`,`setting`,`formattribute`,`unsetgroupids`,`unsetroleids`,`iscore`,`issystem`,`isunique`,`isbase`,`issearch`,`isadd`,`isfulltext`,`isposition`,`listorder`,`disabled`,`isomnipotent`) values (98,11,1,'listorder','排序','','',0,6,'','','number','array (\n)','','','',1,1,0,1,0,0,0,0,51,0,0);
insert  into `v9_model_field`(`fieldid`,`modelid`,`siteid`,`field`,`name`,`tips`,`css`,`minlength`,`maxlength`,`pattern`,`errortips`,`formtype`,`setting`,`formattribute`,`unsetgroupids`,`unsetroleids`,`iscore`,`issystem`,`isunique`,`isbase`,`issearch`,`isadd`,`isfulltext`,`isposition`,`listorder`,`disabled`,`isomnipotent`) values (99,11,1,'template','内容页模板','','',0,30,'','','template','array (\n  \'size\' => \'\',\n  \'defaultvalue\' => \'\',\n)','','-99','-99',0,0,0,0,0,0,0,0,53,0,0);
insert  into `v9_model_field`(`fieldid`,`modelid`,`siteid`,`field`,`name`,`tips`,`css`,`minlength`,`maxlength`,`pattern`,`errortips`,`formtype`,`setting`,`formattribute`,`unsetgroupids`,`unsetroleids`,`iscore`,`issystem`,`isunique`,`isbase`,`issearch`,`isadd`,`isfulltext`,`isposition`,`listorder`,`disabled`,`isomnipotent`) values (100,11,1,'allow_comment','允许评论','','',0,0,'','','box','array (\n  \'options\' => \'允许评论|1\r\n不允许评论|0\',\n  \'boxtype\' => \'radio\',\n  \'fieldtype\' => \'tinyint\',\n  \'minnumber\' => \'1\',\n  \'width\' => \'88\',\n  \'size\' => \'1\',\n  \'defaultvalue\' => \'1\',\n  \'outputtype\' => \'0\',\n)','','','',0,0,0,0,0,0,0,0,54,0,0);
insert  into `v9_model_field`(`fieldid`,`modelid`,`siteid`,`field`,`name`,`tips`,`css`,`minlength`,`maxlength`,`pattern`,`errortips`,`formtype`,`setting`,`formattribute`,`unsetgroupids`,`unsetroleids`,`iscore`,`issystem`,`isunique`,`isbase`,`issearch`,`isadd`,`isfulltext`,`isposition`,`listorder`,`disabled`,`isomnipotent`) values (101,11,1,'status','状态','','',0,2,'','','box','array (\n)','','','',1,1,0,1,0,0,0,0,55,0,0);
insert  into `v9_model_field`(`fieldid`,`modelid`,`siteid`,`field`,`name`,`tips`,`css`,`minlength`,`maxlength`,`pattern`,`errortips`,`formtype`,`setting`,`formattribute`,`unsetgroupids`,`unsetroleids`,`iscore`,`issystem`,`isunique`,`isbase`,`issearch`,`isadd`,`isfulltext`,`isposition`,`listorder`,`disabled`,`isomnipotent`) values (102,11,1,'readpoint','阅读收费','','',0,5,'','','readpoint','array (\n  \'minnumber\' => \'1\',\n  \'maxnumber\' => \'99999\',\n  \'decimaldigits\' => \'0\',\n  \'defaultvalue\' => \'\',\n)','','-99','-99',0,0,0,0,0,0,0,0,55,0,0);
insert  into `v9_model_field`(`fieldid`,`modelid`,`siteid`,`field`,`name`,`tips`,`css`,`minlength`,`maxlength`,`pattern`,`errortips`,`formtype`,`setting`,`formattribute`,`unsetgroupids`,`unsetroleids`,`iscore`,`issystem`,`isunique`,`isbase`,`issearch`,`isadd`,`isfulltext`,`isposition`,`listorder`,`disabled`,`isomnipotent`) values (103,11,1,'username','用户名','','',0,20,'','','text','array (\n)','','','',1,1,0,1,0,0,0,0,98,0,0);
insert  into `v9_model_field`(`fieldid`,`modelid`,`siteid`,`field`,`name`,`tips`,`css`,`minlength`,`maxlength`,`pattern`,`errortips`,`formtype`,`setting`,`formattribute`,`unsetgroupids`,`unsetroleids`,`iscore`,`issystem`,`isunique`,`isbase`,`issearch`,`isadd`,`isfulltext`,`isposition`,`listorder`,`disabled`,`isomnipotent`) values (104,11,1,'islink','转向链接','','',0,0,'','','islink','array (\n)','','','',0,1,0,1,0,1,0,0,20,0,0);
insert  into `v9_model_field`(`fieldid`,`modelid`,`siteid`,`field`,`name`,`tips`,`css`,`minlength`,`maxlength`,`pattern`,`errortips`,`formtype`,`setting`,`formattribute`,`unsetgroupids`,`unsetroleids`,`iscore`,`issystem`,`isunique`,`isbase`,`issearch`,`isadd`,`isfulltext`,`isposition`,`listorder`,`disabled`,`isomnipotent`) values (105,11,1,'video','视频上传','','',0,0,'','','video','array (\n  \'upload_allowext\' => \'flv|rm|mp4|rmv\',\n)','','','',0,0,0,1,0,1,0,0,8,0,0);
insert  into `v9_model_field`(`fieldid`,`modelid`,`siteid`,`field`,`name`,`tips`,`css`,`minlength`,`maxlength`,`pattern`,`errortips`,`formtype`,`setting`,`formattribute`,`unsetgroupids`,`unsetroleids`,`iscore`,`issystem`,`isunique`,`isbase`,`issearch`,`isadd`,`isfulltext`,`isposition`,`listorder`,`disabled`,`isomnipotent`) values (106,11,1,'vision','画质','','',0,0,'','','box','array (\n  \'options\' => \'高清|1\r\n普通|2\',\n  \'boxtype\' => \'select\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n  \'width\' => \'80\',\n  \'size\' => \'1\',\n  \'defaultvalue\' => \'0\',\n  \'outputtype\' => \'1\',\n  \'filtertype\' => \'1\',\n)','','','',0,1,0,1,0,1,0,0,9,0,0);
insert  into `v9_model_field`(`fieldid`,`modelid`,`siteid`,`field`,`name`,`tips`,`css`,`minlength`,`maxlength`,`pattern`,`errortips`,`formtype`,`setting`,`formattribute`,`unsetgroupids`,`unsetroleids`,`iscore`,`issystem`,`isunique`,`isbase`,`issearch`,`isadd`,`isfulltext`,`isposition`,`listorder`,`disabled`,`isomnipotent`) values (107,11,1,'video_category','视频分类','','',0,0,'','','box','array (\n  \'options\' => \'喜剧|1\r\n爱情|2\r\n科幻|3\r\n剧情|4\r\n动作|5\r\n伦理|6\',\n  \'boxtype\' => \'select\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n  \'width\' => \'80\',\n  \'size\' => \'1\',\n  \'defaultvalue\' => \'1\',\n  \'outputtype\' => \'1\',\n  \'filtertype\' => \'1\',\n)','','','',0,1,0,1,0,1,0,0,9,0,0);

/*Table structure for table `v9_module` */

CREATE TABLE `v9_module` (
  `module` varchar(15) NOT NULL,
  `name` varchar(20) NOT NULL,
  `url` varchar(50) NOT NULL,
  `iscore` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `version` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL,
  `setting` mediumtext NOT NULL,
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `installdate` date NOT NULL DEFAULT '0000-00-00',
  `updatedate` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`module`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_module` */

insert  into `v9_module`(`module`,`name`,`url`,`iscore`,`version`,`description`,`setting`,`listorder`,`disabled`,`installdate`,`updatedate`) values ('admin','admin','',1,'1.0','','array (\n  \'admin_email\' => \'phpcms@phpcms.cn\',\n  \'adminaccessip\' => \'0\',\n  \'maxloginfailedtimes\' => \'8\',\n  \'maxiplockedtime\' => \'15\',\n  \'minrefreshtime\' => \'2\',\n  \'mail_type\' => \'1\',\n  \'mail_server\' => \'smtp.qq.com\',\n  \'mail_port\' => \'25\',\n  \'mail_user\' => \'phpcms.cn@foxmail.com\',\n  \'mail_auth\' => \'1\',\n  \'mail_from\' => \'phpcms.cn@foxmail.com\',\n  \'mail_password\' => \'\',\n  \'errorlog_size\' => \'20\',\n)',0,0,'2010-10-18','2010-10-18');
insert  into `v9_module`(`module`,`name`,`url`,`iscore`,`version`,`description`,`setting`,`listorder`,`disabled`,`installdate`,`updatedate`) values ('member','会员','',1,'1.0','','{\"allowregister\":\"0\",\"choosemodel\":\"1\",\"enablemailcheck\":\"0\",\"enablcodecheck\":\"0\",\"mobile_checktype\":\"0\",\"user_sendsms_title\":\"\",\"registerverify\":\"0\",\"showapppoint\":\"0\",\"rmb_point_rate\":\"10\",\"defualtpoint\":\"0\",\"defualtamount\":\"0\",\"showregprotocol\":\"0\",\"regprotocol\":\"\\t\\t \\u6b22\\u8fce\\u60a8\\u6ce8\\u518c\\u6210\\u4e3aphpcms\\u7528\\u6237\\r\\n\\u8bf7\\u4ed4\\u7ec6\\u9605\\u8bfb\\u4e0b\\u9762\\u7684\\u534f\\u8bae\\uff0c\\u53ea\\u6709\\u63a5\\u53d7\\u534f\\u8bae\\u624d\\u80fd\\u7ee7\\u7eed\\u8fdb\\u884c\\u6ce8\\u518c\\u3002 \\r\\n1\\uff0e\\u670d\\u52a1\\u6761\\u6b3e\\u7684\\u786e\\u8ba4\\u548c\\u63a5\\u7eb3\\r\\n\\u3000\\u3000phpcms\\u7528\\u6237\\u670d\\u52a1\\u7684\\u6240\\u6709\\u6743\\u548c\\u8fd0\\u4f5c\\u6743\\u5f52phpcms\\u62e5\\u6709\\u3002phpcms\\u6240\\u63d0\\u4f9b\\u7684\\u670d\\u52a1\\u5c06\\u6309\\u7167\\u6709\\u5173\\u7ae0\\u7a0b\\u3001\\u670d\\u52a1\\u6761\\u6b3e\\u548c\\u64cd\\u4f5c\\u89c4\\u5219\\u4e25\\u683c\\u6267\\u884c\\u3002\\u7528\\u6237\\u901a\\u8fc7\\u6ce8\\u518c\\u7a0b\\u5e8f\\u70b9\\u51fb\\u201c\\u6211\\u540c\\u610f\\u201d \\u6309\\u94ae\\uff0c\\u5373\\u8868\\u793a\\u7528\\u6237\\u4e0ephpcms\\u8fbe\\u6210\\u534f\\u8bae\\u5e76\\u63a5\\u53d7\\u6240\\u6709\\u7684\\u670d\\u52a1\\u6761\\u6b3e\\u3002\\r\\n2\\uff0e phpcms\\u670d\\u52a1\\u7b80\\u4ecb\\r\\n\\u3000\\u3000phpcms\\u901a\\u8fc7\\u56fd\\u9645\\u4e92\\u8054\\u7f51\\u4e3a\\u7528\\u6237\\u63d0\\u4f9b\\u65b0\\u95fb\\u53ca\\u6587\\u7ae0\\u6d4f\\u89c8\\u3001\\u56fe\\u7247\\u6d4f\\u89c8\\u3001\\u8f6f\\u4ef6\\u4e0b\\u8f7d\\u3001\\u7f51\\u4e0a\\u7559\\u8a00\\u548cBBS\\u8bba\\u575b\\u7b49\\u670d\\u52a1\\u3002\\r\\n\\u3000\\u3000\\u7528\\u6237\\u5fc5\\u987b\\uff1a \\r\\n\\u3000\\u30001)\\u8d2d\\u7f6e\\u8bbe\\u5907\\uff0c\\u5305\\u62ec\\u4e2a\\u4eba\\u7535\\u8111\\u4e00\\u53f0\\u3001\\u8c03\\u5236\\u89e3\\u8c03\\u5668\\u4e00\\u4e2a\\u53ca\\u914d\\u5907\\u4e0a\\u7f51\\u88c5\\u7f6e\\u3002 \\r\\n\\u3000\\u30002)\\u4e2a\\u4eba\\u4e0a\\u7f51\\u548c\\u652f\\u4ed8\\u4e0e\\u6b64\\u670d\\u52a1\\u6709\\u5173\\u7684\\u7535\\u8bdd\\u8d39\\u7528\\u3001\\u7f51\\u7edc\\u8d39\\u7528\\u3002\\r\\n\\u3000\\u3000\\u7528\\u6237\\u540c\\u610f\\uff1a \\r\\n\\u3000\\u30001)\\u63d0\\u4f9b\\u53ca\\u65f6\\u3001\\u8be6\\u5c3d\\u53ca\\u51c6\\u786e\\u7684\\u4e2a\\u4eba\\u8d44\\u6599\\u3002 \\r\\n\\u3000\\u30002)\\u4e0d\\u65ad\\u66f4\\u65b0\\u6ce8\\u518c\\u8d44\\u6599\\uff0c\\u7b26\\u5408\\u53ca\\u65f6\\u3001\\u8be6\\u5c3d\\u3001\\u51c6\\u786e\\u7684\\u8981\\u6c42\\u3002\\u6240\\u6709\\u539f\\u59cb\\u952e\\u5165\\u7684\\u8d44\\u6599\\u5c06\\u5f15\\u7528\\u4e3a\\u6ce8\\u518c\\u8d44\\u6599\\u3002 \\r\\n\\u3000\\u30003)\\u7528\\u6237\\u540c\\u610f\\u9075\\u5b88\\u300a\\u4e2d\\u534e\\u4eba\\u6c11\\u5171\\u548c\\u56fd\\u4fdd\\u5b88\\u56fd\\u5bb6\\u79d8\\u5bc6\\u6cd5\\u300b\\u3001\\u300a\\u4e2d\\u534e\\u4eba\\u6c11\\u5171\\u548c\\u56fd\\u8ba1\\u7b97\\u673a\\u4fe1\\u606f\\u7cfb\\u7edf\\u5b89\\u5168\\u4fdd\\u62a4\\u6761\\u4f8b\\u300b\\u3001\\u300a\\u8ba1\\u7b97\\u673a\\u8f6f\\u4ef6\\u4fdd\\u62a4\\u6761\\u4f8b\\u300b\\u7b49\\u6709\\u5173\\u8ba1\\u7b97\\u673a\\u53ca\\u4e92\\u8054\\u7f51\\u89c4\\u5b9a\\u7684\\u6cd5\\u5f8b\\u548c\\u6cd5\\u89c4\\u3001\\u5b9e\\u65bd\\u529e\\u6cd5\\u3002\\u5728\\u4efb\\u4f55\\u60c5\\u51b5\\u4e0b\\uff0cphpcms\\u5408\\u7406\\u5730\\u8ba4\\u4e3a\\u7528\\u6237\\u7684\\u884c\\u4e3a\\u53ef\\u80fd\\u8fdd\\u53cd\\u4e0a\\u8ff0\\u6cd5\\u5f8b\\u3001\\u6cd5\\u89c4\\uff0cphpcms\\u53ef\\u4ee5\\u5728\\u4efb\\u4f55\\u65f6\\u5019\\uff0c\\u4e0d\\u7ecf\\u4e8b\\u5148\\u901a\\u77e5\\u7ec8\\u6b62\\u5411\\u8be5\\u7528\\u6237\\u63d0\\u4f9b\\u670d\\u52a1\\u3002\\u7528\\u6237\\u5e94\\u4e86\\u89e3\\u56fd\\u9645\\u4e92\\u8054\\u7f51\\u7684\\u65e0\\u56fd\\u754c\\u6027\\uff0c\\u5e94\\u7279\\u522b\\u6ce8\\u610f\\u9075\\u5b88\\u5f53\\u5730\\u6240\\u6709\\u6709\\u5173\\u7684\\u6cd5\\u5f8b\\u548c\\u6cd5\\u89c4\\u3002\\r\\n3\\uff0e \\u670d\\u52a1\\u6761\\u6b3e\\u7684\\u4fee\\u6539\\r\\n\\u3000\\u3000phpcms\\u4f1a\\u4e0d\\u5b9a\\u65f6\\u5730\\u4fee\\u6539\\u670d\\u52a1\\u6761\\u6b3e\\uff0c\\u670d\\u52a1\\u6761\\u6b3e\\u4e00\\u65e6\\u53d1\\u751f\\u53d8\\u52a8\\uff0c\\u5c06\\u4f1a\\u5728\\u76f8\\u5173\\u9875\\u9762\\u4e0a\\u63d0\\u793a\\u4fee\\u6539\\u5185\\u5bb9\\u3002\\u5982\\u679c\\u60a8\\u540c\\u610f\\u6539\\u52a8\\uff0c\\u5219\\u518d\\u4e00\\u6b21\\u70b9\\u51fb\\u201c\\u6211\\u540c\\u610f\\u201d\\u6309\\u94ae\\u3002 \\u5982\\u679c\\u60a8\\u4e0d\\u63a5\\u53d7\\uff0c\\u5219\\u53ca\\u65f6\\u53d6\\u6d88\\u60a8\\u7684\\u7528\\u6237\\u4f7f\\u7528\\u670d\\u52a1\\u8d44\\u683c\\u3002\\r\\n4\\uff0e \\u670d\\u52a1\\u4fee\\u8ba2\\r\\n\\u3000\\u3000phpcms\\u4fdd\\u7559\\u968f\\u65f6\\u4fee\\u6539\\u6216\\u4e2d\\u65ad\\u670d\\u52a1\\u800c\\u4e0d\\u9700\\u77e5\\u7167\\u7528\\u6237\\u7684\\u6743\\u5229\\u3002phpcms\\u884c\\u4f7f\\u4fee\\u6539\\u6216\\u4e2d\\u65ad\\u670d\\u52a1\\u7684\\u6743\\u5229\\uff0c\\u4e0d\\u9700\\u5bf9\\u7528\\u6237\\u6216\\u7b2c\\u4e09\\u65b9\\u8d1f\\u8d23\\u3002\\r\\n5\\uff0e \\u7528\\u6237\\u9690\\u79c1\\u5236\\u5ea6\\r\\n\\u3000\\u3000\\u5c0a\\u91cd\\u7528\\u6237\\u4e2a\\u4eba\\u9690\\u79c1\\u662fphpcms\\u7684 \\u57fa\\u672c\\u653f\\u7b56\\u3002phpcms\\u4e0d\\u4f1a\\u516c\\u5f00\\u3001\\u7f16\\u8f91\\u6216\\u900f\\u9732\\u7528\\u6237\\u7684\\u6ce8\\u518c\\u4fe1\\u606f\\uff0c\\u9664\\u975e\\u6709\\u6cd5\\u5f8b\\u8bb8\\u53ef\\u8981\\u6c42\\uff0c\\u6216phpcms\\u5728\\u8bda\\u4fe1\\u7684\\u57fa\\u7840\\u4e0a\\u8ba4\\u4e3a\\u900f\\u9732\\u8fd9\\u4e9b\\u4fe1\\u606f\\u5728\\u4ee5\\u4e0b\\u4e09\\u79cd\\u60c5\\u51b5\\u662f\\u5fc5\\u8981\\u7684\\uff1a \\r\\n\\u3000\\u30001)\\u9075\\u5b88\\u6709\\u5173\\u6cd5\\u5f8b\\u89c4\\u5b9a\\uff0c\\u9075\\u4ece\\u5408\\u6cd5\\u670d\\u52a1\\u7a0b\\u5e8f\\u3002 \\r\\n\\u3000\\u30002)\\u4fdd\\u6301\\u7ef4\\u62a4phpcms\\u7684\\u5546\\u6807\\u6240\\u6709\\u6743\\u3002 \\r\\n\\u3000\\u30003)\\u5728\\u7d27\\u6025\\u60c5\\u51b5\\u4e0b\\u7aed\\u529b\\u7ef4\\u62a4\\u7528\\u6237\\u4e2a\\u4eba\\u548c\\u793e\\u4f1a\\u5927\\u4f17\\u7684\\u9690\\u79c1\\u5b89\\u5168\\u3002 \\r\\n\\u3000\\u30004)\\u7b26\\u5408\\u5176\\u4ed6\\u76f8\\u5173\\u7684\\u8981\\u6c42\\u3002 \\r\\n6\\uff0e\\u7528\\u6237\\u7684\\u5e10\\u53f7\\uff0c\\u5bc6\\u7801\\u548c\\u5b89\\u5168\\u6027\\r\\n\\u3000\\u3000\\u4e00\\u65e6\\u6ce8\\u518c\\u6210\\u529f\\u6210\\u4e3aphpcms\\u7528\\u6237\\uff0c\\u60a8\\u5c06\\u5f97\\u5230\\u4e00\\u4e2a\\u5bc6\\u7801\\u548c\\u5e10\\u53f7\\u3002\\u5982\\u679c\\u60a8\\u4e0d\\u4fdd\\u7ba1\\u597d\\u81ea\\u5df1\\u7684\\u5e10\\u53f7\\u548c\\u5bc6\\u7801\\u5b89\\u5168\\uff0c\\u5c06\\u5bf9\\u56e0\\u6b64\\u4ea7\\u751f\\u7684\\u540e\\u679c\\u8d1f\\u5168\\u90e8\\u8d23\\u4efb\\u3002\\u53e6\\u5916\\uff0c\\u6bcf\\u4e2a\\u7528\\u6237\\u90fd\\u8981\\u5bf9\\u5176\\u5e10\\u6237\\u4e2d\\u7684\\u6240\\u6709\\u6d3b\\u52a8\\u548c\\u4e8b\\u4ef6\\u8d1f\\u5168\\u8d23\\u3002\\u60a8\\u53ef\\u968f\\u65f6\\u6839\\u636e\\u6307\\u793a\\u6539\\u53d8\\u60a8\\u7684\\u5bc6\\u7801\\uff0c\\u4e5f\\u53ef\\u4ee5\\u7ed3\\u675f\\u65e7\\u7684\\u5e10\\u6237\\u91cd\\u5f00\\u4e00\\u4e2a\\u65b0\\u5e10\\u6237\\u3002\\u7528\\u6237\\u540c\\u610f\\u82e5\\u53d1\\u73b0\\u4efb\\u4f55\\u975e\\u6cd5\\u4f7f\\u7528\\u7528\\u6237\\u5e10\\u53f7\\u6216\\u5b89\\u5168\\u6f0f\\u6d1e\\u7684\\u60c5\\u51b5\\uff0c\\u7acb\\u5373\\u901a\\u77e5phpcms\\u3002\\r\\n7\\uff0e \\u514d\\u8d23\\u6761\\u6b3e\\r\\n\\u3000\\u3000\\u7528\\u6237\\u660e\\u786e\\u540c\\u610f\\u7f51\\u7ad9\\u670d\\u52a1\\u7684\\u4f7f\\u7528\\u7531\\u7528\\u6237\\u4e2a\\u4eba\\u627f\\u62c5\\u98ce\\u9669\\u3002 \\u3000\\u3000 \\r\\n\\u3000\\u3000phpcms\\u4e0d\\u4f5c\\u4efb\\u4f55\\u7c7b\\u578b\\u7684\\u62c5\\u4fdd\\uff0c\\u4e0d\\u62c5\\u4fdd\\u670d\\u52a1\\u4e00\\u5b9a\\u80fd\\u6ee1\\u8db3\\u7528\\u6237\\u7684\\u8981\\u6c42\\uff0c\\u4e5f\\u4e0d\\u62c5\\u4fdd\\u670d\\u52a1\\u4e0d\\u4f1a\\u53d7\\u4e2d\\u65ad\\uff0c\\u5bf9\\u670d\\u52a1\\u7684\\u53ca\\u65f6\\u6027\\uff0c\\u5b89\\u5168\\u6027\\uff0c\\u51fa\\u9519\\u53d1\\u751f\\u90fd\\u4e0d\\u4f5c\\u62c5\\u4fdd\\u3002\\u7528\\u6237\\u7406\\u89e3\\u5e76\\u63a5\\u53d7\\uff1a\\u4efb\\u4f55\\u901a\\u8fc7phpcms\\u670d\\u52a1\\u53d6\\u5f97\\u7684\\u4fe1\\u606f\\u8d44\\u6599\\u7684\\u53ef\\u9760\\u6027\\u53d6\\u51b3\\u4e8e\\u7528\\u6237\\u81ea\\u5df1\\uff0c\\u7528\\u6237\\u81ea\\u5df1\\u627f\\u62c5\\u6240\\u6709\\u98ce\\u9669\\u548c\\u8d23\\u4efb\\u3002 \\r\\n8\\uff0e\\u6709\\u9650\\u8d23\\u4efb\\r\\n\\u3000\\u3000phpcms\\u5bf9\\u4efb\\u4f55\\u76f4\\u63a5\\u3001\\u95f4\\u63a5\\u3001\\u5076\\u7136\\u3001\\u7279\\u6b8a\\u53ca\\u7ee7\\u8d77\\u7684\\u635f\\u5bb3\\u4e0d\\u8d1f\\u8d23\\u4efb\\u3002\\r\\n9\\uff0e \\u4e0d\\u63d0\\u4f9b\\u96f6\\u552e\\u548c\\u5546\\u4e1a\\u6027\\u670d\\u52a1 \\r\\n\\u3000\\u3000\\u7528\\u6237\\u4f7f\\u7528\\u7f51\\u7ad9\\u670d\\u52a1\\u7684\\u6743\\u5229\\u662f\\u4e2a\\u4eba\\u7684\\u3002\\u7528\\u6237\\u53ea\\u80fd\\u662f\\u4e00\\u4e2a\\u5355\\u72ec\\u7684\\u4e2a\\u4f53\\u800c\\u4e0d\\u80fd\\u662f\\u4e00\\u4e2a\\u516c\\u53f8\\u6216\\u5b9e\\u4f53\\u5546\\u4e1a\\u6027\\u7ec4\\u7ec7\\u3002\\u7528\\u6237\\u627f\\u8bfa\\u4e0d\\u7ecfphpcms\\u540c\\u610f\\uff0c\\u4e0d\\u80fd\\u5229\\u7528\\u7f51\\u7ad9\\u670d\\u52a1\\u8fdb\\u884c\\u9500\\u552e\\u6216\\u5176\\u4ed6\\u5546\\u4e1a\\u7528\\u9014\\u3002\\r\\n10\\uff0e\\u7528\\u6237\\u8d23\\u4efb \\r\\n\\u3000\\u3000\\u7528\\u6237\\u5355\\u72ec\\u627f\\u62c5\\u4f20\\u8f93\\u5185\\u5bb9\\u7684\\u8d23\\u4efb\\u3002\\u7528\\u6237\\u5fc5\\u987b\\u9075\\u5faa\\uff1a \\r\\n\\u3000\\u30001)\\u4ece\\u4e2d\\u56fd\\u5883\\u5185\\u5411\\u5916\\u4f20\\u8f93\\u6280\\u672f\\u6027\\u8d44\\u6599\\u65f6\\u5fc5\\u987b\\u7b26\\u5408\\u4e2d\\u56fd\\u6709\\u5173\\u6cd5\\u89c4\\u3002 \\r\\n\\u3000\\u30002)\\u4f7f\\u7528\\u7f51\\u7ad9\\u670d\\u52a1\\u4e0d\\u4f5c\\u975e\\u6cd5\\u7528\\u9014\\u3002 \\r\\n\\u3000\\u30003)\\u4e0d\\u5e72\\u6270\\u6216\\u6df7\\u4e71\\u7f51\\u7edc\\u670d\\u52a1\\u3002 \\r\\n\\u3000\\u30004)\\u4e0d\\u5728\\u8bba\\u575bBBS\\u6216\\u7559\\u8a00\\u7c3f\\u53d1\\u8868\\u4efb\\u4f55\\u4e0e\\u653f\\u6cbb\\u76f8\\u5173\\u7684\\u4fe1\\u606f\\u3002 \\r\\n\\u3000\\u30005)\\u9075\\u5b88\\u6240\\u6709\\u4f7f\\u7528\\u7f51\\u7ad9\\u670d\\u52a1\\u7684\\u7f51\\u7edc\\u534f\\u8bae\\u3001\\u89c4\\u5b9a\\u3001\\u7a0b\\u5e8f\\u548c\\u60ef\\u4f8b\\u3002\\r\\n\\u3000\\u30006)\\u4e0d\\u5f97\\u5229\\u7528\\u672c\\u7ad9\\u5371\\u5bb3\\u56fd\\u5bb6\\u5b89\\u5168\\u3001\\u6cc4\\u9732\\u56fd\\u5bb6\\u79d8\\u5bc6\\uff0c\\u4e0d\\u5f97\\u4fb5\\u72af\\u56fd\\u5bb6\\u793e\\u4f1a\\u96c6\\u4f53\\u7684\\u548c\\u516c\\u6c11\\u7684\\u5408\\u6cd5\\u6743\\u76ca\\u3002\\r\\n\\u3000\\u30007)\\u4e0d\\u5f97\\u5229\\u7528\\u672c\\u7ad9\\u5236\\u4f5c\\u3001\\u590d\\u5236\\u548c\\u4f20\\u64ad\\u4e0b\\u5217\\u4fe1\\u606f\\uff1a \\r\\n\\u3000\\u3000\\u30001\\u3001\\u717d\\u52a8\\u6297\\u62d2\\u3001\\u7834\\u574f\\u5baa\\u6cd5\\u548c\\u6cd5\\u5f8b\\u3001\\u884c\\u653f\\u6cd5\\u89c4\\u5b9e\\u65bd\\u7684\\uff1b\\r\\n\\u3000\\u3000\\u30002\\u3001\\u717d\\u52a8\\u98a0\\u8986\\u56fd\\u5bb6\\u653f\\u6743\\uff0c\\u63a8\\u7ffb\\u793e\\u4f1a\\u4e3b\\u4e49\\u5236\\u5ea6\\u7684\\uff1b\\r\\n\\u3000\\u3000\\u30003\\u3001\\u717d\\u52a8\\u5206\\u88c2\\u56fd\\u5bb6\\u3001\\u7834\\u574f\\u56fd\\u5bb6\\u7edf\\u4e00\\u7684\\uff1b\\r\\n\\u3000\\u3000\\u30004\\u3001\\u717d\\u52a8\\u6c11\\u65cf\\u4ec7\\u6068\\u3001\\u6c11\\u65cf\\u6b67\\u89c6\\uff0c\\u7834\\u574f\\u6c11\\u65cf\\u56e2\\u7ed3\\u7684\\uff1b\\r\\n\\u3000\\u3000\\u30005\\u3001\\u634f\\u9020\\u6216\\u8005\\u6b6a\\u66f2\\u4e8b\\u5b9e\\uff0c\\u6563\\u5e03\\u8c23\\u8a00\\uff0c\\u6270\\u4e71\\u793e\\u4f1a\\u79e9\\u5e8f\\u7684\\uff1b\\r\\n\\u3000\\u3000\\u30006\\u3001\\u5ba3\\u626c\\u5c01\\u5efa\\u8ff7\\u4fe1\\u3001\\u6deb\\u79fd\\u3001\\u8272\\u60c5\\u3001\\u8d4c\\u535a\\u3001\\u66b4\\u529b\\u3001\\u51f6\\u6740\\u3001\\u6050\\u6016\\u3001\\u6559\\u5506\\u72af\\u7f6a\\u7684\\uff1b\\r\\n\\u3000\\u3000\\u30007\\u3001\\u516c\\u7136\\u4fae\\u8fb1\\u4ed6\\u4eba\\u6216\\u8005\\u634f\\u9020\\u4e8b\\u5b9e\\u8bfd\\u8c24\\u4ed6\\u4eba\\u7684\\uff0c\\u6216\\u8005\\u8fdb\\u884c\\u5176\\u4ed6\\u6076\\u610f\\u653b\\u51fb\\u7684\\uff1b\\r\\n\\u3000\\u3000\\u30008\\u3001\\u635f\\u5bb3\\u56fd\\u5bb6\\u673a\\u5173\\u4fe1\\u8a89\\u7684\\uff1b\\r\\n\\u3000\\u3000\\u30009\\u3001\\u5176\\u4ed6\\u8fdd\\u53cd\\u5baa\\u6cd5\\u548c\\u6cd5\\u5f8b\\u884c\\u653f\\u6cd5\\u89c4\\u7684\\uff1b\\r\\n\\u3000\\u3000\\u300010\\u3001\\u8fdb\\u884c\\u5546\\u4e1a\\u5e7f\\u544a\\u884c\\u4e3a\\u7684\\u3002\\r\\n\\u3000\\u3000\\u7528\\u6237\\u4e0d\\u80fd\\u4f20\\u8f93\\u4efb\\u4f55\\u6559\\u5506\\u4ed6\\u4eba\\u6784\\u6210\\u72af\\u7f6a\\u884c\\u4e3a\\u7684\\u8d44\\u6599\\uff1b\\u4e0d\\u80fd\\u4f20\\u8f93\\u957f\\u56fd\\u5185\\u4e0d\\u5229\\u6761\\u4ef6\\u548c\\u6d89\\u53ca\\u56fd\\u5bb6\\u5b89\\u5168\\u7684\\u8d44\\u6599\\uff1b\\u4e0d\\u80fd\\u4f20\\u8f93\\u4efb\\u4f55\\u4e0d\\u7b26\\u5408\\u5f53\\u5730\\u6cd5\\u89c4\\u3001\\u56fd\\u5bb6\\u6cd5\\u5f8b\\u548c\\u56fd\\u9645\\u6cd5 \\u5f8b\\u7684\\u8d44\\u6599\\u3002\\u672a\\u7ecf\\u8bb8\\u53ef\\u800c\\u975e\\u6cd5\\u8fdb\\u5165\\u5176\\u5b83\\u7535\\u8111\\u7cfb\\u7edf\\u662f\\u7981\\u6b62\\u7684\\u3002\\u82e5\\u7528\\u6237\\u7684\\u884c\\u4e3a\\u4e0d\\u7b26\\u5408\\u4ee5\\u4e0a\\u7684\\u6761\\u6b3e\\uff0cphpcms\\u5c06\\u53d6\\u6d88\\u7528\\u6237\\u670d\\u52a1\\u5e10\\u53f7\\u3002\\r\\n11\\uff0e\\u7f51\\u7ad9\\u5185\\u5bb9\\u7684\\u6240\\u6709\\u6743\\r\\n\\u3000\\u3000phpcms\\u5b9a\\u4e49\\u7684\\u5185\\u5bb9\\u5305\\u62ec\\uff1a\\u6587\\u5b57\\u3001\\u8f6f\\u4ef6\\u3001\\u58f0\\u97f3\\u3001\\u76f8\\u7247\\u3001\\u5f55\\u8c61\\u3001\\u56fe\\u8868\\uff1b\\u5728\\u5e7f\\u544a\\u4e2d\\u5168\\u90e8\\u5185\\u5bb9\\uff1b\\u7535\\u5b50\\u90ae\\u4ef6\\u7684\\u5168\\u90e8\\u5185\\u5bb9\\uff1bphpcms\\u4e3a\\u7528\\u6237\\u63d0\\u4f9b\\u7684\\u5546\\u4e1a\\u4fe1\\u606f\\u3002\\u6240\\u6709\\u8fd9\\u4e9b\\u5185\\u5bb9\\u53d7\\u7248\\u6743\\u3001\\u5546\\u6807\\u3001\\u6807\\u7b7e\\u548c\\u5176\\u5b83\\u8d22\\u4ea7\\u6240\\u6709\\u6743\\u6cd5\\u5f8b\\u7684\\u4fdd\\u62a4\\u3002\\u6240\\u4ee5\\uff0c\\u7528\\u6237\\u53ea\\u80fd\\u5728phpcms\\u548c\\u5e7f\\u544a\\u5546\\u6388\\u6743\\u4e0b\\u624d\\u80fd\\u4f7f\\u7528\\u8fd9\\u4e9b\\u5185\\u5bb9\\uff0c\\u800c\\u4e0d\\u80fd\\u64c5\\u81ea\\u590d\\u5236\\u3001\\u7be1\\u6539\\u8fd9\\u4e9b\\u5185\\u5bb9\\u3001\\u6216\\u521b\\u9020\\u4e0e\\u5185\\u5bb9\\u6709\\u5173\\u7684\\u6d3e\\u751f\\u4ea7\\u54c1\\u3002\\r\\n12\\uff0e\\u9644\\u52a0\\u4fe1\\u606f\\u670d\\u52a1\\r\\n\\u3000\\u3000\\u7528\\u6237\\u5728\\u4eab\\u7528phpcms\\u63d0\\u4f9b\\u7684\\u514d\\u8d39\\u670d\\u52a1\\u7684\\u540c\\u65f6\\uff0c\\u540c\\u610f\\u63a5\\u53d7phpcms\\u63d0\\u4f9b\\u7684\\u5404\\u7c7b\\u9644\\u52a0\\u4fe1\\u606f\\u670d\\u52a1\\u3002\\r\\n13\\uff0e\\u89e3\\u91ca\\u6743\\r\\n\\u3000\\u3000\\u672c\\u6ce8\\u518c\\u534f\\u8bae\\u7684\\u89e3\\u91ca\\u6743\\u5f52phpcms\\u6240\\u6709\\u3002\\u5982\\u679c\\u5176\\u4e2d\\u6709\\u4efb\\u4f55\\u6761\\u6b3e\\u4e0e\\u56fd\\u5bb6\\u7684\\u6709\\u5173\\u6cd5\\u5f8b\\u76f8\\u62b5\\u89e6\\uff0c\\u5219\\u4ee5\\u56fd\\u5bb6\\u6cd5\\u5f8b\\u7684\\u660e\\u6587\\u89c4\\u5b9a\\u4e3a\\u51c6\\u3002 \",\"registerverifymessage\":\" \\u6b22\\u8fce\\u60a8\\u6ce8\\u518c\\u6210\\u4e3aphpcms\\u7528\\u6237\\uff0c\\u60a8\\u7684\\u8d26\\u53f7\\u9700\\u8981\\u90ae\\u7bb1\\u8ba4\\u8bc1\\uff0c\\u70b9\\u51fb\\u4e0b\\u9762\\u94fe\\u63a5\\u8fdb\\u884c\\u8ba4\\u8bc1\\uff1a{click}\\r\\n\\u6216\\u8005\\u5c06\\u7f51\\u5740\\u590d\\u5236\\u5230\\u6d4f\\u89c8\\u5668\\uff1a{url}\",\"forgetpassword\":\" phpcms\\u5bc6\\u7801\\u627e\\u56de\\uff0c\\u8bf7\\u5728\\u4e00\\u5c0f\\u65f6\\u5185\\u70b9\\u51fb\\u4e0b\\u9762\\u94fe\\u63a5\\u8fdb\\u884c\\u64cd\\u4f5c\\uff1a{click}\\r\\n\\u6216\\u8005\\u5c06\\u7f51\\u5740\\u590d\\u5236\\u5230\\u6d4f\\u89c8\\u5668\\uff1a{url}\"}',0,0,'2010-09-06','2010-09-06');
insert  into `v9_module`(`module`,`name`,`url`,`iscore`,`version`,`description`,`setting`,`listorder`,`disabled`,`installdate`,`updatedate`) values ('pay','支付','',1,'1.0','','',0,0,'2010-09-06','2010-09-06');
insert  into `v9_module`(`module`,`name`,`url`,`iscore`,`version`,`description`,`setting`,`listorder`,`disabled`,`installdate`,`updatedate`) values ('digg','顶一下','',0,'1.0','','',0,0,'2010-09-06','2010-09-06');
insert  into `v9_module`(`module`,`name`,`url`,`iscore`,`version`,`description`,`setting`,`listorder`,`disabled`,`installdate`,`updatedate`) values ('special','专题','',0,'1.0','','',0,0,'2010-09-06','2010-09-06');
insert  into `v9_module`(`module`,`name`,`url`,`iscore`,`version`,`description`,`setting`,`listorder`,`disabled`,`installdate`,`updatedate`) values ('content','内容模块','',1,'1.0','','',0,0,'2010-09-06','2010-09-06');
insert  into `v9_module`(`module`,`name`,`url`,`iscore`,`version`,`description`,`setting`,`listorder`,`disabled`,`installdate`,`updatedate`) values ('search','全站搜索','',0,'1.0','','array (\n  \'fulltextenble\' => \'1\',\n  \'relationenble\' => \'1\',\n  \'suggestenable\' => \'1\',\n  \'sphinxenable\' => \'0\',\n  \'sphinxhost\' => \'10.228.134.102\',\n  \'sphinxport\' => \'9312\',\n)',0,0,'2010-09-06','2010-09-06');
insert  into `v9_module`(`module`,`name`,`url`,`iscore`,`version`,`description`,`setting`,`listorder`,`disabled`,`installdate`,`updatedate`) values ('scan','木马扫描','scan',0,'1.0','','',0,0,'2010-09-01','2010-09-06');
insert  into `v9_module`(`module`,`name`,`url`,`iscore`,`version`,`description`,`setting`,`listorder`,`disabled`,`installdate`,`updatedate`) values ('attachment','附件','attachment',1,'1.0','','',0,0,'2010-09-01','2010-09-06');
insert  into `v9_module`(`module`,`name`,`url`,`iscore`,`version`,`description`,`setting`,`listorder`,`disabled`,`installdate`,`updatedate`) values ('block','碎片','',1,'1.0','','',0,0,'2010-09-01','2010-09-06');
insert  into `v9_module`(`module`,`name`,`url`,`iscore`,`version`,`description`,`setting`,`listorder`,`disabled`,`installdate`,`updatedate`) values ('collection','采集模块','collection',1,'1.0','','',0,0,'2010-09-01','2010-09-06');
insert  into `v9_module`(`module`,`name`,`url`,`iscore`,`version`,`description`,`setting`,`listorder`,`disabled`,`installdate`,`updatedate`) values ('dbsource','数据源','',1,'','','',0,0,'2010-09-01','2010-09-06');
insert  into `v9_module`(`module`,`name`,`url`,`iscore`,`version`,`description`,`setting`,`listorder`,`disabled`,`installdate`,`updatedate`) values ('template','模板风格','',1,'1.0','','',0,0,'2010-09-01','2010-09-06');
insert  into `v9_module`(`module`,`name`,`url`,`iscore`,`version`,`description`,`setting`,`listorder`,`disabled`,`installdate`,`updatedate`) values ('release','发布点','',1,'1.0','','',0,0,'2010-09-01','2010-09-06');
insert  into `v9_module`(`module`,`name`,`url`,`iscore`,`version`,`description`,`setting`,`listorder`,`disabled`,`installdate`,`updatedate`) values ('video','视频库','',0,'1.0','','',0,0,'2012-09-28','2012-09-28');
insert  into `v9_module`(`module`,`name`,`url`,`iscore`,`version`,`description`,`setting`,`listorder`,`disabled`,`installdate`,`updatedate`) values ('announce','公告','announce/',0,'1.0','公告','',0,0,'2016-06-06','2016-06-06');
insert  into `v9_module`(`module`,`name`,`url`,`iscore`,`version`,`description`,`setting`,`listorder`,`disabled`,`installdate`,`updatedate`) values ('comment','评论','comment/',0,'1.0','评论','',0,0,'2016-06-06','2016-06-06');
insert  into `v9_module`(`module`,`name`,`url`,`iscore`,`version`,`description`,`setting`,`listorder`,`disabled`,`installdate`,`updatedate`) values ('link','友情链接','',0,'1.0','','array (\n  1 => \n  array (\n    \'is_post\' => \'1\',\n    \'enablecheckcode\' => \'0\',\n  ),\n)',0,0,'2010-09-06','2010-09-06');
insert  into `v9_module`(`module`,`name`,`url`,`iscore`,`version`,`description`,`setting`,`listorder`,`disabled`,`installdate`,`updatedate`) values ('vote','投票','',0,'1.0','','array (\r\n  1 => \r\n  array (\r\n    \'default_style\' => \'default\',\r\n    \'vote_tp_template\' => \'vote_tp\',\r\n    \'allowguest\' => \'1\',\r\n    \'enabled\' => \'1\',\r\n    \'interval\' => \'1\',\r\n    \'credit\' => \'1\',\r\n  ),\r\n)',0,0,'2010-09-06','2010-09-06');
insert  into `v9_module`(`module`,`name`,`url`,`iscore`,`version`,`description`,`setting`,`listorder`,`disabled`,`installdate`,`updatedate`) values ('message','短消息','',0,'1.0','','',0,0,'2010-09-06','2010-09-06');
insert  into `v9_module`(`module`,`name`,`url`,`iscore`,`version`,`description`,`setting`,`listorder`,`disabled`,`installdate`,`updatedate`) values ('mood','新闻心情','mood/',0,'1.0','新闻心情','',0,0,'2016-06-06','2016-06-06');
insert  into `v9_module`(`module`,`name`,`url`,`iscore`,`version`,`description`,`setting`,`listorder`,`disabled`,`installdate`,`updatedate`) values ('poster','广告模块','poster/',0,'1.0','广告模块','',0,0,'2016-06-06','2016-06-06');
insert  into `v9_module`(`module`,`name`,`url`,`iscore`,`version`,`description`,`setting`,`listorder`,`disabled`,`installdate`,`updatedate`) values ('formguide','表单向导','formguide/',0,'1.0','formguide','array (\n  \'allowmultisubmit\' => \'1\',\n  \'interval\' => \'30\',\n  \'allowunreg\' => \'0\',\n  \'mailmessage\' => \'用户向我们提交了表单数据，赶快去看看吧。\',\n)',0,0,'2010-10-20','2010-10-20');
insert  into `v9_module`(`module`,`name`,`url`,`iscore`,`version`,`description`,`setting`,`listorder`,`disabled`,`installdate`,`updatedate`) values ('wap','手机门户','wap/',0,'1.0','手机门户','',0,0,'2016-06-06','2016-06-06');
insert  into `v9_module`(`module`,`name`,`url`,`iscore`,`version`,`description`,`setting`,`listorder`,`disabled`,`installdate`,`updatedate`) values ('upgrade','在线升级','',0,'1.0','','',0,0,'2011-05-18','2011-05-18');
insert  into `v9_module`(`module`,`name`,`url`,`iscore`,`version`,`description`,`setting`,`listorder`,`disabled`,`installdate`,`updatedate`) values ('tag','标签向导','tag/',0,'1.0','标签向导','',0,0,'2016-06-06','2016-06-06');
insert  into `v9_module`(`module`,`name`,`url`,`iscore`,`version`,`description`,`setting`,`listorder`,`disabled`,`installdate`,`updatedate`) values ('sms','短信平台','sms/',0,'1.0','短信平台','',0,0,'2011-09-02','2011-09-02');

/*Table structure for table `v9_mood` */

CREATE TABLE `v9_mood` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `catid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '栏目id',
  `siteid` mediumint(6) unsigned NOT NULL DEFAULT '0' COMMENT '站点ID',
  `contentid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文章id',
  `total` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '总数',
  `n1` int(10) unsigned NOT NULL DEFAULT '0',
  `n2` int(10) unsigned NOT NULL DEFAULT '0',
  `n3` int(10) unsigned NOT NULL DEFAULT '0',
  `n4` int(10) unsigned NOT NULL DEFAULT '0',
  `n5` int(10) unsigned NOT NULL DEFAULT '0',
  `n6` int(10) unsigned NOT NULL DEFAULT '0',
  `n7` int(10) unsigned NOT NULL DEFAULT '0',
  `n8` int(10) unsigned NOT NULL DEFAULT '0',
  `n9` int(10) unsigned NOT NULL DEFAULT '0',
  `n10` int(10) unsigned NOT NULL DEFAULT '0',
  `lastupdate` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后更新时间',
  PRIMARY KEY (`id`),
  KEY `total` (`total`),
  KEY `lastupdate` (`lastupdate`),
  KEY `catid` (`catid`,`siteid`,`contentid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_mood` */

/*Table structure for table `v9_news` */

CREATE TABLE `v9_news` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `typeid` smallint(5) unsigned NOT NULL,
  `title` varchar(80) NOT NULL DEFAULT '',
  `style` char(24) NOT NULL DEFAULT '',
  `thumb` varchar(100) NOT NULL DEFAULT '',
  `keywords` char(40) NOT NULL DEFAULT '',
  `description` mediumtext NOT NULL,
  `posids` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` char(100) NOT NULL,
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `sysadd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `islink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `status` (`status`,`listorder`,`id`),
  KEY `listorder` (`catid`,`status`,`listorder`,`id`),
  KEY `catid` (`catid`,`status`,`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `v9_news` */

insert  into `v9_news`(`id`,`catid`,`typeid`,`title`,`style`,`thumb`,`keywords`,`description`,`posids`,`url`,`listorder`,`status`,`sysadd`,`islink`,`username`,`inputtime`,`updatetime`) values (1,6,0,'aaa','','http://phpcms_centos.com/uploadfile/2016/0607/20160607011046646.png','aaa','aa',0,'http://phpcms_centos.com/index.php?m=content&c=index&a=show&catid=6&id=1',0,99,1,0,'phpcms',1465276231,1465276251);

/*Table structure for table `v9_news_data` */

CREATE TABLE `v9_news_data` (
  `id` mediumint(8) unsigned DEFAULT '0',
  `content` mediumtext NOT NULL,
  `readpoint` smallint(5) unsigned NOT NULL DEFAULT '0',
  `groupids_view` varchar(100) NOT NULL,
  `paginationtype` tinyint(1) NOT NULL,
  `maxcharperpage` mediumint(6) NOT NULL,
  `template` varchar(30) NOT NULL,
  `paytype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `relation` varchar(255) NOT NULL DEFAULT '',
  `voteid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `allow_comment` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `copyfrom` varchar(100) NOT NULL DEFAULT '',
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_news_data` */

insert  into `v9_news_data`(`id`,`content`,`readpoint`,`groupids_view`,`paginationtype`,`maxcharperpage`,`template`,`paytype`,`relation`,`voteid`,`allow_comment`,`copyfrom`) values (1,'aaa',0,'',0,10000,'',0,'',0,1,'|0');

/*Table structure for table `v9_page` */

CREATE TABLE `v9_page` (
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `title` varchar(160) NOT NULL,
  `style` varchar(24) NOT NULL,
  `keywords` varchar(40) NOT NULL,
  `content` text NOT NULL,
  `template` varchar(30) NOT NULL,
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_page` */

insert  into `v9_page`(`catid`,`title`,`style`,`keywords`,`content`,`template`,`updatetime`) values (2,'dd斯蒂芬森',';','dd时代发生的','dddd斯蒂芬森','',0);
insert  into `v9_page`(`catid`,`title`,`style`,`keywords`,`content`,`template`,`updatetime`) values (3,'时代发生地方',';','地方 时代','水电费','',0);
insert  into `v9_page`(`catid`,`title`,`style`,`keywords`,`content`,`template`,`updatetime`) values (4,'时代发生的',';','时代发生的','时代发生的','',0);
insert  into `v9_page`(`catid`,`title`,`style`,`keywords`,`content`,`template`,`updatetime`) values (5,'双方都是对方身份舒服',';','双方 对方 身份','是对方的手','',0);

/*Table structure for table `v9_pay_account` */

CREATE TABLE `v9_pay_account` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `trade_sn` char(50) NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `contactname` char(50) NOT NULL,
  `email` char(40) NOT NULL,
  `telephone` char(20) NOT NULL,
  `discount` float(8,2) NOT NULL DEFAULT '0.00',
  `money` char(8) NOT NULL,
  `quantity` int(8) unsigned NOT NULL DEFAULT '1',
  `addtime` int(10) NOT NULL DEFAULT '0',
  `paytime` int(10) NOT NULL DEFAULT '0',
  `usernote` char(255) NOT NULL,
  `pay_id` tinyint(3) NOT NULL,
  `pay_type` enum('offline','recharge','selfincome','online') NOT NULL DEFAULT 'recharge',
  `payment` char(90) NOT NULL,
  `type` tinyint(3) NOT NULL DEFAULT '1',
  `ip` char(15) NOT NULL DEFAULT '0.0.0.0',
  `status` enum('succ','failed','error','progress','timeout','cancel','waitting','unpay') NOT NULL DEFAULT 'unpay',
  `adminnote` char(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `userid` (`userid`),
  KEY `trade_sn` (`trade_sn`,`money`,`status`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_pay_account` */

/*Table structure for table `v9_pay_payment` */

CREATE TABLE `v9_pay_payment` (
  `pay_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) NOT NULL,
  `pay_name` varchar(120) NOT NULL,
  `pay_code` varchar(20) NOT NULL,
  `pay_desc` text NOT NULL,
  `pay_method` tinyint(1) DEFAULT NULL,
  `pay_fee` varchar(10) NOT NULL,
  `config` text NOT NULL,
  `is_cod` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_online` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `pay_order` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `author` varchar(100) NOT NULL,
  `website` varchar(100) NOT NULL,
  `version` varchar(20) NOT NULL,
  PRIMARY KEY (`pay_id`),
  KEY `pay_code` (`pay_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_pay_payment` */

/*Table structure for table `v9_pay_spend` */

CREATE TABLE `v9_pay_spend` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `creat_at` int(10) unsigned NOT NULL DEFAULT '0',
  `userid` int(10) unsigned NOT NULL DEFAULT '0',
  `username` varchar(20) NOT NULL,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `logo` varchar(20) NOT NULL,
  `value` int(5) NOT NULL,
  `op_userid` int(10) unsigned NOT NULL DEFAULT '0',
  `op_username` char(20) NOT NULL,
  `msg` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  KEY `creat_at` (`creat_at`),
  KEY `logo` (`logo`),
  KEY `userid` (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_pay_spend` */

/*Table structure for table `v9_picture` */

CREATE TABLE `v9_picture` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `typeid` smallint(5) unsigned NOT NULL,
  `title` char(80) NOT NULL DEFAULT '',
  `style` char(24) NOT NULL DEFAULT '',
  `thumb` char(100) NOT NULL DEFAULT '',
  `keywords` char(40) NOT NULL DEFAULT '',
  `description` char(255) NOT NULL DEFAULT '',
  `posids` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` char(100) NOT NULL,
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `sysadd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `islink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `status` (`status`,`listorder`,`id`),
  KEY `listorder` (`catid`,`status`,`listorder`,`id`),
  KEY `catid` (`catid`,`status`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_picture` */

/*Table structure for table `v9_picture_data` */

CREATE TABLE `v9_picture_data` (
  `id` mediumint(8) unsigned DEFAULT '0',
  `content` text NOT NULL,
  `readpoint` smallint(5) unsigned NOT NULL DEFAULT '0',
  `groupids_view` varchar(100) NOT NULL,
  `paginationtype` tinyint(1) NOT NULL,
  `maxcharperpage` mediumint(6) NOT NULL,
  `template` varchar(30) NOT NULL,
  `paytype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `relation` varchar(255) NOT NULL DEFAULT '',
  `pictureurls` mediumtext NOT NULL,
  `copyfrom` varchar(255) NOT NULL DEFAULT '',
  `allow_comment` tinyint(1) unsigned NOT NULL DEFAULT '1',
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_picture_data` */

/*Table structure for table `v9_position` */

CREATE TABLE `v9_position` (
  `posid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `modelid` smallint(5) unsigned DEFAULT '0',
  `catid` smallint(5) unsigned DEFAULT '0',
  `name` char(30) NOT NULL DEFAULT '',
  `maxnum` smallint(5) NOT NULL DEFAULT '20',
  `extention` char(100) DEFAULT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `thumb` varchar(150) NOT NULL DEFAULT '',
  PRIMARY KEY (`posid`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

/*Data for the table `v9_position` */

insert  into `v9_position`(`posid`,`modelid`,`catid`,`name`,`maxnum`,`extention`,`listorder`,`siteid`,`thumb`) values (1,0,0,'首页焦点图推荐',20,NULL,1,1,'');
insert  into `v9_position`(`posid`,`modelid`,`catid`,`name`,`maxnum`,`extention`,`listorder`,`siteid`,`thumb`) values (2,0,0,'首页头条推荐',20,NULL,4,1,'');
insert  into `v9_position`(`posid`,`modelid`,`catid`,`name`,`maxnum`,`extention`,`listorder`,`siteid`,`thumb`) values (13,82,0,'栏目页焦点图',20,NULL,0,1,'');
insert  into `v9_position`(`posid`,`modelid`,`catid`,`name`,`maxnum`,`extention`,`listorder`,`siteid`,`thumb`) values (5,69,0,'推荐下载',20,NULL,0,1,'');
insert  into `v9_position`(`posid`,`modelid`,`catid`,`name`,`maxnum`,`extention`,`listorder`,`siteid`,`thumb`) values (8,30,54,'图片频道首页焦点图',20,NULL,0,1,'');
insert  into `v9_position`(`posid`,`modelid`,`catid`,`name`,`maxnum`,`extention`,`listorder`,`siteid`,`thumb`) values (9,0,0,'网站顶部推荐',20,NULL,0,1,'');
insert  into `v9_position`(`posid`,`modelid`,`catid`,`name`,`maxnum`,`extention`,`listorder`,`siteid`,`thumb`) values (10,0,0,'栏目首页推荐',20,NULL,0,1,'');
insert  into `v9_position`(`posid`,`modelid`,`catid`,`name`,`maxnum`,`extention`,`listorder`,`siteid`,`thumb`) values (12,0,0,'首页图片推荐',20,NULL,0,1,'');
insert  into `v9_position`(`posid`,`modelid`,`catid`,`name`,`maxnum`,`extention`,`listorder`,`siteid`,`thumb`) values (14,0,0,'视频首页焦点图',20,'',0,1,'');
insert  into `v9_position`(`posid`,`modelid`,`catid`,`name`,`maxnum`,`extention`,`listorder`,`siteid`,`thumb`) values (15,0,0,'视频首页头条推荐',20,'',0,1,'');
insert  into `v9_position`(`posid`,`modelid`,`catid`,`name`,`maxnum`,`extention`,`listorder`,`siteid`,`thumb`) values (16,0,0,'视频首页每日热点',20,'',0,1,'');
insert  into `v9_position`(`posid`,`modelid`,`catid`,`name`,`maxnum`,`extention`,`listorder`,`siteid`,`thumb`) values (17,0,0,'视频栏目精彩推荐',20,'',0,1,'');

/*Table structure for table `v9_position_data` */

CREATE TABLE `v9_position_data` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `posid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `module` char(20) DEFAULT NULL,
  `modelid` smallint(6) unsigned DEFAULT '0',
  `thumb` tinyint(1) NOT NULL DEFAULT '0',
  `data` mediumtext,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '1',
  `listorder` mediumint(8) DEFAULT '0',
  `expiration` int(10) NOT NULL,
  `extention` char(30) DEFAULT NULL,
  `synedit` tinyint(1) DEFAULT '0',
  KEY `posid` (`posid`),
  KEY `listorder` (`listorder`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_position_data` */

/*Table structure for table `v9_poster` */

CREATE TABLE `v9_poster` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` varchar(40) NOT NULL,
  `spaceid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `type` varchar(10) NOT NULL,
  `setting` text NOT NULL,
  `startdate` int(10) unsigned NOT NULL DEFAULT '0',
  `enddate` int(10) unsigned NOT NULL DEFAULT '0',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `hits` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `clicks` smallint(5) unsigned NOT NULL DEFAULT '0',
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `spaceid` (`spaceid`,`siteid`,`disabled`,`listorder`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `v9_poster` */

insert  into `v9_poster`(`id`,`siteid`,`name`,`spaceid`,`type`,`setting`,`startdate`,`enddate`,`addtime`,`hits`,`clicks`,`listorder`,`disabled`) values (1,1,'banner',1,'images','array (\n  1 => \n  array (\n    \'linkurl\' => \'http://www.phpcms.cn\',\n    \'imageurl\' => \'http://v9_centos.com/uploadfile/poster/2.png\',\n    \'alt\' => \'\',\n  ),\n)',1285813808,1446249600,1285813833,0,1,0,0);
insert  into `v9_poster`(`id`,`siteid`,`name`,`spaceid`,`type`,`setting`,`startdate`,`enddate`,`addtime`,`hits`,`clicks`,`listorder`,`disabled`) values (2,1,'phpcmsv9',2,'images','array (\n  1 => \n  array (\n    \'linkurl\' => \'http://www.phpcms.cn\',\n    \'imageurl\' => \'http://v9_centos.com/statics/images/v9/ad_login.jpg\',\n    \'alt\' => \'phpcms专业建站系统\',\n  ),\n)',1285816298,1446249600,1285816310,0,1,0,0);
insert  into `v9_poster`(`id`,`siteid`,`name`,`spaceid`,`type`,`setting`,`startdate`,`enddate`,`addtime`,`hits`,`clicks`,`listorder`,`disabled`) values (3,1,'phpcms下载推荐',3,'images','array (\n  1 => \n  array (\n    \'linkurl\' => \'http://www.phpcms.cn\',\n    \'imageurl\' => \'http://v9_centos.com/uploadfile/poster/3.png\',\n    \'alt\' => \'phpcms官方\',\n  ),\n)',1286504815,1446249600,1286504865,0,1,0,0);
insert  into `v9_poster`(`id`,`siteid`,`name`,`spaceid`,`type`,`setting`,`startdate`,`enddate`,`addtime`,`hits`,`clicks`,`listorder`,`disabled`) values (4,1,'phpcms广告',4,'images','array (\n  1 => \n  array (\n    \'linkurl\' => \'http://www.phpcms.cn\',\n    \'imageurl\' => \'http://v9_centos.com/uploadfile/poster/4.gif\',\n    \'alt\' => \'phpcms官方\',\n  ),\n)',1286505141,1446249600,1286505178,0,0,0,0);
insert  into `v9_poster`(`id`,`siteid`,`name`,`spaceid`,`type`,`setting`,`startdate`,`enddate`,`addtime`,`hits`,`clicks`,`listorder`,`disabled`) values (5,1,'phpcms下载',5,'images','array (\n  1 => \n  array (\n    \'linkurl\' => \'http://www.phpcms.cn\',\n    \'imageurl\' => \'http://v9_centos.com/uploadfile/poster/5.gif\',\n    \'alt\' => \'官方\',\n  ),\n)',1286509363,1446249600,1286509401,0,0,0,0);
insert  into `v9_poster`(`id`,`siteid`,`name`,`spaceid`,`type`,`setting`,`startdate`,`enddate`,`addtime`,`hits`,`clicks`,`listorder`,`disabled`) values (6,1,'phpcms下载推荐1',6,'images','array (\n  1 => \n  array (\n    \'linkurl\' => \'http://www.phpcms.cn\',\n    \'imageurl\' => \'http://v9_centos.com/uploadfile/poster/5.gif\',\n    \'alt\' => \'官方\',\n  ),\n)',1286510183,1446249600,1286510227,0,0,0,0);
insert  into `v9_poster`(`id`,`siteid`,`name`,`spaceid`,`type`,`setting`,`startdate`,`enddate`,`addtime`,`hits`,`clicks`,`listorder`,`disabled`) values (7,1,'phpcms下载详情',7,'images','array (\n  1 => \n  array (\n    \'linkurl\' => \'http://www.phpcms.cn\',\n    \'imageurl\' => \'http://v9_centos.com/uploadfile/poster/5.gif\',\n    \'alt\' => \'官方\',\n  ),\n)',1286510314,1446249600,1286510341,0,0,0,0);
insert  into `v9_poster`(`id`,`siteid`,`name`,`spaceid`,`type`,`setting`,`startdate`,`enddate`,`addtime`,`hits`,`clicks`,`listorder`,`disabled`) values (8,1,'phpcms下载页',8,'images','array (\n  1 => \n  array (\n    \'linkurl\' => \'http://www.phpcms.cn\',\n    \'imageurl\' => \'http://v9_centos.com/uploadfile/poster/1.jpg\',\n    \'alt\' => \'官方站\',\n  ),\n)',1286522084,1446249600,1286522125,0,0,0,0);
insert  into `v9_poster`(`id`,`siteid`,`name`,`spaceid`,`type`,`setting`,`startdate`,`enddate`,`addtime`,`hits`,`clicks`,`listorder`,`disabled`) values (9,1,'phpcms v9广告',9,'images','array (\n  1 => \n  array (\n    \'linkurl\' => \'http://www.phpcms.cn\',\n    \'imageurl\' => \'http://v9_centos.com/uploadfile/poster/4.gif\',\n    \'alt\' => \'\',\n  ),\n)',1287041759,1446249600,1287041804,0,0,0,0);
insert  into `v9_poster`(`id`,`siteid`,`name`,`spaceid`,`type`,`setting`,`startdate`,`enddate`,`addtime`,`hits`,`clicks`,`listorder`,`disabled`) values (10,1,'phpcms',10,'images','array (\n  1 => \n  array (\n    \'linkurl\' => \'http://www.phpcms.cn\',\n    \'imageurl\' => \'http://v9_centos.com/uploadfile/poster/6.jpg\',\n    \'alt\' => \'phpcms官方\',\n  ),\n)',1289270509,1446249600,1289270541,1,0,0,0);

/*Table structure for table `v9_poster_201606` */

CREATE TABLE `v9_poster_201606` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `spaceid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `area` char(40) NOT NULL,
  `ip` char(15) NOT NULL,
  `referer` char(120) NOT NULL,
  `clicktime` int(10) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`,`type`,`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_poster_201606` */

/*Table structure for table `v9_poster_space` */

CREATE TABLE `v9_poster_space` (
  `spaceid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` char(50) NOT NULL,
  `type` char(30) NOT NULL,
  `path` char(40) NOT NULL,
  `width` smallint(4) unsigned NOT NULL DEFAULT '0',
  `height` smallint(4) unsigned NOT NULL DEFAULT '0',
  `setting` char(100) NOT NULL,
  `description` char(100) NOT NULL,
  `items` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`spaceid`),
  KEY `disabled` (`disabled`,`siteid`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `v9_poster_space` */

insert  into `v9_poster_space`(`spaceid`,`siteid`,`name`,`type`,`path`,`width`,`height`,`setting`,`description`,`items`,`disabled`) values (1,1,'顶部搜索右侧广告位','banner','poster_js/1.js',430,63,'array (\n  \'paddleft\' => \'\',\n  \'paddtop\' => \'\',\n)','',1,0);
insert  into `v9_poster_space`(`spaceid`,`siteid`,`name`,`type`,`path`,`width`,`height`,`setting`,`description`,`items`,`disabled`) values (2,1,'会员登陆页广告','banner','poster_js/2.js',310,304,'array (\n  \'paddleft\' => \'\',\n  \'paddtop\' => \'\',\n)','会员登陆页广告右侧代替外部通行证广告',1,0);
insert  into `v9_poster_space`(`spaceid`,`siteid`,`name`,`type`,`path`,`width`,`height`,`setting`,`description`,`items`,`disabled`) values (3,1,'图片频道图片排行下方','banner','poster_js/3.js',249,87,'array (\n  \'paddleft\' => \'\',\n  \'paddtop\' => \'\',\n)','',1,0);
insert  into `v9_poster_space`(`spaceid`,`siteid`,`name`,`type`,`path`,`width`,`height`,`setting`,`description`,`items`,`disabled`) values (4,1,'新闻中心推荐链接左侧','banner','poster_js/4.js',748,91,'array (\n  \'paddleft\' => \'\',\n  \'paddtop\' => \'\',\n)','',1,0);
insert  into `v9_poster_space`(`spaceid`,`siteid`,`name`,`type`,`path`,`width`,`height`,`setting`,`description`,`items`,`disabled`) values (5,1,'下载列表页右侧顶部','banner','poster_js/5.js',248,162,'array (\n  \'paddleft\' => \'\',\n  \'paddtop\' => \'\',\n)','',1,0);
insert  into `v9_poster_space`(`spaceid`,`siteid`,`name`,`type`,`path`,`width`,`height`,`setting`,`description`,`items`,`disabled`) values (6,1,'下载详情页右侧顶部','banner','poster_js/6.js',248,162,'array (\n  \'paddleft\' => \'\',\n  \'paddtop\' => \'\',\n)','',1,0);
insert  into `v9_poster_space`(`spaceid`,`siteid`,`name`,`type`,`path`,`width`,`height`,`setting`,`description`,`items`,`disabled`) values (7,1,'下载详情页右侧下部','banner','poster_js/7.js',248,162,'array (\n  \'paddleft\' => \'\',\n  \'paddtop\' => \'\',\n)','',1,0);
insert  into `v9_poster_space`(`spaceid`,`siteid`,`name`,`type`,`path`,`width`,`height`,`setting`,`description`,`items`,`disabled`) values (8,1,'下载频道首页','banner','poster_js/8.js',698,80,'array (\n  \'paddleft\' => \'\',\n  \'paddtop\' => \'\',\n)','',1,0);
insert  into `v9_poster_space`(`spaceid`,`siteid`,`name`,`type`,`path`,`width`,`height`,`setting`,`description`,`items`,`disabled`) values (9,1,'下载详情页地址列表右侧','banner','poster_js/12.js',330,50,'array (\n  \'paddleft\' => \'\',\n  \'paddtop\' => \'\',\n)','',1,0);
insert  into `v9_poster_space`(`spaceid`,`siteid`,`name`,`type`,`path`,`width`,`height`,`setting`,`description`,`items`,`disabled`) values (10,1,'首页关注下方广告','banner','poster_js/10.js',307,60,'array (\n  \'paddleft\' => \'\',\n  \'paddtop\' => \'\',\n)','',1,0);

/*Table structure for table `v9_queue` */

CREATE TABLE `v9_queue` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type` char(5) DEFAULT NULL,
  `siteid` smallint(5) unsigned DEFAULT '0',
  `path` varchar(100) DEFAULT NULL,
  `status1` tinyint(1) DEFAULT '0',
  `status2` tinyint(1) DEFAULT '0',
  `status3` tinyint(1) DEFAULT '0',
  `status4` tinyint(1) DEFAULT '0',
  `times` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `siteid` (`siteid`),
  KEY `times` (`times`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_queue` */

/*Table structure for table `v9_release_point` */

CREATE TABLE `v9_release_point` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `host` varchar(100) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `port` varchar(10) DEFAULT '21',
  `pasv` tinyint(1) DEFAULT '0',
  `ssl` tinyint(1) DEFAULT '0',
  `path` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_release_point` */

/*Table structure for table `v9_search` */

CREATE TABLE `v9_search` (
  `searchid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `typeid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `adddate` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`searchid`),
  KEY `typeid` (`typeid`,`id`),
  KEY `siteid` (`siteid`),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `v9_search` */

insert  into `v9_search`(`searchid`,`typeid`,`id`,`adddate`,`data`,`siteid`) values (1,52,1,1465271033,'ffff ',1);
insert  into `v9_search`(`searchid`,`typeid`,`id`,`adddate`,`data`,`siteid`) values (2,1,1,1465276231,'aaa aaa ',1);

/*Table structure for table `v9_search_keyword` */

CREATE TABLE `v9_search_keyword` (
  `keyword` char(20) NOT NULL,
  `pinyin` char(20) NOT NULL,
  `searchnums` int(10) unsigned NOT NULL,
  `data` char(20) NOT NULL,
  UNIQUE KEY `keyword` (`keyword`),
  UNIQUE KEY `pinyin` (`pinyin`),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_search_keyword` */

/*Table structure for table `v9_session` */

CREATE TABLE `v9_session` (
  `sessionid` char(32) NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ip` char(15) NOT NULL,
  `lastvisit` int(10) unsigned NOT NULL DEFAULT '0',
  `roleid` tinyint(3) unsigned DEFAULT '0',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `m` char(20) NOT NULL,
  `c` char(20) NOT NULL,
  `a` char(20) NOT NULL,
  `data` char(255) NOT NULL,
  PRIMARY KEY (`sessionid`),
  KEY `lastvisit` (`lastvisit`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

/*Data for the table `v9_session` */

insert  into `v9_session`(`sessionid`,`userid`,`ip`,`lastvisit`,`roleid`,`groupid`,`m`,`c`,`a`,`data`) values ('econuo4mlsfb2ht5lgkmklb8l7',1,'192.168.56.1',1465277944,1,0,'admin','index','public_session_life','code|s:0:\"\";userid|s:1:\"1\";roleid|s:1:\"1\";pc_hash|s:6:\"U46KFy\";lock_screen|i:0;');
insert  into `v9_session`(`sessionid`,`userid`,`ip`,`lastvisit`,`roleid`,`groupid`,`m`,`c`,`a`,`data`) values ('1rjjn6ncu48os9jiq30tos8dk4',0,'192.168.56.1',1465276245,0,0,'attachment','attachments','swfupload','');

/*Table structure for table `v9_site` */

CREATE TABLE `v9_site` (
  `siteid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(30) DEFAULT '',
  `dirname` char(255) DEFAULT '',
  `domain` char(255) DEFAULT '',
  `site_title` char(255) DEFAULT '',
  `keywords` char(255) DEFAULT '',
  `description` char(255) DEFAULT '',
  `release_point` text,
  `default_style` char(50) DEFAULT NULL,
  `template` text,
  `setting` mediumtext,
  `uuid` char(40) DEFAULT '',
  PRIMARY KEY (`siteid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `v9_site` */

insert  into `v9_site`(`siteid`,`name`,`dirname`,`domain`,`site_title`,`keywords`,`description`,`release_point`,`default_style`,`template`,`setting`,`uuid`) values (1,'默认站点','','http://phpcms_centos.com/','PHPCMS演示站','PHPCMS演示站','PHPCMS演示站','','default','default','{\"upload_maxsize\":\"2048\",\"upload_allowext\":\"jpg|jpeg|gif|bmp|png|doc|docx|xls|xlsx|ppt|pptx|pdf|txt|rar|zip|swf\",\"watermark_enable\":\"1\",\"watermark_minwidth\":\"300\",\"watermark_minheight\":\"300\",\"watermark_img\":\"statics\\/images\\/water\\/\\/mark.png\",\"watermark_pct\":\"85\",\"watermark_quality\":\"80\",\"watermark_pos\":\"9\"}','5ef268f2-2bea-11e6-8e5f-080027f993c5');

/*Table structure for table `v9_sms_report` */

CREATE TABLE `v9_sms_report` (
  `id` bigint(15) NOT NULL AUTO_INCREMENT,
  `mobile` varchar(11) NOT NULL,
  `posttime` int(10) unsigned NOT NULL DEFAULT '0',
  `id_code` varchar(10) NOT NULL,
  `msg` varchar(90) NOT NULL,
  `send_userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) NOT NULL DEFAULT '0',
  `return_id` varchar(30) NOT NULL,
  `ip` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mobile` (`mobile`,`posttime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_sms_report` */

/*Table structure for table `v9_special` */

CREATE TABLE `v9_special` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `aid` int(10) unsigned NOT NULL DEFAULT '0',
  `title` char(60) NOT NULL,
  `typeids` char(100) NOT NULL,
  `thumb` char(100) NOT NULL,
  `banner` char(100) NOT NULL,
  `description` char(255) NOT NULL,
  `url` char(100) NOT NULL,
  `ishtml` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ispage` tinyint(1) unsigned NOT NULL,
  `filename` char(40) NOT NULL,
  `pics` char(100) NOT NULL,
  `voteid` char(60) NOT NULL,
  `style` char(20) NOT NULL,
  `index_template` char(40) NOT NULL,
  `list_template` char(40) NOT NULL,
  `show_template` char(60) NOT NULL,
  `css` text NOT NULL,
  `username` char(40) NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0',
  `listorder` smallint(5) unsigned NOT NULL,
  `elite` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isvideo` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `disabled` (`disabled`,`siteid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `v9_special` */

insert  into `v9_special`(`id`,`siteid`,`aid`,`title`,`typeids`,`thumb`,`banner`,`description`,`url`,`ishtml`,`ispage`,`filename`,`pics`,`voteid`,`style`,`index_template`,`list_template`,`show_template`,`css`,`username`,`userid`,`createtime`,`listorder`,`elite`,`disabled`,`isvideo`) values (1,1,0,'fdffdfdfdfd','','http://phpcms_centos.com/uploadfile/2016/0607/20160607114205720.png','http://phpcms_centos.com/uploadfile/2016/0607/20160607114205720.png','ffdfdfd','http://phpcms_centos.com/html/special/444/',1,0,'444','','','default','index','list','show','','phpcms',1,1465270966,0,1,0,0);

/*Table structure for table `v9_special_c_data` */

CREATE TABLE `v9_special_c_data` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `author` varchar(40) NOT NULL,
  `content` text NOT NULL,
  `paginationtype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `maxcharperpage` mediumint(6) unsigned NOT NULL DEFAULT '0',
  `style` char(20) NOT NULL,
  `show_template` varchar(30) NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_special_c_data` */

insert  into `v9_special_c_data`(`id`,`author`,`content`,`paginationtype`,`maxcharperpage`,`style`,`show_template`) values (1,'','fff',0,10000,'default','show');

/*Table structure for table `v9_special_content` */

CREATE TABLE `v9_special_content` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `specialid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `title` char(80) NOT NULL,
  `style` char(24) NOT NULL,
  `typeid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `thumb` char(100) NOT NULL,
  `keywords` char(40) NOT NULL,
  `description` char(255) NOT NULL,
  `url` char(100) NOT NULL,
  `curl` char(15) NOT NULL,
  `listorder` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  `searchid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `islink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isdata` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `videoid` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `specialid` (`specialid`,`typeid`,`isdata`),
  KEY `typeid` (`typeid`,`isdata`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `v9_special_content` */

insert  into `v9_special_content`(`id`,`specialid`,`title`,`style`,`typeid`,`thumb`,`keywords`,`description`,`url`,`curl`,`listorder`,`userid`,`username`,`inputtime`,`updatetime`,`searchid`,`islink`,`isdata`,`videoid`) values (1,1,'ffff','',55,'','ffff','ff','http://phpcms_centos.com/html/special/2016/0607/1.html','',0,1,'phpcms',1465271033,1465271044,1,0,1,0);

/*Table structure for table `v9_sphinx_counter` */

CREATE TABLE `v9_sphinx_counter` (
  `counter_id` int(11) unsigned NOT NULL,
  `max_doc_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`counter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_sphinx_counter` */

/*Table structure for table `v9_sso_admin` */

CREATE TABLE `v9_sso_admin` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `username` char(20) NOT NULL,
  `password` char(32) NOT NULL,
  `encrypt` char(6) DEFAULT NULL,
  `issuper` tinyint(1) DEFAULT '0',
  `lastlogin` int(10) DEFAULT NULL,
  `ip` char(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `v9_sso_admin` */

insert  into `v9_sso_admin`(`id`,`username`,`password`,`encrypt`,`issuper`,`lastlogin`,`ip`) values (1,'phpcms','221d5503859969a087aed410e608f31c','HQDwVU',1,0,'');

/*Table structure for table `v9_sso_applications` */

CREATE TABLE `v9_sso_applications` (
  `appid` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `type` char(16) NOT NULL DEFAULT '',
  `name` char(20) NOT NULL DEFAULT '',
  `url` char(255) NOT NULL DEFAULT '',
  `authkey` char(255) NOT NULL DEFAULT '',
  `ip` char(15) NOT NULL DEFAULT '',
  `apifilename` char(30) NOT NULL DEFAULT 'phpsso.php',
  `charset` char(8) NOT NULL DEFAULT '',
  `synlogin` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`appid`),
  KEY `synlogin` (`synlogin`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `v9_sso_applications` */

insert  into `v9_sso_applications`(`appid`,`type`,`name`,`url`,`authkey`,`ip`,`apifilename`,`charset`,`synlogin`) values (1,'phpcms_v9','phpcms v9','http://phpcms_centos.com/','7m0GUBc0OlmTTx2vqGEz7n7Sag1dfG5Z','','api.php?op=phpsso','utf-8',1);

/*Table structure for table `v9_sso_members` */

CREATE TABLE `v9_sso_members` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` char(20) NOT NULL DEFAULT '',
  `password` char(32) NOT NULL DEFAULT '',
  `random` char(8) NOT NULL DEFAULT '',
  `email` char(32) NOT NULL DEFAULT '',
  `regip` char(15) NOT NULL DEFAULT '',
  `regdate` int(10) unsigned NOT NULL DEFAULT '0',
  `lastip` char(15) NOT NULL DEFAULT '0',
  `lastdate` int(10) unsigned NOT NULL DEFAULT '0',
  `appname` char(15) NOT NULL,
  `type` enum('app','connect') DEFAULT NULL,
  `avatar` tinyint(1) NOT NULL DEFAULT '0',
  `ucuserid` mediumint(8) unsigned DEFAULT '0',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `username` (`username`),
  KEY `email` (`email`),
  KEY `ucuserid` (`ucuserid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_sso_members` */

/*Table structure for table `v9_sso_messagequeue` */

CREATE TABLE `v9_sso_messagequeue` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `operation` char(32) NOT NULL,
  `succeed` tinyint(1) NOT NULL DEFAULT '0',
  `totalnum` smallint(6) unsigned NOT NULL DEFAULT '0',
  `noticedata` mediumtext NOT NULL,
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `appstatus` mediumtext,
  PRIMARY KEY (`id`),
  KEY `dateline` (`dateline`),
  KEY `succeed` (`succeed`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_sso_messagequeue` */

/*Table structure for table `v9_sso_session` */

CREATE TABLE `v9_sso_session` (
  `sessionid` char(32) NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ip` char(15) NOT NULL,
  `lastvisit` int(10) unsigned NOT NULL DEFAULT '0',
  `roleid` tinyint(3) unsigned DEFAULT '0',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `m` char(20) NOT NULL,
  `c` char(20) NOT NULL,
  `a` char(20) NOT NULL,
  `data` char(255) NOT NULL,
  PRIMARY KEY (`sessionid`),
  KEY `lastvisit` (`lastvisit`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

/*Data for the table `v9_sso_session` */

/*Table structure for table `v9_sso_settings` */

CREATE TABLE `v9_sso_settings` (
  `name` varchar(32) NOT NULL DEFAULT '',
  `data` text NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_sso_settings` */

insert  into `v9_sso_settings`(`name`,`data`) values ('denyemail','');
insert  into `v9_sso_settings`(`name`,`data`) values ('denyusername','');
insert  into `v9_sso_settings`(`name`,`data`) values ('creditrate','');
insert  into `v9_sso_settings`(`name`,`data`) values ('sp4','');
insert  into `v9_sso_settings`(`name`,`data`) values ('ucenter','');

/*Table structure for table `v9_tag` */

CREATE TABLE `v9_tag` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `tag` text NOT NULL,
  `name` char(40) NOT NULL,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `module` char(20) NOT NULL,
  `action` char(20) NOT NULL,
  `data` text NOT NULL,
  `page` char(15) NOT NULL,
  `return` char(20) NOT NULL,
  `cache` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `num` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_tag` */

/*Table structure for table `v9_template_bak` */

CREATE TABLE `v9_template_bak` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `creat_at` int(10) unsigned DEFAULT '0',
  `fileid` char(50) DEFAULT NULL,
  `userid` mediumint(8) DEFAULT NULL,
  `username` char(20) DEFAULT NULL,
  `template` text,
  PRIMARY KEY (`id`),
  KEY `fileid` (`fileid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_template_bak` */

/*Table structure for table `v9_times` */

CREATE TABLE `v9_times` (
  `username` char(40) NOT NULL,
  `ip` char(15) NOT NULL,
  `logintime` int(10) unsigned NOT NULL DEFAULT '0',
  `isadmin` tinyint(1) NOT NULL DEFAULT '0',
  `times` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`username`,`isadmin`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

/*Data for the table `v9_times` */

/*Table structure for table `v9_type` */

CREATE TABLE `v9_type` (
  `typeid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `module` char(15) NOT NULL,
  `modelid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` char(30) NOT NULL,
  `parentid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `typedir` char(20) NOT NULL,
  `url` char(100) NOT NULL,
  `template` char(30) NOT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`typeid`),
  KEY `module` (`module`,`parentid`,`siteid`,`listorder`)
) ENGINE=MyISAM AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;

/*Data for the table `v9_type` */

insert  into `v9_type`(`typeid`,`siteid`,`module`,`modelid`,`name`,`parentid`,`typedir`,`url`,`template`,`listorder`,`description`) values (52,1,'search',0,'专题',0,'special','','',4,'专题');
insert  into `v9_type`(`typeid`,`siteid`,`module`,`modelid`,`name`,`parentid`,`typedir`,`url`,`template`,`listorder`,`description`) values (1,1,'search',1,'新闻',0,'','','',1,'新闻模型搜索');
insert  into `v9_type`(`typeid`,`siteid`,`module`,`modelid`,`name`,`parentid`,`typedir`,`url`,`template`,`listorder`,`description`) values (2,1,'search',2,'下载',0,'','','',3,'下载模型搜索');
insert  into `v9_type`(`typeid`,`siteid`,`module`,`modelid`,`name`,`parentid`,`typedir`,`url`,`template`,`listorder`,`description`) values (3,1,'search',3,'图片',0,'','','',2,'图片模型搜索');
insert  into `v9_type`(`typeid`,`siteid`,`module`,`modelid`,`name`,`parentid`,`typedir`,`url`,`template`,`listorder`,`description`) values (53,1,'link',0,'1',0,'','','',0,'1');
insert  into `v9_type`(`typeid`,`siteid`,`module`,`modelid`,`name`,`parentid`,`typedir`,`url`,`template`,`listorder`,`description`) values (54,1,'link',0,'2',0,'','','',0,'2');
insert  into `v9_type`(`typeid`,`siteid`,`module`,`modelid`,`name`,`parentid`,`typedir`,`url`,`template`,`listorder`,`description`) values (55,1,'special',0,'4',1,'444','http://phpcms_centos.com/html/special/444/444/type-55.html','',1,'');

/*Table structure for table `v9_urlrule` */

CREATE TABLE `v9_urlrule` (
  `urlruleid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `module` varchar(15) NOT NULL,
  `file` varchar(20) NOT NULL,
  `ishtml` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `urlrule` varchar(255) NOT NULL,
  `example` varchar(255) NOT NULL,
  PRIMARY KEY (`urlruleid`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

/*Data for the table `v9_urlrule` */

insert  into `v9_urlrule`(`urlruleid`,`module`,`file`,`ishtml`,`urlrule`,`example`) values (1,'content','category',1,'{$categorydir}{$catdir}/index.html|{$categorydir}{$catdir}/{$page}.html','news/china/1000.html');
insert  into `v9_urlrule`(`urlruleid`,`module`,`file`,`ishtml`,`urlrule`,`example`) values (6,'content','category',0,'index.php?m=content&c=index&a=lists&catid={$catid}|index.php?m=content&c=index&a=lists&catid={$catid}&page={$page}','index.php?m=content&c=index&a=lists&catid=1&page=1');
insert  into `v9_urlrule`(`urlruleid`,`module`,`file`,`ishtml`,`urlrule`,`example`) values (11,'content','show',1,'{$year}/{$catdir}_{$month}{$day}/{$id}.html|{$year}/{$catdir}_{$month}{$day}/{$id}_{$page}.html','2010/catdir_0720/1_2.html');
insert  into `v9_urlrule`(`urlruleid`,`module`,`file`,`ishtml`,`urlrule`,`example`) values (12,'content','show',1,'{$categorydir}{$catdir}/{$year}/{$month}{$day}/{$id}.html|{$categorydir}{$catdir}/{$year}/{$month}{$day}/{$id}_{$page}.html','it/product/2010/0720/1_2.html');
insert  into `v9_urlrule`(`urlruleid`,`module`,`file`,`ishtml`,`urlrule`,`example`) values (16,'content','show',0,'index.php?m=content&c=index&a=show&catid={$catid}&id={$id}|index.php?m=content&c=index&a=show&catid={$catid}&id={$id}&page={$page}','index.php?m=content&c=index&a=show&catid=1&id=1');
insert  into `v9_urlrule`(`urlruleid`,`module`,`file`,`ishtml`,`urlrule`,`example`) values (17,'content','show',0,'show-{$catid}-{$id}-{$page}.html','show-1-2-1.html');
insert  into `v9_urlrule`(`urlruleid`,`module`,`file`,`ishtml`,`urlrule`,`example`) values (18,'content','show',0,'content-{$catid}-{$id}-{$page}.html','content-1-2-1.html');
insert  into `v9_urlrule`(`urlruleid`,`module`,`file`,`ishtml`,`urlrule`,`example`) values (30,'content','category',0,'list-{$catid}-{$page}.html','list-1-1.html');

/*Table structure for table `v9_video` */

CREATE TABLE `v9_video` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `typeid` smallint(5) unsigned NOT NULL,
  `title` char(80) NOT NULL DEFAULT '',
  `style` char(24) NOT NULL DEFAULT '',
  `thumb` char(100) NOT NULL DEFAULT '',
  `keywords` char(40) NOT NULL DEFAULT '',
  `description` char(255) NOT NULL DEFAULT '',
  `posids` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` char(100) NOT NULL,
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `sysadd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `islink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  `vision` varchar(255) NOT NULL DEFAULT '',
  `video_category` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `status` (`status`,`listorder`,`id`),
  KEY `listorder` (`catid`,`status`,`listorder`,`id`),
  KEY `catid` (`catid`,`status`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_video` */

/*Table structure for table `v9_video_content` */

CREATE TABLE `v9_video_content` (
  `contentid` int(10) unsigned NOT NULL DEFAULT '0',
  `modelid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `videoid` int(10) unsigned NOT NULL DEFAULT '0',
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  KEY `videoid` (`videoid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_video_content` */

/*Table structure for table `v9_video_data` */

CREATE TABLE `v9_video_data` (
  `id` mediumint(8) unsigned DEFAULT '0',
  `content` text NOT NULL,
  `readpoint` smallint(5) unsigned NOT NULL DEFAULT '0',
  `groupids_view` varchar(100) NOT NULL,
  `paginationtype` tinyint(1) NOT NULL,
  `maxcharperpage` mediumint(6) NOT NULL,
  `template` varchar(30) NOT NULL,
  `paytype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allow_comment` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `relation` varchar(255) NOT NULL DEFAULT '',
  `video` tinyint(3) unsigned NOT NULL DEFAULT '0',
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_video_data` */

/*Table structure for table `v9_video_store` */

CREATE TABLE `v9_video_store` (
  `videoid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` char(60) NOT NULL,
  `vid` char(40) NOT NULL,
  `keywords` char(40) NOT NULL,
  `description` char(255) NOT NULL,
  `status` tinyint(3) NOT NULL DEFAULT '0',
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `picpath` char(120) NOT NULL,
  `size` char(20) NOT NULL,
  `timelen` mediumint(9) NOT NULL DEFAULT '0',
  `userupload` tinyint(1) NOT NULL DEFAULT '0',
  `channelid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`videoid`),
  KEY `videoid` (`videoid`,`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_video_store` */

/*Table structure for table `v9_vote_data` */

CREATE TABLE `v9_vote_data` (
  `userid` mediumint(8) unsigned DEFAULT '0',
  `username` char(20) NOT NULL,
  `subjectid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `time` int(10) unsigned NOT NULL DEFAULT '0',
  `ip` char(15) NOT NULL,
  `data` text NOT NULL,
  `userinfo` text NOT NULL,
  KEY `subjectid` (`subjectid`),
  KEY `userid` (`userid`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_vote_data` */

/*Table structure for table `v9_vote_option` */

CREATE TABLE `v9_vote_option` (
  `optionid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned DEFAULT '0',
  `subjectid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `option` varchar(255) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `listorder` tinyint(2) unsigned DEFAULT '0',
  PRIMARY KEY (`optionid`),
  KEY `subjectid` (`subjectid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_vote_option` */

/*Table structure for table `v9_vote_subject` */

CREATE TABLE `v9_vote_subject` (
  `subjectid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned DEFAULT '0',
  `subject` char(255) NOT NULL,
  `ismultiple` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ischeckbox` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `credit` smallint(5) unsigned NOT NULL DEFAULT '0',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `fromdate` date NOT NULL DEFAULT '0000-00-00',
  `todate` date NOT NULL DEFAULT '0000-00-00',
  `interval` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `template` char(20) NOT NULL,
  `description` text NOT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `allowguest` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `maxval` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `minval` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `allowview` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `optionnumber` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `votenumber` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`subjectid`),
  KEY `enabled` (`enabled`),
  KEY `fromdate` (`fromdate`,`todate`),
  KEY `todate` (`todate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_vote_subject` */

/*Table structure for table `v9_wap` */

CREATE TABLE `v9_wap` (
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '1',
  `sitename` char(30) NOT NULL,
  `logo` char(100) DEFAULT NULL,
  `domain` varchar(100) DEFAULT NULL,
  `setting` mediumtext,
  `status` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_wap` */

insert  into `v9_wap`(`siteid`,`sitename`,`logo`,`domain`,`setting`,`status`) values (1,'PHPCMS手机门户','/statics/images/wap/wlogo.gif','','array (\n  \'listnum\' => \'10\',\n  \'thumb_w\' => \'220\',\n  \'thumb_h\' => \'0\',\n  \'c_num\' => \'1000\',\n  \'index_template\' => \'index\',\n  \'category_template\' => \'category\',\n  \'list_template\' => \'list\',\n  \'show_template\' => \'show\',\n)',0);

/*Table structure for table `v9_wap_type` */

CREATE TABLE `v9_wap_type` (
  `typeid` smallint(5) NOT NULL AUTO_INCREMENT,
  `cat` smallint(5) NOT NULL,
  `parentid` smallint(5) NOT NULL,
  `typename` varchar(30) NOT NULL,
  `siteid` smallint(5) NOT NULL,
  `listorder` smallint(5) DEFAULT '0',
  PRIMARY KEY (`typeid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_wap_type` */

/*Table structure for table `v9_workflow` */

CREATE TABLE `v9_workflow` (
  `workflowid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `steps` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `workname` varchar(20) NOT NULL,
  `description` varchar(255) NOT NULL,
  `setting` text NOT NULL,
  `flag` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`workflowid`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `v9_workflow` */

insert  into `v9_workflow`(`workflowid`,`siteid`,`steps`,`workname`,`description`,`setting`,`flag`) values (1,1,1,'一级审核','审核一次','',0);
insert  into `v9_workflow`(`workflowid`,`siteid`,`steps`,`workname`,`description`,`setting`,`flag`) values (2,1,2,'二级审核','审核两次','',0);
insert  into `v9_workflow`(`workflowid`,`siteid`,`steps`,`workname`,`description`,`setting`,`flag`) values (3,1,3,'三级审核','审核三次','',0);
insert  into `v9_workflow`(`workflowid`,`siteid`,`steps`,`workname`,`description`,`setting`,`flag`) values (4,1,4,'四级审核','四级审核','',0);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
