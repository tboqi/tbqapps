<?php
abstract class Admin_Template_Controller extends Template_Controller {
	
	function __construct() {
		parent::__construct ();
		$this->checkAdmin ();
		$this->template = 'admin/template';
	}
	
	protected function checkAdmin() {
		if (Auth::instance ()->auto_login() && ! Auth::instance ()->logged_in ( 'ADMIN' )) {
			$this->showmessage('您的权限不够，请重新登录', url::site('user/login'), 2);
		}
	}
}