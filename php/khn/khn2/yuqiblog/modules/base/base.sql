CREATE TABLE `yuqi_sessions` (                
     `session_id` varchar(127) NOT NULL,         
     `last_activity` int(10) unsigned NOT NULL,  
     `data` text NOT NULL,                       
     PRIMARY KEY  (`session_id`)                 
   ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
   
CREATE TABLE `yuqi_adminmenus` (                                                                   
   `id` int(11) unsigned NOT NULL auto_increment,                                                   
   `name` varchar(255) character set utf8 NOT NULL,                                                 
   `parent_id` int(11) unsigned NOT NULL default '0',                                               
   `controller_name` varchar(255) NOT NULL default '',                                              
   `function_name` varchar(255) NOT NULL default '',                                                
   `view_order` int(10) NOT NULL default '0',                                                       
   `target` int(11) NOT NULL default '0',                                                           
   `is_admin` int(1) NOT NULL default '1',                                                          
   PRIMARY KEY  (`id`),                                                                             
   KEY `FK_yuqi_adminmenus_1` (`parent_id`),                                                        
   CONSTRAINT `FK_yuqi_adminmenus_1` FOREIGN KEY (`parent_id`) REFERENCES `yuqi_adminmenus` (`id`)  
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
 
insert  into `yuqi_adminmenus`(`id`,`name`,`parent_id`,`controller_name`,`function_name`,`view_order`,`target`,`is_admin`) values (1,'系统管理',0,'','',0,0,1),(2,'修改密码',1,'user','editPassword',0,0,1),(3,'退出',1,'user','logout',100,1,0);

alter table `yuqi_adminmenus` drop foreign key  `FK_yuqi_adminmenus_1` ;
alter table `yuqi_adminmenus` drop column `controller_name`,change `function_name` `uri` varchar (255) DEFAULT '' NOT NULL  COLLATE latin1_swedish_ci , change `target` `target` int (11) DEFAULT '0' NOT NULL;
update `yuqi_adminmenus` set `id`='3',`name`='退出', `parent_id`='1', `uri`='user/logout', `view_order`='100', `target`='1', `is_admin`='0' where `id`='3';
alter table `yuqi_adminmenus` add column `app` enum ('admin','index','space') DEFAULT 'admin' NOT NULL  after `is_admin`;

insert into `yuqi_adminmenus`(`id`,`name`,`parent_id`,`uri`,`view_order`,`target`,`is_admin`,`app`) values ( NULL,'用户管理','0','','0','0','1','admin');
insert into `yuqi_adminmenus`(`id`,`name`,`parent_id`,`uri`,`view_order`,`target`,`is_admin`,`app`) values ( NULL,'搜索用户','0','','0','0','1','admin');
update `yuqi_adminmenus` set `id`='11',`name`='用户管理', `parent_id`='0', `uri`='', `view_order`='0', `target`='0', `is_admin`='1',`app`='admin' where `id`='4';
update `yuqi_adminmenus` set `id`='12',`name`='搜索用户', `parent_id`='11', `uri`='user/search', `view_order`='0', `target`='0',`is_admin`='1',`app`='admin' where `id`='5';
update `yuqi_adminmenus` set `id`='3',`name`='退出', `parent_id`='1', `uri`='user/logout', `view_order`='100', `target`='1',`is_admin`='0',`app`='index' where `id`='3';
alter table `yuqi_adminmenus` drop column `is_admin`;