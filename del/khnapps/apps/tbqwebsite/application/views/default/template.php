<!DOCTYPE html >
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>陶粒砖首页</title>
<link href="<?php echo Resource::css('base.css'); ?>" rel="stylesheet" type="text/css" />
<link href="<?php echo Resource::css('taoli.css'); ?>" rel="stylesheet" type="text/css" />
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
        <li><a href="#">企业简介</a></li>
        <li><a href="#">产品介绍</a></li>
        <li><a href="#">工程案例</a></li>
        <li><a href="#">行业知识</a></li>
        <li><a href="#">新闻中心</a></li>
        <li><a href="#">在线留言</a></li>
        <li><a href="#">联系我们</a></li>
    </ul>
</div>
<div class="bannerBox w980">
	<img src="<?php echo URL::base();?>static/images/banner.jpg" />
</div>
</div>
<div class="content w980 clearfix">
	<div class="fl leftSide">
    	<div class="leftHead">产品导航</div>
        <?php echo Block_Product_Category::category_list();?>
        <div class="leftHead">联系方式</div>
        <ul class="contList">
        	<li>天津陶粒砖厂</li>
            <li>联系人：于文国</li>
            <li>联系电话：13039998888</li>
            <li>邮箱：9393939@qq.com</li>
            <li>地址：天津市武清区</li>
        </ul>
    </div>
    <div class="fr rightSide">
    	<div class="rHeader">公司简介</div>
        <div class="introBox">
        	<p>天津市红星福利新型建材制品厂专业粘土陶粒，页岩陶粒和 各种规格的陶粒空心砌块、陶粒外墙保温砌块和陶粒隔墙板的专业厂家</p>
            <p>我厂拥有多年的生产和管理经验，拥有先进的生产设备，产品顺利打入北京、天津、河北、山东、四川等地，其中陶粒远销日本、台湾、几内亚等国。</p>
            <p>陶粒及其成型产品是新型的建筑材料，具有强度高、隔音、隔热、保温性能好等优点，是取代延用多的粘土实心砖和一些落后填充材料的理想替代品。</p>
            <p>多年来，我厂凭借着一流的产品，良好的信誉及周到的售后服务不仅赢得了市场和广大用户的好评，也得到政府部门的认可，荣获了各种奖项，增强了我们的信心及前途的自信。</p>
            <p></p>
        </div>
        <div class="proHeader clearfix">
        	<span class="fl">产品介绍</span>
            <a href="#" class="fr more"><img src="<?php echo URL::base();?>static/images/more.gif" /></a>
        </div>
        <div class="inProList">
        	<ul>
            	<li><a href="#"><img src="<?php echo URL::base();?>static/images/pro1.jpg" /></a></li>
                <li><a href="#"><img src="<?php echo URL::base();?>static/images/pro2.jpg" /></a></li>
                <li><a href="#"><img src="<?php echo URL::base();?>static/images/pro3.jpg" /></a></li>
                <li class="mr0"><a href="#"><img src="<?php echo URL::base();?>static/images/pro4.jpg" /></a></li>
            </ul>
        </div>
    </div>
</div>
<div class="footer">
	<p class="pt30">版权所有 Copyright(C)2009-2012 北京东方佰泰建材</p>
    <p class="mt10">友情链接：<a href="#">中国建材网</a></p>
</div>
</body>
</html>