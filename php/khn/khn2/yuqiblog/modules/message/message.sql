CREATE TABLE `yuqi_messages` (                                  
                 `id` int(10) unsigned NOT NULL auto_increment,                
                 `from_id` int(10) unsigned NOT NULL,                          
                 `to_id` int(10) unsigned NOT NULL,                            
                 `create_time` bigint(20) unsigned NOT NULL,                   
                 `is_read` tinyint(1) NOT NULL default '1',                    
                 `to_remove` tinyint(1) NOT NULL default '0',                  
                 `to_remove_time` bigint(20) default NULL,                     
                 `from_remove` tinyint(1) NOT NULL default '0',                
                 `from_remove_time` bigint(20) default NULL,                   
                 `title` varchar(255) character set utf8 NOT NULL default '',  
                 `content` text character set utf8,                            
                 `system_message` tinyint(1) NOT NULL default '0',             
                 PRIMARY KEY  (`id`)                                           
               ) ENGINE=InnoDB;