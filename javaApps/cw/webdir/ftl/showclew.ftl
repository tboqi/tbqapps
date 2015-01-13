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
<title>${remark.title} - 传闻线索</title>
<link rel="stylesheet" href="${base}/style/layout.css" type="text/css" media="all"  />
<link rel="stylesheet" href="${base}/style/basic.css" type="text/css" media="all"  />
<link href="${base}/style/header.css" rel="stylesheet" type="text/css" />
<link href="${base}/style/manage.css" rel="stylesheet" type="text/css" />
<link href="${base}/style/footer.css" rel="stylesheet" type="text/css" />
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
<div id="about">
<h1>线索标题：${remark.title}</h1>
    <p>线索提供者：<a href="${base}/user/viewuser?memberId=#{remark.memberId}" class="link_color1" title="查看作者信息" alt="查看作者信息">${member.userName}</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;提供日期：${remark.createDate?string("yyyy-MM-dd")}
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="link_color1" href="${base}/r/#{article.id}">原文：${article.title}</a>
    </p>
<div id="content">
    ${remark.content}
</div>

</div>
</div>
<#include "/ftl/footer.ftl"/>

</div>
<!--wrapper end-->


</body>
</html>
