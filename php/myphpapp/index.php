<?php
define('DOC_ROOT', '/media/data/workspace/phpapp/myphpapp/myphpapp/');

function __autoload($class_name) {
	$class_name_arr = explode('_', $class_name);
	foreach ($class_name_arr as &$value) {
		$value = lcfirst($value);
	}
	$file = implode('/', $class_name_arr) . '.php';
	if (file_exists('classes/' . $file)) {
		require_once 'classes/' . $file;
	} elseif (file_exists('core/' . $file)) {
		require_once 'core/' . $file;
	} else {
// 		exit("您访问的类 $class_name 不存在");
	}
}

$router = new Router();

$controller = new $router->class;
$controller->{$router->method}();