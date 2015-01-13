CREATE TABLE `xikang365`.`foodstore_food_class_link`( 
   `food_id` INT UNSIGNED NOT NULL , 
   `class_id` INT UNSIGNED NOT NULL 
 )  ENGINE=INNODB COMMENT='食物和食材分类关联表' ROW_FORMAT=DEFAULT CHARSET=utf8  ;
 
 ALTER TABLE `xikang365`.`foodstore_raw_food` DROP COLUMN `class_name`,    CHANGE `class_id` `classes` TEXT NULL  COMMENT '存储食材所有分类序列化后的值';