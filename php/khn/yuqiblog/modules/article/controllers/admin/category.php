<?php

class Category_Controller extends Base_Admin_Controller {
	
	function __construct() {
		parent::__construct ();
	}
	
	function add() {
		$view = new View ( 'article/appindex_category_form' );
		$this->render ( '添加文章分类', $view );
	}
	
	function save() {
		$post = new Validation ( $_POST );
		$post->pre_filter ( 'trim', TRUE );
		$post->add_rules ( 'category_name', 'required', 'length[2,10]' );
		$post->add_callbacks ( 'category_name', array ($this, 'category_is_existed' ) );
		
		// 如果通过规则检测
		if ($post->validate ()) {
			$array = array ('title' => $this->input->post ( 'category_name' ) );
			$id = $this->input->post ( 'id' );
			$cate_model = new Category_Model ( );
			if ($id > 0) {
				$cate_model->update ( $array, $id );
			} else {
				$cate_model->create ( $array );
			}
			echo sprintf ( '{status: %d, url: "%s"}', 1, url::site ( 'admin/category/manage' ) );
			exit ();
		} else {
			$errors = array ('category_name' => '' );
			$errors = arr::overwrite ( $errors, $post->errors ( 'category_form_errors' ) );
			$errors = json_encode ( $errors );
			echo sprintf ( '{status: %d, errors: %s}', 0, $errors );
			exit ();
		}
	}
	
	function manage() {
		$view = new View ( 'yui_list' );
		$view->url = url::site ( 'admin/category/manange_yui' );
		$view->key = 'id';
		$view->fields = array ('id', 'title', 'edit' );
		$view->myColumnDefs = array (array ('key' => $view->fields [0], 'label' => 'ID', 'sortable' => true ), array ('key' => $view->fields [1], 'label' => '标题', 'sortable' => true ), array ('key' => $view->fields [2], 'label' => '编辑', 'sortable' => false ) );
		$view->urlquery = '';
		$this->render ( '文章分类列表', $view );
	}
	
	function manange_yui($results = 15, $startIndex = 0, $sort = 'id', $dir = 'asc') {
		$cate_model = new Category_Model ( );
		$view = new View ( 'yui_json' );
		$view->recordsReturned = $results;
		$view->totalRecords = $cate_model->count ();
		$view->startIndex = $startIndex;
		$view->sort = $sort;
		$view->dir = $dir;
		$categories = $cate_model->find ( $results, $startIndex, $sort, $dir );
		foreach ( $categories as $key => $cate ) {
			$categories [$key]->edit = '<a href="' . url::site ( 'admin/category/edit/' . $cate->id ) . '">编辑</a> 
	   	   <a onclick="deleteRow(\'' . url::site ( 'admin/category/delete/' . $cate->id ) . '\');" 
	   	   href="javascript:void(0);">删除</a>';
		}
		$view->result = $categories;
		$view->render ( TRUE );
	}
	
	function edit($id) {
		$cate_model = new Category_Model ( );
		$view = new View ( 'article/appindex_category_form' );
		$view->category = $cate_model->get ( $id );
		$view->id = $id;
		$this->render ( '编辑文章分类', $view );
	}
	
	function delete($id) {
		$cate_model = new Category_Model ( );
		echo $cate_model->delete ( $id );
	}
	
	function category_is_existed(Validation $post) {
		if (array_key_exists ( 'category_name', $post->errors () ))
			return;
		$cate_model = new Category_Model ( );
		if ($post->id > 0) {
			$is = $cate_model->is_existed ( 'title', $post->category_name, $post->id );
		} else {
			$is = $cate_model->is_existed ( 'title', $post->category_name );
		}
		if ($is) {
			$post->add_error ( 'category_name', 'category_is_existed' );
		}
	}
}