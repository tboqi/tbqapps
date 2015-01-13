<?php
class Search_Controller extends Sub_Template_Controller {
	function __construct() {
		parent::__construct ();
	}
	
	function index() {
		$search = $this->input->xss_clean ( $_REQUEST ['select'] );
		switch ($search) {
			case 'user' :
				$this->user ();
				break;
			
			default :
				$this->article ();
				break;
		}
	}
	
	function user($p = 1) {
		$user_searcher = new User_Searcher($this->input->xss_clean($_REQUEST ['keyword']), $p - 1, 12);
		$view = new View('user/blocks/appindex_users');
		$view->users = $user_searcher->result;
		$view->block_title = "用户搜索";
		$content = $this->sub_template($view, $view->block_title);
		$this->set_description($view->block_title);
		$this->set_keywords($view->block_title);
		$this->set_page_title($view->block_title);
		$this->navigation = appindex::navigation(array('welcome/index' => '首页'));
		$this->_render($content);
	}
	
	function article($p = 1) {
		$article_searcher = new Article_Searcher($this->input->xss_clean($_REQUEST ['keyword']), $p-1, 10);
		$view = new View('article/appindex_article_list');
		$view->articles = $article_searcher->result;
		$content = $this->sub_template($view, '文章搜索');
		$this->navigation = appindex::navigation(array('welcome/index' => '首页'));
		$this->set_description('文章搜索');
		$this->set_keywords('文章搜索');
		$this->set_page_title('文章搜索');
		$this->_render($content);
	}
}