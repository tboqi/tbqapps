<?php
class Comment_Controller extends Space_Template_Controller {
	
	function __construct() {
		parent::__construct();
		$this->comment_model = new Blog_Comment_Model();
	}
	
	function save() {
		if (!Auth::instance()->logged_in()) {
			echo 'error';
			return;
		}
		$array = array(
			'article_id' => $this->input->post('article_id'),
			'user_id' => $this->logged_user->id,
			'create_time' => time(),
			'content' => nl2br($this->input->post('content')),
			'article_id' => $this->input->post('article_id'),
		);
		$this->comment_model->create($array);
		url::redirect("article/read/{$this->input->post('article_id')}?user_id={$this->logged_user->id}");
	}
}