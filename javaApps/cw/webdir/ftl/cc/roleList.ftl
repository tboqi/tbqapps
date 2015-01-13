<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>模块列表</title>
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
.style1 {
	color: #FFFFFF;
	font-weight: bold;
}
-->
</style>
</head>

<body>
<table width="400" border="1" cellspacing="0" cellpadding="0">
		<caption>
		模块列表
		</caption>
		<tr bgcolor="#000066">
				<td width="120" class="style1">名称</td>
				<td width="200" class="style1">值</td>
				<td width="102" class="style1">显示顺序</td>
		</tr>
<#if list?exists>
<#list list as role>
		<tr>
				<td>${role.name}</td>
				<td>${role.value}</td>
				<td>${role.viewOrder}</td>
		</tr>
</#list>
</#if>
		<tr>
				<td colspan="3"><div align="center">${page.url} ${page.cp}/${page.pageCount} 每页${page.rowPerPage}条</div></td>
		</tr>
</table>
</body>
</html>
