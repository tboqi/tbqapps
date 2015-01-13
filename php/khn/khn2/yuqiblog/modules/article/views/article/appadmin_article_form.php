<script type="text/javascript" src="<?php echo url::base(); ?>js/fck/fckeditor.js"></script>
<script type="text/javascript">
$(document).ready(function() { 
	form_submit_fck('article_form');
});
window.onload = function()
{
var fck = new FCKeditor('content');
fck.Width = 680;
fck.Height = 300;
fck.BasePath = "<?php echo url::base(); ?>js/fck/";
fck.ReplaceTextarea() ;
}
</script>
<h1><?php echo $title; ?></h1>
<form action="<?php echo url::site('admin/article/save'); ?>" id="article_form" method="post">
<table>
    <tr>
        <td>标题</td>
        <td><input id="title" name="title" value="<?php echo isset($article) ? $article->title : ''; ?>" type="text" /></td>
    </tr>
    <tr>
        <td>分类</td>
        <td><select name="category_id" id="category_id">
		  <option value="">请选择分类</option>
		  <?php foreach ($categories as $category) { ?>
		  <option value="<?php echo $category->id; 
		  ?>"<?php if (isset($article) && $category->id == $article->category_id) 
		  echo ' selected'; ?>><?php echo $category->title; ?></option>
		  <?php } ?>
		</select></td>
    </tr>
    <tr>
        <td>内容</td>
        <td><textarea name="content" id="content"><?php echo isset($article) ? $article->content : ''; ?></textarea></td>
    </tr>
    <tr>
        <td colspan="2"><input value="保存" type="submit" /></td>
    </tr>
</table>
<input type="hidden" name="id" value="<?php echo isset($id) ? $id : 0; ?>" />
</form>