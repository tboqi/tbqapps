<?php
class Search_Controller extends Controller {
	
	function __construct() {
		parent::__construct ();
		$this->MSearch = new Search_Model();
	}
	
	function index($key = "", $page = 0) {
		if ($key == "") {
			$key = $this->post ( "key" );
		}
		if ($this->MSearch->searchCount ( $key ) <= 0) {
			$this->MSearch->initSearch ( $key );
		}
		$perPage = 10;
		$objects = $this->MSearch->searchResult($key, intval($page), $perPage);
		$this->setData("downloads", $objects);
		
		$config['base_url'] = url::site("search/index");
		$config['total_items'] = $this->MSearch->searchCount ( $key );
        $config['items_per_page'] = $perPage;
        $config['uri_segment'] = $key;
        $config['style'] = 'digg';
        $this->pagination = new Pagination($config);
		
		$this->setData("pageTitle", $key . "的所有下载");
		$this->run ( "download/list" );
	}
}
