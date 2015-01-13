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
<div class="back" style="border-bottom:5px solid #F98FB9;"><a href="/u/">回到首页</a></div>
<form>
  <dl id="regsuccess">
    <dt>注册成功：</dt>
    <dd style="font-size:14px;">恭喜您注册成功<!--，您的票数为5--></dd>
    <dd>
     <a href="/u/"> <img src="/union/images/back1.jpg" height="37" width="157" border="0" /></a>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     <a href="http://www.chuanwen.com.cn"> <img src="/union/images/back2.jpg" height="37" width="157" border="0" /></a>
    </dd>
  </dl>
</form>
<div class="back"><a href="/u/">回到首页</a></div>
<div id="foot"><#if uu?exists >${uu.footer?if_exists}</#if></div>
</body>
</html>
