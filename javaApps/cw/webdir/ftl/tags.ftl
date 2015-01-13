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
<title>热门标签 - 传闻网</title>
<link href="${base}/style/layout.css" rel="stylesheet" type="text/css" />
<link href="${base}/style/basic.css" rel="stylesheet" type="text/css" />
<link href="${base}/style/header.css" rel="stylesheet" type="text/css" />
<link href="${base}/style/manage.css" rel="stylesheet" type="text/css" />
<link href="${base}/style/footer.css" rel="stylesheet" type="text/css" />
<link href="${base}/style/tags.css" rel="stylesheet" type="text/css" />
</head>

<body id="oneColLayout" class="channel">
<!--wrapper start-->
<div id="wrapper">

<!--header start-->
<#include "/ftl/header.ftl">
<!-- head end -->

</div>
<!--header end-->

<!-- ad words start -->
<!-- ad words end -->

<!--primaryContent start-->

<div id="primaryContent">
<div id="tg">
<h1>标签</h1>
<div id="content">
<#if labelList?exists>
<#list labelList as label>
<#if label?exists>
<a href="${base}/search/search.action?qs=${stack.findValue("@com.cc.cw.util.URLCoderUtil@encode('${label.content}','UTF-8')")}&search=all&pn=1" target="_blank" style="font-size:${((9)*stack.findValue("@java.lang.Math@random()")+12)?int}px" class="showtags${((6)*stack.findValue("@java.lang.Math@random()"))?int}" title="${label.content}">${label.content}</a>
</#if>
</#list>
</#if> 
  
</div>

</div>
</div>
<!--primaryContent end-->

<!--sideContent start-->
<!--sideContent end-->

<!--footer start-->
<#include "/ftl/footer.ftl">
<!--footer end-->

</div>
<!--wrapper end-->


</body>
</html>
