<?php
class Article_Controller extends Admin_Template_Controller {
	
	function __construct() {
		parent::__construct ();
	}
	
	function add() {
		$cate_model = new Category_Model ( );
		$this->initContent('admin_article_form', array('title' => '新建文章', 'categories' => $cate_model->find_all ()));
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
		$post->add_rules ( 'content', 'required' );
		
		if ($post->validate ()) {
			$article = array ();
			$article ['title'] = trim($this->input->xss_clean ( $this->input->post ( 'title' ) ));
			$article ['content'] = trim($this->input->xss_clean ( $this->input->post ( 'content' ) ));
			$article ['summary'] = trim($this->input->xss_clean ( $this->input->post ( 'summary' ) ));
			$article ['refurl'] = trim($this->input->xss_clean ( $this->input->post ( 'refurl' ) ));
			$category_ids = $this->input->xss_clean ( $this->input->post ( 'category_ids' ) );
			$tabs = trim($this->input->xss_clean ( $this->input->post ( 'tabs' ) ));
			$current_user = Auth::instance ()->get_user ();
			$article ['user_id'] = $current_user->id;
			$article ['create_time'] = time ();
			$article ['update_time'] = time ();
			$article_model = new Article_Model ( );
			
			if ($this->input->post ( 'id' ) > 0) {
				$url = url::site ( 'admin/article/manage' );
				$aid = $article_model->update ( $article, $this->input->post ( 'id' ) );
			} else {
				$url = url::site ( 'admin/article/add' );
				$aid = $article_model->create ( $article );
			}

			if ($aid > 0) {
				$article ['id'] = $aid;
				$article_model->add_article_category($aid, $category_ids);
				$article_model->add_article_tab($aid, $tabs);
			}
			
			echo sprintf ( '{status: 1, url: "%s"}', $url );
			exit ();
		} else {
			$errors = array ('title' => '', 'category_id' => '', 'content' => '' );
			$errors = arr::overwrite ( $errors, $post->errors ( 'article_form_errors' ) );
			$errors = json_encode ( $errors );
			echo sprintf ( '{status: 0, errors: %s}', $errors );
			exit ();
		}
	}
	
	function manage($p = 0) {
		$article_model = new Article_Model ();
		
		$limit = 20;
		
		$p = intval ( $p );
		if ($p < 1) {
			$p = 1;
		}
		$start = ($p - 1) * $limit;
		
		$num_rows = $article_model->count ();
		
		$category_model = new Category_Model();
		
		$this->initContent ( 'admin_article_list', 
			array (
				'articles' => $article_model->find ( $limit, $start ), 
				'title' => '文章管理', 
				'pagination' => new Pagination ( 
					array (
						'base_url' => 'admin/article/manage', 
						'total_items' => $num_rows, 
						'items_per_page' => $limit, 
						'uri_segment' => 4, 
						'style' => 'digg',
					)
				),
				'allcategories' => $category_model->find_all_categories_by_ctype('article'),
			) 
		);
	}
	
	function edit($id) {
		$id = intval($id);
		$cate_model = new Category_Model ( );
		$article_model = new Article_Model ( );
		$this->initContent(
			'admin_article_form', 
			array(
				'title' => '修改文章', 
				'categories' => $cate_model->find_all (), 
				'id' => $id, 
				'article' => $article_model->get ( $id ),
			)
		);
	}
	
	function delete($id) {
		$id = intval($id);
		$article_model = new Article_Model ( );
		echo $article_model->delete ( $id );
	}
	
	function quickedit() {
		$article_model = new Article_Model ( );
		
		$category_ids = $this->input->post('category_ids');
		foreach ($category_ids as $k => $v) {
			$article_model->add_article_category($k, $v);
		}
		
		$tabs = $this->input->post('tabs');
		foreach ($tabs as $key => $tab) {
			$article_model->add_article_tab($key, $tab);
		}
		
		url::redirect('admin/article/manage');
	}
}
