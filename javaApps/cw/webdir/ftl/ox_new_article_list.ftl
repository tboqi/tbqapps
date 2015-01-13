<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link href="/style/headlink.css" rel="stylesheet" type="text/css" />
<link href="/style/oxput.css" rel="stylesheet" type="text/css" />
<title>传闻</title>
</head>
<body>
<div id="head"></div><div class="na" id="nav"><A  href="/" >易趣首页</A>&nbsp;│&nbsp;<A  href="/chuan.asp" ><font color="#FF0000">传闻首页</font></A>&nbsp;│&nbsp;<A  href="/news.asp" >新闻</A>&nbsp;│&nbsp;<A 
                  href="/forum.asp">宝地</A>&nbsp;│&nbsp;<A href="/old/forum.asp">信息吧</A>&nbsp;│&nbsp;<A  href="/gallery.asp">酷片</A>&nbsp;│&nbsp;<A  href="http://www.hotqu.cn/bbs1/index.asp?boardid=42"><font color="#FF0000">游记</font></A>&nbsp;│&nbsp;<A  href="http://www.hotqu.cn/old/forum_list.asp?forum_id=8">call</A>&nbsp;│&nbsp;<A   href="/pris.asp" >黄页</A>&nbsp;│&nbsp;<A   href="file:///F|/6.29_传闻推广页面制作/qq/default.asp" >Q群</A>&nbsp;│&nbsp;<A  href="http://www.hotqu.cn/shop_list.asp?action=more&c_id=10&s_id=0&taxis="><FONT color=#FF0000>建站</font></A>&nbsp;│&nbsp;<A href="http://www.hotqu.cn/bbs1/">杂货铺</A>&nbsp;│&nbsp;<A  href="http://www.hotqu.cn/bbs1/index.asp?boardid=30">老图</A>&nbsp;│&nbsp;<A  href="/STORY/" >小说</A>&nbsp;│&nbsp;<A  href="/jsjl.asp" ><font color="#FF0000">美食</font></A></div>
<div id="more">
<#if articleMapList?exists>
	<#list articleMapList as map>
		<#if map?exists>
			<dl>
				<dt class="blue"><a href="${base}/o/#{map.articleId}" title="${map.articleTitle}" alt="${map.articleTitle}" >${map.articleTitle}</a></dt>
				<dd class="tag"><#if map.label?exists && map.label.size() &gt; 0 >标签：<#list map.label as label><a href="${base}/ox/oxsearch.action?qs=${stack.findValue("@com.cc.cw.util.URLCoderUtil@encode('${label}','UTF-8')")}&search=label&pn=1" target="_blank">${label}</a>&nbsp;&nbsp;<#if label_index=2><#break></#if></#list></#if></dd>
				<dd><#if map.imgSrc?exists && map.imgSrc != ""><img src="${map.imgSrc}" height="100" width="100" /></#if>
				  <p>${map.articleContent}</p>
				</dd>
			  </dl>
		</#if>
	</#list>
</#if>
  <p class="page">${pagnation}</p>
</div>
<h1 class="title">
<a href="${base}/ox/">回到首页</a></h1>
</body>
</html>
