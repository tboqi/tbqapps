<h2>文章列表</h2>
<form id="form1" name="form1" method="post" action="<?php echo url::site('admin/article/quickedit'); ?>">
<table border="1">
	<?php foreach($articles as $art) { ?>
	<tr>
		<td width="4%" rowspan="2">
			<input name="id[]" type="checkbox" id="id[]" value="<?php echo $art->id;?>" />
		</td>
		<td width="60%">标题：<?php echo $art->title;?></td>
		<td width="18%" rowspan="2">
			<select multiple="multiple" name="category_ids[<?php echo $art->id;?>][]" size="5" id="select">
				<?php foreach ($allcategories as $cate) { ?>
				<option value="<?php echo $cate->id; ?>"<?php if(article::check_article_has_category($cate->id, $art->id)) {echo ' selected';} ?>><?php echo $cate->name; ?></option>
				<?php } ?>
			</select>
		</td>
		<td width="18%" rowspan="2">
			<a href="<?php echo url::site('admin/article/edit/' . $art->id); ?>">编辑</a>
			<a href="<?php echo url::site('admin/article/delete/' . $art->id); ?>" class="deleteRow">删除</a>
		</td>
	</tr>
	<tr>
		<td>标签： <input size="40" type="text" name="tabs[<?php echo $art->id;?>]" id="tabs_<?php echo $art->id;?>" value="<?php echo article::get_tabs_string_by_artid($art->id, 0); ?>" /></td>
	</tr>
	<?php } ?>
</table>
<div><input type="submit" value="确定" /></div>
</form>
<?php echo $pagination; ?>
<script type="text/javascript">
$(document).ready(function() { 
	$(".deleteRow").click( function () { return deleteRow(this.href); }); 
});
</script>