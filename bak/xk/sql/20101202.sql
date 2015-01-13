UPDATE foodstore_cook_style SET cook_style_id=29 WHERE cook_style_id=0;
ALTER TABLE `xikang365`.`foodstore_raw_food`     CHANGE `food_tropism` `food_tropism` VARCHAR(12) NOT NULL COMMENT '归经';