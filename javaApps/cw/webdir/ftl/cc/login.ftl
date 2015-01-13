<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>登录</title>
<style type="text/css">
<!--
body,td,th {
	font-family: 宋体;
	font-size: 12px;
}
-->
</style></head>

<body>
<table width="268" border="1" align="center" cellspacing="0" id="login">
	<form name="form1" method="post" action="/cc/login.action">
		<tr>
				<td colspan="2"><div align="center">登录</div></td>
		</tr>
		<tr>
				<td width="60">帐号</td>
				<td width="198"><input name="account" type="text" id="account"></td>
		</tr>
		<tr>
				<td>密码</td>
				<td><input name="password" type="password" id="password" value=""></td>
		</tr>
		<tr>
				<td colspan="2"><div align="center">
						<input name="flag" type="hidden" id="flag" value="login">
						<input type="submit" name="Submit" value="提交">
				</div></td>
		</tr>
		<tr>
				<td colspan="2"><div align="center">
						<font color="red">${message?if_exists}</font>
				</div></td>
		</tr>
	</form>
</table>
</body>
</html>
