<?php
class Controller_Article extends Controller_Template {
	function action_index() {
		$limit = 20;
		
		$article_model = new Model_Article();
		// 分页
		$pagination = Pagination::factory ( array (
				'total_items' => $article_model->count (),
				'items_per_page' => $limit,
				'view' => 'pagination/admin' 
		) );
		$pagination->route_params(array('controller' => $this->request->controller(),
				'action' => $this->request->action()));
		
		$this->sub_title = '文章管理';
		$content = Helper_View::create_view('article/list');
		$start = $pagination->offset;
		$content->articles = $article_model->find ( $limit, $start);
		$content->pagination = $pagination;
		$this->template->content = $content;
	}
	
	function action_create() {
		$this->sub_title = '新文章';
		$category_model = new Model_Article_Category();
		$content = Helper_View::create_view('article/create');
		$content->categories = $category_model->find_all();
		$this->template->content = $content;
	}
	
	function action_save() {
		$article = array ();
		$article['title'] = trim($_POST['title']);
		$article['content'] = trim($_POST['content']);
		$article['summary'] = trim($_POST['summary']);
	
		$article ['create_time'] = time ();
		$article ['update_time'] = time ();
		$article ['category_id'] = intval($_POST['category_id']);
		$model_article_category = new Model_Article_Category();
		$category = $model_article_category->get($article ['category_id'], 'name');
		$article ['category_name'] = $category->name;
	
		$tabs = trim($_POST['tabs']);
		$tabs = explode(',', $tabs);
	
		$model_article = new Model_Article();
		$model_article_tab = new Model_Article_Tab();
		$id = isset($_POST['id']) ? intval($_POST['id']) : 0;
		$tabs_detail = array();
		foreach($tabs as $tab) {
			$tab_id = $model_article_tab->get_tab_id($tab);
			$tabs_detail[] = array('id' => $tab_id, 'tab' => $tab);
		}
		if(count($tabs_detail) > 0) {
			$article['tabs_detail'] = json_encode($tabs_detail);
		} else {
			$article['tabs_detail'] = '';
		}
		if ($id < 1) {
			$id = $model_article->insert($article);
		} else {
			$model_article->update($article, $id);
		}
		$model_article->update_article_tab_link($tabs_detail, $id);
	
		header("location:" . URL::site('article/index'));exit;
	}
	
	function action_del() {
		$this->auto_render = FALSE;
		if( Auth::instance ()->logged_in()) {
			$model_article = new Model_Article();
			$id = intval($this->request->param('param1'));
			$model_article->del($id);
		} else {
			echo '没有权限';
		}
		
// 		header("location:" . URL::site('article/index'));exit;
	}
	
	function action_edit() {
		
		$content = '此功能没有完成';
		
		//验证是否登录状态
// 		if(Auth::instance ()->logged_in()) {
// 			$content = Helper_View::create_view('article/article_form');
// 			$content->title = '编辑文章';
// 			$model_article_category = new Model_Article_Category();
// 			$content->categories = $model_article_category->find_all('id,name');
// 			$id = intval($this->request->param('param1'));
// 			$model_article = new Model_Article();
// 			$content->article = $model_article->get($id);
// 		} else {
// 			$content = '没有权限';
// 		}
		
		$this->template->content = $content;
		$this->sub_title = "编辑文章";
	}
}