<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>更改首页图片</title>
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
-->
</style></head>

<body>
<form name="form1" method="post" action="/cc/changeIndexPic.action" enctype="multipart/form-data">
		<table width="400" border="1" cellspacing="0" cellpadding="0">
    		<tr>
    				<td colspan="2"><div align="center">
    						<font color="red">${message?if_exists}</font>
    				</div></td>
 				</tr>
    		<tr>
    				<td colspan="2"><div align="center">
    						<h2>更改首页图片</h2>
    				</div></td>
 				</tr>
    		<tr>
    				<td width="67">选择图片</td>
    				<td width="174"><input name="file" type="file" id="file"></td>
 				</tr>
    		<tr>
    				<td>图片链接</td>
    				<td><input name="link" type="text" id="link"></td>
 				</tr>
    		<tr>
    				<td colspan="2"><div align="center">
    						<input name="id" type="hidden" id="id" value="0">
    						<input name="flag" type="hidden" id="flag" value="upload">
    						<input type="submit" name="Submit" value="确定">
 						</div></td>
 				</tr>
    		</table>
</form>
</body>
</html>
