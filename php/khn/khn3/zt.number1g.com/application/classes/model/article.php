<?php
class Model_Article extends Model_Base {
	
	function __construct() {
		$this->table = 'articles';
	}
	
	function find($limit, $start) {
		$arr = array();
		
		$sql = "select * from articles order by id desc limit :start, :limit";
		$query = DB::query(Database::SELECT, $sql);
		$query->param(':start', $start);
		$query->param(':limit', $limit);
		$results = $query->as_object()->execute();
		
		foreach ($results as $row){
			$arr[] = $row;
		}
		return $arr;
	}
	
	function count() {
		$total = DB::select(array('COUNT("id")', 'num'))
		->from($this->table)->execute()->get('num', 0);
		return $total;
	}
	
	function find_hot_articles() {
		$arr = array();
		
		$sql = "select * from articles order by read_times desc limit 10";
		$query = DB::query(Database::SELECT, $sql);
		$results = $query->as_object()->execute();
		
		foreach ($results as $row){
			$arr[] = $row;
		}
		return $arr;
	}
	
	function add_read_times($id) {
		DB::update('articles')
		->set(array('read_times' => DB::expr('read_times + 1')))
		->where('id', '=', $id)->execute();
	}
	
	function find_by_category_id($category_id, $limit, $start) {
		$arr = array();
		
		$sql = "select * from articles where category_id=:category_id order by id desc limit :start, :limit";
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
	
	function update_article_tab_link($tab_array, $art_id) {
		DB::delete('article_tab_link')->where('article_id', '=', $art_id)
		->execute();
		$insert_query = DB::insert('article_tab_link')
		->columns(array('article_id', 'tab_id'));
		print_r($tab_array);
		foreach ($tab_array as $tab) {
			echo $art_id, $tab['id'];
			$insert_query->values(array($art_id, $tab['id']));
		}
		$insert_query->execute();
	}

	function count_by_tab_id($tab_id) {
		$total = DB::select(array('COUNT("article_id")', 'num'))
		->from('article_tab_link')->where('tab_id', '=', $tab_id)
		->execute()->get('num', 0);
		return $total;
	}
	
	function find_by_tab_id($tab_id, $limit, $start) {
		$arr = array();
		
		$sql = "select * from articles " 
		. "where id in (select article_id from article_tab_link where tab_id=:tab_id) " 
		. "order by id desc limit :start, :limit";
		$query = DB::query(Database::SELECT, $sql);
		$query->param(':tab_id', $tab_id);
		$query->param(':start', $start);
		$query->param(':limit', $limit);
		$results = $query->as_object()->execute();
		
		foreach ($results as $row){
			$arr[] = $row;
		}
		return $arr;
	}
}
