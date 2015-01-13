<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>友情链接列表</title>
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
<table border="1" cellspacing="0" cellpadding="0">
		<caption>
		模块列表
		</caption>
		<tr>
				<td colspan="5">
				<a href="/cc/friendLink.action">全部</a>&nbsp;
				<a href="/cc/friendLink.action?display=0&flag=unCheck">未处理</a>&nbsp;
				<a href="/cc/friendLink.action?flag=search">搜索</a>&nbsp;
				<!-- 
				<a href="/cc/friendLink.action?flag=allpic">图片</a>&nbsp;
				<a href="/cc/friendLink.action?flag=alltext">内页文字</a>&nbsp;
				<a href="/cc/friendLink.action?flag=index">首页</a>&nbsp;</td>
				-->
		</tr>
		<tr bgcolor="#000066">
				<td width="100" class="style1">网站名称</td>
				<td width="100" class="style1">网站地址</td>
				<td width="100" class="style1">LOGO</td>
				<td width="100" class="style1">显示位置</td>
				<td width="120" class="style1">操作</td>
		</tr>
<#if list?exists>
<#list list as link>
		<tr>
				<td><a href="${link.url}"<#if link.color=1> style="Color:#FF0000"</#if> target="_blank">${link.name}</a></td>
				<td>${link.url}</td>
				<td>
				<#if (link.logoUrl?length > 11)>
				<a href="${link.url}" target="_blank"><img src="${link.logoUrl}" width="88" height="31" border="0" alt="${link.name}" title="${link.name}"></a>
				</#if>
				</td>
				<td><#if link.display=0>未处理</#if><#if link.display=1>内页</#if><#if link.display=2>首页</#if><#if link.display=-1>不显示</#if></td>
				<td><a href="/cc/friendLink.action?flag=check&id=${link.id}">处理</a>&nbsp;</td>
		</tr>
</#list>
</#if>
<#if page?exists>
		<tr>
				<td colspan="5"><div align="center">${page.url} ${page.cp}/${page.pageCount} 每页${page.rowPerPage}条</div></td>
		</tr>
</#if>
</table>
</body>
</html>
