<?php
class Admin_User_Controller {
	
	function index() {
		echo 1;
	}
	
	function login() {
		$view = new View();
		echo $view->display('admin/login');
	}
	
	function login_do() {
		echo 1;
	}
}