<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>用户管理－－用户列表</title>
<style type="text/css">
<!--
body,td,th {
	font-family: 宋体;
	font-size: 12px;
}
a {
	font-size: 12px;
}
a:link {
	text-decoration: underline;
}
a:visited {
	text-decoration: underline;
	color: #000000;
}
a:hover {
	text-decoration: none;
	color: #66FF00;
}
a:active {
	text-decoration: underline;
	color: #3366FF;
}
.style1 {
	color: #FFFFFF;
	font-weight: bold;
}
-->
</style>
</head>

<body>
<table width="760" border="1" cellspacing="0" cellpadding="0">
		<caption>
		用户列表
		</caption><br />
		<a href="/cc/user.action?flag=input">添加新用户</a>
		<tr bgcolor="#000066">
				<td width="120" class="style1">帐号</td>
				<td width="200" class="style1">密码</td>
				<td width="260" class="style1">权限</td>
				<td class="style1">操作</td>
		</tr>
<#if list?exists>
<#list list as user>
		<tr>
				<td>${user.account}</td>
				<td>${user.password}</td>
				<td>${user.role}</td>
				<td><a href="/cc/user.action?flag=role&id=${user.id}">修改权限</a>&nbsp;<a href="/cc/user.action?flag=edit&id=${user.id}">编辑</a>&nbsp;<a href="/cc/user.action?flag=delete&id=${user.id}">删除</a></td>
		</tr>
</#list>
</#if>
		<tr>
				<td colspan="4"><div align="center">${page.url} ${page.cp}/${page.pageCount} 每页${page.rowPerPage}条</div></td>
		</tr>
</table>
</body>
</html>
