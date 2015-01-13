<?php
class appindex_Core {
	/**
	 * 网页头部导航
	 *
	 * @param array $nav 导航的内容，按顺序的数组 名字＋链接
	 */
	static function navigation($nav) {
		$view = new View('navigation');
		$view->nav = html::anchor_array($nav);
		return $view;
	}
	
	static function mainmenu() {
		$category_model = new Blog_Category_Model();
		$view = new View('blocks/mainmenu');
		$view->categories = $category_model->categories_orderby_article_counts(10);
		return $view;
	}
}