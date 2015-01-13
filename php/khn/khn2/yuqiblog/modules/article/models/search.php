<?php
defined ( 'SYSPATH' ) or die ( 'No direct script access.' );

/**
 * @author Tang Boqi
 */

class Search_Model extends Base_Model {
	
	public function __construct() {
		parent::__construct ();
		$this->table = 'search';
	}
	
	function delete_article_search($article_id) {
		$this->db->query ( "delete from #__article_search where article_id='{$article_id}'" );
	}
	
	function insert_article_search($article_search) {
		$this->db->insert ( "article_search", $article_search );
	}
	/**
	 * 判断key是否已存在
	 * 不存在检索文章，将key相关写入search
	 * 并返回文章
	 * 
	 * 如果存在，返回文章
	 *
	 * @param string $key
	 */
	function search_articles($key, $start = 0, $num = 10) {
		if ($this->is_existed('key', $key)) {
			$sql = "select a.title, a.content, a.id, a.user_id, a.create_time, a_s.widget, u.username, u.nickname
			from #__articles a
			left join #__article_search a_s on a_s.article_id=a.id
			left join #__search s on s.id=a_s.search_id
			left join #__users u on u.id=a.user_id
			where s.key=?
			order by a.id desc
			limit ?, ?";
			return $this->result_from_sql($sql, array($key, $start, $num));
		} else {
			$id = $this->create(array('key' => $key));
			$sql = "select a.title, a.content, a.id, a.user_id, a.create_time, a_s.widget, u.username, u.nickname
			from #__articles a
			left join #__article_search a_s on a_s.article_id=a.id
			left join #__search s on s.id=a_s.search_id
			left join #__users u on u.id=a.user_id
			where title like '%{$key}%' or content like '%{$key}%'
			order by a.id desc
			limit {$start}, {$num}";
			$articles = $this->result_from_sql($sql);
			if (is_array($articles) && count($articles) > 0) {
				foreach ($articles as $article) {
					$as = array('article_id' => $article->id, 'search_id' => $id);
					$wtitle = StringUtil::widget($article->title, $key);
					$content = StringUtil::removeHtmltag($article->content);
					$wcontent = StringUtil::widget($content, $key);
					$as['widget'] = $wcontent + $wtitle;
					$this->insert_article_search($as);
				}
			}
			return $articles;
		}
	}
	
	function search_article_count($key) {
		$sql = "select count(*)
		from #__articles a
		left join #__article_search a_s on a_s.article_id=a.id
		left join #__search s on s.id=a_s.search_id
		left join #__users u on u.id=a.user_id
		where s.key='$key'";
		return $this->getone($sql);
	}
}