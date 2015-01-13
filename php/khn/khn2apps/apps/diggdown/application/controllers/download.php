<?php

/**
 * {0}
 * 
 * @author 唐伯琦
 * @version 0.1
 */

class Download_Controller extends Controller {
	
	function __construct() {
		parent::__construct ();
		$this->MDownload = new Download_Model();
		$this->MCategory = new Category_Model();
		
		$this->table = "downloads";
	}
	
	function index() {
		$this->myDownloads();
	}
	
	function add() {
		$this->checkUser ();
		$userID = $this->my->id;
		$this->setData ( "pageTitle", "添加下载" );
		
		$myCategories = $this->MCategory->findCategoriesByUserID ( $userID );
		$options = array (0 => "" );
		foreach ( $myCategories as $cate ) {
			$options [$cate->id] = $cate->name;
		}
		$this->setData ( "options", $options );
		$this->run ( 'download/add' );
	}
	
	function doSave() {
		$this->checkUser ();
		$userID = $this->my->id;
		$down = $this->input->post ( 'down' );
		$down ['user_id'] = $userID;
		$down ['create_time'] = now ();
		if($down['id'] > 0) {
			$this->MDownload->update( $down );
			$downID = $down['id'];
		} else {
			$this->MDownload->insert ( $down );
			$downID = $this->db->insert_id ();
		}
		
		$this->load->model ( 'MSearch' );
		$this->MSearch->checkSearch($downID, $down['title'], $down['description']);
		
		$keywords = $this->input->xss_clean ( $this->input->post ( 'keywords' ) );
		$keywords = explode ( "|", $keywords );
		$this->load->model ( 'MKeyword', '', TRUE );
		$this->MKeyword->deleteByDownloadID($downID);
		if (is_array ( $keywords ) && count ( $keywords )) {
			foreach ( $keywords as $keyword ) {
				$this->MKeyword->insert ( $keyword, $downID );
			}
		}
		redirect ( "download/myDownloads" );
	}
	
	function myDownloads() {
		$this->checkUser ();
		$userID = $this->my->id;
		$this->setData ( "pageTitle", "我的下载" );
		$myDownloads = $this->MDownload->findByUserid ( $userID );
		$this->setData ( "downloads", $myDownloads );
		$this->run ( "download/list" );
	}
	
	function detail($id) {
		$download = $this->MDownload->get ( $id );
		$download->num += 1;
		$this->MDownload->update(array("id" => $id, "num" => $download->num));
		
		$this->setData ( "pageTitle", $download->title );
		$this->setData ( "download", $download );
		$this->run ( "download/detail" );
	}
	
	function downloadsOfCategory($cateID, $page=0) {
		$perPage = 10;
		$this->setData("downloads", $this->MDownload->downloadsOfCategory($cateID, intval($page), intval($perPage)));
		
		$cate = $this->MCategory->get($cateID);
		
		$config['total_items'] = $this->MDownload->downloadsCountOfCategory($cateID);
        $config['items_per_page'] = $perPage;
        $config['uri_segment'] = $cateID;
        $config['style'] = 'digg';
        $this->pagination = new Pagination($config);
		
		$this->setData("pageTitle", $cate->name . "的所有下载");
		$this->run ( "download/list" );
	}
	
	function downloadsOfkeyword($keyID, $page=0)	{
		$perPage = 10;
		$this->setData("downloads", $this->MDownload->downloadsOfkeyword($keyID, intval($page), intval($perPage)));
		
		$this->load->model( 'MKeyword', '', TRUE );
		$keyword = $this->MKeyword->get($keyID);
		$this->setData("pageTitle", "标签 " . $keyword->keyword . " 的所有下载");
		
		$config['base_url'] = site_url("download/downloadsOfkeyword/" . $keyID);
		$config['total_rows'] = $this->MDownload->downloadsCountOfKeyword($keyID);
		$config['per_page'] = $perPage;
		$config['uri_segment'] = 4;
		$this->pagination->initialize($config);
		
		$this->run( "download/list" );
	}
	
	function myDownloadsOfCategory($cateID, $page=0) {
		$perPage = 10;
		$userID = $this->session->userdata('userid');
		$downloads = $this->MDownload->myDownloadsOfCategory($cateID, $userID, intval($page), intval($perPage));
		$this->setData("downloads", $downloads);
		
		$this->load->model( 'MCategory', '', TRUE );
		$cate = $this->MCategory->get($cateID);
		
		$config['base_url'] = site_url("download/myDownloadsOfCategory/" . $cateID);
		$config['total_rows'] = $this->MDownload->myDownloadsCountOfCategory($cateID, $userID);
		$config['per_page'] = $perPage;
		$config['uri_segment'] = 4;
		$this->pagination->initialize($config);
		
		$this->setData("pageTitle", $cate->name . " 分类下 所有 我的下载");
		$this->run ( "download/list" );
	}
	
	function edit($id) {
		$this->checkUser ();
		$userID = $this->my->id;
		$this->setData ( "pageTitle", "编辑下载" );
		$this->load->model ( 'MCategory', '', TRUE );
		$myCategories = $this->MCategory->findCategoriesByUserID ( $userID );
		$options = array (0 => "" );
		foreach ( $myCategories as $cate ) {
			$options [$cate->id] = $cate->name;
		}
		$this->setData ( "options", $options );
		$download = $this->MDownload->get($id);
		
		$this->load->model ( 'MKeyword', '', TRUE );
		$keywords = $this->MKeyword->keywordsOfDownloadID($id);
		$keywordsString = "";
		if($keywords && is_array($keywords)) {
			if(count($keywords) == 1) {
				$keywordsString = $keywords[0]->keyword;
			} else {
				foreach ($keywords as $k => $keyword) {
					if($k == 0) {
						$keywordsString = $keyword->keyword;
					} else {
						$keywordsString .= "|" . $keyword->keyword;
					}
				}
			}
			$download->keyword = $keywordsString;
		}
		$this->setData("download", $download);
		
		$this->run ( 'download/add' );
	}
	
	function delete($id) {
		$this->MDownload->delete($id);
		redirect ( "download/myDownloads" );
	}
}