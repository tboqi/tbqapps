<?php
header("Content-type: text/html; charset=utf8"); 
require_once 'Zend/Search/Lucene.php';
$index = new Zend_Search_Lucene('f:/zslindex'); 

//$keywords = strtolower($_GET[’keywords’]);
$keywords = 'mysql';
if(! empty($keywords)) {
 $hits = $index->find($keywords);
    echo '<br>Search result:<br>';
    foreach ($hits as $hit) {
        echo '<a href="' . $hit->url . '"><strong>' . $hit->title . '</strong></a><br>';
//        echo $hit->contents . '<hr>';
    }
}