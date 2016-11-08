<?php defined('SYSPATH') OR die('No direct access allowed.');

return array
(
    'default' => array(
        'type' => 'PDO',
        'connection' => array(
            /**
             * The following options are available for PDO:
             *
             * string   dsn         Data Source Name
             * string   username    database username
             * string   password    database password
             * boolean  persistent  use persistent connections?
             */
            'dsn' => 'mysql:host=127.0.0.1;dbname=khnapps_main',
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
