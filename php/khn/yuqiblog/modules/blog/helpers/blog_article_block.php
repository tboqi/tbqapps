<?php
defined ( 'SYSPATH' ) or die ( 'No direct script access.' );

class blog_article_block_Core {
	
	public static function article_list($cate, $creator_id, $per_page_num = 15, $current_page = 1) {
		$blog_article_model = new Blog_Article_Model ( );
		
		$view = new View ( 'blog/blocks/appspace_article_list' );
		if ($cate == 0) {
			$view->articles = $blog_article_model->find_by_blog_id ( $creator_id, $per_page_num, $current_page );
			$num_rows = $blog_article_model->count_by_blog_id($creator_id);
		} elseif ($cate > 0) {
			$view->articles = $blog_article_model->find_by_blog_id_and_category_id ( $cate, $creator_id, $per_page_num, $current_page );
			$num_rows = $blog_article_model->count_by_blog_id_and_category_id($creator_id, $cate);
		} else {
			$view->articles = $blog_article_model->find_by_blog_id_and_uncate ( $creator_id, $per_page_num, $current_page );
			$num_rows = $blog_article_model->count_by_blog_id_and_uncate($creator_id);
		}
		$view->pagination = new Pagination(array(
		    'base_url'    		=> "article/manage/{$cate}",
		    'total_items'    	=> $num_rows,
		    'items_per_page' 	=> $per_page_num,
				'uri_segment'			=> 4,
		    'style'          	=> 'digg'
		));
		return $view;
	}
	
	public static function categories_list($user_id) {
		$blog_article_model = new Blog_Article_Model();
		
		$view = new View('blog/blocks/appspace_categories_list');
		
		$sql = "select c.id, c.name, ac.num
		from #__categories c
		left join #__user_category uc on uc.category_id=c.id
		left join (select count(*) num, category_id from #__article_categories group by category_id) ac on ac.category_id=c.id
		where uc.user_id=?";
		$view->categories = $blog_article_model->result_from_sql($sql, array($user_id));
		
		$view->uncate = $blog_article_model->count_by_blog_id_and_uncate($user_id);
		
		return $view;
	}
}