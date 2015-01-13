<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta content="all" name="robots" />
<meta name="Copyright" content="www.chuanwen.com.cn" />
<meta name="description" content="传闻网,创建自己的频道,收录自己喜欢的资讯." />
<meta content="娱乐,明星,传闻,爆料,奇闻" name="keywords" />
<link rel="icon" href="${base}/images/favicon.ico" type="image/x-icon" />
<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" /> 
<title>频道 - 传闻网</title>
<link href="${base}/style/layout.css" rel="stylesheet" type="text/css" />
<link href="${base}/style/basic.css" rel="stylesheet" type="text/css" />
<link href="${base}/style/header.css" rel="stylesheet" type="text/css" />
<link href="${base}/style/newchapter_list.css" rel="stylesheet" type="text/css" />
<link href="${base}/style/footer.css" rel="stylesheet" type="text/css" />
<script src="${base}/Scripts/AC_RunActiveContent.js" type="text/javascript"></script>
<script type="text/javascript">
function toupiao(channelId){
	$.post("/vote4channel.action", {channelId: channelId }, function(data){
  		str = data.split("~");
  		if(!(str[0] == "success"))
  			alert(str[0]);
  		else {
  			document.getElementById("chv" + channelId).innerHTML=str[1];
  			document.getElementById("youVoteCount").innerHTML=str[2];
  		}
	});
}
</script>
<style type="text/css">

</style>
</head>

<body id="towColLayout2" class="channel">
<!--wrapper start-->
<div id="wrapper">

<!--header start-->
<#include "/ftl/header.ftl"/><script type="text/javascript" src="/js/jquery.js"></script>
<!-- head end -->

</div>
<!--header end-->

<!-- ad words start -->
<!-- ad words end -->

<!--primaryContent start-->
<div id="primaryContent">
<!--活跃传客 开始-->
<dl id="hyck">
<dt>活跃传客<#if 1=2><a href="more.html" title="点击查看更多"><img src="images/btn_more.png" /></a></#if></dt>
<#if activityMemberList?exists && activityMemberList.size() &gt; 0>
	<#list activityMemberList as member>
		<#if member_index != 0 && member_index % 2 = 0>
		<dd><a title="asfasf" class="clearrightpadding" href="${base}/user/viewuser?memberId=#{member.id}"><#if member.coverPath != ""><img src="http://www.chuanwen.com.cn${member.coverPath!""}" width="66" height="66" /><#else><img src="http://www.chuanwen.com.cn/images/icon_user.gif" width="66" height="66" /></#if></a><p>${member.userName}</p></dd>
		<#else>
		<dd><a title="asfasf" href="${base}/user/viewuser?memberId=#{member.id}"><#if member.coverPath != ""><img src="http://www.chuanwen.com.cn${member.coverPath!""}" width="66" height="66" /><#else><img src="http://www.chuanwen.com.cn/images/icon_user.gif" width="66" height="66" /></#if></a><p>${member.userName}</p></dd>		
		</#if>
	</#list>
<#else>
目前没有活跃传客
</#if>
</dl><div class="clr"></div>
<!--活跃传客 结束-->
<!--本月最热 开始-->
<h3 class="zrcw">本月最热<#if 1=2><a href="more.html" title="点击查看更多"><img src="${base}/images/btn_more.png" /></a></#if></h3>
<ul class="zrcw_border">
<#if monthList?exists && monthList.size() &gt; 0>
	<#list monthList as article>
		<li><a href="${base}/r/#{article.id}">${article.title}</a></li>
	</#list>
<#else>
<li>本月没有最热文章</li>
</#if>
</ul>
<!--本月最热 结束-->
<div class="v_space"></div>
<!--最新频道 开始-->
<h4 class="zxpd">最新频道<#if 1=2><a href="more.html" title="点击查看更多"><img src="${base}/images/btn_more.png" /></a></#if></h3>
<ul class="zrcw_border">
<#if newChannelList?exists && newChannelList.size() &gt; 0>
<#list newChannelList as channel>
<li><a href="${base}/c/#{channel.id}">${channel.name}</a></li>
</#list>
<#else>
<li>没有最新频道</li>
</#if>
</ul>
<!--最新频道 结束-->
</div>
<!--primaryContent end-->

<!--sideContent start-->
<div id="sideContent">
<h1 class="channellist">频道列表</h1>

<!-- 频道列表 1 -->

<#if channelMapList?exists && channelMapList.size() &gt; 0>
<#list channelMapList as map>
	<dl class="pdlb">
	<dt><a href="${base}/c/#{map.channelId}">${map.title}</a>&nbsp;&nbsp;<a href="${base}/rss/rssServlet/?feedType=article&channelId=#{map.channelId}"><img title="rss" alt="rss" src="${base}/images/icon_rss2.gif" /></a>&nbsp;&nbsp;人气：<font size="3" color="red"><b><span id="chv#{map.channelId}">#{map.channelVoteCount}</span></b></font>&nbsp;<img src="/images/1.gif" /><a href="#" onclick="toupiao(#{map.channelId});return false;">投票</a></dt>
	<dd class="info_color"><span class="scz_color">创建者：</span><#if map.author?exists><a href="${base}/user/viewuser?memberId=#{map.author.id}" >${map.author.userName}</a></#if> 创建日期：${map.createDate} <span class="scz_color">关键字：</span>${map.keywords}</dd>
	<dd>文章数量：<span class="num_color">${map.articleNum}</span></dd>
	<dd class="xt">${map.description}</dd>
	</dl>
<div class="list_sprite_line"></div>
</#list>
<#else>
<dl class="pdlb">
<dd>目前没有频道</dd>
</dl>
<div class="list_sprite_line"></div>
</#if>

<div class="page_num">
<p>
${pagnation}
</p>
</div>

</div>
<!--sideContent end-->

<!--footer start-->
<#include "/ftl/footer.ftl">
<!--footer end-->

</div>
<!--wrapper end-->


</body>
</html>
