<?php
class Model_Contact extends Model_Base {
	
	function __construct() {
		$this->table = 'contact';
	}
	
	function get_new() {
		$sql = "select * from {$this->table} order by id desc limit 1";
		$query = DB::query(Database::SELECT, $sql);
		$result = $query->as_object()->execute();
		$row = $result->current();
		if (empty($row)) {
			$row = array('title' => 'a', 'description' => 'b', 'keywords' => 'c', 'id' => 0);
			return json_decode(json_encode($row));
		} else {
			return $row;
		}
	}
}