<?php
class Controller_Website extends Controller_Template {
	
	function action_baseinfo() {
		$model_website = new Model_Website();
		if ($_SERVER['REQUEST_METHOD'] == 'POST') {
			$baseinfo = array('id' => intval($_POST['id']));
			$baseinfo['title'] = trim($_POST['title']);
			$baseinfo['description'] = trim($_POST['description']);
			$baseinfo['keywords'] = trim($_POST['keywords']);
			$post = Validation::factory($baseinfo)
					->rule('title', 'not_empty')
					->rule('description', 'not_empty')
					->rule('keywords', 'not_empty');
			if ($post->check()) {
				$result['status'] = 1;
				$result['url'] = URL::site('website/baseinfo');
				$id = isset($_POST['id'])?intval($_POST['id']):0;
				if ($id < 1) {
					$model_website->insert($baseinfo);
				} else {
					$model_website->update($baseinfo, $id);
				}
			}
			$this->auto_render = false;
			echo json_encode($result);
		}
		$this->sub_title = '首页';
		$content = Helper_View::create_view('website/baseinfo');
		$content->baseinfo = $model_website->get_new();
		$this->template->content = $content;
	}
	
	function action_contact() {
		$model_contact = new Model_Contact();
		if ($_SERVER['REQUEST_METHOD'] == 'POST') {
			$contact = array('id' => intval($_POST['id']));
			$contact['name'] = trim($_POST['name']);
			$contact['linkman'] = trim($_POST['linkman']);
			$contact['dianhua'] = trim($_POST['dianhua']);
			$contact['email'] = trim($_POST['email']);
			$contact['dizhi'] = trim($_POST['dizhi']);
			$post = Validation::factory($contact)
					->rule('name', 'not_empty')
					->rule('linkman', 'not_empty')
					->rule('dianhua', 'not_empty')
					->rule('email', 'not_empty')
					->rule('dizhi', 'not_empty');
			if ($post->check()) {
				$result['status'] = 1;
				$result['url'] = URL::site('website/contact');
				$id = isset($_POST['id'])?intval($_POST['id']):0;
				if ($id < 1) {
					$model_contact->insert($contact);
				} else {
					$model_contact->update($contact, $id);
				}
			}
			$this->auto_render = false;
			echo json_encode($result);
		}
		$this->sub_title = '联系方式';
		$content = Helper_View::create_view('website/contact');
		$content->contact = $model_contact->get_new();
		$this->template->content = $content;
	}
	
	function before() {
		parent::before();
		if( Auth::instance ()->logged_in()) {
		} else {
			$request = Request::factory();
			$request->redirect(URL::site('user/login', true));
		}
	}
}