<?php defined('SYSPATH') or die('No direct script access.');

ini_set('include_path', ini_get('include_path').PATH_SEPARATOR.APPPATH.'vendor/');

require_once 'Zend/Search/lucene.php';
require_once 'CN_Lucene_Analyzer.php';

class Book_Core {
	
	function __construct() {
	
	}
	
	function parseIndex() {
		Zend_Search_Lucene_Analysis_Analyzer::setDefault ( new CN_Lucene_Analyzer () );
		
		$index = new Zend_Search_Lucene ( DOCROOT . 'searcherindex', true );
		$doc = new Zend_Search_Lucene_Document ();
		
		$doc->addField ( Zend_Search_Lucene_Field::Text ( 'url', 'http://www.eyuwo.com', 'UTF-8' ) );
		$Text = 'this is just a test of Zend_Search_lucene. 说些什么呢,别没事找事啊,真不够哥们,繁體能不能被搜索到呢，测试一下啊.';
		$Text .= '非常簡單的實作；然而就全文檢索來說還是有缺點的！首先，建立分詞索引時必定會耗費系統資源，故比較好的做法是批次定時處理建立索引的動作。第二點是中文的問題，因為中文字詞與連貫的句子的關係，在分詞時是以二個字為一個詞的最基本單位，所以單一個中文字是不會有任何搜尋結果的。最後因為建立分詞索引為觸發事件，如果沒有去觸發它就無法更新分詞至目前資料庫的最新狀態。我覺得分詞索引的方式很像是MySQL的View資料表，也是將資料表中的欄位作一個資料上的更新，只是它沒有欄位的限制，可以針對建立的「詞」索引進行搜尋。就某方面來說是很好用的功能，也不失為中文在全文索引時的一種解決方案。^^';
		//$docText=iconv('ISO-8859-1','ASCII//TRANSLIT',$Text);
		$doc->addField ( Zend_Search_Lucene_Field::Text ( 'contents', $Text, 'UTF-8' ) );
		$index->addDocument ( $doc );
		$index->commit ();
		
		echo 'indexer one file!';
	}
}
