<?php
class Controller_Link extends Controller_Template {

	function action_index() {
		$model_link = new Model_Link();
		$this->sub_title = '链接管理';
		$content = Helper_View::create_view('link/list');
		$content->links = $model_link->find_all();
		$model_link_category = new Model_Link_Category();
		$content->categories = $model_link_category->find_all();
		$this->template->content = $content;
	}

	function action_save() {
		$result = array();
		
		$content = '';
		
		//验证是否登录状态
		if($user = Auth::instance ()->logged_in()) {
			$category = array();
			$category['category_id'] = trim($_POST['category_id']);
			$category['name'] = trim($_POST['name']);
			$category['url'] = trim($_POST['url']);
			$post = Validation::factory($_POST)
			->rule('name', 'not_empty')
			->rule('url', 'not_empty')
			->rule('category_id', 'not_empty');
			if ($post->check()) {
				$result['status'] = 1;
				$result['url'] = URL::site('link/index');
				$model_link = new Model_Link();
				$id = isset($_POST['id'])?intval($_POST['id']):0;
				if ($id < 1) {
					$model_link->insert($category);
				} else {
					$model_link->update($category, $id);
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
		$id = intval($this->request->param('param1'));
		$model_link = new Model_Link();
		$model_link->del($id);
		header("location:" . URL::site('link/index'));exit;
	}
}