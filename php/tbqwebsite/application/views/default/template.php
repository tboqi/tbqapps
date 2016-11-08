<!DOCTYPE html >
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>陶粒砖首页</title>
<link href="<?php echo Resource::css('base.css');?>" rel="stylesheet" type="text/css" />
<link href="<?php echo Resource::css('taoli.css');?>" rel="stylesheet" type="text/css" />
<link rel="shortcut icon" href="/static/favicon.ico"/>
<link rel="bookmark" href="/static/favicon.ico"/>
</head>

<body>
<div class="header">
	<div class="w980">
    	<div class="fl"><span>天津东方百泰陶粒砖厂</span><span class="ml20">联系人：于文国</span><span>手机：13039998888</span></div>
        <div class="fr"><a href="#">设为首页</a><a href="#">加入收藏</a><a href="#">网站地图</a></div>
    </div>
</div>
<div class="topBg">
<div class="mainMenu">
	<ul class="w980 clearfix">
    	<li><a href="<?php echo URL::base();?>" class="menuCur">企业首页</a></li>
        <!--
        <li><a href="#">企业简介</a></li>
        <li><a href="#">产品介绍</a></li>
        <li><a href="#">工程案例</a></li>
        <li><a href="#">行业知识</a></li>-->
        <li><a href="<?php echo URL::site('article/index');?>">新闻中心</a></li>
        <li><a href="<?php echo URL::site('liuyan/index');?>">在线留言</a></li>
        <!--<li><a href="#">联系我们</a></li>-->
    </ul>
</div>
<div class="bannerBox w980">
	<img src="<?php echo URL::base();?>static/images/banner.jpg" />
</div>
</div>
<div class="content w980 clearfix">
<?php echo $content;?>
</div>
<div class="footer">
	<p class="pt30">版权所有 Copyright(C)2009-2012 北京东方佰泰建材</p>
    <p class="mt10">友情链接：<a href="#">中国建材网</a></p>
</div>
</body>
</html>
