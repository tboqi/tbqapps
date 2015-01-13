<?php
class Rss_Controller extends Template_Controller {
	
	function __construct() {
		parent::__construct();
	}
	
	function index() {
		$article_model = new Article_Model ();
		$view = new View ( 'rss' );
		$view->articles = $article_model->find(100);
		$view->render ( TRUE );
	}
}