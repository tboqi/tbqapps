<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>后台管理</title>
<style type="text/css">
<!--
body,td,th {
	font-family: 宋体;
}
body {
	background-color: #D8D1EF;
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
</style>
</head>

<body>
<#if list?exists>
<#list list as role>
<a href="${role.value}" target="mainFrame">${role.name}</a><br>
</#list>
</#if>
<a href="/cc/login.action?flag=logout" target="parent">退出</a><br>
</body>
</html>
