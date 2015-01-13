<?php
defined ( 'SYSPATH' ) or die ( 'No direct access allowed.' );

class Search_Controller extends Base_Controller {
	
	function __construct() {
		parent::__construct ();
		$this->load->model ( 'MSearch' );
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
		
		$config['base_url'] = url::site("search/index/" . $key);
		$config['total_rows'] = $this->MSearch->searchCount ( $key );
		$config['per_page'] = $perPage;
		$config['uri_segment'] = 4;
		$this->pagination->initialize($config);
		
		$this->setData("pageTitle", $key . "的所有下载");
		$this->run ( "download/list" );
	}
}
