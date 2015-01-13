<?php
class Controller_Article_Comment extends Controller_Template {

	function action_index() {
		$model_article_comment = new Model_Article_Comment();
		$this->sub_title = '文章评论管理';
		$content = Helper_View::create_view('article/comments');
		$num = 20;
		// 分页
		$pagination = Pagination::factory ( array (
				'total_items' => $model_article_comment->count (),
				'items_per_page' => $num,
				'view' => 'pagination/admin' 
		) );
		$start = $pagination->offset;
		$comments = $model_article_comment->find($num, $start);
		$content->comments = $comments;
		$content->pagination = $pagination;
		$this->template->content = $content;
	}
	
	function action_del() {
		$this->auto_render = false;
		$model_article_comment = new Model_Article_Comment();
		$id = intval($this->request->param('param1'));
		$model_article_comment->del($id);
	}
}