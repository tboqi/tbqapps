<?php
class Blog_Model extends Base_Model {
	
	function __construct() {
		parent::__construct ();
		$this->table = 'blogs';
	}
}