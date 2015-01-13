<?php
/**
 * 5.3版本可用
 */
version_compare(PHP_VERSION, '5.3', '<') and exit('requires PHP 5.3 or newer.');

/**
 * Set the error reporting level. Unless you have a special need, E_ALL is a
 * good level for error reporting.
 * 
 * Turning off display_errors will effectively disable Kohana error display
 * and logging. You can turn off Kohana errors in application/config/config.php
 */
error_reporting(E_ALL & ~E_STRICT);
ini_set('display_errors', TRUE);

define('DOCROOT', getcwd().DIRECTORY_SEPARATOR);

// Define application and system paths
define('APPPATH', '/media/data/workspace/phpapp/tbqphp/app/');
define('MODPATH', '/media/data/workspace/phpapp/tbqphp/modules/');
define('SYSPATH', '/media/data/workspace/phpapp/tbqphp/system/');

define('DEFAULT_CONTROLLER', 'welcome');

/**
 * Fake file extension that will be added to all generated URLs. Example: .html
 */
define('URL_SUFFIX', '');

require SYSPATH.'core/Bootstrap.php';