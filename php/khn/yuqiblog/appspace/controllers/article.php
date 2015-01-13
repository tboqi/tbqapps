<?php
class Article_Controller extends Space_Template_Controller {
	
	function __construct() {
		parent::__construct ();
	}
	
	function write() {
		if (!Auth::instance()->logged_in()) {
			url::redirect_index('user/login');
		}
		$cate_model = new Category_Model ( );
		$content = new View ( 'blog/blocks/appspace_article_form' );
		$content->title = '撰写文章';
		$content->categories = $cate_model->find_by_user ($this->logged_user->id);
		$this->_render ( $content );
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
			$title = $this->input->xss_clean ( $this->input->post ( 'title' ) );
			$article ['title'] = StringUtil::removeHtmltag ( $title );
			$article ['content'] = $this->input->xss_clean ( $this->input->post ( 'content' ) );
			$current_user = Auth::instance ()->get_user ();
			$article ['user_id'] = $current_user->id;
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
				
				$category_model = new Blog_Category_Model();
				if ($category_model->delete_article_category($aid)) {
					$categories = isset($_POST['categories']) ? $_POST['categories'] : 0;
					if (is_array($categories)) {
						foreach ($categories as $cid) {
							$category_model->create(array('article_id' => $aid, 'category_id' => $cid), 'article_categories');
						}
					}
				}
			}
			
			echo sprintf ( '{status: 1, url: "%s"}', url::site ( 'space/article/manage' ) );
			exit ();
		} else {
			$errors = array ('title' => '', 'content' => '' );
			$errors = arr::overwrite ( $errors, $post->errors ( 'article_form_errors' ) );
			$errors = json_encode ( $errors );
			echo sprintf ( '{status: 0, errors: %s}', $errors );
			exit ();
		}
	}
	
	public function manage($cate = 0, $current_page = 0) {
		if ($current_page < 1) {
			$current_page = 1;
		}
		$view = blog_article_block::article_list ( $cate, $this->logged_user->id, 10, intval($current_page) );
		$this->_render ( $view );
	}
	
	public function edit($articleid) {
		if (!Auth::instance()->logged_in()) {
			url::redirect_index('user/login');
		}
		$cate_model = new Category_Model ( );
		$article_model = new Blog_Article_Model();
		$content = new View ( 'blog/blocks/appspace_article_form' );
		$content->title = '编辑文章';
		$content->categories = $cate_model->find_by_user ($this->logged_user->id);
		$content->article = $article_model->get($articleid);
		$content->aritcle_categories = $article_model->getCategories($articleid);
		$content->id = intval($articleid);
		$this->_render ( $content );
	}
	
	function delete($id) {
		$article_model = new Blog_Article_Model();
		$article_model->delete(intval($id));
		url::redirect($_SERVER['HTTP_REFERER']);
	}
	
	function read($id) {
		$article_model = new Blog_Article_Model();
		$comment_model = new Blog_Comment_Model();
		$view = new View('blog/appspace_article_read');
		$view->article = $article_model->get($id);
		$view->user = ORM::factory('user', $view->article->user_id);
		$view->previous_article = $article_model->previous_article($view->user->id, $view->article->id);
		$view->next_article = $article_model->next_article($view->user->id, $view->article->id);
		$view->comments = $comment_model->find_by_article($view->article->id);
		
		$this->set_page_title($view->article->title);
		$this->set_description(article::summary($view->article->content));
		
		$this->_render($view);
	}
}