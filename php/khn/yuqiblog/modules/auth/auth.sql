CREATE TABLE `yuqi_users` (                                        
  `id` int(10) unsigned NOT NULL auto_increment,                   
  `username` varchar(200) NOT NULL,                                
  `nickname` varchar(200) character set utf8 NOT NULL default '',  
  `password` varchar(200) NOT NULL,                                
  `regist_time` bigint(20) unsigned NOT NULL,                      
  `email` varchar(200) NOT NULL,                                   
  `logins` int(10) unsigned NOT NULL,                              
  `last_login` int(10) unsigned NOT NULL,                          
  `session_id` varchar(127) NOT NULL default '',                   
  PRIMARY KEY  (`id`),                                             
  UNIQUE KEY `username` (`username`)                               
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `yuqi_roles` (                            
  `id` int(11) unsigned NOT NULL auto_increment,       
  `name` varchar(32) NOT NULL,                         
  `description` varchar(255) NOT NULL,                 
  PRIMARY KEY  (`id`),                                 
  UNIQUE KEY `uniq_name` (`name`)                      
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `yuqi_roles_users` (                                                                                                   
    `user_id` int(10) unsigned NOT NULL,                                                                                              
    `role_id` int(10) unsigned NOT NULL,                                                                                              
    PRIMARY KEY  (`user_id`,`role_id`),                                                                                               
    KEY `fk_role_id` (`role_id`),                                                                                                     
    CONSTRAINT `yuqi_roles_users_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `yuqi_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,  
    CONSTRAINT `yuqi_roles_users_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `yuqi_roles` (`id`) ON DELETE CASCADE                     
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `yuqi_user_tokens` (                                                                                                  
    `id` int(11) unsigned NOT NULL auto_increment,                                                                                   
    `user_id` int(11) unsigned NOT NULL,                                                                                             
    `user_agent` varchar(40) NOT NULL,                                                                                               
    `token` varchar(32) NOT NULL,                                                                                                    
    `created` int(10) unsigned NOT NULL,                                                                                             
    `expires` int(10) unsigned NOT NULL,                                                                                             
    PRIMARY KEY  (`id`),                                                                                                             
    UNIQUE KEY `uniq_token` (`token`),                                                                                               
    KEY `fk_user_id` (`user_id`),                                                                                                    
    CONSTRAINT `yuqi_user_tokens_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `yuqi_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE  
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert  into `yuqi_roles`(`id`,`name`,`description`) values (1,'ADMIN','超级管理员'),(2,'REGISTER','登录用户');
insert  into `yuqi_users`(`id`,`email`,`username`,`password`,`logins`,`last_login`,`nickname`) values (1,'tboqi301709@gmail.com','admin','d01115546380325e1b1c15c399a3bd4c681ef3a99f0b691632',22,1235524923,'管理员'),(3,'dsffds@dsf.com','sdfdsf','c8ff583906fab586aa88efe85ac15d09db70b3fd326c0f6164',1,1232353614,'sfdsf'),(4,'tboqi1@gg.com','tboqi1','d01115546380325e1b1c15c399a3bd4c681ef3a99f0b691632',2,1232356643,'tboqi');
insert  into `yuqi_roles_users`(`user_id`,`role_id`) values (1,1),(3,2),(4,2);

alter table `yuqi_users` add column `avatar` varchar (255) DEFAULT '' NOT NULL  after `session_id`;
insert into `yuqi_roles_users`(`user_id`,`role_id`) values ( '1','2');