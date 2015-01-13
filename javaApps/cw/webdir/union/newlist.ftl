<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta content="all" name="robots" />
<meta name="Copyright" content="www.chuanwen.com.cn" />
<meta name="description" content="<#if uu?exists >${uu.description?if_exists}</#if>" />
<meta content="<#if uu?exists >${uu.keyword?if_exists}</#if>" name="keywords" />
<link rel="icon" href="${base}/images/favicon.ico" type="image/x-icon" />
<link rel="shortcut icon" href="${base}/images/favicon.ico" type="image/x-icon" /> 
<title><#if uu?exists >${uu.websiteName?if_exists}</#if></title>
<link href="/union/style.css" rel="stylesheet" type="text/css" />
<link href="/union/v.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="nav" style="margin-bottom:5px;"><#if uu?exists >${uu.header?if_exists}</#if></div>
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
<div id="foot"><#if uu?exists >${uu.footer?if_exists}</#if></div>
</body>
</html>
