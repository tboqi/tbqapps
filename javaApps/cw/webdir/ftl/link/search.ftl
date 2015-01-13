<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>友情链接搜索</title>
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
<form name="form1" method="post" action="/cc/friendLink.action">
		<table width="247" border="1" cellspacing="0" cellpadding="0">
    		<tr>
    				<td colspan="2"><div align="center">
    						<h2>友情链接搜索</h2>
    				</div></td>
 				</tr>
 			<tr>
    				<td colspan="2"><font color="red">${message?if_exists}</font></td>
 				</tr>
    		<tr>
    				<td width="67">条件</td>
    				<td width="174"><input name="query" type="text" id="query"</td>
 				</tr>
    				    <td>属性</td>
    				<td><select name="field" id="field">
    						<option value="name">网站名称</option>
    						<option value="url">网站域名</option>
    						</select></td>
 				</tr>
    		<tr>
    				<td colspan="2"><div align="center">
    						<input name="flag" type="hidden" id="flag" value="doSearch">
    						<input type="submit" name="Submit" value="确定">
    						<input type="button" name="button" value="取消" onclick="javascript:history.back();">
 						</div></td>
 				</tr>
    		</table>
</form>
</body>
</html>
