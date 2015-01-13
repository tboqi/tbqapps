<?php
defined ( 'SYSPATH' ) or die ( 'No direct access allowed.' );

class Welcome_Controller extends Template_Controller {
	
	public function __construct() {
		parent::__construct ();
	}
	
	public function index() {
		$content = new View ( 'home' );
		$this->set_page_title ( '首页' );
		$this->set_description ( 'yuqiblog' );
		$this->set_keywords ( 'yuqiblog' );
		$this->_render ( $content );
	}
}