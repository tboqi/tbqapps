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
		alert("您没有选择留言！");
	} else {
		ids = ids.substr(1, ids.length);
		if(confirm("您确定要删除吗？")){
			$.get("/cc/liuyan.action?flag=delete&ids=" + ids, function(data){
		  		alert(data);
		  		window.location.reload();
			});
		}
	}
}
</script>
<title>留言管理</title>
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
				<td>留言管理</td>
		</tr>
</table>
<table width="400" border="0" cellspacing="0" cellpadding="0">
		<tr>
				<td><form name="form1" method="post" action="/cc/liuyan.action">
				关键字：
				<input name="key" type="text" id="key" size="16" value="${key?if_exists}">
属性
<select name="property" id="property">
		<option value="0">按用户</option>
		<option value="1">按内容</option>
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
				<td>内容</td>
				<td>发布日期</td>
		</tr>
		<#list list as message>
		<tr>
				<td><input name="ids" type="checkbox" id="ids" value="#{message.id}"></td>
				<td>[${message.title}]<#if message.content?length &gt; 20>${message.content?substring(0,20)}<#else>${message.content}</#if></td>
				<td>${message.sendTime?string('yyyy/MM/dd')}&nbsp;</td>
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
