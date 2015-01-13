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
<title>传闻网 - 评论搜索 - ${qs}</title>
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
                <dt><span>[评论]</span><a class="style1red" href="${base}/r/#{map.article.id}" target="_blank">${map.article.title}</a></dt>
                <dd class="list_show_tags"><span>作者：</span><a href="${base}/user/viewuser?memberId=#{map.member.id}" title="查看作者信息" alt="查看作者信息">${map.member.userName}&nbsp;&nbsp;</a><#assign labelList = map.labelList><#if labelList?exists && labelList.size() &gt; 0 ><span>标签：</span><#list labelList as label><a href="${base}/search/search.action?qs=${stack.findValue("@com.cc.cw.util.URLCoderUtil@encode('${label}','UTF-8')")}&search=all&pn=1" title="${label}">${label}</a>&nbsp;&nbsp;<#if label_index=2><#break></#if></#list></#if>
                 	<#if 1=2>
                 	<span id="more"><#if labelList?exists><#if labelList.size() &gt; 3><span class="morelist">|<a href="#" onclick="show_hide('morecontent_${map_index}');return false;">more...</a><div class="morecontent" id="morecontent_${map_index}" style="display:none"><ul><li><a href="#" class="closeit" onclick="show_hide('morecontent_${map_index}');return false;">×</a></li><#list labelList as label><li><a href="${base}/search/search.action?qs=${stack.findValue("@com.cc.cw.util.URLCoderUtil@encode('${label}','UTF-8')")}&search=all&pn=1" title="${label}" >${label}</a></li></#list></ul></div></span></#if></#if></span>
                 	</#if>
                 </dd>
                <dd class="list_show_content">${map.remark.content}.....</dd>
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