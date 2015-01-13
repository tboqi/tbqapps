<h1>分类管理</h1>
<div><a href="<?php echo url::site('category/add'); ?>">添加分类</a></div>
<table>
	<?php foreach ($categories as $category) { ?>
	<tr>
		<td><?php echo $category->name; ?></td>
		<td><a href="<?php echo url::site('category/delete/' . $category->id); ?>">删除</a></td>
	</tr>
	<?php } ?>
</table>