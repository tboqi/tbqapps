<?php
class Article_Controller extends Base_Admin_Controller {
	
	function __construct() {
		parent::__construct ();
	}
	
	function add() {
		$cate_model = new Category_Model ( );
		$view = new View ( 'article/appadmin_article_form' );
		$view->categories = $cate_model->find_all ();
		$this->render ( '新建文章', $view );
	}
	
	/**
	 * 确定是添加还是修改
	 * 
	 * a 添加
	 * 移除title中的html标签
	 * 先写入article，获得article id
	 * 移除content的标签
	 * 检查title和content中包含的search关键字
	 * 记录入数据库
	 * 
	 * b 编辑
	 * 移除title中的html标签
	 * 删除search中的关于这个文章的关键字 的记录（article_search）
	 * 写入article
	 * 检查title和content中包含的search关键字
	 * 记录入数据库
	 */
	function save() {
		$post = new Validation ( $_POST );
		$post->pre_filter ( 'trim', TRUE );
		$post->add_rules ( 'title', 'required' );
		$post->add_rules ( 'category_id', 'required' );
		$post->add_rules ( 'content', 'required' );
		
		if ($post->validate ()) {
			$article = array ();
			$title = $this->input->xss_clean ( $this->input->post ( 'title' ) );
			$article ['title'] = StringUtil::removeHtmltag ( $title );
			$article ['content'] = $this->input->xss_clean ( $this->input->post ( 'content' ) );
			$article ['category_id'] = $this->input->post ( 'category_id' );
			$current_user = Auth::instance ()->get_user ();
			$article ['author_id'] = $current_user->id;
			$article ['create_time'] = time ();
			$article ['update_time'] = time ();
			$article_model = new Article_Model ( );
			
			if ($this->input->post ( 'id' ) > 0) {
				$aid = $article_model->update ( $article, $this->input->post ( 'id' ) );
			} else {
				$aid = $article_model->create ( $article );
			}
			
			if ($aid > 0) {
				$article ['id'] = $aid;
				searcher::create_search_index ( $article );
			}
			
			echo sprintf ( '{status: 1, url: "%s"}', url::site ( 'admin/article/manage' ) );
			exit ();
		} else {
			$errors = array ('title' => '', 'category_id' => '', 'content' => '' );
			$errors = arr::overwrite ( $errors, $post->errors ( 'article_form_errors' ) );
			$errors = json_encode ( $errors );
			echo sprintf ( '{status: 0, errors: %s}', $errors );
			exit ();
		}
	}
	
	function manage() {
		$view = new View ( 'article/article_list' );
		$view->url = url::site ( 'admin/article/manange_yui' );
		$view->key = 'id';
		$view->fields = array ('id', 'title', 'author', 'category', 'edit' );
		$view->myColumnDefs = array (array ('key' => $view->fields [0], 'label' => 'ID', 'sortable' => true ), array ('key' => $view->fields [1], 'label' => '标题', 'sortable' => true ), array ('key' => $view->fields [2], 'label' => '作者', 'sortable' => true ), array ('key' => $view->fields [3], 'label' => '分类', 'sortable' => true ), array ('key' => $view->fields [4], 'label' => '编辑', 'sortable' => false ) );
		
		$key = $this->input->get ( 'key' );
		$view->urlquery = '';
		if (! empty ( $key )) {
			$view->urlquery = '?key=' . $key;
		}
		
		$this->render ( '文章列表', $view );
	}
	
	function manange_yui($results = 15, $startIndex = 0, $sort = 'id', $dir = 'asc') {
		$article_model = new Article_Model ( );
		$view = new View ( 'yui_json' );
		$view->recordsReturned = $results;
		$view->startIndex = $startIndex;
		$view->sort = $sort;
		$view->dir = $dir;
		if (empty ( $_GET ['key'] )) {
			$articles = $article_model->find ( $results, $startIndex, $sort, $dir );
			$view->totalRecords = $article_model->count ();
		} else {
			$view->totalRecords = $article_model->searchCount ( $key );
			$articles = $article_model->search ( $key, $results, $startIndex, $sort, $dir );
		}
		foreach ( $articles as $key => $article ) {
			$articles [$key]->edit = '<a href="' . url::site ( 'admin/article/edit/' . $article->id ) . '">编辑</a> <a onclick="deleteRow(\'' . url::site ( 'admin/article/delete/' . $article->id ) . '\');" href="javascript:void(0);">删除</a>';
		}
		$view->result = $articles;
		$view->render ( TRUE );
	}
	
	function edit($id) {
		$cate_model = new Category_Model ( );
		$article_model = new Article_Model ( );
		$view = new View ( 'article/appadmin_article_form' );
		$view->categories = $cate_model->find_all ();
		$view->article = $article_model->get ( $id );
		$view->id = $id;
		$this->render ( '修改文章', $view );
	}
	
	function delete($id) {
		$article_model = new Article_Model ( );
		echo $article_model->delete ( $id );
	}
}
