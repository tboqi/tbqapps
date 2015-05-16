<?php
class Controller_Comment extends Controller {
	
	function action_save() {
		$comment = array();
		$comment['user_name'] = $_POST['user_name'];
		$comment['user_email'] = $_POST['user_email'];
		$comment['content'] = $_POST['content'];
		$comment['article_id'] = $_POST['article_id'];
		$comment['create_time'] = time();
		
		$model_comment = new Model_Comment();
		$model_comment->insert($comment);
		header('location:' . url::site('article/detail/' . $comment['article_id']));exit;
	}
}