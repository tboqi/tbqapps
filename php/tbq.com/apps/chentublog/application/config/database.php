<?php defined('SYSPATH') or die('No direct access allowed.');

return array (
		'default' => array (
				'type' => 'PDO',
				'connection' => array (
						'dsn' => 'mysql:host=127.0.0.1;dbname=chentublog',
						'username' => 'root',
						'password' => '111111',
						'persistent' => FALSE 
				),
				'table_prefix' => '',
				'charset' => 'utf8',
				'caching' => FALSE 
		) 
);
