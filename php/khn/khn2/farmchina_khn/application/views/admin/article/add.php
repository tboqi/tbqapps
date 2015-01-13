<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<?php echo new View("admin/meta"); ?>

<script type="text/javascript">
window.onload = function()
{
var fck = new FCKeditor('art[content]');
fck.Width = "80%";
fck.Height = 300;
fck.BasePath = "<?php echo url::base(); ?>fck/";
fck.ReplaceTextarea() ;
}
</script>
<title><?php echo $pageTitle; ?></title>
</head>

<body>

<h1><?php echo $pageTitle; ?></h1>
<?php 
$hidden = array('art[id]' => isset($article) ? $article->id : 0);
echo form::open('admin/article/save', '', $hidden);

echo form::label('title', '标题');
$edata = array('name' => 'art[title]', 'id' => 'title', 'size' => '25', 'value' => isset($article) ? $article->title : "");
echo form::input($edata);

echo form::label("category", '分类');
$edata = array('name' => 'art[category_id]', 'id' => 'category_id');
echo form::dropdown("art[category_id]", $options, isset($article) ? $article->category_id : 0);

$edata = array('name' => 'art[content]', 'id' => 'content', 'value' => isset($article) ? $article->content : "");
echo form::textarea($edata);

echo form::submit('submit','保存');
echo form::close();
?>
</body>
</html>