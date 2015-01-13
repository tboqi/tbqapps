<?php
class Article_Controller extends Sub_Template_Controller {
	function __construct() {
		parent::__construct();
	}
	
	function view($id) {
		$article_model = new Article_Model();
		$article_model->read_times($id);
		$comment_model = new Blog_Comment_Model();
		$view = new View('article/appindex_article_view');
		$view->article = $article_model->get($id);
		$this->navigation = appindex::navigation(array('welcome/index' => '首页'));
		$this->set_page_title($view->article->title);
		$this->set_description(article::summary($view->article->content));
		$this->set_keywords('keywords');
		$view->comments = $comment_model->find_by_article($view->article->id);
		$content = $this->sub_template($view, $view->article->title);
		$this->_render($content);
	}
}