<?php
class Sitemap_Controller extends Template_Controller {
	
	function __construct() {
		parent::__construct();
	}
	
	function index() {
		$key = hcache::parse_key('control', 'Sitemap_Controller', 'index' );
		$cache = Cache::instance();
		$articles = $cache->get ( $key );
		if (is_null($articles)) {
			$article_model = new Article_Model ();
			$articles = $article_model->find (50000, 0);
			$cache->set ( $key, $articles );
		}
		
		$view = new View ( 'sitemap' );
		$view->articles = $articles;
		$view->render ( TRUE );
	}
}