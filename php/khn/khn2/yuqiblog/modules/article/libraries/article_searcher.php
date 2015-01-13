<?php
class Article_Searcher_Core {
private $keyword;
	private $search_count;
	private $result;
	
	function __construct($keyword, $start = 0, $num = 10) {
		$this->keyword = $keyword;
		$search_model = new Search_Model();
		$this->result = $search_model->search_articles($keyword, $start, $num);
		$this->search_count = $search_model->search_article_count($keyword);
	}

	public function __get($name) {
		return $this->$name;
	}
}