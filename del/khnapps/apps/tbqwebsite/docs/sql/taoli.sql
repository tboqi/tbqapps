SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';



-- -----------------------------------------------------
-- Table `article_categories`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `article_categories` ;

CREATE  TABLE IF NOT EXISTS `article_categories` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(200) NOT NULL ,
  `description` TEXT NULL ,
  `show_order` INT(11) NOT NULL DEFAULT '0' ,
  `num` VARCHAR(45) NOT NULL DEFAULT 0 COMMENT '本分类下的文章数' ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8
COMMENT = '文章分类';


-- -----------------------------------------------------
-- Table `articles`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `articles` ;

CREATE  TABLE IF NOT EXISTS `articles` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `title` VARCHAR(200) NOT NULL ,
  `summary` TEXT NOT NULL ,
  `content` TEXT NOT NULL ,
  `create_time` BIGINT(20) UNSIGNED NOT NULL ,
  `read_times` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '阅读次数' ,
  `update_time` BIGINT(20) UNSIGNED NOT NULL DEFAULT '0' ,
  `ref` TINYINT(3) UNSIGNED NOT NULL COMMENT '0 原创 1转贴 2翻译' ,
  `refurl` VARCHAR(511) NOT NULL DEFAULT '' COMMENT 'ref=0时为null' ,
  `category_id` INT(10) UNSIGNED NOT NULL ,
  `category_name` VARCHAR(45) NOT NULL DEFAULT '' ,
  `tabs_detail` VARCHAR(255) NOT NULL DEFAULT '' COMMENT '存储标签的详细信息，\njson格式，\n包含id，name' ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_articles_article_categories1` (`category_id` ASC) ,
  CONSTRAINT `fk_articles_article_categories1`
    FOREIGN KEY (`category_id` )
    REFERENCES `article_categories` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 243
DEFAULT CHARACTER SET = utf8
ROW_FORMAT = DYNAMIC;


-- -----------------------------------------------------
-- Table `article_tabs`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `article_tabs` ;

CREATE  TABLE IF NOT EXISTS `article_tabs` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `tab` VARCHAR(255) NOT NULL ,
  `num` INT UNSIGNED NOT NULL DEFAULT 0 COMMENT '本标签下的文章数' ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8
COMMENT = '文章标签';


-- -----------------------------------------------------
-- Table `article_tab_link`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `article_tab_link` ;

CREATE  TABLE IF NOT EXISTS `article_tab_link` (
  `article_id` INT(10) UNSIGNED NOT NULL ,
  `tab_id` INT(10) UNSIGNED NOT NULL ,
  UNIQUE INDEX `aid_tid` (`article_id` ASC, `tab_id` ASC) ,
  INDEX `FK_yuqi_article_tab_2` (`tab_id` ASC) ,
  CONSTRAINT `FK_yuqi_article_tab`
    FOREIGN KEY (`article_id` )
    REFERENCES `articles` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_yuqi_article_tab_2`
    FOREIGN KEY (`tab_id` )
    REFERENCES `article_tabs` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = '文章与标签关联表'
ROW_FORMAT = DYNAMIC;


-- -----------------------------------------------------
-- Table `article_comments`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `article_comments` ;

CREATE  TABLE IF NOT EXISTS `article_comments` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `article_id` INT(10) UNSIGNED NOT NULL ,
  `create_time` BIGINT(20) UNSIGNED NOT NULL ,
  `content` TEXT NOT NULL ,
  `user_name` VARCHAR(255) NULL COMMENT '评论者用户名' ,
  `user_email` VARCHAR(255) NULL COMMENT '评论者email' ,
  PRIMARY KEY (`id`) ,
  INDEX `FK_yuqi_comments_1` (`article_id` ASC) ,
  CONSTRAINT `FK_yuqi_comments_1`
    FOREIGN KEY (`article_id` )
    REFERENCES `articles` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `link_categories`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `link_categories` ;

CREATE  TABLE IF NOT EXISTS `link_categories` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
COMMENT = '友情链接的分类';


-- -----------------------------------------------------
-- Table `links`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `links` ;

CREATE  TABLE IF NOT EXISTS `links` (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `url` VARCHAR(255) NOT NULL DEFAULT '' ,
  `name` VARCHAR(255) NOT NULL DEFAULT '' ,
  `category_id` INT UNSIGNED NOT NULL COMMENT '友情链接' ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_links_link_category1` (`category_id` ASC) ,
  CONSTRAINT `fk_links_link_category1`
    FOREIGN KEY (`category_id` )
    REFERENCES `link_categories` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 31
DEFAULT CHARACTER SET = utf8
COMMENT = '友情链接';



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

ALTER TABLE `articles` CHANGE COLUMN `tabs_detail` `tabs_detail` TEXT NULL DEFAULT NULL COMMENT '存储标签的详细信息，\njson格式，\n包含id，name'  ;

CREATE  TABLE `website` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `title` VARCHAR(255) NOT NULL DEFAULT '' ,
  `description` VARCHAR(255) NOT NULL DEFAULT '' ,
  `keywords` VARCHAR(255) NOT NULL DEFAULT '' ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;
insert into website values	(3,'title','description','keywords');
CREATE TABLE `product_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `description` text,
  `show_order` int(11) NOT NULL DEFAULT '0',
  `num` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '本分类下的产品数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品分类';
ALTER TABLE `article_categories` CHANGE COLUMN `num` `num` INT UNSIGNED NOT NULL DEFAULT '0' COMMENT '本分类下的文章数'  ;
