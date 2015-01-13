<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript">
function screen(mid){
	$.get("/cc/member.action?flag=screen&mid=" + mid, function(data){
  		alert(data);
  		window.location.reload();
	});
	
}
function unScreen(mid){
	$.get("/cc/member.action?flag=unScreen&mid=" + mid, function(data){
  		alert(data);
		window.location.reload();
	});
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
				<td>用户管理</td>
		</tr>
		<tr>
				<td><a href="/cc/member.action">用户基本信息查询</a>&nbsp;
					<a href="/cc/member.action?flag=coverList">用户头像列表</a>&nbsp;
					<a href="/cc/member.action?flag=online">在线用户列表</a>&nbsp;
				</td>
		</tr>
</table>
<table width="400" border="0" cellspacing="0" cellpadding="0">
		<tr>
				<td><form name="form1" method="post" action="/cc/member.action">
				关键字：
				<input name="key" type="text" id="key" size="16" value="${key?if_exists}">
属性
<select name="property" id="property">
		<option value="UserName" <#if proterty?exists><#if proterty="UserName">selected</#if></#if>>UserName</option>
		<option value="Email" <#if proterty?exists><#if proterty="Email">selected</#if></#if>>Email</option>
</select> 
<input name="flag" type="hidden" id="flag" value="doSearch"> 
<input type="submit" name="Submit" value="提交">     
				</form></td>
		</tr>
</table>
<#if list?exists>
<table border="1" cellspacing="0" cellpadding="0">
		<tr bgcolor="#66FFFF">
				<td>用户名</td>
				<td>email</td>
				<td>密码</td>
				<td>票数</td>
				<td>注册时间</td>
				<td>上次登录时间</td>
				<td>状态</td>
				<td>操作</td>
		</tr>
		<#list list as member>
		<tr>
				<td>${member.userName}</td>
				<td>${member.email}&nbsp;</td>
				<td>${member.password}&nbsp;</td>
				<td>#{member.privilege}&nbsp;</td>
				<td>${member.registerTime?string('yyyy/MM/dd')}&nbsp;</td>
				<td><#if member.lastLoginTime?exists>${member.lastLoginTime?string('yyyy/MM/dd')}</#if>&nbsp;</td>
				<td><#if (member.state=0)>正常<#else>屏蔽</#if>&nbsp;</td>
				<td><a href="?flag=privilege&mid=#{member.id}">票数管理</a>&nbsp;
					<!--<a href="#">交易历史</a>&nbsp;-->
					<a href="?flag=articles&mid=#{member.id}">文章</a>&nbsp;
					<span id="external_links">
					<#if (member.state=0)>
						<a href="javascript:screen(#{member.id});">屏蔽</a>
					<#else>
						<a href="javascript:unScreen(#{member.id});">取消屏蔽</a>
					</#if>
					&nbsp;</span>
				</td>
		</tr>
		</#list>
</table>
</#if>
</body>
</html>
