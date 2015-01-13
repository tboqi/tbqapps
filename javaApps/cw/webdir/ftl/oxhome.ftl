<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta content="all" name="robots" />
<meta name="Copyright" content="www.chuanwen.com.cn" />
<meta name="description" content="娱乐明星,IT科技,财经股市,内幕揭秘,探索发现,网友自助发布传闻的web2.0网站,欢迎知情人报料." />
<meta content="娱乐,明星,传闻,爆料,奇闻" name="keywords" />
<link rel="icon" href="${base}/images/favicon.ico" type="image/x-icon" />
<link rel="shortcut icon" href="${base}/images/favicon.ico" type="image/x-icon" /> 
<title>传闻网 － 传闻由我</title>
<link href="${base}/style/headlink.css" rel="stylesheet" type="text/css" />
<link href="${base}/style/oxhome.css" rel="stylesheet" type="text/css" />
<title>传闻</title>
<div style="height:0;overflow:hidden;"><script language="javascript" src="http://count12.51yes.com/click.aspx?id=123222001&logo=9"></script></div>
</head>
<body>
<div id="head"></div><div class="na" id="nav"><A  href="http://www.hotqu.cn/" >热趣首页</A>&nbsp;│&nbsp;<A  href="http://www.hotqu.cn/chuan.asp" ><font color="#FF0000">传闻首页</font></A>&nbsp;│&nbsp;<A  href="http://www.hotqu.cn/news.asp" >新闻</A>&nbsp;│&nbsp;<A href="http://www.hotqu.cn/forum.asp">宝地</A>&nbsp;│&nbsp;<A href="http://www.hotqu.cn/old/forum.asp">信息吧</A>&nbsp;│&nbsp;<A  href="http://www.hotqu.cn/gallery.asp">酷片</A>&nbsp;│&nbsp;<A  href="http://www.hotqu.cn/bbs1/index.asp?boardid=42"><font color="#FF0000">游记</font></A>&nbsp;│&nbsp;<A  href="http://www.hotqu.cn/old/forum_list.asp?forum_id=8">call</A>&nbsp;│&nbsp;<A   href="http://www.hotqu.cn/pris.asp" >黄页</A>&nbsp;│&nbsp;<A   href="http://www.hotqu.cn/qq/default.asp" >Q群</A>&nbsp;│&nbsp;<A  href="http://www.hotqu.cn/shop_list.asp?action=more&c_id=10&s_id=0&taxis="><FONT color=#FF0000>建站</font></A>&nbsp;│&nbsp;<A href="http://www.hotqu.cn/bbs1/">杂货铺</A>&nbsp;│&nbsp;<A  href="http://www.hotqu.cn/bbs1/index.asp?boardid=30">老图</A>&nbsp;│&nbsp;<A  href="http://www.hotqu.cn/STORY/" >小说</A>&nbsp;│&nbsp;<A  href="http://www.hotqu.cn/jsjl.asp" ><font color="#FF0000">美食</font></A></div>
<div id="content">
  <div id="left">
    <div id="new_chapter">
      <h2>最新文章</h2>
	  <#assign size = newListMap.size()>
	  <#assign article = newListMap.get(0)>
	  <#list newListMap as article>
      <dl>
        <dt class="title"><a href="${base}/o/#{article.id}">${article.title}</a></dt>
        <dd><a href="${base}/o/#{article.id}"><img src="${article.imgSrc}" alt="${article.title}" width="100" height="88" title="${article.title}" /></a>
          <p>${article.content}</p>
        </dd>
      </dl>
	  </#list>
    </div>
    <ul>
      <h2>本周看点</h2>
	  <#if weekList?exists && weekList.size() &gt; 0>
	  <#list weekList as article>
	  <#if article?exists>
      <li class="list">·<a href="${base}/o/#{article.id}">${article.title}</a></li>
	  </#if>
	  </#list>
	  </#if>
    </ul><div class="more"></div>
    <ul>
      <h2>昨日回顾</h2>
	  <#if reviewList?exists && reviewList.size() &gt; 0>
	  <#list reviewList as article>
      <li class="list">·<a href="${base}/o/#{article.id}">${article.title}</a></li>
	  </#list>
	  </#if>
    </ul><div class="more"></div>
  </div>
  <div id="right">
    <form id="formsearch" name="formearch" action="${base}/ox/oxsearch.action?pn=1" method="post">
      <ul id="search" style="border:1px solid #60bef9;">
        <li>
          <input class="inputradio01" name="search" type="radio" value="all" checked="checked" />
          <label>文章</label>
          <input class="inputradio01" name="search" type="radio" value="channel" />
          <label>频道</label>
          <input class="inputradio01" name="search" type="radio" value="all" />
          <label>标签</label>
          <input class="inputradio01" name="search" type="radio" value="all" />
          <label>全部</label>
        </li>
        <li>
          <input class="inputtext01" type="text" name="qs" id="" />
          <input class="inputimage01" type="image" alt="请点击进行搜索" title="请点击进行搜索" src="${base}/images/btn_search.gif" />
        </li>
      </ul>
    </form>
    <div id="tags">
      <h3>标签</h3>
	  <#if hotLabelList?exists>
	  <#list hotLabelList as label>
	  <#if label?exists>
	  <a href="${base}/ox/oxsearch.action?qs=${stack.findValue("@com.cc.cw.util.URLCoderUtil@encode('${label.content}','UTF-8')")}&search=all&pn=1" target="_blank" style="font-size:${((9)*stack.findValue("@java.lang.Math@random()")+12)?int}px" class="showtags${((6)*stack.findValue("@java.lang.Math@random()"))?int}" title="${label.content}">${label.content}</a>
	  </#if>
	  </#list>
	  </#if> 
	</div>
    <ul id="suggest_chapter">
      <h2>推荐文章</h2>
	  <#if hottestList?exists>
	  <#list hottestList as article>
      <li class="list">·<a href="${base}/o/#{article.id}">${article.title}</a></li>
	  </#list>
	  </#if>
    </ul><div class="more"></div>
	<#if hottestPicList?exists>
    <ul id="picshow" style="border:none;">
	  <#list hottestPicList as picMap>
	  <#if picMap?exists && picMap_index &lt; 4>
      <li><a href="${base}/o/${picMap.articleId}"><img src="${picMap.imgSrc}" alt="${picMap.title}" width="75" height="75" title="${picMap.title}" /></a></li>
	  </#if>
	  </#list>
      <div class="clr"></div>
    </ul>
	</#if>
    <dl class="against">
      <dt>反对有理</dt>
	  <#if againstList?exists>
	  <#list againstList as article>
	  <#if article?exists>
      <dd class="list">·<a href="${base}/o/#{article.id}">${article.title}</a></dd>
	  </#if>
	  </#list>
	  </#if>
    </dl>
    <dl class="suggest">
      <dt>支持到底</dt>
	  <#if suggestList?exists>
	  <#list suggestList as article>
	  <#if article?exists>
      <dd class="list">·<a href="${base}/o/#{article.id}">${article.title}</a></dd>
	  </#if>
	  </#list>
	  </#if>
    </dl>
    <div class="clr"></div>
  </div>
</div>
</body>
</html>
