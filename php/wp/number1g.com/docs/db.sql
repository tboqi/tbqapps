ALTER TABLE `wp_posts` ADD COLUMN `had_fetched_images` TINYINT NOT NULL DEFAULT 0  AFTER `source_url` , ADD COLUMN `images` TEXT NOT NULL DEFAULT '' COMMENT '文章里面的图片，json格式'  AFTER `had_fetched_images` ;
CREATE  TABLE `my_post_image` (
  `id` INT NOT NULL ,
  `art_id` INT UNSIGNED NOT NULL ,
  `image` VARCHAR(255) NOT NULL ,
  PRIMARY KEY (`id`) )
COMMENT = '文章图片关联表';
ALTER TABLE `my_post_image` CHANGE COLUMN `id` `id` INT(11) NOT NULL AUTO_INCREMENT  ;
