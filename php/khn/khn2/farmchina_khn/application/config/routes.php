<?php defined('SYSPATH') OR die('No direct access allowed.');
/**
 * @package  Core
 *
 * Sets the default route to "welcome"
 */
$config['_default'] = 'welcome';
$config['article/findByCategory/([0-9]+)'] = 'article/findByCategory/$1';

$config['admin'] = "admin/welcome";