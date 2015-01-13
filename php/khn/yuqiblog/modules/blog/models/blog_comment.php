<?php
class Blog_Comment_Model extends Base_Model {
	
	function __construct() {
		parent::__construct();
		$this->table = 'comments';
	}
	
	function find_by_article($article_id) {
		$sql = "select c.content, c.user_id, c.id, c.create_time, u.username, u.nickname
		from #__comments c
		left join #__users u on u.id=c.user_id
		where c.article_id=?";
		return $this->result_from_sql($sql, array($article_id));
	}
}