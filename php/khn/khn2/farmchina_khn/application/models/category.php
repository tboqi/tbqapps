<?php
class Category_Model extends Base_Model {
	
	function __construct() {
		parent::__construct ();
		$this->table = "categories";
	}
	
	function allExceptGonggao() {
		$sql = "select * from #__categories where id != 20";
		return $this->objects($sql);
	}
}
