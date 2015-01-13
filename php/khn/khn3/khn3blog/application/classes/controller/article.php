<?php defined('SYSPATH') or die('No direct script access.');

class Controller_Article extends Controller_Template {

	private $fields_for_main_content = '`id`,`title`,`summary`,`create_time`,`read_times`,`category_id`,`category_name`,`tabs_detail`';
	
	public function action_index()
	{
		$article_model = new Model_Article();
		
		$limit = 10;
		
		//分页
		$pagination = Pagination::factory(array(
				'total_items' => $article_model->count (),
				'items_per_page' => $limit,
			)
		);
		
		$pagination->route_params(array('controller' => $this->request->controller(),
				'action' => $this->request->action()));
		
		$start = $pagination->offset;
		$content = Helper_View::create_view('article/articles');
		$content->articles = $article_model->find ( $limit, $start, $this->fields_for_main_content);
		$content->pagination = $pagination;
		
		$this->template->content = $content;
		
		$this->sub_title = '文章列表';
	}

	public function action_category() {
		$article_model = new Model_Article();
		
		$category_id = intval($this->request->param('param1'));
		
		$limit = 10;
		
		//分页
		$pagination = Pagination::factory(array(
				'total_items' => $article_model->count_by_category_id ($category_id),
				'items_per_page' => $limit,
			)
		);
		$pagination->route_params(array('controller' => $this->request->controller(), 
				'action' => $this->request->action(),
				'param1' => $category_id
				)
		);
		$start = $pagination->offset;
		$content = Helper_View::create_view('article/articles');
		$content->articles = $article_model->find_by_category_id ( $category_id, 
				$limit, $start, $this->fields_for_main_content);
		
		$content->pagination = $pagination;
		
		$this->template->content = $content;
		
		$model_category = new Model_Article_Category();
		$category = $model_category->get($category_id, 'name');
		$this->sub_title = "分类 {$category->name} 下的文章列表";
		$this->keywords = $this->description = $category->name;
	}

	public function action_tab() {
		$article_model = new Model_Article();
		
		$tab_id = intval($this->request->param('param1'));
		
		$limit = 10;
		
		//分页
		$pagination = Pagination::factory(array(
				'total_items' => $article_model->count_by_tab_id ($tab_id),
				'items_per_page' => $limit,
			)
		);
		$pagination->route_params(array('controller' => $this->request->controller(), 
				'action' => $this->request->action(),
				'param1' => $tab_id
				)
		);
		$start = $pagination->offset;
		$content = Helper_View::create_view('article/articles');
		$content->articles = $article_model->find_by_tab_id ( $tab_id, 
				$limit, $start, $this->fields_for_main_content);
		
		$content->pagination = $pagination;
		
		$this->template->content = $content;
		
		$model_tab = new Model_Article_Tab();
		$tab = $model_tab->get($tab_id, 'tab');
		$this->sub_title = "标签 {$tab->tab} 下的文章列表";
		$this->keywords = $this->description = $tab->tab;
	}
	
	function action_detail() {
		$model_article = new Model_Article();
		$id = intval($this->request->param('param1'));
		//阅读次数
		$model_article->add_read_times($id);
		
		$content = Helper_View::create_view('article/detail');
		$content->article = $model_article->get($id);
		$this->template->content = $content;
		$this->sub_title = $content->article->title;
		$this->keywords = $content->article->category_name;
		if (!empty($content->article->tabs_detail)) {
			$tabs = json_decode($content->article->tabs_detail);
			$split = ',';
			foreach ($tabs as $tab) {
				$this->keywords .= $split . $tab->tab;
			}
		}
		$this->description = $content->article->summary;
		
		$model_comment = new Model_Comment();
		$content->comments = $model_comment->find_by_article_id($id);
	}

} // End Article
