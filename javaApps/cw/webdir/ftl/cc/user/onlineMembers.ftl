<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户头像列表</title>
<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript">
function commend(mid, commend){
	$.get("/cc/member.action?flag=commend&mid=" + mid + "&commend=" + commend, function(data){
  		//alert(data);
  		document.getElementById("table" + mid).innerHTML=data;
  		//window.location.reload();
	});
	
}
</script>
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
<#if onlineMemberSize=0>
没有在线用户
<#else>
<#if list?exists>
<table border="0" cellspacing="0" cellpadding="0">
		<tr>
		<#list list as member>
				<td valign="top" width="160" id="table#{member.id}"><table width="155" border="0" cellspacing="0" cellpadding="0">
        		<tr>
        				<td><img src="<#if member.coverPath?exists && member.coverPath != "">http://www.chuanwen.com.cn${member.coverPath!""}<#else>/images/icon_user.gif</#if>" 
        				width="155" height="175" border="0" title="点击图片可以推荐或取消推荐" 
        				alt="点击图片可以推荐或取消推荐" onclick="javascript:commend(#{member.id}, <#if member.commend=1>0<#else>1</#if>)"></td>
        				</tr>
        		<tr>
        				<td>昵称：${member.userName}</td>
        				</tr>
        		<tr>
        				<td><font color="#FF0000"><#if member.commend=1>已推荐<#else>未推荐</#if></font></td>
        				</tr>
				<tr>
        				<td><font color="#990000">点击图片可以推荐或取消推荐</font></td>
        				</tr>
        		</table></td>
        		<#if (member_index+1)%4=0></tr><tr></#if>
		</#list></tr>
		
</table>
</#if>
</#if>
</body>
</html>
