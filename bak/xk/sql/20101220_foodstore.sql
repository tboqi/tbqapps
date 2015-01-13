ALTER TABLE `xikang365`.`foodstore_raw_food`     CHANGE `for_people` `nutritional_analysis` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '适合人群';
ALTER TABLE `xikang365`.`foodstore_raw_food`     ADD COLUMN `meal` VARCHAR(20) NULL AFTER `nutritional_analysis`;
##################
CREATE TABLE `foodstore_food_compatibility_class_link` (
  `food_id` INT(10) UNSIGNED NOT NULL,
  `class_id` INT(10) UNSIGNED NOT NULL
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='食物禁忌配伍，分类';
ALTER TABLE `xikang365`.`foodstore_raw_food`     ADD COLUMN `compatibility_classes` TEXT NULL COMMENT '配伍分类' AFTER `meal`,    CHANGE `meal` `meal` VARCHAR(20) CHARACTER SET utf8 COLLATE utf8_bin NULL  COMMENT '餐次';
