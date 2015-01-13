<?php
class Search_Model extends Base_Model {
	function __construct() {
		parent::__construct ();
		$this->table = "search";
	}

	/**
	 * 传入一个aritcle数组，将相关key和相关widget 写入 aritcle_search 表中
	 * 
	 * 先删除这个article的相关信息
	 *
	 * @param array $article
	 */
	function parseArticleSearcher($article) {
		$this->db->delete("article_search", array("article_id" => $article['id']));
		
		$searchList = $this->all();
		if($searchList && is_array($searchList) && count($searchList) > 0) {
			$articleSearch = array("article_id" => $article['id']);
			$articleTitle = $this->stringutil->removeHtmltag($article['title']);
			$articleContent = $this->stringutil->removeHtmltag($article['content']);
			foreach ($searchList as $search) {
				$widgetTitle = $this->stringutil->widget($articleTitle, $search->key);
				$widgetContent = $this->stringutil->widget($articleContent, $search->key);
				if($widgetTitle > 0 || $widgetContent > 0) {
					$articleSearch['widget'] = $widgetTitle + $widgetContent;
					$articleSearch['search_id'] = $search->id;
					$this->db->insert("article_search", $articleSearch);
				}
			}
		}
	}
	
}