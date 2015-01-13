<?php
ini_set('include_path', ini_get('include_path') . PATH_SEPARATOR . APPPATH . 'vendor/');

//echo ini_get('include_path');exit;

require_once 'Zend/Search/lucene.php';
require_once 'CN_Lucene_Analyzer.php';

class Searcher_Controller extends Template_Controller {
	
	function __construct() {
		parent::__construct();
	}
	
	function index() {
		Zend_Search_Lucene_Analysis_Analyzer::setDefault ( new CN_Lucene_Analyzer () );
		
		$index = new Zend_Search_Lucene ( DOCROOT . 'artiecleindex', TRUE);
		
		$article_model = new Article_Model();
		$articles = $article_model->find_start_id();
		
		foreach ($articles as $article) {
			$doc = new Zend_Search_Lucene_Document ();
			$doc->addField ( Zend_Search_Lucene_Field::Text ( 'article_id', $article->id, 'UTF-8' ) );
			$doc->addField ( Zend_Search_Lucene_Field::Text ( 'title', $article->title, 'UTF-8' ) );
			$doc->addField ( Zend_Search_Lucene_Field::Text ( 'summary', $article->summary, 'UTF-8' ) );
			$doc->addField ( Zend_Search_Lucene_Field::Text ( 'content', $article->content, 'UTF-8' ) );
			$index->addDocument ( $doc );
		}
		
		$index->commit ();
		
		echo 'indexer one file!';
	}
	
	function search() {
		$index = new Zend_Search_Lucene ( DOCROOT . 'artiecleindex' );
		Zend_Search_Lucene_Analysis_Analyzer::setDefault ( new CN_Lucene_Analyzer () );
		$keyword = '网站';
		$query = Zend_Search_Lucene_Search_QueryParser::parse ( $keyword, "UTF-8" );
		echo $index->count() . '<br/>';
		$hits = $index->find ( $query );
		
		foreach ( $hits as $hit ) {
			echo 'ID: ' . $hit->id . '<br>';
			echo 'Score: ' . $hit->score . '<br>';
			echo 'article_id: ' . $hit->article_id . '<br><hr>';
			echo 'title: ' . $hit->title . '<br>';
		}
	}
}