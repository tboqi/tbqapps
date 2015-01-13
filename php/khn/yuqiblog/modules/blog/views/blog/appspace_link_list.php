<h1>链接列表</h1>
<?php if (isset($links) && is_array($links) && count($links) > 0) { ?>
<table border="1" cellspacing="0" cellpadding="0">
	<tr>
		<th>链接名称</th>
		<th>管理</th>
	</tr>
	<?php foreach ( $links as $link ) { ?>
	<tr>
		<td><a href="<?php echo $link->url; ?>" target="_blank"><?php echo $link->name; ?></a></td>
		<td><a href="<?php echo url::site('link/update/' . $link->id); ?>">编辑</a>&nbsp;&nbsp;<a href="<?php echo url::site('link/delete/' . $link->id); ?>">删除</a></td>
	</tr>
	<?php } ?>
</table>
<?php } else { echo 'no data'; } ?>