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
<title>创建频道 - 传闻网</title>
<link href="${base}/style/layout.css" rel="stylesheet" type="text/css" />
<link href="${base}/style/basic.css" rel="stylesheet" type="text/css" />
<link href="${base}/style/header.css" rel="stylesheet" type="text/css" />
<link href="${base}/style/manage.css" rel="stylesheet" type="text/css" />
<link href="${base}/style/footer.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/js/prototype.js"></script>
<script type="text/javascript" src="${base}/js/validObj.js"></script>
</head>

<body id="oneColLayout" class="channel">
<!--wrapper start-->
<div id="wrapper">
<#include "/ftl/header.ftl">
</div>
<!--header end-->

<!-- ad words start -->
<!-- ad words end -->

<!--primaryContent start-->

<div id="primaryContent">
<div id="publish">
<h1>创建频道</h1>
<div id="content1">
  <form action="${base}/channelapply/channelapply.action" method="post" >
    
    <table width="100%" border="0" cellspacing="6">
      <tr>
        <td width="8%">频道名称：</td>
        <td width="92%"><input name="chname" type="text" id="chname" size="70" value="${chname!""}" />
        <input type="hidden" name="loginFlag" value="true" /></td>
      </tr>
      <tr>
        <td valign="top">频道描述：</td>
        <td><textarea name="description" id="description" cols="45" rows="5">${description!""}</textarea></td>
      </tr>
      <tr>
        <td>关 键 词：</td>
        <td><input name="key" type="text" id="key" size="70" value="${key!""}" /></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td><input type="submit" value="创建频道" />
          <input type="reset" value="重新设置" /></td>
      </tr>
    </table>
  </form>
  </div>

</div>
</div>
<!--primaryContent end-->

<!--sideContent start-->
<!--sideContent end-->

<#include "/ftl/footer.ftl">

</div>
<!--wrapper end-->

<script language="javascript">
    <#if msg?exists>
        alert('${msg}');
    <#else>
    </#if>

    
</script>
</body>
</html>
