	<div id="top">
<#if member?exists>
    欢迎您！<span class="red">${member.userName}</span>
    您的票数目前是：<span class="number" id="youVoteCount">#{member.privilege}</span>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <#if unreadCount?exists && unreadCount gt 0>
    &nbsp;&nbsp;&nbsp;&nbsp;
    <a href="/shortmsgunread"><img src="/images/x.gif" border="0" /></a>
    (<a href="/shortmsgunread">${unreadCount}</a>)</label>
    </#if>&nbsp;&nbsp;&nbsp;&nbsp;
    <a href="/user/usermanage"><img src="/images/jj.gif" border="0" />
    <font color="blue">我的传客</font></a>
    <#if Session['bindflag']?exists && Session['bindflag']=='yes' && Session['sessionVal']?exists && Session['sessionVal'].uuid == member.uuid>
    	该机器已与您的帐户绑定,欢迎您回家!
    </#if>
    <span class="right"><a href="#" onclick="this.style.behavior='url(#default#homepage)';this.setHomePage('http://www.chuanwen.com.cn');">设为首页</a>│<a href="javascript:window.external.AddFavorite('http://www.chuanwen.com.cn','传闻网�');">加入收藏</a>&nbsp;&nbsp;<span class="red"><a href="${base}/help.html">您想了解传闻网吗？</a></span></span>
<#else>
	<form action="${base}/login.action" method="post">
	<span class="red">游客</span>，欢迎您！该机器目前票数是：<span class="number" id="youVoteCount"><#if Session?exists && Session['sessionVal']?exists && Session['sessionVal'].privilege?exists>${Session['sessionVal'].privilege}<#else>0</#if> </span>票！
	    邮箱：<input class="textbox" type="text" name="email" size="12"/></label>
        密码：<input class="textbox" type="password" name="password" size="12"/></label>
        <input type="hidden" name="loginFlag" value="true" />&nbsp;&nbsp;	
		<#if request.getQueryString()?exists>
			<#assign queryString = "?"+request.getQueryString()>
		<#else>
			<#assign queryString = "">
		</#if>	
		<input type="hidden" value="${inputUrl?if_exists}" name="inputUrl"/>
		${request.getSession().removeAttribute("errorMap")}
		<input type="submit" name="Submit" value="登录" class="but" />
      &nbsp;&nbsp;<span class="zhuce"><a target="_blank" href="${base}/regist.html">注册</a>&nbsp;<a target="_blank" href="${base}/findpassword.action"> 忘记密码？</a></span><span class="right"><a href="#" onclick="this.style.behavior='url(#default#homepage)';this.setHomePage('http://www.chuanwen.com.cn');">设为首页</a>│<a href="javascript:window.external.AddFavorite('http://www.chuanwen.com.cn','传闻网�');">加入收藏</a>&nbsp;&nbsp;<span class="red"><a href="${base}/help.html">您想了解传闻网吗？</a></span></span>
      <div class="clr"></div>
	</form>
</#if>
	</div>
	<!-- top end -->