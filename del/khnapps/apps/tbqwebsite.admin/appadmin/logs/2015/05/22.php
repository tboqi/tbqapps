<?php defined('SYSPATH') OR die('No direct script access.'); ?>

2015-05-22 21:53:26 --- EMERGENCY: ErrorException [ 1 ]: Call to undefined method Request::redirect() ~ APPPATH/classes/Controller/Index.php [ 15 ] in file:line
2015-05-22 21:53:26 --- DEBUG: #0 [internal function]: Kohana_Core::shutdown_handler()
#1 {main} in file:line
2015-05-22 21:55:45 --- EMERGENCY: Kohana_Exception [ 0 ]: A valid cookie salt is required. Please set Cookie::$salt in your bootstrap.php. For more information check the documentation ~ SYSPATH/classes/Kohana/Cookie.php [ 158 ] in /Users/tangboqi/bitbucket/khnapps/system/classes/Kohana/Cookie.php:67
2015-05-22 21:55:45 --- DEBUG: #0 /Users/tangboqi/bitbucket/khnapps/system/classes/Kohana/Cookie.php(67): Kohana_Cookie::salt('session', NULL)
#1 /Users/tangboqi/bitbucket/khnapps/system/classes/Kohana/Request.php(151): Kohana_Cookie::get('session')
#2 /Users/tangboqi/bitbucket/khnapps/apps/tbqwebsite/config.php(122): Kohana_Request::factory()
#3 /Users/tangboqi/bitbucket/khnapps/apps/tbqwebsite/admin.php(10): include('/Users/tangboqi...')
#4 {main} in /Users/tangboqi/bitbucket/khnapps/system/classes/Kohana/Cookie.php:67