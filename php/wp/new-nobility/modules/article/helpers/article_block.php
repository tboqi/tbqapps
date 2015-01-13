<?php
class article_block_Core {
	static function new_articles($num = 10, $start = 0) {
		$num = intval($num);
		$start = intval($start);
		
		$cache = Cache::instance();
		
		$key = hcache::parse_key('block', 'article_block_Core', 'new_articles', 
			array($num, $start) );
		
		$object = $cache->get ( $key );
		if (is_null($object)) {
			$article_model = new Article_Model();
			$object = new View('block_articles');
			$object->articles = $article_model->new_articles($num, $start);
			$object->title = '最新文章';
			
			$cache->set ( $key, $object );
		}
		
		return $object;
	}
	
	static function rand_articles($num = 10) {
		$num = intval($num);
		
		$cache = Cache::instance();
		
		$key = hcache::parse_key('block', 'article_block_Core', 'new_articles', $num);
		
		$object = $cache->get ( $key );
		if (is_null($object)) {
			$article_model = new Article_Model();
			$object = new View('block_articles');
			$object->articles = $article_model->find_rand($num);
			$object->title = '随机文章';
			
			$cache->set ( $key, $object );
		}
		
		return $object;
	}
	
	static function display_article($article, $displaySummary = 0) {
		$displaySummary = intval($displaySummary);
		
		$cache = Cache::instance();
		
		$key = hcache::parse_key('block', 'article_block_Core', 'display_article', 
			array(serialize($article), $displaySummary) );
		
		$object = $cache->get ( $key );
		if (is_null($object)) {
			$article->content = nl2br ( $article->content );
			if ($displaySummary) {
				$article->content = empty ( $article->summary ) ? $article->content : $article->summary;
			}
			$object = new View ( 'block_article' );
			$object->article = $article;
			$object->displaySummary = $displaySummary;
			
			$cache->set ( $key, $object );
		}
		
		return $object;
	}
	/**
	 * 相关文章
	 * @param int $article_id
	 * @param int $num
	 */
	static function relative_articles($article_id, $num = 10) {
		$article_id = intval($article_id);
		if ($article_id < 1) return null;
		$num = intval($num);
		
		$cache = Cache::instance();
		
		$key = hcache::parse_key('block', 'article_block_Core', 'relative_articles', array($article_id, $num));
		
		$object = $cache->get ( $key );
//		if (is_null($object)) {
			$article_model = new Article_Model();
			$object = new View('block_articles');
			$object->articles = $article_model->find_relative($article_id, $num);
			$object->title = '相关文章';
			
			$cache->set ( $key, $object );
//		}
		
		return $object;
	}
}