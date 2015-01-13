<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<?php new View("admin/meta"); ?>
<title>文章列表</title>
</head>

<body>
<?php if($articles !== FALSE && is_array($articles) && count($articles) > 0) { ?>
<table>
	<thead>
		<tr>
			<th colspan="5"><h1>文章列表</h1></th>
		</tr>
		<tr>
			<th>id</th>
			<th>标题</th>
			<th>分类</th>
			<th>编辑</th>
			<th>删除</th>
		</tr>
	</thead>
	<tbody>
		<?php foreach ($articles as $article) { ?>
		<tr>
			<td><?php echo $article->id; ?></td>
			<td><?php echo $article->title; ?></td>
			<td><?php echo $article->category_name; ?></td>
			<td>编辑</td>
			<td>删除</td>
		</tr>
		<?php } ?>
	</tbody>
</table>
<?php } else { echo "没有记录"; } ?>
</body>
</html>