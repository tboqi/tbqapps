<?php defined('SYSPATH') or die('No direct access allowed.');

return array(

    //    'driver' => 'Mysql',
    'driver' => 'File',
    'hash_key' => 'needEdit',
    'hash_method' => 'sha256',
    'lifetime' => 1209600,
    'session_type' => Session::$default,
    'session_key' => 'auth_user',

);