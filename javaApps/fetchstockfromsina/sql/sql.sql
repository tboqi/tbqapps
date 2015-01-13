/*
SQLyog Community- MySQL GUI v8.21 
MySQL - 5.0.67-community-nt : Database - stock
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`stock` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `stock`;

/*Table structure for table `stocks` */

DROP TABLE IF EXISTS `stocks`;

CREATE TABLE `stocks` (
  `symbol` char(8) character set utf8 NOT NULL,
  `code` char(6) character set utf8 NOT NULL,
  `name` varchar(45) character set utf8 NOT NULL,
  `trade` float(6,3) NOT NULL,
  `pricechange` float(6,3) NOT NULL,
  `changepercent` float(6,3) NOT NULL,
  `buy` float(6,3) NOT NULL,
  `sell` float(6,3) NOT NULL,
  `settlement` float(6,3) NOT NULL,
  `open` float(6,3) NOT NULL,
  `high` float(6,3) NOT NULL,
  `low` float(6,3) NOT NULL,
  `volume` int(10) unsigned NOT NULL,
  `amount` int(10) unsigned NOT NULL,
  `fetchtime` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=gbk;

/*Data for the table `stocks` */

insert  into `stocks`(`symbol`,`code`,`name`,`trade`,`pricechange`,`changepercent`,`buy`,`sell`,`settlement`,`open`,`high`,`low`,`volume`,`amount`,`fetchtime`) values ('sh600000','600000','浦发银行',19.230,0.320,1.692,19.210,19.220,18.910,18.480,19.300,18.400,40777828,771270528,'2010-05-22 01:43:47'),('sh600004','600004','白云机场',9.420,0.130,1.399,9.420,9.430,9.290,9.050,9.440,9.000,9457262,87589080,'2010-05-22 01:43:47'),('sh600005','600005','武钢股份',4.820,0.000,0.000,0.000,0.000,4.820,0.000,0.000,0.000,0,0,'2010-05-22 01:43:47'),('sh600006','600006','东风汽车',5.020,0.070,1.414,5.010,5.020,4.950,4.800,5.060,4.750,17303032,84878752,'2010-05-22 01:43:47'),('sh600007','600007','中国国贸',9.580,0.270,2.900,9.570,9.580,9.310,9.150,9.630,8.830,3990028,37746636,'2010-05-22 01:43:47'),('sh600008','600008','首创股份',5.970,0.020,0.336,5.970,5.980,5.950,5.780,5.990,5.730,11162693,65406384,'2010-05-22 01:43:47'),('sh600009','600009','上海机场',12.710,0.450,3.670,12.710,12.720,12.260,11.870,12.730,11.800,20573256,252254880,'2010-05-22 01:43:47'),('sh600010','600010','包钢股份',3.410,0.040,1.187,3.410,3.420,3.370,3.310,3.420,3.260,18432648,61515424,'2010-05-22 01:43:47'),('sh600011','600011','华能国际',6.170,0.020,0.325,6.170,6.180,6.150,6.090,6.190,5.980,4568784,27747348,'2010-05-22 01:43:47'),('sh600012','600012','皖通高速',5.570,0.030,0.542,5.560,5.570,5.540,5.440,5.590,5.380,4746538,26085280,'2010-05-22 01:43:47');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
