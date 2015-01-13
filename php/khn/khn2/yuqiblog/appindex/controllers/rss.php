<?php
class Rss_Controller extends Template_Controller {
	
	function __construct() {
		parent::__construct();
	}
	
	function blog($id) {
		$space_model = new Blog_Model();
		$article_model = new Blog_Article_Model();
		$view = new View('rss');
		$space = $space_model->get_by(array('creator_id' => $id));
		if (empty($space)) {
			$space = new Space();
		}
		$view->space = $space;
		$view->articles = $article_model->blog_articles($id, 10);
		$view->render(TRUE);
	}
}