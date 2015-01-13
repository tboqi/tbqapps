<?php
class Welcome_Controller extends Admin_Template_Controller {
	
	function __construct() {
		parent::__construct ();
	}
	
	function index() {
		$this->set_page_title ( '欢迎访问' );
		$this->initContent('admin/index');
	}
}