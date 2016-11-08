<?php defined('SYSPATH') OR die('No direct script access.'); ?>

2016-05-24 17:04:53 --- EMERGENCY: ErrorException [ 1 ]: Class 'Pagination' not found ~ APPPATH/classes/Controller/Article.php [ 12 ] in file:line
2016-05-24 17:04:53 --- DEBUG: #0 [internal function]: Kohana_Core::shutdown_handler()
#1 {main} in file:line
2016-05-24 17:06:42 --- EMERGENCY: ErrorException [ 1 ]: Class 'Pagination' not found ~ APPPATH/classes/Controller/Article.php [ 12 ] in file:line
2016-05-24 17:06:42 --- DEBUG: #0 [internal function]: Kohana_Core::shutdown_handler()
#1 {main} in file:line
2016-05-24 17:06:44 --- EMERGENCY: ErrorException [ 1 ]: Class 'Pagination' not found ~ APPPATH/classes/Controller/Article.php [ 12 ] in file:line
2016-05-24 17:06:44 --- DEBUG: #0 [internal function]: Kohana_Core::shutdown_handler()
#1 {main} in file:line
2016-05-24 17:06:45 --- EMERGENCY: ErrorException [ 1 ]: Class 'Pagination' not found ~ APPPATH/classes/Controller/Article.php [ 12 ] in file:line
2016-05-24 17:06:45 --- DEBUG: #0 [internal function]: Kohana_Core::shutdown_handler()
#1 {main} in file:line
2016-05-24 17:06:46 --- EMERGENCY: ErrorException [ 1 ]: Class 'Pagination' not found ~ APPPATH/classes/Controller/Article.php [ 12 ] in file:line
2016-05-24 17:06:46 --- DEBUG: #0 [internal function]: Kohana_Core::shutdown_handler()
#1 {main} in file:line
2016-05-24 17:06:46 --- EMERGENCY: ErrorException [ 1 ]: Class 'Pagination' not found ~ APPPATH/classes/Controller/Article.php [ 12 ] in file:line
2016-05-24 17:06:46 --- DEBUG: #0 [internal function]: Kohana_Core::shutdown_handler()
#1 {main} in file:line
2016-05-24 17:06:46 --- EMERGENCY: ErrorException [ 1 ]: Class 'Pagination' not found ~ APPPATH/classes/Controller/Article.php [ 12 ] in file:line
2016-05-24 17:06:46 --- DEBUG: #0 [internal function]: Kohana_Core::shutdown_handler()
#1 {main} in file:line
2016-05-24 17:10:04 --- EMERGENCY: Database_Exception [ 1045 ]: SQLSTATE[HY000] [1045] Access denied for user 'root'@'localhost' (using password: NO) ~ MODPATH/database/classes/Kohana/Database/PDO.php [ 59 ] in /home/tboqi/code/bitbucket/khnapps/modules/database/classes/Kohana/Database/PDO.php:136
2016-05-24 17:10:04 --- DEBUG: #0 /home/tboqi/code/bitbucket/khnapps/modules/database/classes/Kohana/Database/PDO.php(136): Kohana_Database_PDO->connect()
#1 /home/tboqi/code/bitbucket/khnapps/modules/database/classes/Kohana/Database/Query.php(251): Kohana_Database_PDO->query(1, 'SELECT COUNT("i...', false, Array)
#2 /home/tboqi/code/bitbucket/khnapps/apps/chentublog/application/classes/Model/Article.php(25): Kohana_Database_Query->execute()
#3 /home/tboqi/code/bitbucket/khnapps/apps/chentublog/application/classes/Controller/Article.php(13): Model_Article->count()
#4 /home/tboqi/code/bitbucket/khnapps/system_3.3_kohana/classes/Kohana/Controller.php(84): Controller_Article->action_index()
#5 [internal function]: Kohana_Controller->execute()
#6 /home/tboqi/code/bitbucket/khnapps/system_3.3_kohana/classes/Kohana/Request/Client/Internal.php(97): ReflectionMethod->invoke(Object(Controller_Article))
#7 /home/tboqi/code/bitbucket/khnapps/system_3.3_kohana/classes/Kohana/Request/Client.php(114): Kohana_Request_Client_Internal->execute_request(Object(Request), Object(Response))
#8 /home/tboqi/code/bitbucket/khnapps/system_3.3_kohana/classes/Kohana/Request.php(997): Kohana_Request_Client->execute(Object(Request))
#9 /home/tboqi/code/bitbucket/khnapps/apps/chentublog/index.php(110): Kohana_Request->execute()
#10 {main} in /home/tboqi/code/bitbucket/khnapps/modules/database/classes/Kohana/Database/PDO.php:136
2016-05-24 17:31:43 --- EMERGENCY: Database_Exception [ 1045 ]: SQLSTATE[HY000] [1045] Access denied for user 'root'@'localhost' (using password: NO) ~ MODPATH/database/classes/Kohana/Database/PDO.php [ 59 ] in /home/tboqi/code/bitbucket/khnapps/modules/database/classes/Kohana/Database/PDO.php:136
2016-05-24 17:31:43 --- DEBUG: #0 /home/tboqi/code/bitbucket/khnapps/modules/database/classes/Kohana/Database/PDO.php(136): Kohana_Database_PDO->connect()
#1 /home/tboqi/code/bitbucket/khnapps/modules/database/classes/Kohana/Database/Query.php(251): Kohana_Database_PDO->query(1, 'SELECT COUNT("i...', false, Array)
#2 /home/tboqi/code/bitbucket/khnapps/apps/chentublog/application/classes/Model/Article.php(25): Kohana_Database_Query->execute()
#3 /home/tboqi/code/bitbucket/khnapps/apps/chentublog/application/classes/Controller/Article.php(13): Model_Article->count()
#4 /home/tboqi/code/bitbucket/khnapps/system_3.3_kohana/classes/Kohana/Controller.php(84): Controller_Article->action_index()
#5 [internal function]: Kohana_Controller->execute()
#6 /home/tboqi/code/bitbucket/khnapps/system_3.3_kohana/classes/Kohana/Request/Client/Internal.php(97): ReflectionMethod->invoke(Object(Controller_Article))
#7 /home/tboqi/code/bitbucket/khnapps/system_3.3_kohana/classes/Kohana/Request/Client.php(114): Kohana_Request_Client_Internal->execute_request(Object(Request), Object(Response))
#8 /home/tboqi/code/bitbucket/khnapps/system_3.3_kohana/classes/Kohana/Request.php(997): Kohana_Request_Client->execute(Object(Request))
#9 /home/tboqi/code/bitbucket/khnapps/apps/chentublog/index.php(110): Kohana_Request->execute()
#10 {main} in /home/tboqi/code/bitbucket/khnapps/modules/database/classes/Kohana/Database/PDO.php:136
2016-05-24 17:32:59 --- EMERGENCY: Database_Exception [ 42S02 ]: SQLSTATE[42S02]: Base table or view not found: 1146 Table 'chentublog.v_articles' doesn't exist [ select * from v_articles order by id desc limit 0, 10 ] ~ MODPATH/database/classes/Kohana/Database/PDO.php [ 157 ] in /home/tboqi/code/bitbucket/khnapps/modules/database/classes/Kohana/Database/Query.php:251
2016-05-24 17:32:59 --- DEBUG: #0 /home/tboqi/code/bitbucket/khnapps/modules/database/classes/Kohana/Database/Query.php(251): Kohana_Database_PDO->query(1, 'select * from v...', true, Array)
#1 /home/tboqi/code/bitbucket/khnapps/apps/chentublog/application/classes/Model/Article.php(15): Kohana_Database_Query->execute()
#2 /home/tboqi/code/bitbucket/khnapps/apps/chentublog/application/classes/Controller/Article.php(23): Model_Article->find(10, 0)
#3 /home/tboqi/code/bitbucket/khnapps/system_3.3_kohana/classes/Kohana/Controller.php(84): Controller_Article->action_index()
#4 [internal function]: Kohana_Controller->execute()
#5 /home/tboqi/code/bitbucket/khnapps/system_3.3_kohana/classes/Kohana/Request/Client/Internal.php(97): ReflectionMethod->invoke(Object(Controller_Article))
#6 /home/tboqi/code/bitbucket/khnapps/system_3.3_kohana/classes/Kohana/Request/Client.php(114): Kohana_Request_Client_Internal->execute_request(Object(Request), Object(Response))
#7 /home/tboqi/code/bitbucket/khnapps/system_3.3_kohana/classes/Kohana/Request.php(997): Kohana_Request_Client->execute(Object(Request))
#8 /home/tboqi/code/bitbucket/khnapps/apps/chentublog/index.php(110): Kohana_Request->execute()
#9 {main} in /home/tboqi/code/bitbucket/khnapps/modules/database/classes/Kohana/Database/Query.php:251
2016-05-24 17:44:55 --- EMERGENCY: ErrorException [ 1 ]: Class 'block_Article' not found ~ APPPATH/views/article/articles.php [ 2 ] in file:line
2016-05-24 17:44:55 --- DEBUG: #0 [internal function]: Kohana_Core::shutdown_handler()
#1 {main} in file:line