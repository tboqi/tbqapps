<?php
class Link_Controller extends Permission_Space_Template_Controller {
	
	private $link_model = null;
	
	function __construct() {
		parent::__construct();
		$this->link_model = new Link_Model();
	}
	
	function manage() {
		$view = new View('blog/appspace_link_list');
		$view->links = $this->link_model->find_by(array('user_id' => $this->logged_user->id));
		$this->_render($view);
	}
	
	function delete($id) {
		$this->link_model->delete($id);
		url::redirect($_SERVER ['HTTP_REFERER']);
	}
	
	function update($id = 0) {
		$msg = '';
		$link = NULL;
		if ($id > 0) {
			$link = $this->link_model->get(intval($id));
		}
		if ($_SERVER['REQUEST_METHOD'] == 'POST') {
			$link = array('name' => $this->input->post('name'), 'url' => $this->input->post('url'), 'description' => $this->input->post('description') ); 
			$post = new Validation($link);
			$post->add_rules('name', 'required', 'length[2,30]');
			$post->add_rules('url', 'required', 'url');
			if ($post->validate()) {
				$link['user_id'] = $this->logged_user->id;
				if ($this->input->post('id') > 0) {
					$this->link_model->update($link, $this->input->post('id'));
				} else {
					$this->link_model->create($link);
				}
				url::redirect('link/manage', 300);
			} else {
				$msg = 'error';
			}
		}
		$view = new View('blog/appspace_link_form');
		$view->id = $id;
		$view->msg = $msg;
		$view->link = is_array($link) ? new ArrayObject($link) : $link;
		$this->_render($view);
	}
}