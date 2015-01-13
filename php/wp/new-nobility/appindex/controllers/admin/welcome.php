<?php
class Welcome_Controller extends Admin_Template_Controller {
	
	function __construct() {
		parent::__construct ();
	}
	
	function index() {
		$this->auto_render = false;
		$content = new View ( 'admin_home' );
		$content->render ( TRUE );
	}
	
	function main() {
		$this->set_page_title ( '欢迎访问' );
		$this->initContent('admin_main');
	}
	
	function menu() {
		$this->auto_render = false;
		$adminmenu_model = new Adminmenu_Model();
		$content = new View ( 'admin_menu' );
		$content->menus = $adminmenu_model->menus();
		$content->render ( TRUE );
	}
}