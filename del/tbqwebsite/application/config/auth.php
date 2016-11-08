<?php defined('SYSPATH') or die('No direct access allowed.');

return array(

	'driver'       => 'file',
	'hash_method'  => 'sha256',
	'hash_key'     => 'blog',//NULL
	'lifetime'     => 1209600, // 60 * 60 * 24 * 14
	'session_type' => Session::$default,
	'session_key'  => 'auth_user',

	// Username/password combinations for the Auth File driver
	'users' => array(
		'admin' => '758b4c37cd73dae84525390ba418945c8ade1a936c04edb33dc94e63f08162c8',
	),

);
