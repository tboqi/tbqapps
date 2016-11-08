<?php defined('SYSPATH') or die('No direct access allowed.');

return array
(
    'default' => array(
        'type' => 'PDO',
        'connection' => array(
            'dsn' => 'mysql:host=' . DB_HOST . ';dbname=' . DB_NAME,
            'username' => DB_USER,
            'password' => DB_PASS,
            'persistent' => FALSE,
        ),
        'table_prefix' => '',
        'charset' => 'utf8',
        'caching' => FALSE,
    ),
);
