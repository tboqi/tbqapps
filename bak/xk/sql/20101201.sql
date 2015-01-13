RENAME TABLE `kang`.`organs_conditioning` TO `kang`.`foodstore_effect_food_organ`;
RENAME TABLE `kang`.`food_crowd` TO `kang`.`foodstore_effect_food_crowd`;
RENAME TABLE `kang`.`food_disease` TO `kang`.`foodstore_effect_food_disease`;
RENAME TABLE `kang`.`food_effect` TO `kang`.`foodstore_effect_food_function`;
ALTER TABLE `kang`.`foodstore_effect_food_crowd` ENGINE = INNODB
CHARACTER SET utf8 COLLATE utf8_general_ci
COMMENT = '食物库 功效 食物人群关联表';
ALTER TABLE `kang`.`foodstore_effect_food_organ` ENGINE = InnoDB
CHARACTER SET utf8 COLLATE utf8_general_ci
COMMENT = '食物库 功效 食物脏腑关联表';
--------------
