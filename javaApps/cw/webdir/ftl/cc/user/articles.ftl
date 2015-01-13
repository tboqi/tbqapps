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
</style>
</head>

<body>
<table width="400" border="0" cellspacing="0" cellpadding="0">
		<tr>
				<td>用户管理--文章</td>
		</tr>
		<tr>
				<td><a href="/cc/member.action">用户基本信息查询</a>&nbsp;
					<a href="/cc/member.action?flag=coverList">用户头像列表</a>&nbsp;
					<a href="/cc/member.action?flag=online">在线用户列表</a>&nbsp;
				</td>
		</tr>
</table>
<#if articleList?exists>
<table border="1" cellspacing="0" cellpadding="0">
		<tr bgcolor="#66FFFF">
				<td>id</td>
				<td>标题</td>
				<td>时间</td>
				<td>操作</td>
		</tr>
		<#list articleList as article>
		<tr>
				<td>#{article.id}</td>
				<td><a href="/r/#{article.id}" target="_blank">${article.title}</a>&nbsp;</td>
				<td>${article.createDate?string("yyyy-MM-dd")}&nbsp;</td>
				<td><a href="?flag=articleDel&aid=#{article.id}&mid=#{mid}&cp=#{page.cp}">删除</a>&nbsp;
				</td>
		</tr>
		</#list>
		<tr>
				<td colspan="4"><div align="center">${page.url} #{page.cp}/#{page.pageCount} 每页${page.rowPerPage}条</div></td>
		</tr>
</table>
</#if>
</body>
</html>
