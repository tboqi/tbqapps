<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>无标题文档</title>
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
.style1 {color: #FF0000}
-->
</style>
</head>

<body>
<form name="form1" method="post" action="/cc/member.action">
		为<span class="style1">${member.userName}</span>增加
		<input name="num" type="text" id="num" size="12">
票数
<input type="submit" name="Submit" value="提交">
<input name="flag" type="hidden" id="flag" value="doPrivilege">
<input name="mid" type="hidden" id="mid" value="#{mid}">
</form>
</body>
</html>
