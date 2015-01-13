<?php
defined ( 'SYSPATH' ) or die ( 'No direct script access.' );

class article_searcher_Core {
	/**
     * 传入一个aritcle数组，将相关key和相关widget 写入 aritcle_search 表中
     * 
     * 先删除这个article的相关信息
     *
     * @param array $article
     */
	static function create_search_index($article) {
		$search_model = new Search_Model ( );
		$search_model->delete_article_search ( $article ['id'] );
		
		$array = $search_model->find_all ();
		
		if ($array && is_array ( $array ) && count ( $array ) > 0) {
			$articleSearch = array ("article_id" => $article ['id'] );
			$articleTitle = StringUtil::removeHtmltag ( $article ['title'] );
			$articleContent = StringUtil::removeHtmltag ( $article ['content'] );
			foreach ( $array as $search ) {
				$widgetTitle = StringUtil::widget ( $articleTitle, $search->key );
				$widgetContent = StringUtil::widget ( $articleContent, $search->key );
				if ($widgetTitle > 0 || $widgetContent > 0) {
					$articleSearch ['widget'] = $widgetTitle + $widgetContent;
					$articleSearch ['search_id'] = $search->id;
					$search_model->insert_article_search ( $articleSearch );
				}
			}
		}
	}
}