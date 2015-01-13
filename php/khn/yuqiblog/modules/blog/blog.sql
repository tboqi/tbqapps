CREATE TABLE `yuqi_user_category` (                                                                                                          
  `user_id` int(10) unsigned NOT NULL,                                                                                                       
  `category_id` int(10) unsigned NOT NULL,                                                                                                   
  KEY `FK_yuqi_user_category_1` (`user_id`),                                                                                                 
  KEY `FK_yuqi_user_category_2` (`category_id`),                                                                                             
  CONSTRAINT `FK_yuqi_user_category_2` FOREIGN KEY (`category_id`) REFERENCES `yuqi_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,  
  CONSTRAINT `FK_yuqi_user_category_1` FOREIGN KEY (`user_id`) REFERENCES `yuqi_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE            
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `yuqi_links` (                                                                                                   
  `id` int(10) unsigned NOT NULL auto_increment,                                                                              
  `name` varchar(200) NOT NULL,                                                                                               
  `url` varchar(200) NOT NULL,                                                                                                
  `user_id` int(10) unsigned NOT NULL,                                                                                        
  PRIMARY KEY  (`id`),                                                                                                        
  KEY `FK_yuqi_links_user` (`user_id`),                                                                                       
  CONSTRAINT `FK_yuqi_links_user` FOREIGN KEY (`user_id`) REFERENCES `yuqi_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE  
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

alter table `yuqi_links` add column `description` text   NULL  after `user_id`;

alter table `yuqi_blogs` add column `theme` varchar (200) DEFAULT 'default' NOT NULL  COLLATE utf8_general_ci  after `keywords`;

insert into `yuqi_adminmenus`(`id`,`name`,`parent_id`,`uri`,`view_order`,`target`,`is_admin`,`app`) values ( '13','博文管理','0','','0','0','1','admin');
insert into `yuqi_adminmenus`(`id`,`name`,`parent_id`,`uri`,`view_order`,`target`,`is_admin`,`app`) values ( '14','搜索博文','13','article/search','0','0','1','admin');
