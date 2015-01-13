<?php
class category_block_Core {
	static function category_list($num = 10, $start = 0) {
		$num = intval($num);
		$start = intval($start);
		
		$cache = Cache::instance();
		
		$key = hcache::parse_key('block', 'category_block_Core', 'category_list', 
			array($num, $start) );
		
		$object = $cache->get ( $key );
		if (is_null($object)) {
			$category_model = new Category_Model();
			$object = new View('block_article_category_list');
			$object->categories = $category_model->categories_with_articlenum();
			
			$cache->set ( $key, $object );
		}
		
		return $object;
	}
}