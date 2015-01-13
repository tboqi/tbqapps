<?php
class article_block_Core {
	static function new_articles($num = 10, $start = 0) {
		$article_model = new Article_Model();
		$view = new View('article/blocks/appindex_new_articles');
		$view->articles = $article_model->new_articles($num, $start);
		return $view;
	}
}