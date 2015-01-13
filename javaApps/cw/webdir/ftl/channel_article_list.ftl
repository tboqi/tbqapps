<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta content="all" name="robots" />
<meta name="Copyright" content="www.chuanwen.com.cn" />
<meta name="description" content="传闻网,创建自己的频道,收录自己喜欢的资讯." />
<meta content="娱乐,明星,传闻,爆料,奇闻" name="keywords" />
<link rel="icon" href="${base}/images/favicon.ico" type="image/x-icon" />
<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" /> 
<title><#if channel?exists>${channel.name?if_exists+' - '}</#if>频道 - 传闻网</title>
<link href="${base}/style/layout.css" rel="stylesheet" type="text/css" />
<link href="${base}/style/basic.css" rel="stylesheet" type="text/css" />
<link href="${base}/style/header.css" rel="stylesheet" type="text/css" />
<link href="${base}/style/newchapter_list.css" rel="stylesheet" type="text/css" />
<link href="${base}/style/footer.css" rel="stylesheet" type="text/css" />
<script src="${base}/Scripts/AC_RunActiveContent.js" type="text/javascript"></script>
<script type="text/javascript" src="${base}/js/prototype.js"></script>
<script type="text/javascript" src="${base}/js/validObj.js"></script>
<style type="text/css">

</style>
</head>

<body id="towColLayout2" class="channel">
<!--wrapper start-->
<div id="wrapper">

<#include "/ftl/header.ftl">
</div>
<!--header end-->

<!-- ad words start -->
<!-- ad words end -->

<!--primaryContent start-->
<div id="primaryContent">
<#if newArticle?exists>
    <p class="madecenter"><img class="right_pic_first" alt="${newArticle.title}" title="${newArticle.title}" src="${newArticle.imgSrc}" /></p>
    <h2 class="blackh2"><a class="blackh2" href="${base}/r/#{newArticle.id}" title="${newArticle.title}" alt="${newArticle.title}" >${newArticle.title}</a></h2>
    <p class="linehight_01">${newArticle.content}</p>
</#if>
<div class="v_space"></div>
<!--本周焦点 开始-->
<h3 class="bzjd">本周焦点<a href="${base}/weeklist.html" title="点击查看更多"><img src="/images/btn_more.png" /></a></h3>
<ul class="textlist">
    <#if weekList?exists && weekList.size() &gt; 0>
        <#list weekList as article>
            <li><a href="${base}/r/#{article.id}" title="${article.title}" alt="${article.title}" >${article.title}</a></li>
        </#list>
    <#else>
        暂无焦点文章！
    </#if>
</ul>
<!--本周焦点 结束-->
<div class="v_space"></div>
<!--精彩频道 开始-->
<h3 class="bzjd">精彩频道<a href="${base}/channellist.html" title="点击查看更多"><img src="/images/btn_more.png" /></a></h3>
<div id="exiting">
<#if hotChannelList?exists && hotChannelList.size() &gt; 0>
    <ul class="exiting1">
        <#list hotChannelList as channel>
            <li><a href="${base}/c/#{channel.id}" title="${channel.name}" alt="${channel.name}" >${channel.name}</a></li>
        <#if channel_index = 4> <#break></#if>
        </#list>
    </ul>
    <ul class="exiting2">
        <#list hotChannelList as channel>
            <#if channel_index &lt;= 4><#else><li><a href="${base}/c/#{channel.id}" title="${channel.name}" alt="${channel.name}" >${channel.name}</a></li></#if>        
        </#list>
    </ul>
</#if>
</div>
<!--精彩频道 结束-->

<!--广告 开始-->
<!--广告列表-->
<#if adsList?exists && adsList.size() &gt; 0>
<#list adsList as map>
<div style="text-align:center; margin:10px 0; padding:0;">
<a href="${map.url}" target="_blank"><img src="${map.pic}" height="50" width="240" border="0" style="border:1px solid #CCCCCC"/></a>
</div>
</#list>
</#if>

<!--广告 结束-->
</div>
<!--primaryContent end-->

<!--sideContent start-->
<div id="sideContent">
<h1 class="newchapterlist">文章列表<#if 1=2><a href="${base}/rss/rssServlet/?feedType=newArticle"><img src="images/icon_rss.gif" alt="rss" title="rss" /></a></#if></h1>

