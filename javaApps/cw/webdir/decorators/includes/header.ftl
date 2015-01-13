<div id="header">
<h1 class="headerh1"><a href="index.html" title="传闻网">传闻网</a></h1>
<ul id="mainNav">
	<li><a href="${base}/home.action" id="home">首页</a></li>
	<li><a href="/channellist.html" id="channel">频道</a></li>
	<li><a href="${base}/tags.action" id="tags">标签</a></li>
	<#if member?exists>
	<li><a href="${base}/login!logout.action" id="manage">登出</a></li>
	<#else>
	<li><a href="${base}/login.action" id="login">登录</a></li>
	</#if>
</ul>
<!-- #search -->
<div id="search">
<form action="search.html" id="searchform" name="searchform">
<input type="radio" name="searchcondition" checked="checked" /><label>全部</label>
<input type="radio" name="searchcondition" /><label>频道</label>
<input type="radio" name="searchcondition" /><label>文章</label>
<input type="radio" name="searchcondition" /><label>标签</label>
<input class="inputtext" type="text" id="searchtxt" name="searchtxt" /><a href="#"><img class="btn" alt="搜索" title="搜索" src="${base}/images/btn_search.gif" width="21" height="18" /></a>
</form>
</div>
<div id="hotpot">
<ul>
<li class="bold01">标签：</li>
<#if labelList?exists>
	<#list labelList as label>
		<li><a href="#">${label.content}</a></li>
	</#list>
</#if>
</ul>
</ul>
</div>
<div class="clr"></div>
<!-- #search end -->
</div><!-- #header end -->
