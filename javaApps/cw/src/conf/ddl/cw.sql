drop database IF EXISTS cw;
create database IF NOT EXISTS cw;   # character set utf8;
use cw;

create table IF NOT EXISTS member(
  Id int(10) unsigned NOT NULL auto_increment,
  Password varchar(16) not null,
  UserName varchar(30) not null,
  Email varchar(50) not null,
  Privilege int(10) default 0,
  PrivilegeDecimalValue int(10) default 0,
  Ip char(20) default '',
  RegisterTime datetime default 0,
  LastLoginTime datetime default 0,
  State int(3) not null default 0,
  Uuid varchar(32) not null default 0,
  primary key (Id)
)TYPE=InnoDB;

create index indexofmember on member(Id ASC);

create table if not exists article(
	Id int(10) unsigned not null auto_increment,
	Title varchar(50) default '',
	Content text default '',
	MemberId int(10) not null default 0,
	ChannelId int(10) not null default 0,
	SupportCount int (10) unsigned default 0,
	UnSupportCount int (10) unsigned default 0,
	CreateDate datetime not null,
	EndDate datetime default 0,
	State int(3) default 0,
	VoteResultType int(3) not null default 0,
  	Rate int(10) DEFAULT 0,
  	PublishType tinyint(2) DEFAULT 0,
	primary key(Id)

)TYPE=InnoDB;

create table if not exists remark(
	Id int(10) unsigned not null auto_increment,
	Title varchar(50) default '',
	Content text default '',
	MemberId int(10) not null default 0,
	ArticleId int(10) not null default 0,
	CreateDate datetime not null,
	Level int(3) not null default 0,
	Type tinyint(3) unsigned NOT NULL default 0,
	primary key(Id)

)TYPE=InnoDB;

create table if not exists label(
	Id int(10) unsigned not null auto_increment,
	ArticleId int(10) not null default 0,
	MemberId int(10) not null default 0,
	Content text not null,
	primary key(Id)
)TYPE=InnoDb;

create table if not exists clew(
	Id int(10) unsigned not null auto_increment,
	Creater int(10) not null default 0,
	Title varchar(20) not null default '',
	Discription varchar(200) not null default '',
	PicLink varchar(100) default '',
	
	primary key(Id)
)TYPE=InnoDb;

create table if not exists vote(
	Id int(10) unsigned not null auto_increment,
	MemberId int(10) not null default 0,
	ResourceId int(10) not null default 0,
	ResourceType varchar(10) not null default '',
	VoteCategory varchar(10) not null default '',
	VoteDate datetime not null,
	VoteNumber int(10) not null default 0,
	primary key(Id)	
)TYPE=InnoDb;

create table if not exists channel(
	Id int(10) unsigned not null auto_increment,
	MemberId int(10) not null default 0,
	Name varchar(20) not null default '',
	Keywords varchar(100) not null default '',
	Description text not null,
	CreateDate datetime not null,
	SupportCount int (10) unsigned not null default 0,
	UnSupportCount int (10) unsigned not null default 0,
	ArticleNums int(10) unsigned not null default 0,
	State int(3) not null default 1,
	primary key(Id)
)TYPE=InnoDb;

create table if not exists sessionval(	
	Id int(10) unsigned not null auto_increment,
	MemberId int(10) unsigned not null default 0,
	HostId varchar(100) not null,
	FirstVisitTime varchar(20) not null,
	LastVisitTime varchar(20) not null,
	FromIP varchar(15) not null,
	Privilege int(10) not null default 0,
	State int(3) not null default 1,
	primary key(Id) 
)TYPE=InnoDb;

create table if not exists atomLabel(	
	Id int(10) unsigned not null auto_increment,
	ProviderId int(10) unsigned not null default 0,
	Content varchar(20) not null,
	Count int(10) not null default 1,
	ArticleId int(10) unsigned NOT NULL DEFAULT 0,
	primary key(Id) 

)TYPE=InnoDb;

create table if not exists message(
	Id int  primary key auto_increment,
	SenderId int not null,
	ReceiveId int not null,
	MsgType int not null,
	State int not null DEFAULT 0,
	SendTime datetime not null ,
	Title varchar(20) DEFAULT '',
	Content text DEFAULT ''
)TYPE=InnoDb;

create table if not exists channelcategory(	
	Id int(10) unsigned not null auto_increment,
	Content varchar(20) not null,
	Count int(10) not null default 1,
	primary key(Id) 
)TYPE=InnoDb;

create table if not exists friend (                                  
          Id int(10) unsigned NOT NULL auto_increment,         
          MyId int(10) unsigned NOT NULL default 0,          
          FriendId int(10) unsigned NOT NULL default 0,      
          Comment varchar(200) default NULL,                   
          CreateDate datetime default NULL,
          PassedTime datetime default NULL,  
          State tinyint(3) NOT NULL default 0,      
          PRIMARY KEY  (Id)                                    
)TYPE=InnoDB;  

CREATE TABLE clicklog (                                                           
            `uuid` varchar(32) character set gbk NOT NULL,
            `articleid` int(10) NOT NULL,                                   
            `channelId` int(10) NOT NULL,                                   
            `tags` varchar(100) character set gbk default NULL,   
            `keyword` varchar(20) character set gbk NOT NULL,        
            `category` varchar(20) character set gbk default NULL,      
            `clicktime` datetime NOT NULL                               
)TYPE=InnoDB  