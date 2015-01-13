ALTER TABLE `xikang365_neusoft`.`feed` DROP COLUMN `type`, DROP COLUMN `icon`, DROP COLUMN `friend`, DROP COLUMN `hash_template`, DROP COLUMN `hash_data`, DROP COLUMN `title_template`, DROP COLUMN `body_template`, DROP COLUMN `body_image`, DROP COLUMN `target_ids`, DROP COLUMN `id`, DROP COLUMN `idtype`,    ADD COLUMN `feed_title` TEXT NULL COMMENT 'feed的标题（内容完整的）by_x' AFTER `body_general`,     ADD COLUMN `feed_body` TEXT NULL COMMENT 'feed的内容 by_x' AFTER `feed_title`,     ADD COLUMN `images` VARCHAR(1000) NULL COMMENT 'feed中的图片资源 by_x' AFTER `feed_body`,     ADD COLUMN `feed_type` VARCHAR(20) NULL COMMENT 'feed的类型 by_x' AFTER `images`,     ADD COLUMN `allow_reply` TINYINT(4) NULL COMMENT '是否可以回复by_x' AFTER `feed_type`,     ADD COLUMN `reply_num` SMALLINT(6) DEFAULT '0' NOT NULL COMMENT 'feed的回复数' AFTER `allow_reply`,     ADD COLUMN `replied` TIMESTAMP NULL COMMENT '最好回复时间' AFTER `reply_num`;

CREATE TABLE `feed_reply` (
  `reply_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `feed_id` BIGINT(20) NOT NULL,
  `reply_content` VARCHAR(250) NOT NULL,
  `member_id` BIGINT(20) NOT NULL,
  `member_name` VARCHAR(32) NOT NULL,
  `replied` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `deleted` TINYINT(4) NOT NULL DEFAULT '0',
  PRIMARY KEY  (`reply_id`)
) ENGINE=INNODB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=235 ;

CREATE TABLE `site_feed` (
  `feedid` INT(11) NOT NULL,
  `feed_title` TEXT NOT NULL,
  `feed_body` TEXT NOT NULL,
  `body_general` TEXT NOT NULL,
  `images` TEXT CHARACTER SET latin1 NOT NULL,
  `mid` INT(11) NOT NULL,
  `dateline` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `feed_type` CHAR(16) NOT NULL,
  PRIMARY KEY  (`feedid`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='这个表用于记录站点的feed';