<h2>分类列表</h2>
<table>
<tr>
	<th>id</th><th>名称</th><th>操作</th>
</tr>
<?php foreach($categories as $cate) {?>
<tr>
	<td><?php echo $cate->id;?></td>
	<td><?php echo $cate->name;?></td>
	<td>
		<a href="<?php echo url::site('admin/category/edit/' . $cate->id); ?>">编辑</a>
		<a href="<?php echo url::site('admin/category/delete/' . $cate->id); ?>" class="deleteRow">删除</a>
	</td>
</tr>
<?php } ?>
</table>
<script type="text/javascript">
$(document).ready(function() { 
	$(".deleteRow").click( function () { deleteRow(this.href); }); 
});
</script>