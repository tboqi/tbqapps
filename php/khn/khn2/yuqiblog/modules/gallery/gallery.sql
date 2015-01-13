CREATE TABLE `yuqi_album` (                                                                                                
  `id` int(10) unsigned NOT NULL auto_increment,                                                                           
  `user_id` int(10) unsigned NOT NULL,                                                                                     
  `name` varchar(200) NOT NULL default '',                                                                                 
  `description` text NOT NULL,                                                                                             
  PRIMARY KEY  (`id`),                                                                                                     
  KEY `FK_yuqi_album_1` (`user_id`),                                                                                       
  CONSTRAINT `FK_yuqi_album_1` FOREIGN KEY (`user_id`) REFERENCES `yuqi_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE  
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `yuqi_photos` (                                                                                                 
   `id` int(10) unsigned NOT NULL auto_increment,                                                                             
   `album_id` int(10) unsigned NOT NULL,                                                                                      
   `photo` varchar(200) character set latin1 NOT NULL,                                                                        
   `description` text character set latin1 NOT NULL,                                                                          
   `front_cover` varchar(200) character set latin1 NOT NULL COMMENT '封面',                                                 
   PRIMARY KEY  (`id`),                                                                                                       
   KEY `FK_yuqi_photos_1` (`album_id`),                                                                                       
   CONSTRAINT `FK_yuqi_photos_1` FOREIGN KEY (`album_id`) REFERENCES `yuqi_album` (`id`) ON DELETE CASCADE ON UPDATE CASCADE  
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8;