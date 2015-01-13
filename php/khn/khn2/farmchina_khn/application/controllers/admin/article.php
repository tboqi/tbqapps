<?php
class Article_Controller extends Base_Admin_Controller {
	
	function __construct() {
		parent::__construct ();
	}
	
	function add() {
		$this->checkAdmin();
		$this->setData("pageTitle", "添加文章");
		
		$categories = $this->MCategory->all();
		
		$options = array();
		foreach ($categories as $cate) {
			$options[$cate->id] = $cate->name;
		}
		$this->setData("options", $options);
		
		$this->runAdmin("article/add");
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
		$this->checkAdmin();
		
		$article = $this->post("art");
		$article['title'] = $this->clean( StringUtil::removeHtmltag($article['title']) );
		$article['author_id'] = $this->admin->id;
		$article['create_time'] = time();
		if(strpos ($article['content'], "<img")) {
			$content = substr($article['content'], strpos($article['content'], '<img'));
			$content = substr($content, strpos($content, "src=") + 5);
			$article['img'] = substr($content, 0, strpos($content, "\""));
		}
		
		if($article['id'] > 0) {
			$this->MArticle->update($article);
		} else {
			$article['id'] = $this->MArticle->insert($article);
		}
		
		$this->MSearch->parseArticleSearcher($article);
		
		url::redirect("admin/article/articlelist");
	}
	
	function articlelist($cp = 0) {
		$this->checkAdmin();
		
		$articles = $this->MArticle->findArticles(0, 15);
		$this->setData("articles", $articles);
		$this->runAdmin("article/list");
	}
}
