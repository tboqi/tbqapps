<script type="text/javascript" src="<?php echo url::base (); ?>js/fck/fckeditor.js"></script>
<script type="text/javascript">
$(document).ready(function() { 
	form_submit_fck('article_form');
});
window.onload = function() {
	var fck = new FCKeditor('content');
	fck.Width = 680;
	fck.Height = 300;
	fck.BasePath = "<?php echo url::base (); ?>js/fck/";
	fck.ReplaceTextarea() ;
}
</script>
<h1><?php echo $title; ?></h1>
<form action="<?php echo url::site ( 'article/save' ); ?>" id="article_form" method="post">
<table>
	<tr>
		<td>标题</td>
		<td><input id="title" name="title" value="<?php echo isset ( $article ) ? $article->title : ''; ?>" type="text" /></td>
	</tr>
    <?php if (isset ( $categories ) && is_array ( $categories ) && count ( $categories ) > 0) { ?>
    <tr>
		<td>分类</td>
		<td>
        <?php foreach ( $categories as $category ) { ?>
        <span><input name="categories[]" type="checkbox" id="categories<?php echo $category->id; ?>" value="<?php echo $category->id; ?>"<?php if (in_array($category->id, $aritcle_categories)){ echo ' checked'; } ?> /><?php echo $category->name; ?></span>
        <?php } ?>
			</td>
	</tr>
    <?php } else { ?>
    <input type="hidden" name="categories" value="0" />
    <?php } ?>
    <tr>
		<td>内容</td>
		<td><textarea name="content" id="content"><?php echo isset ( $article ) ? $article->content : ''; ?></textarea></td>
	</tr>
	<tr>
		<td colspan="2"><input value="保存" type="submit" /></td>
	</tr>
</table>
<input type="hidden" name="id" value="<?php echo isset ( $id ) ? $id : 0; ?>" />
</form>