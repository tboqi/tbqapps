<?php
defined ( 'SYSPATH' ) or die ( 'No direct script access.' );

class article_Core {
	
	public static function summary($content) {
		$content = strip_tags ( $content );
		return $content;
	}
	
	static function get_tabs_by_artid($artid, $use_cache = 1) {
		$artid = intval($artid);
		
		if ($use_cache) {
			$cache = Cache::instance();
			
			$key = hcache::parse_key('helper', 'article_Core', 'get_tabs_by_artid', $artid );
			
			$tabs = $cache->get ( $key );
			if (is_null($tabs)) {
				$tab_model = new Tab_Model ();
				$tabs = $tab_model->get_tabs_by_artid ( $artid );
				
				$cache->set ( $key, $tabs );
			}
		} else {
			$tab_model = new Tab_Model ();
			$tabs = $tab_model->get_tabs_by_artid ( $artid );
		}
		
		return $tabs;
	}
	
	static function get_tabs_string_by_artid($artid, $use_cache = 1) {
		$tabs_array = self::get_tabs_by_artid($artid, $use_cache);
		$tabs = $s = '';
		foreach ($tabs_array as $tab) {
			$tabs .= $s . $tab->tab;
			$s = ',';
		}
		return $tabs;
	}
	
	static function get_categories_by_artid($artid) {
		$artid = intval($artid);
		
		$cache = Cache::instance();
		
		$key = hcache::parse_key('helper', 'article_Core', 'get_categories_by_artid', $artid );
		
		$categories = $cache->get ( $key );
		if (is_null($categories)) {
			$category_model = new Category_Model ();
			$categories = $category_model->get_categories_by_artid ( $artid );
			
			$cache->set ( $key, $categories );
		}
		
		return $categories;
	}
	
	static function check_article_has_category($category_id, $article_id) {
		$category_id = intval($category_id);
		$article_id = intval($article_id);
		
		$category_model = new Category_Model ();
		$categories = $category_model->get_categories_by_artid ( $article_id );
		foreach ($categories as $cate) {
			if ($cate->id == $category_id) return TRUE;
		}
		return FALSE;
	}
}