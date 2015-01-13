<?php
defined ( 'SYSPATH' ) or die ( 'No direct access allowed.' );

class Category_Controller extends Base_Controller {
	
	function __construct() {
		parent::__construct ();
		$this->load->model ( 'MCategory', '', TRUE );
	}
}
