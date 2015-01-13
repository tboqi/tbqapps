/*
SQLyog Community Edition- MySQL GUI v5.20
Host - 5.0.27-standard-log : Database - stock
*********************************************************************
Server version : 5.0.27-standard-log
*/

SET NAMES utf8;

SET SQL_MODE='';

create database if not exists `stock`;

USE `stock`;

SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';

/*Table structure for table `history` */

DROP TABLE IF EXISTS `history`;

CREATE TABLE `history` (
  `Id` int(10) unsigned NOT NULL auto_increment,
  `MemberId` int(10) unsigned NOT NULL default '0',
  `Type` int(3) NOT NULL default '0',
  `StockId` varchar(10) NOT NULL default '0',
  `Hands` int(10) NOT NULL default '0',
  `Price` varchar(8) NOT NULL,
  `Balance` varchar(10) NOT NULL default '0',
  `TransTime` datetime NOT NULL,
  PRIMARY KEY  (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

/*Table structure for table `stock` */

DROP TABLE IF EXISTS `stock`;

CREATE TABLE `stock` (
  `Id` int(8) unsigned NOT NULL auto_increment,
  `Name` varchar(20) NOT NULL,
  `StockId` varchar(8) NOT NULL,
  `Price` varchar(8) NOT NULL,
  `UpdateTime` datetime NOT NULL,
  `PriceChange` varchar(8) default NULL,
  `PriceChangePercent` varchar(8) default NULL,
  `TradingVolume` bigint(16) NOT NULL default '0',
  `isNew` tinyint(1) NOT NULL default '1',
  PRIMARY KEY  (`Id`),
  KEY `stockId` (`StockId`)
) ENGINE=MyISAM AUTO_INCREMENT=134577 DEFAULT CHARSET=utf8;

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `MemberId` int(10) unsigned NOT NULL default '0',
  `Name` varchar(100) NOT NULL default 'noname',
  `Balance` varchar(10) NOT NULL default '0',
  `State` int(3) NOT NULL default '0',
  `Credit` int(10) NOT NULL default '0',
  `CreditTime` datetime NOT NULL,
  `CreateTime` datetime NOT NULL,
  PRIMARY KEY  (`MemberId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `userstock` */

DROP TABLE IF EXISTS `userstock`;

CREATE TABLE `userstock` (
  `MemberId` int(10) unsigned NOT NULL default '0',
  `StockId` varchar(10) NOT NULL default '0',
  `Amount` int(10) NOT NULL default '0',
  `AvgPrice` varchar(10) NOT NULL default '0',
  KEY `user_stock` (`MemberId`,`StockId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
