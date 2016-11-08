<?php
class Controller_Sitemap extends Controller {
	
	function action_index() {
		$this->auto_render = false;
		$article_model = new Model_Article ();
		$view = View::factory( 'sitemap' );
		$view->articles = $article_model->find(300, 0);
		$view->domain = URL::base($this->request);
		$this->response->body($view->render());
	}
}