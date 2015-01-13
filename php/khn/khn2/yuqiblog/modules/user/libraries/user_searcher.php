<?php
class User_Searcher_Core {
	private $keyword;
	private $search_count;
	private $result;
	
	function __construct($keyword, $start = 0, $num = 10) {
		$this->keyword = $keyword;
		$this->db = new Database();
		$this->search_count = $this->_search_count($keyword);
		$this->result = $this->_search_result($keyword, $start, $num);
	}
	
	private function _search_result($keyword, $start = 0, $num = 10) {
		$sql = "select * from #__users 
		where username like '%{$keyword}%'
		or nickname like '%{$keyword}%'
		order by id desc
		limit $start, $num";
		$query = $this->db->query ( $sql );
		return $query->result_array ();
	}
	
	private function _search_count($keyword) {
		$sql = "select count(*) from #__users 
		where username like '%{$keyword}%'
		or nickname like '%{$keyword}%'";
		$query = $this->db->query ( $sql );
		$query->result(FALSE, MYSQL_NUM);
		$row = $query->current();
		return $row[0];
	}

	public function __get($name) {
		return $this->$name;
	}
}