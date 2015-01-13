<?php defined('SYSPATH') OR die('No direct access allowed.');

$lang = array( 
        'oldpassword' => array(
	        'required'             => '旧密码不能为空',
	        'oldpassword_error'    => '旧密码输入有误',
	        'default'              => '输入错误',
	    ),
        'newpassword' => array(
	        'required'         => '新密码不能为空',
	        'length'           => '输入字符的长度为 5 ~~ 30',
	        'alpha_numeric'    => '只允许输入字母和数字',
	        'matches'          => '两次输入密码不一致',
	        'default'          => '输入错误',
	    ),
);