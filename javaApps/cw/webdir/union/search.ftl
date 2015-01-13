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
<div id="result">
  <form action="/u/search?pn=1" method="post">
    <div id="serbar">
      <input name="qs" type="text" value="${qs}" class="input1" onFocus="this.className='input1-bor'" 
      onBlur="this.className='input1'" />
      <input type="hidden" name="search" id="search" value="article"/>
      <input type="image" src="/union/images/but_search.gif" 
      height="22" width="44" title="点击进行搜索" border="0" /></div>
  </form>
	<#if rs?exists && rs.size() &gt; 0>
  <#list rs as map>
  <dl>
    <dt class="blue"><a href="/u/#{map.article.id}">${map.article.title}</a></dt>
    <#assign labelList = map.labelList><#if labelList?exists && labelList.size() &gt; 0 ><dd>标签：<#list labelList as label><a href="${base}/u/search?qs=${stack.findValue("@com.cc.cw.util.URLCoderUtil@encode('${label}','UTF-8')")}&search=all&pn=1" title="${label}">${label}</a>&nbsp;&nbsp;<#if label_index=2><#break></#if></#list></dd></#if>
    <dd>
      <p><#if map.article.content.length() &gt; 150>${map.article.content?substring(0, 150)}<#else>${map.article.content}</#if>.....</p>
    </dd>
  </dl>
  </#list>
  <#else>
  	<dl><dd>没有找到您想要的传闻</dd></dl>
  </#if>
  <p class="page">${pagnation}</p>
</div>
<div class="back"><a href="/u/">回到首页</a></div>
<div id="foot"><#if uu?exists >${uu.footer?if_exists}</#if></div>
</body>
</html>
