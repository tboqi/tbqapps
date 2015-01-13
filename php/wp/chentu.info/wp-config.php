<?php
/** 
 * WordPress 基础配置文件。
 *
 * 本文件包含以下配置选项: MySQL 设置、数据库表名前缀、
 * 密匙、WordPress 语言设定以及 ABSPATH。如需更多信息，请访问
 * {@link http://codex.wordpress.org/Editing_wp-config.php 编辑
 * wp-config.php} Codex 页面。MySQL 设置具体信息请咨询您的空间提供商。
 *
 * 这个文件用在于安装程序自动生成 wp-config.php 配置文件，
 * 您可以手动复制这个文件，并重命名为 wp-config.php，然后输入相关信息。
 *
 * @package WordPress
 */

// ** MySQL 设置 - 具体信息来自您正在使用的主机 ** //
/** WordPress 数据库的名称 */
//define('DB_NAME', 'C321871_khnblog');
define('DB_NAME', 'chentu.info');

/** MySQL 数据库用户名 */
//define('DB_USER', 'C321871_khnblog');
define('DB_USER', 'root');

/** MySQL 数据库密码 */
//define('DB_PASSWORD', '1qaz!QAZ');
define('DB_PASSWORD', 'root');

/** MySQL 主机 */
//define('DB_HOST', 'mysql1008.ixwebhosting.com');
define('DB_HOST', 'localhost');

/** 创建数据表时默认的文字编码 */
define('DB_CHARSET', 'utf8');

/** 数据库整理类型。如不确定请勿更改 */
define('DB_COLLATE', '');

/**#@+
 * 身份密匙设定。
 *
 * 您可以随意写一些字符
 * 或者直接访问 {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org 私钥生成服务}，
 * 任何修改都会导致 cookie 失效，所有用户必须重新登录。
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         '{}~Lpz1VV!jss5AEGzuV~-%M4xws8jB4YY.q0vN%2Wn9,6v qTJ2o]rbTCg_:rY(');
define('SECURE_AUTH_KEY',  'RH%4qvx?>h;c`9N5@8jhy$VF4>`g][;&~aF*C8?J^CcMbXeJ1=03|<L&KojG:iy1');
define('LOGGED_IN_KEY',    'r7^vp1dB|wu,9Z69MnPC9r`T-.oL;itxs`;Dz|(cA>c{2P[% <AJg+p.0Sdll=52');
define('NONCE_KEY',        'd=Kl5EfR1<EdJq2o|O>&4[Nswn]0!Iu^^2!24V,>::dG:ipd3q5$BeeE*QdR^-#>');
define('AUTH_SALT',        'QY.[Cq,ApY`bV%RzW~>.E2E9;9r@mBR#RS]a`?bf,sb[@NIy^e9l_n`&<67LEj_!');
define('SECURE_AUTH_SALT', 'W[G/K|_a;#QbQvt>s&fR5R+]5z+wb]=JC7EL,}>fSyoU-s?qq.M8qI*>35lIsLZD');
define('LOGGED_IN_SALT',   '5<uQ1O$5uV.-hG.|epEW}^J@c[@lkpm|OHu]J 29|j4R3U+@_@n~<*T+`V&>@Xeb');
define('NONCE_SALT',       'L*wPM(,8th2%mIG5*IQ3a2A/y~_JHV-j2fN0){1Cz&s&;nv*qJ-S)Ji tg_L)FBi');

/**#@-*/

/**
 * WordPress 数据表前缀。
 *
 * 如果您有在同一数据库内安装多个 WordPress 的需求，请为每个 WordPress 设置不同的数据表前缀。
 * 前缀名只能为数字、字母加下划线。
 */
$table_prefix  = 'wp_';

/**
 * WordPress 语言设置，默认为英语。
 *
 * 本项设定能够让 WordPress 显示您需要的语言。
 * wp-content/languages 内应放置同名的 .mo 语言文件。
 * 要使用 WordPress 简体中文界面，只需填入 zh_CN。
 */
define ('WPLANG', 'zh_CN');

/**
 * 开发者专用：WordPress 调试模式。
 *
 * 将这个值改为“true”，WordPress 将显示所有用于开发的提示。
 * 强烈建议插件开发者在开发环境中启用本功能。
 */
define('WP_DEBUG', false);

/**
 * 解决错误
 * Fatal error: Allowed memory size of 33554432 bytes exhausted (tried to allocate xxx bytes)
 */
define('WP_MEMORY_LIMIT', '64M');

/* 好了！请不要再继续编辑。请保存该文件。使用愉快！ */

/** WordPress 目录的绝对路径。 */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** 设置 WordPress 变量和包含文件。 */
require_once(ABSPATH . 'wp-settings.php');

define('WP_ALLOW_REPAIR', true);
