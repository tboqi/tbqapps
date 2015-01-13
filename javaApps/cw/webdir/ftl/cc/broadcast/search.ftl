<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript">
function removeByIds(){
	checkIds = document.form2.ids;
	ids = "";
	for(i=0; i<checkIds.length; i++){
		if(checkIds[i].checked == true){
			ids += "," + checkIds[i].value;
			continue;
		} else {
			continue;
		}
	}
	if(ids.length == 0){
		alert("您没有选择广播！");
	} else {
		ids = ids.substr(1, ids.length);
		if(confirm("您确定要删除吗？")){
			$.get("/cc/broadcast.action?flag=delete&ids=" + ids, function(data){
		  		alert(data);
		  		window.location.reload();
			});
		}
	}
}
</script>
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
				<td>广播管理</td>
		</tr>
		<tr>
				<td><a href="/cc/broadcast.action">系统广播</a>&nbsp;
					<a href="/cc/broadcast.action?flag=list">广播列表</a>
				</td>
		</tr>
</table>
<table width="400" border="0" cellspacing="0" cellpadding="0">
		<tr>
				<td><form name="form1" method="post" action="/cc/broadcast.action">
				关键字：
				<input name="key" type="text" id="key" size="16" value="${key?if_exists}">
属性
<select name="property" id="property">
		<option value="0">按用户</option>
		<option value="1">按日期</option>
</select> 
<input name="flag" type="hidden" id="flag" value="doSearch"> 
<input type="submit" name="Submit" value="提交">     
				</form></td>
		</tr>
</table>
<#if list?exists>
<table border="1" cellspacing="0" cellpadding="0">
<form name="form2" id="form2">
		<tr bgcolor="#66FFFF">
				<td>&nbsp;</td>
				<td>标题</td>
				<td>发起人</td>
				<td>发布日期</td>
				<td>广播类别</td>
		</tr>
		<#list list as broadcast>
		<tr>
				<td><input name="ids" type="checkbox" id="ids" value="#{broadcast.id}"></td>
				<td>${broadcast.articleTitle}</td>
				<td>${broadcast.memberName}&nbsp;</td>
				<td>${broadcast.createDate?string('yyyy/MM/dd')}&nbsp;</td>
				<td><#if broadcast.sort=4>系统广播
					<#elseif broadcast.sort=3>二次投票
					<#elseif broadcast.sort=2>投票
					<#elseif broadcast.sort=1>募捐
					<#else>拉票
					</#if></td>
		</tr>
		</#list>
		<#if page?exists>
		<tr>
				<td colspan="6"><input type="button" name="Submit" value="删除" onclick="javascript:removeByIds();">&nbsp;&nbsp;
				<div align="center">${page.url} ${page.cp}/${page.pageCount} 每页${page.rowPerPage}条</div></td>
		</tr>
</#if>
</form>
</table>
</#if>
</body>
</html>
