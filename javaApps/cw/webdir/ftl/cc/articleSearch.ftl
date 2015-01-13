<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>文章搜索</title>
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
<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript">
function tuijian(tj, aid){
	if(tj == 1){
		$.get("/cc/article.action?flag=tuijian&id=" + aid, function(data){
			//alert(data + '“aaaaaaaaaa”');
	  		//document.getElementById("tr" + aid).innerHTML=data;
	  		alert("成功");
	  		window.location.reload();
		});
	} else {
		$.get("/cc/article.action?flag=notuijian&id=" + aid, function(data){
		//alert(data + '“aaaaaaaaaa”');
	  		//document.getElementById("tr" + aid).innerHTML=data;
	  		alert("成功");
	  		window.location.reload();
		});
	}
}
</script>
</head>

<body>
<form name="form1" method="post" action="/cc/article.action">
		<table width="247" border="1" cellspacing="0" cellpadding="0">
    		<tr>
    				<td colspan="2"><div align="center">
    						<h2>文章搜索</h2>
    				</div></td>
 				</tr>
 			<tr>
    				<td colspan="2"><font color="red">${message?if_exists}</font></td>
 				</tr>
    		<tr>
    				<td width="67">条件</td>
    				<td width="174"><input name="query" type="text" id="query"</td>
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
<#if articleList?exists>
<table border="1" cellspacing="0" cellpadding="0">
		<caption>
		文章列表
		</caption>
		<tr bgcolor="#000066">
				<td width="100" class="style1">id</td>
				<td width="200" class="style1">标题</td>
				<td width="60" class="style1">推荐</td>
				<td width="100" class="style1">操作</td>
		</tr>

<#list articleList as article>
		<tr id="tr#{article.id}">
				<td>#{article.id}</td>
				<td>${article.title}</td>
				<td>${article.status}</td>
				<td>
				<#if article.status="推荐">
				<a href="javascript:tuijian(0, #{article.id})">不推荐</a>&nbsp;</td>
				<#else>
				<a href="javascript:tuijian(1, #{article.id})">推荐</a>&nbsp;</td>
				</#if>
				
		</tr>
</#list>
</table>
</#if>
</body>
</html>
