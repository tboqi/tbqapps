<?php defined('SYSPATH') OR die('No direct access allowed.');

return array
(
    'default' => array(
        'type' => 'PDO',
        'connection' => array(
            'dsn' => 'mysql:host=127.0.0.1;dbname=tienstest',
            'username' => 'root',
            'password' => '111111',
            'persistent' => FALSE,
        ),
        /**
         * The following extra options are available for PDO:
         *
         * string   identifier  set the escaping identifier
         */
        'table_prefix' => '',
        'charset' => 'utf8',
        'caching' => FALSE,
    ),
);
