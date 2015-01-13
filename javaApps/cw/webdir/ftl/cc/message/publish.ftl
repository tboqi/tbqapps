<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>短信息管理－－发布系统信息</title>
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
	color: #0000CC;
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
<table width="400" border="0" cellspacing="0" cellpadding="0">
		<tr>
				<td>信息管理</td>
		</tr>
		<tr>
				<td><a href="/cc/message.action">系统消息</a>&nbsp;
					<a href="/cc/message.action?flag=list">消息列表</a>
				</td>
		</tr>
</table>
<form name="form1" method="post" action="/cc/message.action">
		<table border="1" cellspacing="0" cellpadding="0">
    		<tr>
    				<td colspan="2"><div align="center">
    						<h2>发布系统信息</h2>
    				</div></td>
 				</tr>
 			<tr>
    				<td colspan="2"><font color="red">${message?if_exists}</font></td>
 				</tr>
    		<tr>
    				<td width="67">标题</td>
    				<td width="174"><input name="title" type="text" id="title" value="${title?if_exists}"></td>
 				</tr><tr>
    				<td>内容</td>
    				<td><textarea name="content" cols="80" rows="6" id="content">${content?if_exists}</textarea></td>
 				</tr>
    		<tr>
    				<td colspan="2"><div align="center">
    						<input name="id" type="hidden" id="id" value="${id?if_exists}">
    						<input name="flag" type="hidden" id="flag" value="input">
    						<input type="submit" name="Submit" value="确定">
    						<input type="button" name="button" value="取消" onclick="javascript:history.back();">
 						</div></td>
 				</tr>
    		</table>
</form>
</body>
</html>
