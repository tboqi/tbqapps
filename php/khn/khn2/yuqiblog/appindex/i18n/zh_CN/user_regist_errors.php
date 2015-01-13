<?php
defined ( 'SYSPATH' ) or die ( 'No direct access allowed.' );

$lang = array (
	'username' => array (
		'required' => '用户名不能为空', 
		'length' => '长度必须在2－10之间', 
		'alpha_numeric' => '必须是字母和数字',
		'username_is_existed' => '用户已存在',
		'default' => '无效输入' 
	),
	'nickname' => array (
		'required' => '昵称不能为空', 
	),
	'password' => array (
		'required' => '密码不能为空', 
		'length' => '长度必须在2－10之间', 
		'alpha_dash' => '必须是英文字母，数字，下划线和破折号',
		'default' => '无效输入' 
	),
	'password2' => array (
		'required' => '密码确认不能为空', 
		'matches' => '两次密码输入不相等',
		'default' => '无效输入' 
	),
	'email' => array (
		'required' => 'Email不能为空', 
		'email' => '非法Email', 
		'email_is_existed' => 'Email已注册',
		'default' => '无效输入' 
	),
);