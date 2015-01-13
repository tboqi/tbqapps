<?php
class Link_Model extends Base_Model {
	
	function __construct() {
		parent::__construct();
		$this->table = 'links';
	}
}