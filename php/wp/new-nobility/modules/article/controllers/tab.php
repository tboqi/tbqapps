<?php
class Tab_Controller extends Template_Controller {
	
	function __construct() {
		parent::__construct();
	} 
	
	function index() {
		$tab_model = new Tab_Model();
		$tabs = $tab_model->find_all();
		
		$this->set_page_title ( '所有标签' );
		$this->set_description ( '所有标签' );
		$this->set_keywords ( '所有标签' );
		
		$this->initContent('tabs', array('tabs' => $tabs));
	}
}