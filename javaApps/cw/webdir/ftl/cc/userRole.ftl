<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户管理－－编辑权限</title>
<style type="text/css">
<!--
body,td,th {
	font-family: 宋体;
}
a {
	font-size: 12px;
}
a:link {
	text-decoration: underline;
}
a:visited {
	text-decoration: underline;
	color: #FFFFCC;
}
a:hover {
	text-decoration: none;
	color: #66FF00;
}
a:active {
	text-decoration: underline;
	color: #3366FF;
}
-->
</style></head>

<body>
<form name="form1" method="post" action="/cc/user.action">
		<table width="247" border="1" cellspacing="0" cellpadding="0">
    		<tr>
    				<td colspan="2"><div align="center">
    						<h2>编辑权限</h2>
    				</div></td>
 				</tr>
 			<tr>
    				<td colspan="2"><font color="red">${message?if_exists}</font></td>
 				</tr>
    		<tr>
    				<td colspan="2">
    				<#list roleList as role>
    				<INPUT TYPE="checkbox" NAME="roleIds" id="roleIds" value="${role.id}"<#list roleIds as roleId><#if role.id=roleId> checked</#if></#list>>${role.name}<br />
    				</#list>
    				</td>
 				</tr>
    		<tr>
    				<td colspan="2"><div align="center">
    						<input name="id" type="hidden" id="id" value="${id?if_exists}">
    						<input name="flag" type="hidden" id="flag" value="${flag?if_exists}">
    						<input type="submit" name="Submit" value="确定">
    						<input type="button" name="button" value="取消" onclick="javascript:history.back();">
 						</div></td>
 				</tr>
    		</table>
</form>
</body>
</html>
