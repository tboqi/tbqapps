<form action="" method="post">
<table>
<tr>
	<td colspan="2">给 <?php echo $to_user->nickname; ?> 发消息</td>
</tr>
<tr>
	<td>标题</td>
	<td><input name="title" id="title" value="" type="text" /></td>
</tr>
<tr>
	<td colspan="2"><textarea name="content" id="content"></textarea></td>
</tr>
<tr>
	<td colspan="2"><input type="submit" /></td>
</tr>
</table>
</form>