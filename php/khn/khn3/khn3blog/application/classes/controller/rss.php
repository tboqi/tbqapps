<?php
class Controller_Rss extends Controller_Template {
	
	function action_index() {
		$this->auto_render = false;
		$article_model = new Model_Article ();
		$view = View::factory( 'rss' );
		$view->articles = $article_model->find(30, 0);
		$this->response->body($view->render());
	}
}