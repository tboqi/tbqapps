<?php
class Blog_Article_Model extends Article_Model {
	
	function __construct() {
		parent::__construct ();
	}
	
	function find_by_blog_id($creator_id, $per_page_num, $current_page) {
		$sql = "select a.id, a.title, a.content, a.user_id, a.create_time, a.read_times, u.username, u.nickname, c.comments from #__articles a
		left join #__users u on u.id=a.user_id
		left join (select count(*) comments, article_id from #__comments group by article_id) c on c.article_id=a.id
		left join #__blogs b on b.creator_id=u.id
		where a.status=1 and b.creator_id=?
		order by id desc limit ?, ?";
		return $this->result_from_sql ( $sql, array($creator_id, ($current_page - 1) * $per_page_num, $per_page_num) );
	}
	
	function find_by_blog_id_and_category_id($category_id, $creator_id, $per_page_num, $current_page) {
		$sql = "select a.id, a.title, a.content, a.user_id, a.create_time, a.read_times, u.username, u.nickname, c.comments from #__articles a
		left join #__users u on u.id=a.user_id
		left join (select count(*) comments, article_id from #__comments group by article_id) c on c.article_id=a.id
		left join #__blogs b on b.creator_id=u.id
		left join #__article_categories ac on ac.article_id=a.id
		where a.status=1 and b.creator_id=? and ac.category_id=?
		order by id desc limit ?, ?";
		return $this->result_from_sql ( $sql, array($creator_id, $category_id, ($current_page - 1) * $per_page_num, $per_page_num) );
	}
	
	function find_article_searchkey($article_id, $num) {
		$sql = "select s.key, s.id from yuqi_search s 
		left join yuqi_article_search artsearch on artsearch.search_id=s.id
		where artsearch.article_id=?
		order by artsearch.widget desc
		limit 0, ?";
		return $this->result_from_sql($sql, array($article_id, intval($num)));
	}
	
	function find_article_categories($article_id) {
		$sql = "select c.id, c.name from yuqi_categories c
		left join yuqi_article_categories ac on ac.category_id=c.id
		where ac.article_id=?";
		return $this->result_from_sql($sql, array($article_id));
	}
	
	function find_by_blog_id_and_uncate($creator_id, $per_page_num, $current_page) {
		$sql = "select a.id, a.title, a.content, a.user_id, a.create_time, a.read_times, u.username, u.nickname, c.comments from #__articles a
		left join #__users u on u.id=a.user_id
		left join (select count(*) comments, article_id from #__comments group by article_id) c on c.article_id=a.id
		left join #__blogs b on b.creator_id=u.id
		where a.status=1 and b.creator_id=?
		and a.id not in (select article_id from #__article_categories)
		order by id desc limit ?, ?";
		return $this->result_from_sql ( $sql, array($creator_id, ($current_page - 1) * $per_page_num, $per_page_num) );
	}
	
	function count_by_blog_id($creator_id) {
		$sql = "select count(*) from #__articles a
		left join #__users u on u.id=a.user_id
		left join (select count(*) comments, article_id from #__comments group by article_id) c on c.article_id=a.id
		left join #__blogs b on b.creator_id=u.id
		where a.status=1 and b.creator_id=?";
		return $this->getone($sql, array($creator_id));
	}
	
	function count_by_blog_id_and_category_id($creator_id, $category_id) {
		$sql = "select count(*) from #__articles a
		left join #__users u on u.id=a.user_id
		left join (select count(*) comments, article_id from #__comments group by article_id) c on c.article_id=a.id
		left join #__blogs b on b.creator_id=u.id
		left join #__article_categories ac on ac.article_id=a.id
		where a.status=1 and b.creator_id=? and ac.category_id=?";
		return $this->getone($sql, array($creator_id, $category_id));
	}
	
	function count_by_blog_id_and_uncate($creator_id) {
		$sql = "select count(*) from #__articles a
		left join #__users u on u.id=a.user_id
		left join (select count(*) comments, article_id from #__comments group by article_id) c on c.article_id=a.id
		left join #__blogs b on b.creator_id=u.id
		where a.status=1 and b.creator_id=?
		and a.id not in (select article_id from #__article_categories)";
		return $this->getone($sql, array($creator_id));
	}
	
	function getCategories($articleid) {
		$sql = 'select category_id from #__article_categories where article_id=?';
		$categories = $this->result_from_sql($sql, array($articleid));
		$arr = array();
		if (!empty($categories) && is_array($categories) && count($categories) > 0) {
			foreach ($categories as $cate) {
				$arr[] = $cate->category_id;
			}
		}
		return $arr;
	}
	
	function previous_article($user_id, $current_article_id) {
		$sql = "select * from yuqi_articles where id>? and user_id=? order by id limit 1";
		$query = $this->db->query($sql, array($current_article_id, $user_id));
		return $query->current();
	}
	
	function next_article($user_id, $current_article_id) {
		$sql = "select * from yuqi_articles where id<? and user_id=? order by id desc limit 1";
		$query = $this->db->query($sql, array($current_article_id, $user_id));
		return $query->current();
	}
	
	function blog_articles($blog_id, $num) {
		$sql = "select * from yuqi_articles where user_id=? order by id limit ?";
		return $this->result_from_sql($sql, array($blog_id, $num));
	}
}