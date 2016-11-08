<?php
class Controller_Article_Category extends Controller_Template {

	function action_index() {
		$content = '';
		
		//验证是否登录状态
		if($user = Auth::instance ()->logged_in()) {
			$content = View::factory('article/categories');
			$content->title = '文章分类列表';
			$model_article_category = new Model_Article_Category();
			$content->categories = $model_article_category->find_all();
		} else {
			$content = '没有权限';
		}
		
		$this->template->content = $content;
		$this->sub_title = '文章分类';
	}
	
	function action_create() {
		$content = '';
		
		//验证是否登录状态
		if($user = Auth::instance ()->logged_in()) {
			$content = View::factory('article/category_form');
			$content->title = '添加文章分类';
		} else {
			$content = '没有权限';
		}
		
		$this->template->content = $content;
		$this->sub_title = '添加文章分类';
		$this->set_js_array('jquery.form.js');
		$this->set_js_array('yuqi_utils.js');
		$this->template->js = '$(document).ready(function() { 
	form_submit(\'categoryForm\');
});';
	}
	
	function action_edit() {
		$content = '';
		
		//验证是否登录状态
		if($user = Auth::instance ()->logged_in()) {
			$id = intval($this->request->param('param1'));
			$content = View::factory('article/category_form');
			$content->title = '编辑文章分类';
			$model_article_category = new Model_Article_Category();
			$content->category = $model_article_category->get($id);
		} else {
			$content = '没有权限';
		}
		
		$this->template->content = $content;
		$this->sub_title = '文章分类';
	}

	function action_save() {
		$content = '';
		
		//验证是否登录状态
		if($user = Auth::instance ()->logged_in()) {
			$category = array();
			$category['name'] = trim($_POST['category_name']);
			$category['description'] = trim($_POST['description']);
			$category['show_order'] = intval($_POST['show_order']);
			$model_article_category = new Model_Article_Category();
			$id = intval($_POST['id']);
			if ($id < 1) {
				$model_article_category->insert($category);
			} else {
				$model_article_category->update($category, $id);
			}
			die(json_encode(array('status' => 1, 'url' => URL::site('article_category/index'))));
// 			header("location:" . URL::site('article_category/index'));exit;
		} else {
			die(json_encode(array('errors' => '没有权限')));
// 			$content = '没有权限';
		}
		
// 		$this->template->content = $content;
	}
	
	function action_del() {
		$content = '';
		
		//验证是否登录状态
		if($user = Auth::instance ()->logged_in()) {
			$id = intval($this->request->param('param1'));
			DB::update('articles')->set(array('category_id' => 0, 
					'category_name'=> '未分类'))
				->where('category_id', '=', $id)->execute();
			$model_article_category = new Model_Article_Category();
			$model_article_category->del($id);
			header("location:" . URL::site('article_category/index'));exit;
		} else {
			$content = '没有权限';
		}
		
		$this->template->content = $content;
	}
}