<!-- 推荐文章列表 1 -->
<#if articleMapList?exists>
	<#list articleMapList as map>
		<#if map?exists>
            <p><#if map.imgSrc?exists && map.imgSrc != ""><img src="${map.imgSrc}" height="66" width="66" /></#if></p>
            <#if map.state = 1 | map.state = 3>
                <#if map.voteResultType = 1>
                    <dl class="tag_true">
                <#elseif map.voteResultType = 2>
                    <dl class="tag_false">
                </#if>
            <#else>
            <dl>
            </#if>
            <dt><a href="${base}/r/#{map.articleId}" title="${map.articleTitle}" alt="${map.articleTitle}" >${map.articleTitle}</a></dt>
            <dd class="info_color"><#if map.member?exists><span class="scz_color">上传者：</span><a class="info_color" href="${base}/user/viewuser?memberId=#{map.member.id}" title="查看作者信息" alt="查看作者信息">${map.member.userName}&nbsp;&nbsp;</a> 发表日期：${map.createDate?string("yyyy-MM-dd")}  </#if>  <#if map.label?exists && map.label.size() &gt; 0 ><span class="scz_color">&nbsp;&nbsp;标签：</span><#list map.label as label><a class="info_color" href="${base}/search/search.action?qs=${stack.findValue("@com.cc.cw.util.URLCoderUtil@encode('${label}','UTF-8')")}&search=all&pn=1">${label}</a>&nbsp;&nbsp;<#if label_index=2><#break></#if></#list></#if>
                <#if 1=2><span id="more"><#if map.label?exists><#if map.label.size() &gt; 3><span class="morelist">|<a class="info_color" href="#" onclick="show_hide('morecontent_${map_index}');return false;">more...</a><div class="morecontent" id="morecontent_${map_index}" style="display:none"><ul><li><a class="info_color" href="#" class="closeit" onclick="show_hide('morecontent_${map_index}');return false;">×</a></li><#list map.label as label><li><a class="info_color" href="${base}/search/search.action?qs=${stack.findValue("@com.cc.cw.util.URLCoderUtil@encode('${label}','UTF-8')")}&search=all&pn=1" title="${label}" >${label}</a></li></#list></ul></div></span></#if></#if></span></#if>
            </dd>
            <dd><p>${map.articleContent}</p></dd>
            
            </dl>
            <div class="list_sprite_line"></div>
        </#if>
	</#list>
<#else>
    <br><br><br><br>
    <p>&nbsp;&nbsp;对不起！该频道还没有创建或收录文章！请浏览其它频道</p><br><br>
</#if>
<div class="page_num">
<p>
${articlePagnation}
</p>
</div>

</div>
<!--sideContent end-->

<!--footer start-->
<#include "/ftl/footer.ftl">
<!--footer end-->

</div>
<!--wrapper end-->

<script language="javascript">
    <#if errorMsg?exists>
        alert('${errorMsg}');
        ${session.removeAttribute("errorMsg")}
    <#else>
    </#if>

    function needLogin(){
        <#if member?exists>
        <#else>
            alert("对不起！请您登录后执行此操作！");
            return false; 
        </#if>
    }
    
    var ddObj;
    function showCollDD(index){
        <#if member?exists>
            $('startDD_'+index).style.display='none';
            var chlDiv = $('collDD_'+index);
            chlDiv.style.display='block';
            if(ddObj != null && ddObj != chlDiv){
                ddObj.style.display="none";
            }
            ddObj = chlDiv;
			return false;
        <#else>
            alert("对不起！请您登录后执行此操作！");
            return false; 
        </#if>
    }

    function showStartDD(index){
        <#if member?exists>
            $('collDD_'+index).style.display='none';
            var chlDiv = $('startDD_'+index);
            chlDiv.style.display='block';
            if(ddObj != null && ddObj != chlDiv){
                ddObj.style.display="none";
            }
            ddObj = chlDiv;
			return false;
        <#else>
            alert("对不起！请您登录后执行此操作！");
            return false; 
        </#if>
    }

    function checkCollForm(index){
        var chlid = $F('chlId_'+index);
        if(chlid < 0){
            alert("请选择频道！");
            return false;
        }
    }

    function checkStartForm(index){
        var chlid = $F('chlId2_'+index);
        if(chlid < 0){
            alert("请选择频道！");
            return false;
        }

        var num = /^[0-9]*[1-9]\d*$/;
        var rate = $F('rate_'+index);
        if(!rate.trim().match(num)){
            alert("请正确输入天数！！！");
            $('rate_'+index).focus();
            return false;
        }
    }

    function startDD(index){
        <#if member?exists>
            $('collDD_'+index).style.display='none';
            var chlDiv = $('chlDiv2');
            chlDiv.style.display='block';
			return false;
        <#else>
            alert("对不起！请您登录后执行此操作！");
            return false; 
        </#if>
    }
</script>
</body>
</html>
