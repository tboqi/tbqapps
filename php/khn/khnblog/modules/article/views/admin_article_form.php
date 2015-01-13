<script type="text/javascript" src="<?php echo Kohana::config('core.static_website'); ?>js/fck/fckeditor.js"></script>
<script type="text/javascript">
$(document).ready(function() { 
	form_submit_fck('article_form');
});
window.onload = function()
{
var fck1 = new FCKeditor('content');
fck1.Width = 680;
fck1.Height = 300;
fck1.BasePath = "<?php echo Kohana::config('core.static_website'); ?>js/fck/";
fck1.ReplaceTextarea() ;
}
</script>
<h1><?php echo $title; ?></h1>
<form action="<?php echo url::site('admin/article/save'); ?>" id="article_form" method="post">
<table>
    <tr>
        <td>标题</td>
        <td><input id="title" name="title" style="width: 450px;" value="<?php echo isset($article) ? $article->title : ''; ?>" type="text" /></td>
    </tr>
    <tr>
        <td>分类</td>
        <td><select name="category_ids[]" size="6" id="category_ids[]" multiple="multiple">
		  <?php foreach ($categories as $category) { ?>
		  <option value="<?php echo $category->id; ?>"<?php if (isset($article) && $category->id == $article->category_id) echo ' selected'; ?>><?php echo $category->name; ?></option>
		  <?php } ?>
		</select></td>
    </tr>
    <tr>
        <td>摘要</td>
        <td><textarea name="summary" id="summary" style="width: 450px; height: 110px;"><?php echo isset($article) ? $article->summary : ''; ?></textarea></td>
    </tr>
    <tr>
        <td>内容</td>
        <td><textarea name="content" id="content"><?php echo isset($article) ? $article->content : ''; ?></textarea></td>
    </tr>
    <tr>
        <td>标签</td>
        <td><input id="tabs" name="tabs" value="<?php echo isset($article) ? $article->tabs : ''; ?>" type="text" /></td>
    </tr>
    <tr>
        <td>原文地址</td>
        <td><input id="refurl" name="refurl" value="<?php echo isset($article) ? $article->refurl : ''; ?>" type="text" /></td>
    </tr>
    <tr>
        <td colspan="2"><input value="保存" type="submit" /></td>
    </tr>
</table>
<input type="hidden" name="id" value="<?php echo isset($id) ? $id : 0; ?>" />
</form>