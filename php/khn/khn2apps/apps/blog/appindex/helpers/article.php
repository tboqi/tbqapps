<?php
defined ( 'SYSPATH' ) or die ( 'No direct script access.' );

class article_Core {
	
	public static function summary($content) {
		$content = strip_tags ( $content );
		return $content;
	}
	
	static function check_article_has_category($category_id, $article) {
		if (empty($article) || empty($article->categories)) {
			return false;
		}
		$categories = json_decode($article->categories);
		foreach ($categories as $cate) {
			if ($cate->id == $category_id) return TRUE;
		}
		return FALSE;
	}
	
	static function get_tabs_json($tabs_json) {
		if (empty($tabs_json)) return '';
		$tabs = json_decode($tabs_json);
		$s = '';
		$t = '';
		foreach ($tabs as $tab) {
			$t .= $s . $tab->tab;
			$s = ',';
		}
		return $t;
	}
}