<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript">
function screen(aid){
	$.get("/cc/articleManager.action?flag=screen&aid=" + aid, function(data){
  		//alert(data);
  		//window.location.reload();
  		document.getElementById("li" + aid).innerHTML=data;
	});
	
}
function unScreen(aid){
	$.get("/cc/articleManager.action?flag=unScreen&aid=" + aid, function(data){
  		//alert(data);
		//window.location.reload();
		document.getElementById("li" + aid).innerHTML=data;
	});
}
function screenPic(aid){
	$.get("/cc/articleManager.action?flag=screenPic&aid=" + aid, function(data){
  		alert(data);
		//window.location.reload();
		//document.getElementById("li" + aid).innerHTML=data;
	});
}
</script>
<title>文章搜索</title>
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
				<td>文章管理</td>
		</tr>
</table>
<table width="400" border="0" cellspacing="0" cellpadding="0">
		<tr>
				<td><form name="form1" method="post" action="/cc/articleManager.action">
				关键字：
				<input name="key" type="text" id="key" size="16" value="${key?if_exists}">
属性
<select name="property" id="property">
		<option value="0" <#if proterty?exists><#if proterty=0>selected</#if></#if>>文章名称</option>
		<option value="1" <#if proterty?exists><#if proterty=1>selected</#if></#if>>作者</option>
</select> 
<input name="flag" type="hidden" id="flag" value="doSearch"> 
<input type="submit" name="Submit" value="提交">     
				</form></td>
		</tr>
</table>
<#if list?exists>
<table border="1" cellspacing="0" cellpadding="0">
		<tr>
				<td>
		<#list list as article>
		<ul>
			<li id="li#{article.id}">${article.title}&nbsp;
			<#if article.status=-1>
				[<font color="red">被屏蔽</font>]&nbsp;[<a href="#" onclick="unScreen(#{article.id})">取消屏蔽</a>]
			<#else>
				[正常]&nbsp;[<a href="#"onclick="screen(#{article.id})">屏蔽</a>]</#if>[<a href="#" onclick="screenPic(#{article.id})">屏蔽图片</a>]
			</li>
		</ul>
		</#list>
		</td></tr>		
<#if page?exists>
		<tr>
				<td ><div align="center">${page.url} ${page.cp}/${page.pageCount} 每页${page.rowPerPage}条</div></td>
		</tr>
</#if>
</table>
</#if>
</body>
</html>