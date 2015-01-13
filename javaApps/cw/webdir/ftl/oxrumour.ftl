<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta content="all" name="robots" />
<meta name="Copyright" content="www.chuanwen.com.cn" />
<meta name="description" content="娱乐明星,IT科技,财经股市,内幕揭秘,探索发现,网友自助发布传闻的web2.0网站,欢迎知情人报料." />
<meta content="娱乐,明星,传闻,爆料,奇闻" name="keywords" />
<link rel="icon" href="${base}/images/favicon.ico" type="image/x-icon" />
<link href="${base}/style/oxput.css" rel="stylesheet" type="text/css" />
<title>传闻网</title>
<div style="height:0;overflow:hidden;"><script language="javascript" src="http://count12.51yes.com/click.aspx?id=123222001&logo=9"></script></div>
</head>
<body>
<div id="head"></div><div class="na" id="nav"><A  href="http://www.hotqu.cn/" >热趣首页</A>&nbsp;│&nbsp;<A  href="http://www.hotqu.cn/chuan.asp" ><font color="#FF0000">传闻首页</font></A>&nbsp;│&nbsp;<A  href="http://www.hotqu.cn/news.asp" >新闻</A>&nbsp;│&nbsp;<A href="http://www.hotqu.cn/forum.asp">宝地</A>&nbsp;│&nbsp;<A href="http://www.hotqu.cn/old/forum.asp">信息吧</A>&nbsp;│&nbsp;<A  href="http://www.hotqu.cn/gallery.asp">酷片</A>&nbsp;│&nbsp;<A  href="http://www.hotqu.cn/bbs1/index.asp?boardid=42"><font color="#FF0000">游记</font></A>&nbsp;│&nbsp;<A  href="http://www.hotqu.cn/old/forum_list.asp?forum_id=8">call</A>&nbsp;│&nbsp;<A   href="http://www.hotqu.cn/pris.asp" >黄页</A>&nbsp;│&nbsp;<A   href="http://www.hotqu.cn/qq/default.asp" >Q群</A>&nbsp;│&nbsp;<A  href="http://www.hotqu.cn/shop_list.asp?action=more&c_id=10&s_id=0&taxis="><FONT color=#FF0000>建站</font></A>&nbsp;│&nbsp;<A href="http://www.hotqu.cn/bbs1/">杂货铺</A>&nbsp;│&nbsp;<A  href="http://www.hotqu.cn/bbs1/index.asp?boardid=30">老图</A>&nbsp;│&nbsp;<A  href="http://www.hotqu.cn/STORY/" >小说</A>&nbsp;│&nbsp;<A  href="http://www.hotqu.cn/jsjl.asp" ><font color="#FF0000">美食</font></A></div>
<div id="content2">
  <h2>${article.title}</h2>
  <h3 class="tag">上传者：${articleAuthor} 标签：<#if allLabels?exists><#list allLabels as label><a href="${base}/ox/oxsearch.action?qs=${stack.findValue("@com.cc.cw.util.URLCoderUtil@encode('${label}','UTF-8')")}&search=label&pn=1" title="${label}" alt="${label}" class="link_color1">${label}</a>&nbsp;&nbsp;<#if label_index=2><#break></#if></#list></#if></h3>
  <div id="chapter_content">
    <p>${article.content}</p>
  </div>
  <h4 class="red"><a href="http://www.chuanwen.com.cn/" target="_blank">如果您想对传闻进行投票判断真假，请登陆传闻网！</a></h4>
  <dl>
    <dt>相关传闻</dt>
	<#if sameArticleList?exists && sameArticleList.size() &gt; 0>
	<#list sameArticleList as art>
    <#if article.id != art.id>
	<dd class="blue">·<a href="${base}/o/#{art.id}">${art.title}</a></dd>
	</#if>
	</#list>
	</#if>
  </dl>
</div>
<h1 class="title">
<a href="${base}/ox/">回到首页</a></h1>
</body>
</html>
