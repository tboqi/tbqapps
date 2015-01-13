<form action="" method="get">
<table>
	<tr>
		<td>关键字:</td>
		<td><input type="text" id="key" name="key" value="<?php echo $this->input->get('key'); ?>" /></td>
	</tr>
	<tr><td colspan="2"><input type="submit" value="查询" /></td></tr>
</table>
</form>
<?php if (isset($users) && is_array($users) && count($users) > 0) { ?>
<table>
	<tr>
		<th>用户名</th>
		<th>昵称</th>
		<th>操作</th>
	</tr>
	<?php foreach ($users as $user) { ?>
	<tr>
		<td><?php echo $user->username; ?></td>
		<td><?php echo $user->nickname; ?></td>
		<td>
		<a href="<?php echo url::site('user/delete/' . $user->id); ?>">删除</a></td>
	</tr>
	<?php } ?>
	<tr>
		<td colspan="3"><?php echo $pagination; ?></td>
	</tr>
</table>
<?php } else { echo '没有找到用户'; } ?>