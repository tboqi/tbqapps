<?php
/*
 * 文件：Session
 *
 * 选项：
 *  driver         - Session 驱动名：'cookie'，'database'，'native' 或 'cache'
 *  storage        - Session 使用驱动（数据库或缓存）的储存参数
 *  name           - 默认 Session 名（仅字母，数字和下划线）
 *  validate       - 设置 Session 参数到变量（user_agent，ip_address）
 *  encryption     - 密钥，设置 FALSE 关闭 session 加密
 *  expiration     - 每个 Session 维持的生命周期（秒）（设置为 0 表示直到退出浏览器才终止 Session）
 *  regenerate     - 一些网页载入前 Session 更新（设置为 0 标志关闭自动更新）
 *  gc_probability - 百分比概率表示垃圾收集将被收集
 */
$config = array (	'driver' => 'cookie', 
									'storage' => '', 
									'name' => 'kohanasession', 
									'validate' => array ('user_agent' ), 
									'encryption' => FALSE, 
									'expiration' => 7200, 
									'regenerate' => 3, 
									'gc_probability' => 2 );