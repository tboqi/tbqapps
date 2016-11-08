<?php defined('SYSPATH') or die('No direct access allowed.');

return array(

	'driver'       => 'mysql',
	'hash_method'  => 'sha256',
	'hash_key'     => 'blog',//NULL
	'lifetime'     => 1209600, // 60 * 60 * 24 * 14
	'session_type' => Session::$default,
	'session_key'  => 'auth_user',

	// Username/password combinations for the Auth File driver
	'users' => array(
		'admin' => '5f728a520f30af4c3778740e1c58086f413f63f968cefe10a0f359f72c94338d',
	),

);
