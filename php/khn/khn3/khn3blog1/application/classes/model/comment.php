<?php
class Model_Comment extends Model_Base {
	
	function __construct() {
		$this->table = 'article_comments';
	}
	
	function find_by_article_id($article_id) {
		$arr = array();
		
		$sql = "select * from {$this->table} where article_id=:article_id order by id desc";
		$query = DB::query(Database::SELECT, $sql);
		$query->param(':article_id', $article_id);
		$results = $query->as_object()->execute();
		
		foreach ($results as $row){
			$arr[] = $row;
		}
		return $arr;
	}
}