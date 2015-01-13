<?php
class Welcome_Controller extends Base_Admin_Controller {
	
	function __construct() {
		parent::__construct ();
	}
	
	function index() {
		$this->checkAdmin();
		$this->runAdmin('home');
	}
	
	function top() {
		$this->checkAdmin();
		$this->runAdmin('top');
	}
	
	function main() {
		$this->checkAdmin();
		$this->runAdmin('main');
	}
	
	function menu() {
		$this->checkAdmin();
		$this->runAdmin('menu');
	}
}