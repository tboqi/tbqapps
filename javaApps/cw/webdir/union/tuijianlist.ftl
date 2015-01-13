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
<title>传闻网－传闻由我</title>
<link href="/union/style.css" rel="stylesheet" type="text/css" />
<link href="/union/v.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="nav" style="margin-bottom:5px;"><a href="http://www.bjchw.com">首页</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="http://www.bjchw.com/?action-news">资讯</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="http://www.bjchw.com/?action-goods" >商店</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="http://www.bjchw.com/?action-image">相册</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="http://www.bjchw.com/?action-video">影音</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="http://www.bjchw.com/?action-blog">日志</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="http://www.bjchw.com/?action-file">文件</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="http://www.bjchw.com/?action-group">圈子</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="http://www.bjchw.com/?action-bbs" >论坛</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="http://www.bjchw.com/?action-link">书签</a></div>
<div id="head"></div>
<div class="back"><a href="/u/">回到首页</a></div>
<div id="channel">
<#if articleMapList?exists>
	<#list articleMapList as map>
	<#if map?exists>
  <dl>
    <dt class="blue"><a href="/u/#{map.articleId}" title="${map.articleTitle}" alt="${map.articleTitle}" >${map.articleTitle}</a></dt>
    <#if map.imgSrc?exists && map.imgSrc != ""><img src="${map.imgSrc}" width="100" height="100" /></#if>
    <dd class="tag"><#if map.label?exists && map.label.size() &gt; 0 >标签：<#list map.label as label><a href="${base}/u/search?qs=${stack.findValue("@com.cc.cw.util.URLCoderUtil@encode('${label}','UTF-8')")}&search=label&pn=1" target="_blank">${label}</a>&nbsp;&nbsp;<#if label_index=2><#break></#if></#list></#if></dd>
    <dd>
      <p>${map.articleContent}</p>
    </dd>
  </dl>
	</#if>
	</#list>
</#if>
  <p class="page">${pagnation}</p>
</div>
<div class="back"><a href="/u/">回到首页</a></div>
<div id="foot">
  <p><a href="/about.html">关于我们</a> | <a href="/declare.html">网站声明</a> | <a href="/service.html">服务条款</a> | <a href="/business.html">商务合作</a> | <a href="/freindlinks.html">友情链接</a></p>
  <p>&copy;版权所有：传闻网</p>
  <p><img src="/images/pic_email.gif" width="138" height="16" /></p>
</div>
</body>
</html>
