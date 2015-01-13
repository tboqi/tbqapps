<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript">
function screen(aid){
	$.get("/cc/channel.action?flag=screen&id=" + aid, function(data){
  		//alert(data);
  		//window.location.reload();
  		document.getElementById("li" + aid).innerHTML=data;
	});
	
}
function unScreen(aid){
	$.get("/cc/channel.action?flag=unScreen&id=" + aid, function(data){
  		//alert(data);
		//window.location.reload();
		document.getElementById("li" + aid).innerHTML=data;
	});
}

function tuijian(id, tuijian) {
	$.get("/cc/channel.action?flag=tuijian&id=" + id + "&tuijian=" + tuijian, function(data){
  		//alert(data);
		//window.location.reload();
		document.getElementById("li" + id).innerHTML=data;
	});
}
</script>
<title>频道管理</title>
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
				<td>频道管理</td>
		</tr>
</table>
<table width="400" border="0" cellspacing="0" cellpadding="0">
		<tr>
				<td><form name="form1" method="post" action="/cc/channel.action">
				关键字：
				<input name="key" type="text" id="key" size="16" value="${key?if_exists}">
<input name="flag" type="hidden" id="flag" value="doSearch"> 
<input type="submit" name="Submit" value="提交">     
				</form></td>
		</tr>
</table>
<#if list?exists>
<table border="1" cellspacing="0" cellpadding="0">
		<tr>
				<td>
		<#list list as channel>
		<ul>
			<li id="li#{channel.id}">${channel.name}(${channel.articleNums})&nbsp;
			<#if channel.tuijian=0>[推荐]
			<#else>
			[不推荐]
			</#if>
			<#if channel.state=3>
				[<font color="red">被屏蔽</font>]&nbsp;[<a href="#" onclick="unScreen(#{channel.id})">取消屏蔽</a>]
			<#else>
				[正常]&nbsp;[<a href="#"onclick="screen(#{channel.id})">屏蔽</a>]</#if>
			<#if channel.tuijian=0>[<a href="#"onclick="tuijian(#{channel.id}, -1)">不推荐</a>]
			<#else>
				[<a href="#"onclick="tuijian(#{channel.id}, 0)">推荐</a>]
			</#if>
			</li>
		</ul>
		</#list>
		</td></tr>
<#if page?exists>
		<tr>
				<td ><div align="center">${page.url} ${page.cp}/${page.pageCount} 每页${page.rowPerPage}条</div></td>
		</tr>
</#if>
</#if>
</body>
</html>
