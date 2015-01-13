<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<?php
require_once('Zend/Search/Lucene.php');
require_once('CN_Lucene_Analyzer.php');

$index = new Zend_Search_Lucene('f:/index1');
Zend_Search_Lucene_Analysis_Analyzer::setDefault(new CN_Lucene_Analyzer());
$keyword = isset($_GET['keyword']) ? strtolower($_GET['keyword']) : '';
$query = Zend_Search_Lucene_Search_QueryParser::parse($keyword, "UTF-8");
$hits = $index->find($query);

foreach ($hits as $hit) {
    echo 'ID: '.$hit->id.'<br>';
    echo 'Score: '.$hit->score.'<br>';
    echo 'Url: '.$hit->url.'<br><hr>';
    echo 'Contents: '.$hit->contents.'<br>';
}
?>

<hr>
<form action="" name="frm" method="get" onSubmit="return checkform(this)">
        <input type="text" name="keyword" size="20" maxlength="50" value="<?php echo $keyword; ?>">
        <input type="submit" name="search" value="搜索">
</form>