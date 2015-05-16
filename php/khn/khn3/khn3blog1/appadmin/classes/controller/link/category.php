<?php
class Controller_Link_Category extends Controller_Template {

	function action_index() {
		$model_link_category = new Model_Link_Category();
		$this->sub_title = '链接分类管理';
		$content = Helper_View::create_view('link/categories');
		$content->categories = $model_link_category->find_all();
		$this->template->content = $content;
	}

	function action_save() {
		$result = array();
		
		$content = '';
		
		//验证是否登录状态
		if($user = Auth::instance ()->logged_in()) {
			$category = array();
			$category['name'] = trim($_POST['category_name']);
			$post = Validation::factory($_POST)
			->rule('category_name', 'not_empty');
			if ($post->check()) {
				$result['status'] = 1;
				$result['url'] = URL::site('link_category/index');
				$model_link_category = new Model_Link_Category();
				$id = isset($_POST['id'])?intval($_POST['id']):0;
				if ($id < 1) {
					$model_link_category->insert($category);
				} else {
					$model_link_category->update($category, $id);
				}
			} else {
				$result['status'] = 0;
				$result['errors'] = $post->errors('error_msg');
			}
		} else {
			$result['msg'] = '没有权限';
			$result['status'] = 0;
		}
		
		$this->auto_render = false;
		echo json_encode($result);
	}
	
	function action_del() {
		$content = '';
		
		//验证是否登录状态
		if($user = Auth::instance ()->logged_in()) {
			$id = intval($this->request->param('param1'));
			DB::update('articles')->set(array('category_id' => 0, 
					'category_name'=> '未分类'))
				->where('category_id', '=', $id)->execute();
			$model_link_category = new Model_Link_Category();
			$model_link_category->del($id);
			header("location:" . URL::site('article_category/index'));exit;
		} else {
			$content = '没有权限';
		}
		
		$this->template->content = $content;
	}
}