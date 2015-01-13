<?php
class Block_Article {
	
	static function categories() {
		$view = View::factory('blocks/article/categories');
		$model_article_category = new Model_Article_Category();
		$view->categories = $model_article_category->find_all();
		echo $view->render();
	}
	
	static function hot_articles() {
		$view = View::factory('blocks/article/hotArticles');
		$model_article = new Model_Article();
		$view->articles = $model_article->find_hot_articles ( );
		echo $view->render();
	}
	
	static function article($article, $showContent = false) {
		$view = View::factory('blocks/article/article');
		$view->article = $article;
		$view->showContent = $showContent;
		echo $view->render();
	}
}