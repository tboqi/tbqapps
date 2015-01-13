<?php defined('SYSPATH') OR die('No direct script access.'); ?>

2015-01-13 01:49:34 --- ERROR: Kohana_Exception [ 0 ]: A valid cookie salt is required. Please set Cookie::$salt. ~ SYSPATH\classes\kohana\cookie.php [ 151 ]
2015-01-13 01:49:34 --- STRACE: Kohana_Exception [ 0 ]: A valid cookie salt is required. Please set Cookie::$salt. ~ SYSPATH\classes\kohana\cookie.php [ 151 ]
--
#0 D:\github\tbqapps\php\khn\khn3\khn3blog\system\classes\kohana\cookie.php(67): Kohana_Cookie::salt('auth_user', NULL)
#1 D:\github\tbqapps\php\khn\khn3\khn3blog\system\classes\kohana\request.php(202): Kohana_Cookie::get('auth_user')
#2 D:\github\tbqapps\php\khn\khn3\khn3blog\index.php(109): Kohana_Request::factory()
#3 {main}