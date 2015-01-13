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
<title>我的频道 - 传闻网</title>
<link href="${base}/style/layout.css" rel="stylesheet" type="text/css" />
<link href="${base}/style/basic.css" rel="stylesheet" type="text/css" />
<link href="${base}/style/header.css" rel="stylesheet" type="text/css" />
<link href="${base}/style/usermanage.css" rel="stylesheet" type="text/css" />
<link href="${base}/style/footer.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/js/prototype.js"></script>
<script type="text/javascript" src="${base}/js/validObj.js"></script>
</head>

<body id="oneColLayout2" class="channel">
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
<!-- ad pic start -->
<div id="pic_ad_manage"><img src="${base}/images/pic_manage.jpg" width="980" height="100" /></div>
<!-- ad pic end -->

<!--manage nav start-->
<div id="cap">
  <#include "/ftl/usermanagemenu.ftl">
  <#include "/ftl/broadcast.ftl">
</div>
<!--manage nav end-->
<!-- left start -->

<#include "/ftl/usermanage_left.ftl">

<!-- left end-->

<div id="right">
  	<#if channelArticleList?exists && channelArticleList.size() &gt; 0>
  	<#assign count=0>
    <#list channelArticleList as map>
    <div class="list_chuan">
     <h4><span>${map.channel.name}</span><em>>><a href="${base}/user/mychannelarticles.action?channelId=#{map.channel.id}" title="查看更多">more</a></em></h4>
     	<#if map.memberArticleList?exists && map.memberArticleList.size() &gt; 0>
		<ul id="expcon0" class="expcon">
		<#list map.memberArticleList as memberArticleMap>
		<li><span class="borderbottom"><a href="${base}/r/#{memberArticleMap.article.id}">${memberArticleMap.article.title}</a>&nbsp;
		<font color="#999999">${memberArticleMap.article.createDate?date}</font>&nbsp; 
		<span class="name"><a href="${base}/user/viewuser?memberId=#{memberArticleMap.article.memberId}">${memberArticleMap.member.userName}</a></span>
		<span class="purple"><#if memberArticleMap.article.state = 0 && memberArticleMap.article.channelId = 0>[<a href="#" onclick="return showStartDD(${count});">发起投票</a>]</#if><#if map.channel.id!=memberArticleMap.article.channelId>[<a href="${base}/user/removeInMyChannelManage.action?articleId=#{memberArticleMap.article.id}">删除</a>]</#if></span></span></li>
     	            <li id="startDD_${count}" style="display: none" ><span class="borderbottom">
                <form action="${base}/addtochannel!add.action" method="post" onsubmit="return checkStartForm(${count});">
                    <input type="hidden" name="articleId" value="#{memberArticleMap.article.id}" />
                    <input type="hidden" name="toPage" value="mychannels" />
                    <input type="hidden" id="cost_${count}" value="#{memberArticleMap.article.rate}" />
                     <#if channelList?exists>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        请选择频道：<select name="chlId" id="chlId2_${count}">
                                    <option value="-1">请选择频道</option>
                            <#list channelList as channel>
                               <option value="${channel.id}">${channel.name}</option>
                             </#list>
                         </select>
                    </#if>
                    请指定投票天数：<input type="text" name="rate" id="rate_${count}" value="#{memberArticleMap.article.rate!""}" />
                    <input type="submit" value="确定" />
                </form>
			</span>
            </li>
     	<#assign count=count+1>
     	</#list>
     	<#else>
     		<br/>
     		该频道没有文章！
     	</ul>
     	</#if>
    </div>
    </#list>
    <#else>
        您还没有创建频道
    </#if>
    ${pagination}
</div>
<#--<div id="my_channel_list">
<#if channelArticleList?exists && channelArticleList.size() &gt; 0>
<#list channelArticleList as map>
	<dl>
		<dt>${map.channel.name}<a title="点击查看更多" href="${base}/user/mychannelarticles.action?channelId=#{map.channel.id}"><img src="${base}/images/btn_more.png" /></a></dt>
		<#if map.memberArticleList?exists && map.memberArticleList.size() &gt; 0>
		<#list map.memberArticleList as memberArticleMap>
			<dd><span class="borderbottom">
			<a href="${base}/r/#{memberArticleMap.article.id}">${memberArticleMap.article.title}</a>
			<span class="del_vote">
			
			<a href="${base}/user/viewuser?memberId=#{memberArticleMap.article.memberId}">${memberArticleMap.member.userName}</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<#if memberArticleMap.article.state = 0 && memberArticleMap.article.channelId = 0>[<a href="#" onclick="return showStartDD(${count});">发起投票</a>]</#if><#if map.channel.id!=memberArticleMap.article.channelId>[<a href="${base}/user/removeInMyChannelManage.action?articleId=#{memberArticleMap.article.id}">删除</a>]</#if>
			</span>
			</span>
			</dd>

            <dd id="startDD_${count}" style="display: none" ><span class="borderbottom">
                <form action="${base}/addtochannel!add.action" method="post" onsubmit="return checkStartForm(${count});">
                    <input type="hidden" name="articleId" value="#{memberArticleMap.article.id}" />
                    <input type="hidden" name="toPage" value="mychannels" />
                    <input type="hidden" id="cost_${count}" value="#{memberArticleMap.article.rate}" />
                     <#if channelList?exists>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        请选择频道：<select name="chlId" id="chlId2_${count}">
                                    <option value="-1">请选择频道</option>
                            <#list channelList as channel>
                               <option value="${channel.id}">${channel.name}</option>
                             </#list>
                         </select>
                    </#if>
                    请指定投票天数：<input type="text" name="rate" id="rate_${count}" value="#{memberArticleMap.article.rate!""}" />
                    <input type="submit" value="确定" />
                </form>
			</span>
            </dd>
            
		</#list>
		<#else>
		此频道没有文章
		</#if>
	
	</dl>
</#list>
<#else>
<dl><dt>目前还没有建立频道</dt></dl>
</#if>
</div>


<table width="980" border="0" cellspacing="0" cellpadding="0">
  <tr>
    ${pagination}
  </tr>
</table>
</div>-->
<!--primaryContent end-->

<!--sideContent start-->
<!--sideContent end-->

<!--footer start-->
<#include "/ftl/footer.ftl">
<!--footer end-->

</div>
<!--wrapper end-->

<script language="">
    var ddObj;
	function showStartDD(index){
        <#if member?exists>
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

        var articleCost = $F('cost_'+index);//收藏文章所需票数
        var cost = rate - articleCost;//收藏文章所需票数与天数差额
        var str;
        if(cost < 1)
            str = '收藏文章需付出“'+articleCost+'”票！\r\n是否继续？';
        else
            str = '收藏文章需付出“'+articleCost+'”票！您指定的投票日期较长，您将额外付出'+cost+'票！\r\n是否继续？';
        
        return confirm(str);
    }


    <#if errorMsg?exists>
        alert('${errorMsg}');
        ${session.removeAttribute("errorMsg")}
    <#else>
    </#if>
</script
</body>
</html>
