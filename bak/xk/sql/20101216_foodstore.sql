ALTER TABLE `xikang365`.`foodstore_raw_food` 
   CHANGE `season` `season` VARCHAR(7) NOT NULL COMMENT '材食的时令';
 
 ALTER TABLE `xikang365`.`foodstore_dish_food`     CHANGE `food_resource` `resource_file` VARCHAR(60) CHARACTER SET utf8 COLLATE utf8_bin NULL ;