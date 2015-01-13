<?php defined('SYSPATH') OR die('No direct access allowed.');

$lang = array( 
    'username' => array(
	    'required'         => '名字不能为空',
	    'alpha_numeric'    => '只允许输入字母和数字',
        'length'           => '输入字符的长度为 5 ~~ 30',
        'user_is_not_exist' => '用户不存在',
	    'default'          => '输入错误',
    ),
    'password' => array(
        'required'  => '密码不能为空',
        'length'    => '输入字符的长度为 5 ~~ 30',
        'password_is_error' => '密码错误',
        'default'   => '输入错误',
    ),
);