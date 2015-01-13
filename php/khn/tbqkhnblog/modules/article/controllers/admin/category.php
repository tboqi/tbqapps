<?php

class Category_Controller extends Admin_Template_Controller {
	
	function __construct() {
		parent::__construct ();
	}
	
	function add() {
		$this->initContent('admin_article_category_form', array('title' => '添加分类'));
	}
	
	function save() {
		$post = new Validation ( $_POST );
		$post->pre_filter ( 'trim', TRUE );
		$post->add_rules ( 'category_name', 'required', 'length[2,10]' );
		$post->add_callbacks ( 'category_name', array ($this, 'category_is_existed' ) );
		
		// 如果通过规则检测
		if ($post->validate ()) {
			$array = array (
				'name' => $this->input->xss_clean($this->input->post ( 'category_name' )),
				'show_order' => intval($this->input->post ( 'show_order' )), 
				'description' => $this->input->xss_clean($this->input->post ( 'description' )), 
				'ctype' => 'article',
			);
			$id = $this->input->post ( 'id' );
			$cate_model = new Category_Model ( );
			if ($id > 0) {
				$url = url::site ( 'admin/category/manage' );
				$cate_model->update ( $array, $id );
			} else {
				$url = url::site ( 'admin/category/add' );
				$cate_model->create ( $array );
			}
			echo sprintf ( '{status: %d, url: "%s"}', 1, $url );
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
		$cate_model = new Category_Model ( );
		$this->initContent('admin_article_category_list', array('categories' => $cate_model->find_all()));
	}
	
	function edit($id) {
		$cate_model = new Category_Model ( );
		$this->initContent('admin_article_category_form', array('category' => $cate_model->get ( $id ), 'id' => $id, 'title' => '编辑分类'));
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
			$is = $cate_model->is_existed ( 'name', $post->category_name, $post->id );
		} else {
			$is = $cate_model->is_existed ( 'name', $post->category_name );
		}
		if ($is) {
			$post->add_error ( 'category_name', 'category_is_existed' );
		}
	}
}