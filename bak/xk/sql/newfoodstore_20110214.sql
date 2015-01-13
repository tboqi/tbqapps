ALTER TABLE `xikang365`.`newfoodstore_raw_food` DROP COLUMN `purine`, DROP COLUMN `ediable`, DROP COLUMN `richness`, DROP COLUMN `energy_kj`,
   CHANGE `food_name` `food_name` VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '材食名称', 
   CHANGE `food_alias` `food_alias` VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' NOT NULL COMMENT '食材别名'