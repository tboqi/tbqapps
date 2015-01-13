<?php
defined ( 'SYSPATH' ) or die ( 'No direct access allowed.' );

class Welcome_Controller extends Base_Controller {
	
	// Disable this controller when Kohana is set to production mode.
	// See http://docs.kohanaphp.com/installation/deployment for more details.
	const ALLOW_PRODUCTION = FALSE;
	
	public function index() {
		$this->pageTitle = '首页';
		$this->addjs ( "index" );
		
		//无公害技术
		$this->setData ( "articlesWghjs", $this->MArticle->findArticlesByCategory ( 1, 0, 8 ) );
		//农业标准
		$this->setData ( "articlesNybz", $this->MArticle->findArticlesByCategory ( 2, 0, 10 ) );
		//农业词典
		$this->setData ( "articlesNycd", $this->MArticle->findArticlesByCategory ( 3, 0, 10 ) );
		//蔬菜技术
		$this->setData ( "articlesScjs", $this->MArticle->findArticlesByCategory ( 4, 0, 10 ) );
		//供求信息
		$this->setData ( "articlesGqxx", $this->MArticle->findArticlesByCategory ( 5, 0, 18 ) );
		//蔬菜种植技术
		$this->setData ( "articlesSczzjs", $this->MArticle->findArticlesByCategory ( 6, 0, 10 ) );
		$this->setData ( "articlesSczzjsImg", $this->MArticle->findArticlesByCategoryWithImg ( 6, 0, 2 ) );
		//昆虫养殖
		$this->setData ( "articlesKcyz", $this->MArticle->findArticlesByCategory ( 7, 0, 10 ) );
		$this->setData ( "articlesKcyzImg", $this->MArticle->findArticlesByCategoryWithImg ( 7, 0, 2 ) );
		//致富项目
		$this->setData ( "articlesZfxm", $this->MArticle->findArticlesByCategory ( 8, 0, 10 ) );
		$this->setData ( "articlesZfxmImg", $this->MArticle->findArticlesByCategoryWithImg ( 8, 0, 2 ) );
		//温室种植
		$this->setData ( "articlesWszz", $this->MArticle->findArticlesByCategory ( 9, 0, 20 ) );
		//种业信息
		$this->setData ( "articlesZyxx", $this->MArticle->findArticlesByCategory ( 10, 0, 10 ) );
		//市场行情
		$this->setData ( "articlesSchq", $this->MArticle->findArticlesByCategory ( 11, 0, 10 ) );
		//保 鲜
		$this->setData ( "articlesBx", $this->MArticle->findArticlesByCategory ( 12, 0, 7 ) );
		//果 树
		$this->setData ( "articlesGs", $this->MArticle->findArticlesByCategory ( 13, 0, 7 ) );
		//畜 牧
		$this->setData ( "articlesXm", $this->MArticle->findArticlesByCategory ( 14, 0, 7 ) );
		//无 公 害
		$this->setData ( "articlesWgh", $this->MArticle->findArticlesByCategory ( 15, 0, 7 ) );
		//昆 虫 图 谱
		$this->setData ( "articlesKctp", $this->MArticle->findArticlesByCategory ( 16, 0, 7 ) );
		//农 机
		$this->setData ( "articlesNj", $this->MArticle->findArticlesByCategory ( 17, 0, 7 ) );
		//农 药
		$this->setData ( "articlesNy", $this->MArticle->findArticlesByCategory ( 18, 0, 7 ) );
		//食 用 菌
		$this->setData ( "articlesSyj", $this->MArticle->findArticlesByCategory ( 19, 0, 7 ) );
		//最新技术动态
		$this->setData ( "articlesZxjsdt", $this->MArticle->findNewArticles ( 0, 11 ) );
		$this->setData ( "articlesZxjsdtImg", $this->MArticle->findNewArticlesImg ( 0, 2 ) );
		
		if ($this->session->get ( 'userid' ) > 0) {
			$menu = new View ( $this->themes . "/user/userMenu" );
		} else {
			$menu = new View ( $this->themes . "/user/login" );
		}
		$menu->my = $this->my;
		$this->setData('menu', $menu);
		$this->run ( 'home' );
	}
}