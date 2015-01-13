CREATE TABLE `yuqi_categories` (                  
   `id` int(10) unsigned NOT NULL auto_increment,  
   `name` varchar(200) NOT NULL,                   
   `description` text NOT NULL,                    
   PRIMARY KEY  (`id`)                             
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
 
CREATE TABLE `yuqi_articles` (                                                                                                
	 `id` int(10) unsigned NOT NULL auto_increment,                                                                              
	 `title` varchar(200) NOT NULL,                                                                                              
	 `content` varchar(200) NOT NULL,                                                                                            
	 `user_id` int(10) unsigned NOT NULL,                                                                                        
	 `create_time` bigint(20) unsigned NOT NULL,                                                                                 
	 `status` int(11) NOT NULL,                                                                                                  
	 `read_times` int(10) unsigned NOT NULL default '0' COMMENT '阅读次数',                                                  
     PRIMARY KEY  (`id`),                                                                                                        
     KEY `FK_yuqi_articles_1` (`user_id`),                                                                                       
     CONSTRAINT `FK_yuqi_articles_1` FOREIGN KEY (`user_id`) REFERENCES `yuqi_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE  
   ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
   
CREATE TABLE `yuqi_article_categories` (                                                                                                          
   `article_id` int(10) unsigned NOT NULL,                                                                                                         
   `category_id` int(10) unsigned NOT NULL,                                                                                                        
   KEY `FK_yuqi_article_categories_1` (`category_id`),                                                                                             
   KEY `FK_yuqi_article_categories_2` (`article_id`),                                                                                              
   CONSTRAINT `FK_yuqi_article_categories_1` FOREIGN KEY (`category_id`) REFERENCES `yuqi_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,  
   CONSTRAINT `FK_yuqi_article_categories_2` FOREIGN KEY (`article_id`) REFERENCES `yuqi_articles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE      
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
 
CREATE TABLE `yuqi_article_search` (                                                                                                       
   `article_id` int(10) unsigned NOT NULL,                                                                                                  
   `search_id` int(10) unsigned NOT NULL,                                                                                                   
   `widget` int(10) unsigned NOT NULL default '0' COMMENT '关键词出现次数',                                                          
   PRIMARY KEY  (`article_id`,`search_id`),                                                                                                 
   KEY `FK_yuqi_article_search_2` (`search_id`),                                                                                            
   CONSTRAINT `FK_yuqi_article_search_1` FOREIGN KEY (`article_id`) REFERENCES `yuqi_articles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,  
   CONSTRAINT `FK_yuqi_article_search_2` FOREIGN KEY (`search_id`) REFERENCES `yuqi_search` (`id`) ON DELETE CASCADE ON UPDATE CASCADE      
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
 
insert into `yq_adminmenus`(`id`,`name`,`parent_id`,`controller_name`,`function_name`,`view_order`,
`target`) values ( 4,'文章管理','0','','','0','0');
insert into `yq_adminmenus`(`id`,`name`,`parent_id`,`controller_name`,`function_name`,`view_order`,
`target`) values ( 5,'添加分类','4','category','add','0','0');
insert into `yq_adminmenus`(`id`,`name`,`parent_id`,`controller_name`,`function_name`,`view_order`,
`target`) values ( 6,'分类列表','4','category','list','0','0');
insert into `yq_adminmenus`(`id`,`name`,`parent_id`,`controller_name`,`function_name`,`view_order`,
`target`) values ( 7,'添加文章','4','article','add','0','0');
insert into `yq_adminmenus`(`id`,`name`,`parent_id`,`controller_name`,`function_name`,`view_order`,
`target`) values ( 8,'文章列表','4','article','list','0','0');

CREATE TABLE `yuqi_comments` (                                                                                                       
     `id` int(10) unsigned NOT NULL auto_increment,                                                                                     
     `article_id` int(10) unsigned NOT NULL,                                                                                            
     `user_id` int(10) unsigned NOT NULL,                                                                                               
     `create_time` bigint(20) unsigned NOT NULL,                                                                                        
     `content` text NOT NULL,                                                                                                           
     `status` int(11) NOT NULL,                                                                                                         
     PRIMARY KEY  (`id`),                                                                                                               
     KEY `FK_yuqi_comments_1` (`article_id`),                                                                                           
     KEY `FK_yuqi_comments_2` (`user_id`),                                                                                              
     CONSTRAINT `FK_yuqi_comments_1` FOREIGN KEY (`article_id`) REFERENCES `yuqi_articles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,  
     CONSTRAINT `FK_yuqi_comments_2` FOREIGN KEY (`user_id`) REFERENCES `yuqi_users` (`id`)                                             
   ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
   
alter table `yuqi_articles` add column `update_time` bigint (20)UNSIGNED  DEFAULT '0' NOT NULL  after `read_times`;
alter table `yuqi_articles` change `status` `status` tinyint (3) DEFAULT '1' NOT NULL ;