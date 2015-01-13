<?php
header("Content-type: text/html; charset=utf8"); 
require_once 'Zend/Search/Lucene.php';
$index = new Zend_Search_Lucene ( 'f:/zslindex', true );//建立索引对象，TRUE表示一个新的索引
$conn = mysql_connect('localhost', 'root', 'root');
mysql_select_db('khnblog');
mysql_query('set names utf8');
$sql = "select id, title from yuqi_articles";
$query = mysql_query( $sql );
while ( $row = mysql_fetch_array($query)) {
  $url = 'http://www.sellcamera.net/detail.php/' . $row['id']; //产品链接
	$title = $row ['title'];//产品标题
	echo $title;
	// Store document URL to identify it in search result.
	$doc = new Zend_Search_Lucene_Document (); //建立一个索引文档
	$doc->addField ( Zend_Search_Lucene_Field::UnIndexed ( 'url', $url ) );
	$doc->addField ( Zend_Search_Lucene_Field::Text ( 'title', $title, 'utf8') );
	$index->addDocument ( $doc ); //将这个文档加到索引中
}
// Write changes to the index.
$index->commit ();//提交，保存索引资料