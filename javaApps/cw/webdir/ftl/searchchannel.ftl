<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta content="all" name="robots" />
<meta name="Copyright" content="www.chuanwen.com.cn" />
<meta name="description" content="娱乐明星,IT科技,财经股市,内幕揭秘,探索发现,网友自助发布传闻的web2.0网站,欢迎知情人报料." />
<meta content="娱乐,明星,传闻,爆料,奇闻" name="keywords" />
<link rel="icon" href="${base}/images/favicon.ico" type="image/x-icon" />
<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" /> 
<title>传闻网 - 频道搜索 - ${qs}</title>
<link href="${base}/style/layout.css" rel="stylesheet" type="text/css" />
<link href="${base}/style/basic.css" rel="stylesheet" type="text/css" />
<link href="${base}/style/header.css" rel="stylesheet" type="text/css" />
<link href="${base}/style/manage.css" rel="stylesheet" type="text/css" />
<link href="${base}/style/footer.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="${base}/style/contentstyle.css" type="text/css" />
<style type="text/css">
<!--
#list_show dt span.style1red {color: #FF0000}
-->
</style>
</head>

<body id="oneColLayout" class="channel">

<div id="wrapper">
  
  <#include "/ftl/header.ftl">
  </div>
  <!-- #header end -->
<div id="primaryContent">
<div id="list_show">

	<#if rs?exists && rs.size() &gt; 0>
		<#list rs as map>
            <dl>
                <dt><span>[频道]</span><a class="style1red" href="${base}/c/#{map.channel.id}" target="_blank">${map.channel.name}</a></dt>
                <dd class="list_show_tags"><span>作者：</span><a href="${base}/user/viewuser?memberId=#{map.member.id}" title="查看作者信息" alt="查看作者信息">${map.member.userName}&nbsp;&nbsp;</a><span>拥有文章数量：</span>${map.channel.articleNums}</dd>
                <dd class="list_show_content">${map.channel.description}</dd>
            </dl>
    	</#list>
    <#else>
    <br><br><br><br>
    <p>对不起！没有满足条件的结果！请尝试其它搜索条件</p><br><br>
	</#if>

<p>${pagnation}</p>
</div>
</div><!-- end #primaryContent --> 

<div id="sideContent">
sideContent
</div><!-- end #sideContent --> 

<#include "/ftl/footer.ftl">


</div><!-- end #wrapper --> 

</body>
</html>