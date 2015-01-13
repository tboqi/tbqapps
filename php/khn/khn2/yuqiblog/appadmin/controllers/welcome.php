<?php
class Welcome_Controller extends Admin_Template_Controller {
	
	function __construct() {
		parent::__construct ();
	}
	
	function index() {
		$this->runAdmin('home');
	}
	
	function top() {
		$this->runAdmin('top');
	}
	
	function main() {
		$this->runAdmin('main');
	}
	
	function menu() {
		$adminmenu_model = new Adminmenu_Model();
		$this->data['menus'] = $adminmenu_model->menus();
		$this->runAdmin('menu');
	}
}