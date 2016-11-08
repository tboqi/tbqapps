<?php defined('SYSPATH') OR die('No direct script access.'); ?>

2016-06-02 17:08:53 --- EMERGENCY: Database_Exception [ 1045 ]: SQLSTATE[HY000] [1045] Access denied for user 'root'@'localhost' (using password: NO) ~ MODPATH/database/classes/Kohana/Database/PDO.php [ 59 ] in /home/tboqi/code/bitbucket/khnapps/modules/database/classes/Kohana/Database/PDO.php:136
2016-06-02 17:08:53 --- DEBUG: #0 /home/tboqi/code/bitbucket/khnapps/modules/database/classes/Kohana/Database/PDO.php(136): Kohana_Database_PDO->connect()
#1 /home/tboqi/code/bitbucket/khnapps/modules/database/classes/Kohana/Database/Query.php(251): Kohana_Database_PDO->query(1, 'select * from w...', true, Array)
#2 /home/tboqi/code/bitbucket/khnapps/modules/base/classes/Model/Website.php(11): Kohana_Database_Query->execute()
#3 /home/tboqi/code/bitbucket/khnapps/modules/base/classes/Controller/Template.php(38): Model_Website->get_new()
#4 /home/tboqi/code/bitbucket/khnapps/apps/tbqwebsite.admin/appadmin/classes/Controller/Index.php(11): Controller_Template->before()
#5 /home/tboqi/code/bitbucket/khnapps/system_3.3_kohana/classes/Kohana/Controller.php(69): Controller_Index->before()
#6 [internal function]: Kohana_Controller->execute()
#7 /home/tboqi/code/bitbucket/khnapps/system_3.3_kohana/classes/Kohana/Request/Client/Internal.php(97): ReflectionMethod->invoke(Object(Controller_Index))
#8 /home/tboqi/code/bitbucket/khnapps/system_3.3_kohana/classes/Kohana/Request/Client.php(114): Kohana_Request_Client_Internal->execute_request(Object(Request), Object(Response))
#9 /home/tboqi/code/bitbucket/khnapps/system_3.3_kohana/classes/Kohana/Request.php(997): Kohana_Request_Client->execute(Object(Request))
#10 /home/tboqi/code/bitbucket/khnapps/apps/tbqwebsite.admin/config.php(122): Kohana_Request->execute()
#11 /home/tboqi/code/bitbucket/khnapps/apps/tbqwebsite.admin/index.php(10): include('/home/tboqi/cod...')
#12 {main} in /home/tboqi/code/bitbucket/khnapps/modules/database/classes/Kohana/Database/PDO.php:136
2016-06-02 17:09:42 --- EMERGENCY: ErrorException [ 1 ]: Class 'Auth_Mysql' not found ~ MODPATH/auth/classes/Kohana/Auth.php [ 37 ] in file:line
2016-06-02 17:09:42 --- DEBUG: #0 [internal function]: Kohana_Core::shutdown_handler()
#1 {main} in file:line
2016-06-02 17:12:07 --- EMERGENCY: ErrorException [ 1 ]: Class 'Model_User' not found ~ MODPATH/auth/classes/Auth/Mysql.php [ 13 ] in file:line
2016-06-02 17:12:07 --- DEBUG: #0 [internal function]: Kohana_Core::shutdown_handler()
#1 {main} in file:line
2016-06-02 17:31:24 --- EMERGENCY: Kohana_Exception [ 0 ]: Untrusted host khnapps_website.admin. If you trust khnapps_website.admin, add it to the trusted hosts in the `url` config file. ~ SYSPATH/classes/Kohana/URL.php [ 107 ] in /home/tboqi/code/bitbucket/khnapps/system_3.3_kohana/classes/Kohana/URL.php:144
2016-06-02 17:31:24 --- DEBUG: #0 /home/tboqi/code/bitbucket/khnapps/system_3.3_kohana/classes/Kohana/URL.php(144): Kohana_URL::base(true, true)
#1 /home/tboqi/code/bitbucket/khnapps/apps/tbqwebsite.admin/appadmin/classes/Controller/Index.php(14): Kohana_URL::site('user/login', true)
#2 /home/tboqi/code/bitbucket/khnapps/system_3.3_kohana/classes/Kohana/Controller.php(69): Controller_Index->before()
#3 [internal function]: Kohana_Controller->execute()
#4 /home/tboqi/code/bitbucket/khnapps/system_3.3_kohana/classes/Kohana/Request/Client/Internal.php(97): ReflectionMethod->invoke(Object(Controller_Index))
#5 /home/tboqi/code/bitbucket/khnapps/system_3.3_kohana/classes/Kohana/Request/Client.php(114): Kohana_Request_Client_Internal->execute_request(Object(Request), Object(Response))
#6 /home/tboqi/code/bitbucket/khnapps/system_3.3_kohana/classes/Kohana/Request.php(997): Kohana_Request_Client->execute(Object(Request))
#7 /home/tboqi/code/bitbucket/khnapps/apps/tbqwebsite.admin/config.php(122): Kohana_Request->execute()
#8 /home/tboqi/code/bitbucket/khnapps/apps/tbqwebsite.admin/index.php(10): include('/home/tboqi/cod...')
#9 {main} in /home/tboqi/code/bitbucket/khnapps/system_3.3_kohana/classes/Kohana/URL.php:144
2016-06-02 17:33:13 --- EMERGENCY: Kohana_Exception [ 0 ]: Untrusted host khnapps_website.admin. If you trust khnapps_website.admin, add it to the trusted hosts in the `url` config file. ~ SYSPATH/classes/Kohana/URL.php [ 107 ] in /home/tboqi/code/bitbucket/khnapps/system_3.3_kohana/classes/Kohana/URL.php:144
2016-06-02 17:33:13 --- DEBUG: #0 /home/tboqi/code/bitbucket/khnapps/system_3.3_kohana/classes/Kohana/URL.php(144): Kohana_URL::base(true, true)
#1 /home/tboqi/code/bitbucket/khnapps/apps/tbqwebsite.admin/appadmin/classes/Controller/Index.php(14): Kohana_URL::site('user/login', true)
#2 /home/tboqi/code/bitbucket/khnapps/system_3.3_kohana/classes/Kohana/Controller.php(69): Controller_Index->before()
#3 [internal function]: Kohana_Controller->execute()
#4 /home/tboqi/code/bitbucket/khnapps/system_3.3_kohana/classes/Kohana/Request/Client/Internal.php(97): ReflectionMethod->invoke(Object(Controller_Index))
#5 /home/tboqi/code/bitbucket/khnapps/system_3.3_kohana/classes/Kohana/Request/Client.php(114): Kohana_Request_Client_Internal->execute_request(Object(Request), Object(Response))
#6 /home/tboqi/code/bitbucket/khnapps/system_3.3_kohana/classes/Kohana/Request.php(997): Kohana_Request_Client->execute(Object(Request))
#7 /home/tboqi/code/bitbucket/khnapps/apps/tbqwebsite.admin/config.php(122): Kohana_Request->execute()
#8 /home/tboqi/code/bitbucket/khnapps/apps/tbqwebsite.admin/index.php(10): include('/home/tboqi/cod...')
#9 {main} in /home/tboqi/code/bitbucket/khnapps/system_3.3_kohana/classes/Kohana/URL.php:144