<?php
class Article_Controller extends Template_Controller {
	function __construct() {
		parent::__construct ();
	}
	
	function view($id) {
		$id = intval($id);
		
		$article_model = new Article_Model ();
		
		$article = $article_model->get ( $id );
		
		if (!$article) {
			echo '页面不存在';
			exit;
		}
		
		$article_model->read_times ( $id );
		
		$this->set_page_title ( $article->title );
		$this->set_description ( strip_tags(empty ( $article->summary ) ? article::summary ( $article->content ) : $article->summary) );
		$this->set_keywords ( article::get_tabs_string_by_artid($id) );
		$this->initContent ( 'article_view', array ('article' => $article ) );
	}
	
	public function index($p = 0) {
		$this->set_page_title ( '首页' );
		$this->set_description ( '新贵族' );
		$this->set_keywords ( '名车，名酒，豪宅' );
		$article_model = new Article_Model ();
		$limit = 10;
		$p = intval ( $p );
		if ($p < 1) {
			$p = 1;
		}
		$start = ($p - 1) * $limit;
		
		$articles = $article_model->find ( $limit, $start );
		
		$num_rows = $article_model->count ();
		
		$this->initContent ( 'home', array ('articles' => $articles, 'pagination' => new Pagination ( array ('base_url' => 'article/index', 'total_items' => $num_rows, 'items_per_page' => $limit, 'uri_segment' => 3, 'style' => 'digg' ) ) ) );
	}
	
	public function user($user_id, $p = 0) {
		$p = intval ( $p );
		if ($p < 1) {
			$p = 1;
		}
		
		$limit = 10;
		
		$start = ($p - 1) * $limit;
		
		$user_model = new User_Model ();
		$user = $user_model->get ( $user_id );
		
		$arr = array ('user_id' => $user_id );
		$article_model = new Article_Model ();
		$article_total = $article_model->count_by ( $arr );
		
		$articles = $article_model->find_by_user_id ( $user_id, $limit, $start );
		
		$pagination = new Pagination ( 
		                  array (
		                      'base_url' => 'article/user/' . $user_id, 
		                      'total_items' => $article_total, 
		                      'items_per_page' => $limit, 
		                      'uri_segment' => 4, 
		                      'style' => 'digg' 
		                  )
		              );
		
		$this->set_page_title ( $user->nickname . '的所有文章' );
		$this->set_description ( $user->nickname . '所有记录，技术文章' );
		$this->set_keywords ( '名车, 名酒, 豪宅' );
		
		$this->initContent ('home', array('articles' => $articles, 'pagination' => $pagination));
	}
	
	public function category($category_id, $p = 1) {
		$category_id = intval($category_id);
		$p = intval ( $p );
		if ($p < 1) {
			$p = 1;
		}
		
		$limit = 10;
		
		$start = ($p - 1) * $limit;
		
		$category_model = new Category_Model ();
		$category = $category_model->get ( $category_id );
		
		$article_model = new Article_Model ();
		$article_total = $article_model->count_by_category_id ( $category_id );
		
		$articles = $article_model->find_by_category_id ( $category_id, $limit, $start );
		
		$pagination = new Pagination ( 
		                  array (
		                      'base_url' => 'article/category/' . $category_id, 
		                      'total_items' => $article_total, 
		                      'items_per_page' => $limit, 
		                      'uri_segment' => 4, 
		                      'style' => 'digg' 
		                  )
		              );
		
		if (empty($category)) {
			$this->set_page_title ( '未分类' );
			$this->set_description ( '未分类' );
			$this->set_keywords ( '未分类' );
		} else {
			$this->set_page_title ( $category->name );
			$this->set_description ( $category->name );
			$this->set_keywords ( $category->name );
		}
		
		$this->initContent ('home', array('articles' => $articles, 'pagination' => $pagination));
	}
	
	public function tab($tabid, $p = 1) {
		$tabid = intval($tabid);
		$p = intval ( $p );
		if ($p < 1) {
			$p = 1;
		}
		
		$limit = 10;
		
		$start = ($p - 1) * $limit;
		
		$tab_model = new Tab_Model ();
		$tab = $tab_model->get ( $tabid );
		
		$article_model = new Article_Model ();
		$article_total = $article_model->count_by_tabid ( $tabid );
		
		$articles = $article_model->find_by_tabid ( $tabid, $limit, $start );
		
		$pagination = new Pagination ( array ( 
				'base_url' => 'article/tab/' . $tabid, 
				'total_items' => $article_total, 
				'items_per_page' => $limit, 
				'uri_segment' => 4, 
				'style' => 'digg' 
		) );
		
		$this->set_page_title ( '标签: ' . $tab->tab );
		$this->set_description ( '标签: ' . $tab->tab );
		$this->set_keywords ( $tab->tab );
		
		$this->initContent ('home', array('articles' => $articles, 'pagination' => $pagination));
	}
	
	function search($p = 1) {
		$p = intval ( $p );
		if ($p < 1) {
			$p = 1;
		}
		$key = $this->input->get('key');
		$key = $this->input->xss_clean($key);
		
		$limit = 10;
		
		$start = ($p - 1) * $limit;
		
		$article_model = new Article_Model ();
		$article_total = $article_model->count_by_searchkey ( $key );
		
		$articles = $article_model->find_by_searchkey ( $key, $limit, $start );
		
		$pagination = new Pagination ( array ( 
				'base_url' => 'article/search', 
				'total_items' => $article_total, 
				'items_per_page' => $limit, 
				'uri_segment' => 3, 
				'style' => 'digg' 
		) );
		
		$this->set_page_title ( '搜索: ' . $key );
		$this->set_description ( $key );
		$this->set_keywords ( $key );
		$this->initContent ('article_search', array('articles' => $articles, 'pagination' => $pagination));
	}
}