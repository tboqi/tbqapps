ALTER TABLE `xikang365`.`foodstore_raw_food` DROP COLUMN `taste`;
###
ALTER TABLE `test`.`foodstore_food`     CHANGE `food_name` `food_name` VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '食物的名称',     CHANGE `food_alias` `food_alias` VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '物食的别名';
RENAME TABLE `xikang365`.`foodstore_raw_food` TO `xikang365`.`foodstore_raw_food_bak`;
RENAME TABLE `xikang365`.`foodstore_food` TO `xikang365`.`foodstore_food_bak`;
