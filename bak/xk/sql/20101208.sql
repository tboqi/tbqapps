ALTER TABLE `xikang365`.`foodstore_dish_food` CHANGE COLUMN `raw_foods` `raw_foods_main` text  CHARACTER SET utf8 COLLATE utf8_bin COMMENT '所有食材主料的序列化值';
ALTER TABLE `xikang365`.`foodstore_dish_food` ADD COLUMN `raw_foods_sub` text  NOT NULL COMMENT '食材辅料' AFTER `raw_foods_main`;

