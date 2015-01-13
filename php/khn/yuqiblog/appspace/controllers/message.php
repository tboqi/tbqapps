<?php
class Message_Controller extends Permission_Space_Template_Controller {
	function __construct() {
		parent::__construct();
		$this->messages_tpl = 'message/appspace_list';
	}
	
	function inbox($p = 1) {
		if (intval($p) < 1) {
			$p = 1;
		}
		$num = 10;
		$message_model = new Message_Model();
		$total_rows = $message_model->inbox_messages_count($this->logged_user->id);
		
		$view = new View($this->messages_tpl);
		$view->messages = $message_model->inbox_messages($this->logged_user->id, ($p - 1) * $num, $num);
		$view->boxtype = 1;
		$this->_render($view);
	}
	
	function outbox($p = 1) {
		if (intval($p) < 1) {
			$p = 1;
		}
		$num = 10;
		$message_model = new Message_Model();
		$total_rows = $message_model->outbox_messages_count($this->logged_user->id);
		
		$view = new View($this->messages_tpl);
		$view->boxtype = 2;
		$view->messages = $message_model->outbox_messages($this->logged_user->id, ($p - 1) * $num, $num);
		$this->_render($view);
	}
	
	/**
	 * 垃圾桶
	 *
	 * @param int $p
	 */
	function trashcan($p = 1) {
		if (intval($p) < 1) {
			$p = 1;
		}
		$num = 10;
		$message_model = new Message_Model();
		$total_rows = $message_model->removed_messages_count($this->logged_user->id);
		
		$view = new View($this->messages_tpl);
		$view->boxtype = 3;
		$view->messages = $message_model->removed_messages($this->logged_user->id, ($p - 1) * $num, $num);
		$this->_render($view);
	}
	
	function remove($id) {
		$message_model = new Message_Model();
		$message_model->remove_message($id, $this->logged_user->id);
		url::redirect('message/inbox');
	}
	
	function restore($id) {
		$message_model = new Message_Model();
		$message_model->restore_message($id, $this->logged_user->id);
		url::redirect('message/inbox');
	}
	
	function send($to_id) {
		if ($_POST) {
			$message_model = new Message_Model();
			$message_model->send_message($this->input->xss_clean($_POST['title']), $this->input->xss_clean($_POST['content']), $this->logged_user->id, $to_id);
			url::redirect('?user_id=' . $to_id);
		}
		$view = new View('message/appspace_send');
		$view->to_user = ORM::factory('user', $to_id);
		$view->render(TRUE);
	}
	
	function view($msgid) {
		$message_model = new Message_Model();
		$message_model->set_message_to_read($msgid);
		$view = new View('message/appspace_view');
		$view->msg = $message_model->get($msgid);
		$this->_render($view);
	}
}