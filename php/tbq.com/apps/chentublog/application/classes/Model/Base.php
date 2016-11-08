<?php
class Model_Base extends Model_Database {
	
	protected $table;
	
	function find_all() {
		$arr = array();
		
		$sql = "select * from `{$this->table}` order by num desc";
		$query = DB::query(Database::SELECT, $sql);
		$results = $query->as_object()->execute();
		
		foreach ($results as $row){
			$arr[] = $row;
		}
		return $arr;
	}
	
	function insert(array $category) {
		$fields = array();
		$values = array();
		foreach ($category as $field => $value) {
			$fields[] = $field;
			$values[] = $value;
		}
		$insert = DB::insert($this->table)->columns($fields)->values($values);
 
		list($insert_id, $affected_rows) = $insert->execute();
		return $insert_id;
	}
	
	function get($id) {
		$query = DB::select()->from($this->table)->where('id', '=', $id);
		$results = $query->as_object()->execute();
		return $results->current();
	}
	
	function update(array $array, $id) {
		$update_rows = DB::update($this->table)->set($array)
		->where('id', '=', $id)->execute();
		return $update_rows;
	}
	
	function del($id) {
		$delete_rows = DB::delete($this->table)
		->where('id', '=', $id)->execute();
		return $delete_rows;
	}
}