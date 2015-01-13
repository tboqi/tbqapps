<?php
class Photo extends Base_Model {
	function __construct() {
		parent::__construct();
		$this->table = 'photos';
	}
}