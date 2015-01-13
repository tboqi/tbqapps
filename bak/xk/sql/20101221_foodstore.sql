ALTER TABLE `xikang365`.`foodstore_raw_food`     ADD COLUMN `taste` VARCHAR(20) NULL COMMENT '口味' AFTER `compatibility_classes`;
########################
ALTER TABLE `xikang365`.`foodstore_dish_food`     ADD COLUMN `nutritional_analysis` TEXT NULL COMMENT '营养分析' AFTER `raw_foods_sub`;
