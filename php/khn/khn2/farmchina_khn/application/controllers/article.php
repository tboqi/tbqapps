<?php
defined ( 'SYSPATH' ) or die ( 'No direct access allowed.' );
/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of article
 *
 * @author boqi.tang
 */
class Article_Controller extends Base_Controller {

	function findByCategory($cateID, $start=0) {
		$perPage = 10;
		if($start < 0) $start = 0;
		$this->setData("articles", 
			$this->MArticle->findArticlesByCategory(
				intval($cateID), intval($start), intval($perPage)));

		$cate = $this->MCategory->get($cateID);
		$this->setData("pageTitle", $cate->name . "的所有文章");

		$config['total_items'] = $this->MArticle->articlesCountOfCategory($cateID);
		$config['items_per_page'] = $perPage;
		$config['uri_segment'] = $cateID;
		$config['style'] = 'digg';
		$this->pagination = new Pagination($config);
 
		$this->run ( "article/list" );
	}
	
	function detail($articleID) {
		$article = $this->MArticle->get($articleID);
		$this->setData("pageTitle", $article->title);
		$this->setData("article", $article);
		$this->run ( "article/detail" );
	}
}
?>
