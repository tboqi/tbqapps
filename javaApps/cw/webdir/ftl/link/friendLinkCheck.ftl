<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>友情链接</title>
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
</style>
</head>

<body>
<table>
<form action="/cc/friendLink.action" method="post">
		<tr>
				<td></td>
		</tr>
		<tr>
				<td>如何处理： <select name="display" id="display">
		<option value="0">未处理</option>
		<option value="1">显示在内页</option>
		<option value="2">显示在首页</option>
		<option value="-1">不显示</option>
</select></td>
		</tr>
		<tr>
				<td>是否显示为红色： <input type="radio" name="color" value="1">是 <input type="radio" name="color" value="0" checked>否</td>
		</tr>
		<tr>
				<td>显示顺序： <input type="text" name="viewOrder" id="viewOrder" value="0"></td>
		</tr>
		<tr>
				<td><input type="submit" value="确定" /><input type="hidden" id="flag" name="flag" value="doCheck" /><input type="hidden" id="id" name="id" value="${id}" /></td>
		</tr></form>
</table>
</body>
</html>
