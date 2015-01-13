<?php
class Category_Controller extends Controller {
	
	function __construct() {
		parent::__construct ();
		$this->MCategory = new Category_Model();
	}
	
	function index() {
		$this->myCategory ();
	}
	
	function add() {
		$this->checkUser ();
		$this->setData ( "pageTitle", "新建分类" );
		$this->run ( 'category/add' );
	}
	
	function doSave() {
		$this->checkUser ();
		$userID = $this->my->id;
		$rules ['name'] = "required";
		$this->validation->set_rules ( $rules );
		if ($this->validation->run () == FALSE) {
			$this->setData ( "pageTitle", "新建分类" );
			$this->run ( 'category/add' );
		} else {
			$cateName = $this->clean ( $this->post ( 'name' ) );
			$data = array ("name" => $cateName );
			//判断分类是否已存在
			$cate = $this->MCategory->isExist ( array ("name" => $cateName ) );
			if (! empty ( $cate ) && is_object ( $cate )) {
				//存在
				$cateID = $cate->id;
			} else {
				//不存在
				$this->MCategory->insert ( $data );
				$cateID = $this->db->insert_id ();
			}
			//判断cateID和userID是否已存在
			if (! $this->MCategory->isExistCC ( $cateID, $userID )) {
				$this->MCategory->insertCC ( $cateID, $userID );
			}
			redirect ( "category/myCategory" );
		}
	}
	
	function myCategory() {
		$this->checkUser ();
		$userID = $this->my->id;
		$this->setData ( "pageTitle", "我的分类" );
		$categoryList = $this->MCategory->findCategoriesByUserID ( $userID );
		$this->setData ( "categories", $categoryList );
		$this->run ( 'category/mycategory' );
	}
	
	function delete($id) {
		$this->checkUser ();
		$this->MCategory->delete ( $id, $this->my->id );
		redirect ( "category/myCategory" );
	}
	
	function all() {
		$this->setData ( "pageTitle", "所有分类" );
		$objects = $this->MCategory->all();
		foreach ($objects as $key => $obj) {
			$objects[$key]->mycount = $this->MCategory->isMyCategory($this->my->id, $obj->id);
		}
		
		$this->setData("allCategories", $objects);
		$this->run('category/all');
	}
	
	function addMyCategory($cateID) {
		$this->checkUser ();
		if(!$this->MCategory->isExistCC($cateID, $this->my->id)) {
			$this->MCategory->insertCC($cateID, $this->my->id);
		}
		redirect("category/all");
	}
}
