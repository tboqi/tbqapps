<?php
class Model_Product extends Model_Base {
	
	function __construct() {
		$this->table = 'products';
	}
	
	function find_hot_products() {
		$arr = array();
		
		$sql = "select id,title from products order by read_times desc limit 10";
		$query = DB::query(Database::SELECT, $sql);
		$results = $query->as_object()->execute();
		
		foreach ($results as $row){
			$arr[] = $row;
		}
		return $arr;
	}
	
	function add_read_times($id) {
		DB::update('products')
		->set(array('read_times' => DB::expr('read_times + 1')))
		->where('id', '=', $id)->execute();
	}
	
	function find_by_category_id($category_id, $limit, $start, $fields) {
		$arr = array();
		
		$sql = "select {$fields} from products where category_id=:category_id ".
				"order by id desc limit :start, :limit";
		$query = DB::query(Database::SELECT, $sql);
		$query->param(':category_id', $category_id);
		$query->param(':start', $start);
		$query->param(':limit', $limit);
// 		$sql = $query->compile(Database::instance());
// 		echo $sql;exit;
		$results = $query->as_object()->execute();
		
		foreach ($results as $row){
			$arr[] = $row;
		}
		return $arr;
	}
	
	function count_by_category_id($category_id) {
		$total = DB::select(array('COUNT("id")', 'num'))
		->from($this->table)->where('category_id', '=', $category_id)
		->execute()->get('num', 0);
		return $total;
	}
	
}
