<?php
define('BASE_URL', '/');
// define('BASE_URL', '/taoli/');
define('DB_HOST', '127.0.0.1');
define('DB_NAME', 'khnapps_website');
define('DB_USER', 'root');
define('DB_PASS', '111111');
define('USED_MODULES', 'base|article|auth|database|pagination|link|product');
$modules = 'modules';
$system = 'system';

define('EXT', '.php');
error_reporting(E_ALL | E_STRICT);
define('DOCROOT', realpath(dirname(__FILE__)) . DIRECTORY_SEPARATOR);

// Make the application relative to the docroot, for symlink'd index.php
if (!is_dir($application) AND is_dir(DOCROOT . $application)) {
    $application = DOCROOT . $application;
}

// Make the modules relative to the docroot, for symlink'd index.php
if (!is_dir($modules) AND is_dir(DOCROOT . $modules)) {
    $modules = DOCROOT . $modules;
}

// Make the system relative to the docroot, for symlink'd index.php
if (!is_dir($system) AND is_dir(DOCROOT . $system)) {
    $system = DOCROOT . $system;
}

// Define the absolute paths for configured directories
define('APPPATH', realpath($application) . DIRECTORY_SEPARATOR);
define('MODPATH', realpath($modules) . DIRECTORY_SEPARATOR);
define('SYSPATH', realpath($system) . DIRECTORY_SEPARATOR);

// Clean up the configuration vars
unset($application, $modules, $system);

if (file_exists('install' . EXT)) {
    // Load the installation check
    return include 'install' . EXT;
}

/**
 * Define the start time of the application, used for profiling.
 */
if (!defined('KOHANA_START_TIME')) {
    define('KOHANA_START_TIME', microtime(TRUE));
}

/**
 * Define the memory usage at the start of the application, used for profiling.
 */
if (!defined('KOHANA_START_MEMORY')) {
    define('KOHANA_START_MEMORY', memory_get_usage());
}

// Bootstrap the application
require APPPATH . 'bootstrap' . EXT;

/**
 * Execute the main request. A source of the URI can be passed, eg: $_SERVER['PATH_INFO'].
 * If no source is specified, the URI will be automatically detected.
 */
echo Request::factory()
    ->execute()
    ->send_headers()
    ->body();
