# chentublog

wampserver2.5-Apache-2.4.9-Mysql-5.6.17-php5.5.12-64b.exe

use khn 3.3/master
https://github.com/tboqi/chentukhn_core
https://github.com/tboqi/chentu_khn

我的个人博客

<VirtualHost *:80>
    DocumentRoot "D:/github/chentublog/"
    ServerName chentublog
    <Directory "D:/github/chentublog/">
	    Options Indexes FollowSymLinks
	    AllowOverride All
	    Allow from all
	</Directory>
</VirtualHost> 

127.0.0.1 chentublog

php版本大于5.3

先执行install.php 检查环境