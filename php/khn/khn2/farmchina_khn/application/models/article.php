<?php
class Article_Model extends Base_Model {
	private $fields = "a.id, a.title, a.content, a.author_id, u.nickname, a.category_id, 
		c.name as category_name, a.create_time, a.img from #__articles a
		left join #__categories c on c.id=a.category_id
		left join #__users u on u.id=a.author_id";
	function __construct() {
		parent::__construct ();
		$this->table = "articles";
		 
	}
	
	function findArticles($start, $num) {
		$sql = "select " . $this->fields . " order by create_time desc limit ?, ?";
		return $this->objects($sql, array($start, $num));
	}
	
	function findNewArticles($start, $num) {
		$sql = "select " . $this->fields . " where a.category_id !=20 order by create_time desc limit ?, ?";
		return $this->objects($sql, array($start, $num));
	}
	
	function findNewArticlesImg($start, $num) {
		$sql = "select " . $this->fields . " where img is not null and a.category_id !=20 order by create_time desc limit ?, ?";
		return $this->objects($sql, array($start, $num));
	}
	
	function findArticlesByCategory($categoryID, $start, $num) {
		$sql = "select " . $this->fields . " where a.category_id=? 
		order by create_time desc limit ?, ?";
		return $this->objects($sql, array($categoryID, $start, $num));
	}
	
	function findArticlesByCategoryWithImg($categoryID, $start, $num) {
		$sql = "select " . $this->fields . " where a.category_id=? and a.img is not null 
		order by create_time desc limit ?, ?";
		return $this->objects($sql, array($categoryID, $start, $num));
	}
	
	function articlesCountOfCategory($categoryID) {
		$sql = "select count(*) c from #__articles where category_id=?";
		$o = $this->object($sql, array($categoryID));
		return $o->c;
	}
	
	function get($articleID) {
		$sql = "select {$this->fields} where a.id=?";
		return $this->object($sql, array($articleID));
	}
	
	function gonggao() {
		$sql = "select {$this->fields} where a.category_id=20 
		order by create_time desc limit 1";
		return $this->object($sql);
	}
}
