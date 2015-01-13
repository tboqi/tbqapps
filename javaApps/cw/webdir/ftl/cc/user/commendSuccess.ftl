<#if member?exists>
	<table width="155" border="0" cellspacing="0" cellpadding="0">
        		<tr>
        				<td><img src="<#if member.coverPath?exists && member.coverPath != "">http://www.chuanwen.com.cn${member.coverPath!""}<#else>/images/icon_user.gif</#if>" 
        				width="155" height="175" border="0" title="点击图片可以推荐或取消推荐" 
        				alt="点击图片可以推荐或取消推荐" onclick="javascript:commend(#{member.id}, <#if member.commend=1>0<#else>1</#if>)"></td>
        				</tr>
        		<tr>
        				<td>昵称：${member.userName}</td>
        				</tr>
        		<tr>
        				<td><#if member.commend=1><font color="#FF0000">已推荐</font><#else>未推荐</#if></td>
        				</tr>
				<tr>
        				<td><font color="#990000">点击图片可以推荐或取消推荐</font></td>
        				</tr>
        		</table>
<#else>
操作错误
</#if>