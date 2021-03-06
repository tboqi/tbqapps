<?php defined('SYSPATH') or die('No direct access allowed.');

return array
(
		'default' => array(
				'type'       => 'pdo',
				'connection' => array(
						/**
						 * The following options are available for PDO:
		*
		* string   dsn         Data Source Name
		* string   username    database username
		* string   password    database password
		* boolean  persistent  use persistent connections?
		*/
						'dsn'        => 'mysql:host='.DB_HOST.';dbname=' . DB_NAME,
						'username'   => 'root',
						'password'   => '',
						'persistent' => FALSE,
				),
				/**
				 * The following extra options are available for PDO:
		*
		* string   identifier  set the escaping identifier
		*/
				'table_prefix' => '',
				'charset'      => 'utf8',
				'caching'      => FALSE,
				'profiling'    => TRUE,
		),
);