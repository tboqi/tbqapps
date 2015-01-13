<script type="text/javascript" src="<?php echo url::base();?>js/yuqi_utils.js"></script>
<script type="text/javascript">
$().ready(function(){
	form_submit('user_regist');
});
</script>
<form action="<?php echo url::site('user/regist'); ?>" method="post" id="user_regist">
<table>
	<tr>
		<th colspan="2">用户注册</th>
	</tr>
	<tr>
		<td>帐号</td>
		<td><input type="text" name="username" id="username" /></td>
	</tr>
	<tr>
		<td>昵称</td>
		<td><input type="text" name="nickname" id="nickname" /></td>
	</tr>
	<tr>
		<td>密码</td>
		<td><input type="password" name="password" id="password" /></td>
	</tr>
	<tr>
		<td>密码确认</td>
		<td><input type="password" name="password2" id="password2" /></td>
	</tr>
	<tr>
		<td>Email</td>
		<td><input type="text" name="email" id="email" /></td>
	</tr>
	<tr>
		<td colspan="2"><input type="submit" value="注册" /></td>
	</tr>
</table>
</form>