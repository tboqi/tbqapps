<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册友情链接</title>
</head>
<style type="text/css">
<!--
body {
	background-color: #DEF8E6;
}
-->
</style>
<body>
<table>
		<tr>
				<td class="font_title_1">本站链接信息 <font color="red">（请先在贵站做好本站的链接，再提交贵站信息，我们会及时处理和反馈的）</font> </td>
		</tr>
		<tr>
				<td>本站名称：传闻网 </td>
		</tr>
		<tr>
				<td>本站网址：http://www.chuanwen.com.cn </td>
		</tr>
		<tr>
				<td>本站LOGO： <img src="http://www.chuanwen.com.cn/images/logo_cw.gif" height="31" width="88"></td>
		</tr>
</table>
<br>
<table>
<form action="/friendlinks.action" method="post">
		<tr>
				<td style="Color:#FF0000">${message?if_exists}</td>
		</tr>
		<tr>
				<td class="font_title_1">提交贵站信息 </td>
		</tr>
		<tr>
				<td>网站名称： 
						<input name="name" type="text" id="name" value="${name?if_exists}"></td>
		</tr>
		<tr>
				<td>网站地址： 
						<input name="url" type="text" id="url" value="${url?if_exists}">
						如http://www.chuanwen.com.cn </td>
		</tr>
		<tr>
				<td>LOGO地址： 
						<input name="logoUrl" type="text" id="logoUrl" value=${logoUrl?if_exists}>
						如http://www.chuanwen.com.cn/images/logo_cw.gif（注意：图片大小必须 88×31 ；交换文字链接可不提交该项） </td>
		</tr>
		<tr>
				<td><input type="submit" value="确定" /><input type="hidden" id="flag" name="flag" value="doInput" /></td>
		</tr></form>
</table>
</body>
</html>
