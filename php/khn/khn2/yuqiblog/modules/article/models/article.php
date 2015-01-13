<?php
class Article_Model extends Base_Model {
	
	function __construct() {
		parent::__construct ();
		$this->table = 'articles';
	}
	
	function find($results = 15, $startIndex = 0, $sort = 'id', $dir = 'asc') {
		$sql = "select a.id, a.title, u.username as author, c.title as category from yq_articles a left join yq_users u on u.id=a.author_id left join yq_categories c on c.id=a.category_id order by {$sort} {$dir} limit {$startIndex}, {$results}";
		return $this->result_from_sql ( $sql );
	}
	
	function new_articles($num, $start = 0) {
		$query = $this->db->orderby(array('id' => 'desc'))->get($this->table, $num, $start);
		return $query->result_array();
	}
	
	function get($id) {
		$sql = "select a.id, a.title, a.content, a.user_id, a.create_time, a.read_times, u.username, u.nickname 
		from #__articles a
		left join #__users u on u.id=a.user_id
		where a.id=?";
		return $this->getrow($sql, array($id));
	}
	
	function read_times($id) {
		$sql = "update #__articles set read_times=read_times+1 where id={$id}";
		$this->db->query($sql);
	}
}