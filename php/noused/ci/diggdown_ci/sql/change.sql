alter table `users` change `create_time` `create_time` bigint   NOT NULL ;

CREATE TABLE `download_search` (                                                                                                   
   `id` int(10) unsigned NOT NULL auto_increment,                                                                                   
   `key` varchar(45) NOT NULL,                                                                                                      
   `widget` int(10) unsigned NOT NULL default '0',                                                                                  
   `download_id` int(10) unsigned NOT NULL,                                                                                         
   PRIMARY KEY  (`id`),                                                                                                             
   KEY `FK_download_search_1` (`download_id`),                                                                                      
   CONSTRAINT `FK_download_search_1` FOREIGN KEY (`download_id`) REFERENCES `downloads` (`id`) ON DELETE CASCADE ON UPDATE CASCADE  
 ) ENGINE=InnoDB;

alter table `download_search` add index `key` (`key`);

alter table `download_search` change `key` `key` varchar (45) DEFAULT '' NOT NULL  COLLATE utf8_general_ci 