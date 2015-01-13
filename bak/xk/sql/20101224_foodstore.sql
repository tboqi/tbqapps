RENAME TABLE `xikang365`.`foodstore_raw_food` TO `xikang365`.`foodstore_raw_food_bak2`;
CREATE TABLE `foodstore_raw_food` (
  `food_id` INT(11) NOT NULL COMMENT '物食id',
  `food_name` VARCHAR(25) COLLATE utf8_bin NOT NULL COMMENT '材食名称',
  `food_alias` VARCHAR(60) COLLATE utf8_bin NOT NULL COMMENT '食材别名',
  `season` VARCHAR(7) COLLATE utf8_bin NOT NULL COMMENT '材食的时令',
  `classes` TEXT COLLATE utf8_bin COMMENT '存储食材所有分类序列化后的值',
  `popular` TINYINT(4) NOT NULL COMMENT '否是常用',
  `introduce` VARCHAR(200) COLLATE utf8_bin NOT NULL COMMENT '材食的介绍',
  `food_tropism` VARCHAR(12) COLLATE utf8_bin NOT NULL COMMENT '归经',
  `food_medical` VARCHAR(12) COLLATE utf8_bin NOT NULL COMMENT '药性',
  `food_taste` VARCHAR(12) COLLATE utf8_bin NOT NULL COMMENT '食物的口味（甘，苦，辣',
  `purine` FLOAT NOT NULL DEFAULT '0' COMMENT '100克含有的嘌呤（毫克）',
  `ediable` FLOAT NOT NULL COMMENT '可食部',
  `water` FLOAT NOT NULL COMMENT '含水量',
  `richness` INT(11) NOT NULL COMMENT '食物的营养丰富程度',
  `energy` FLOAT NOT NULL DEFAULT '0' COMMENT '100克可食部包含的能量(大卡）',
  `protein` FLOAT NOT NULL DEFAULT '0' COMMENT '100克可食部包含的蛋白质',
  `fat` FLOAT NOT NULL DEFAULT '0' COMMENT '100克可食部包含的脂肪',
  `cho` FLOAT NOT NULL DEFAULT '0' COMMENT '100克可食部包含的碳水化合物',
  `diet_fiber` FLOAT NOT NULL COMMENT '100克可食部包含的纤维素',
  `vit_a` FLOAT NOT NULL COMMENT '100克包含的维生素a(毫克）',
  `carotene` FLOAT NOT NULL DEFAULT '0' COMMENT '100克包含的胡萝卜素（毫克）所有种类',
  `vit_b1` FLOAT NOT NULL DEFAULT '0' COMMENT '维生素b1',
  `vit_b2` FLOAT NOT NULL DEFAULT '0' COMMENT '维生素b2',
  `vit_b3` FLOAT NOT NULL DEFAULT '0' COMMENT '100克可食部含有的维生素b3的量（毫克）',
  `vit_b6` FLOAT NOT NULL DEFAULT '0' COMMENT '维生素b6',
  `vit_b12` FLOAT NOT NULL COMMENT '卫生素b12(毫克）',
  `vit_c` FLOAT NOT NULL COMMENT '100克可食部包含的维生素c（毫克）',
  `vit_e` FLOAT NOT NULL DEFAULT '0' COMMENT '100克可食部包含的维生素e',
  `cholesterol` FLOAT NOT NULL DEFAULT '0' COMMENT '100克可食部含有的胆固醇（毫克）',
  `ca` FLOAT NOT NULL COMMENT '100克可食部包含的钙（毫克）',
  `p` FLOAT NOT NULL COMMENT '100克可食部包含的磷（毫克）',
  `k` FLOAT NOT NULL DEFAULT '0' COMMENT '100克可食部包含的钾（毫克）',
  `na` FLOAT NOT NULL DEFAULT '0' COMMENT '100克可食部包含的钠',
  `mg` FLOAT NOT NULL DEFAULT '0' COMMENT '100克可食部包含的镁',
  `fe` FLOAT NOT NULL COMMENT '100克可食部包含的铁（毫克）',
  `zn` FLOAT NOT NULL DEFAULT '0' COMMENT '100克可食部包含的锌（毫克）',
  `se` FLOAT NOT NULL DEFAULT '0' COMMENT '100克可食部包含的锡（毫克）',
  `cu` FLOAT NOT NULL DEFAULT '0' COMMENT '100克可食部包含的铜',
  `mn` FLOAT NOT NULL DEFAULT '0' COMMENT '100克可食部包含的锰（毫克）',
  `i` FLOAT NOT NULL DEFAULT '0' COMMENT '100克可食部包含的碘（毫克）',
  `resource_file` VARCHAR(60) COLLATE utf8_bin NOT NULL DEFAULT '',
  `nutritional_analysis` TEXT CHARACTER SET utf8 NOT NULL COMMENT '适合人群',
  `meal` VARCHAR(20) COLLATE utf8_bin DEFAULT NULL COMMENT '餐次',
  `compatibility_classes` TEXT COLLATE utf8_bin COMMENT '配伍分类',
  PRIMARY KEY (`food_id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='食材，未加工的食物比如 蔬菜，肉类 蛋 奶 水果等';
ALTER TABLE `xikang365`.`foodstore_raw_food`     ADD COLUMN `test_year` CHAR(6) NULL COMMENT '测量营养元素的年份' AFTER `compatibility_classes`,     ADD COLUMN `food_code` CHAR(6) NULL COMMENT '食物编码' AFTER `test_year`,     ADD COLUMN `energy_kj` FLOAT NULL COMMENT '能量 千焦' AFTER `food_code`,     ADD COLUMN `ash` FLOAT NULL COMMENT '灰分' AFTER `energy_kj`,     ADD COLUMN `retionl` FLOAT NULL COMMENT '视黄醇' AFTER `ash`,     ADD COLUMN `folate` FLOAT NULL COMMENT '叶酸' AFTER `retionl`,     ADD COLUMN `naicin` FLOAT NULL AFTER `folate`,     ADD COLUMN `a_vit_e` FLOAT NULL AFTER `naicin`,     ADD COLUMN `remark` VARCHAR(100) NULL AFTER `a_vit_e`;
ALTER TABLE `xikang365`.`foodstore_food`     CHANGE `food_name` `food_name` VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' NOT NULL COMMENT '食物的名称',     CHANGE `food_alias` `food_alias` VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' NOT NULL COMMENT '物食的别名',     CHANGE `food_type` `food_type` TINYINT(4) DEFAULT '0' NOT NULL COMMENT '食物的类型1 为食材2为菜谱';
###############
UPDATE `xikang365`.`foodstore_raw_food_class` SET `class_name`='谷类及制品' WHERE `class_id`='91';
/*[15:10:06][ 141 ms]*/ UPDATE `xikang365`.`foodstore_raw_food_class` SET `class_name`='薯类、淀粉及制品' WHERE `class_id`='92';
/*[15:10:16][ 156 ms]*/ UPDATE `xikang365`.`foodstore_raw_food_class` SET `class_name`='干豆类及制品' WHERE `class_id`='93';
/*[15:10:23][ 187 ms]*/ UPDATE `xikang365`.`foodstore_raw_food_class` SET `class_name`='蔬菜类及制品' WHERE `class_id`='94';
/*[15:10:30][  78 ms]*/ UPDATE `xikang365`.`foodstore_raw_food_class` SET `class_name`='菌藻类' WHERE `class_id`='95';
/*[15:10:37][ 109 ms]*/ UPDATE `xikang365`.`foodstore_raw_food_class` SET `class_name`='水果类及制品' WHERE `class_id`='96';
/*[15:10:43][ 172 ms]*/ UPDATE `xikang365`.`foodstore_raw_food_class` SET `class_name`='坚果、种子类' WHERE `class_id`='97';
/*[15:10:56][ 375 ms]*/ UPDATE `xikang365`.`foodstore_raw_food_class` SET `class_name`='畜肉类及制品' WHERE `class_id`='100';
/*[15:11:05][ 282 ms]*/ UPDATE `xikang365`.`foodstore_raw_food_class` SET `class_name`='禽肉类及制品' WHERE `class_id`='101';
/*[15:11:14][  94 ms]*/ UPDATE `xikang365`.`foodstore_raw_food_class` SET `class_name`='乳类及制品' WHERE `class_id`='102';
/*[15:11:18][ 110 ms]*/ UPDATE `xikang365`.`foodstore_raw_food_class` SET `class_name`='蛋类及制品' WHERE `class_id`='103';
/*[15:11:23][ 140 ms]*/ UPDATE `xikang365`.`foodstore_raw_food_class` SET `class_name`='鱼虾蟹贝类' WHERE `class_id`='104';
/*[15:11:30][  78 ms]*/ UPDATE `xikang365`.`foodstore_raw_food_class` SET `class_name`='婴幼儿食品' WHERE `class_id`='105';
/*[15:11:37][  94 ms]*/ UPDATE `xikang365`.`foodstore_raw_food_class` SET `class_name`='小吃、甜饼' WHERE `class_id`='106';
/*[15:11:45][ 172 ms]*/ UPDATE `xikang365`.`foodstore_raw_food_class` SET `class_name`='速食食品' WHERE `class_id`='107';
/*[15:11:52][ 218 ms]*/ UPDATE `xikang365`.`foodstore_raw_food_class` SET `class_name`='饮料类' WHERE `class_id`='108';
/*[15:11:58][ 266 ms]*/ UPDATE `xikang365`.`foodstore_raw_food_class` SET `class_name`='含酒精饮料' WHERE `class_id`='109';
/*[15:12:07][  62 ms]*/ UPDATE `xikang365`.`foodstore_raw_food_class` SET `class_name`='糖、蜜饯类' WHERE `class_id`='110';
/*[15:12:13][ 171 ms]*/ UPDATE `xikang365`.`foodstore_raw_food_class` SET `class_name`='油脂类' WHERE `class_id`='111';
/*[15:12:18][  78 ms]*/ UPDATE `xikang365`.`foodstore_raw_food_class` SET `class_name`='调味品类' WHERE `class_id`='112';
/*[15:12:22][ 140 ms]*/ UPDATE `xikang365`.`foodstore_raw_food_class` SET `class_name`='药食两用食物及其它' WHERE `class_id`='113';
ALTER TABLE `xikang365`.`foodstore_raw_food_class`     ADD COLUMN `bianhao` CHAR(4) NULL COMMENT '编号' AFTER `class_sort`;
UPDATE `xikang365`.`foodstore_raw_food_class` SET `bianhao`='01' WHERE `class_id`='91';
/*[15:16:41][ 110 ms]*/ UPDATE `xikang365`.`foodstore_raw_food_class` SET `bianhao`='02' WHERE `class_id`='92';
/*[15:16:43][  94 ms]*/ UPDATE `xikang365`.`foodstore_raw_food_class` SET `bianhao`='03' WHERE `class_id`='93';
/*[15:16:47][ 125 ms]*/ UPDATE `xikang365`.`foodstore_raw_food_class` SET `bianhao`='04' WHERE `class_id`='94';
/*[15:16:49][  94 ms]*/ UPDATE `xikang365`.`foodstore_raw_food_class` SET `bianhao`='05' WHERE `class_id`='95';
/*[15:16:51][ 109 ms]*/ UPDATE `xikang365`.`foodstore_raw_food_class` SET `bianhao`='06' WHERE `class_id`='96';
/*[15:16:53][ 172 ms]*/ UPDATE `xikang365`.`foodstore_raw_food_class` SET `bianhao`='07' WHERE `class_id`='97';
/*[15:16:55][ 110 ms]*/ UPDATE `xikang365`.`foodstore_raw_food_class` SET `bianhao`='08' WHERE `class_id`='100';
/*[15:16:56][ 141 ms]*/ UPDATE `xikang365`.`foodstore_raw_food_class` SET `bianhao`='09' WHERE `class_id`='101';
/*[15:16:58][ 141 ms]*/ UPDATE `xikang365`.`foodstore_raw_food_class` SET `bianhao`='10' WHERE `class_id`='102';
/*[15:16:59][  94 ms]*/ UPDATE `xikang365`.`foodstore_raw_food_class` SET `bianhao`='11' WHERE `class_id`='103';
/*[15:17:00][ 109 ms]*/ UPDATE `xikang365`.`foodstore_raw_food_class` SET `bianhao`='12' WHERE `class_id`='104';
/*[15:17:02][ 141 ms]*/ UPDATE `xikang365`.`foodstore_raw_food_class` SET `bianhao`='13' WHERE `class_id`='105';
/*[15:17:03][ 125 ms]*/ UPDATE `xikang365`.`foodstore_raw_food_class` SET `bianhao`='14' WHERE `class_id`='106';
/*[15:17:05][ 125 ms]*/ UPDATE `xikang365`.`foodstore_raw_food_class` SET `bianhao`='15' WHERE `class_id`='107';
/*[15:17:07][ 125 ms]*/ UPDATE `xikang365`.`foodstore_raw_food_class` SET `bianhao`='16' WHERE `class_id`='108';
/*[15:17:09][  78 ms]*/ UPDATE `xikang365`.`foodstore_raw_food_class` SET `bianhao`='17' WHERE `class_id`='109';
/*[15:17:11][  78 ms]*/ UPDATE `xikang365`.`foodstore_raw_food_class` SET `bianhao`='18' WHERE `class_id`='110';
/*[15:17:13][  78 ms]*/ UPDATE `xikang365`.`foodstore_raw_food_class` SET `bianhao`='19' WHERE `class_id`='111';
/*[15:17:15][  78 ms]*/ UPDATE `xikang365`.`foodstore_raw_food_class` SET `bianhao`='20' WHERE `class_id`='112';
/*[15:17:21][ 188 ms]*/ UPDATE `xikang365`.`foodstore_raw_food_class` SET `bianhao`='21' WHERE `class_id`='113';
TRUNCATE TABLE `xikang365`.`foodstore_food_class_link`;
#########################
ALTER TABLE `xikang365`.`foodstore_dish_food`     ADD COLUMN `compatibility_classes` TEXT NULL AFTER `nutritional_analysis`;
ALTER TABLE `xikang365`.`foodstore_dish_food`     CHANGE `taste` `taste` VARCHAR(30) DEFAULT '' NOT NULL COMMENT '食物的口味';
