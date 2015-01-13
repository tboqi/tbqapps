ALTER TABLE `khnblog`.`yuqi_categories` ADD COLUMN `show_order` int  NOT NULL DEFAULT 0 AFTER `description`;
ALTER TABLE `khnblog`.`yuqi_categories` ADD COLUMN `ctype` VARCHAR(45) NOT NULL DEFAULT 'article' AFTER `show_order`;
ALTER TABLE `khnblog`.`yuqi_articles` ADD COLUMN `categories` VARCHAR(255) NOT NULL DEFAULT ''  AFTER `refurl` , ADD COLUMN `tabs` VARCHAR(255) NOT NULL DEFAULT ''  AFTER `categories` , CHANGE COLUMN `refurl` `refurl` VARCHAR(511) NOT NULL DEFAULT '' COMMENT 'ref=0ʱΪnull'  ;

