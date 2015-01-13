<?php defined('SYSPATH') or die('No direct script access.'); ?>

2012-03-29 12:22:36 +08:00 --- error: 未捕获PHP Error异常: mysqli::mysqli(): (28000/1045): Access denied for user 'root'@'localhost' (using password: NO) 于文件 system/libraries/drivers/Database/Mysqli.php 在行 50
2012-03-29 12:22:36 +08:00 --- error: Missing i18n entry core.stack_trace for language zh_CN
2012-03-29 15:53:57 +08:00 --- error: 未捕获PHP Error异常: mysqli::mysqli(): (28000/1045): Access denied for user 'root'@'localhost' (using password: NO) 于文件 system/libraries/drivers/Database/Mysqli.php 在行 50
2012-03-29 15:53:57 +08:00 --- error: Missing i18n entry core.stack_trace for language zh_CN
2012-03-29 15:54:48 +08:00 --- error: 未捕获PHP Error异常: mysqli::mysqli(): (42000/1049): Unknown database 'yuqiblog' 于文件 system/libraries/drivers/Database/Mysqli.php 在行 50
2012-03-29 15:54:48 +08:00 --- error: Missing i18n entry core.stack_trace for language zh_CN
2012-03-29 15:56:54 +08:00 --- error: 未捕获Kohana_Database_Exception异常: SQL错误: Table 'yuqiblog.yuqi_sessions' doesn't exist - SELECT *
FROM `yuqi_sessions`
WHERE `session_id` = 'nul2j0cks6rk3268iejtg5gf30'
LIMIT 0, 1 于文件 system/libraries/drivers/Database/Mysqli.php 在行 147
2012-03-29 15:56:54 +08:00 --- error: Missing i18n entry core.stack_trace for language zh_CN
2012-03-29 15:57:31 +08:00 --- error: 未捕获Kohana_Database_Exception异常: SQL错误: Table 'yuqiblog.yuqi_sessions' doesn't exist - SELECT *
FROM `yuqi_sessions`
WHERE `session_id` = 'nul2j0cks6rk3268iejtg5gf30'
LIMIT 0, 1 于文件 system/libraries/drivers/Database/Mysqli.php 在行 147
2012-03-29 15:57:31 +08:00 --- error: Missing i18n entry core.stack_trace for language zh_CN
2012-03-29 16:03:50 +08:00 --- error: 未捕获Kohana_Database_Exception异常: SQL错误: Table 'yuqiblog.yuqi_categories' doesn't exist - select c.id, c.name, ac.num 
		from yuqi_categories c
		left join (select count(*) as num, category_id from yuqi_article_categories group by category_id) ac on ac.category_id=c.id
		order by ac.num desc
		limit 10 于文件 system/libraries/drivers/Database/Mysqli.php 在行 147
2012-03-29 16:03:50 +08:00 --- error: Missing i18n entry core.stack_trace for language zh_CN
2012-03-29 17:00:42 +08:00 --- error: 未捕获Kohana_Exception异常: 请求的 view, <tt>user/regist</tt>, 不存在. 于文件 system/core/Kohana.php 在行 934
2012-03-29 17:00:42 +08:00 --- error: Missing i18n entry core.stack_trace for language zh_CN
2012-03-29 17:05:54 +08:00 --- error: 未捕获Kohana_Exception异常: 请求的 view, <tt>user/regist</tt>, 不存在. 于文件 system/core/Kohana.php 在行 934
2012-03-29 17:05:54 +08:00 --- error: Missing i18n entry core.stack_trace for language zh_CN
2012-03-29 17:05:58 +08:00 --- error: 未捕获Kohana_Exception异常: 请求的 view, <tt>user/regist</tt>, 不存在. 于文件 system/core/Kohana.php 在行 934
2012-03-29 17:05:58 +08:00 --- error: Missing i18n entry core.stack_trace for language zh_CN
2012-03-29 17:06:02 +08:00 --- error: 未捕获Kohana_Exception异常: 请求的 view, <tt>user/regist</tt>, 不存在. 于文件 system/core/Kohana.php 在行 934
2012-03-29 17:06:02 +08:00 --- error: Missing i18n entry core.stack_trace for language zh_CN
2012-03-29 17:13:46 +08:00 --- error: 未捕获Kohana_Exception异常: 请求的 view, <tt>user/regist</tt>, 不存在. 于文件 system/core/Kohana.php 在行 934
2012-03-29 17:13:46 +08:00 --- error: Missing i18n entry core.stack_trace for language zh_CN
