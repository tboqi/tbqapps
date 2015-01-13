<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta content="all" name="robots" />
<meta name="Copyright" content="www.chuanwen.com.cn" />
<meta name="description" content="娱乐明星,IT科技,财经股市,内幕揭秘,探索发现,网友自助发布传闻的web2.0网站,欢迎知情人报料." />
<meta content="娱乐,明星,传闻,爆料,奇闻" name="keywords" />
<link rel="icon" href="${base}/images/favicon.ico" type="image/x-icon" />
<link rel="shortcut icon" href="${base}/images/favicon.ico" type="image/x-icon" /> 
<title>我发布的传闻 - 传闻网</title>
<link href="${base}/style/layout.css" rel="stylesheet" type="text/css" />
<link href="${base}/style/basic.css" rel="stylesheet" type="text/css" />
<link href="${base}/style/header.css" rel="stylesheet" type="text/css" />
<link href="${base}/style/usermanage.css" rel="stylesheet" type="text/css" />
<link href="${base}/style/manage.css" rel="stylesheet" type="text/css" />
<link href="${base}/style/footer.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/js/prototype.js"></script>
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
<!-- ad pic start -->
<div id="pic_ad_manage"><img src="${base}/images/pic_manage.jpg" width="980" height="100" /></div>
<!-- ad pic end -->

<div id="cap">
<#if member?exists>
    <#if memberId = member.id>
        <!--manage nav start-->
          <#include "/ftl/usermanagemenu.ftl">
        <!--manage nav end-->
    </#if>
</#if>
<#include "/ftl/broadcast.ftl">
</div>

<div id="my_channel_list">

<dl>
<dt>我发布的传闻</dt>
<#if myPublishArticles?exists && myPublishArticles.size() &gt; 0>
	<#list myPublishArticles as map>
		<dd><span class="borderbottom"><a href="${base}/r/#{map.article.id}">${map.article.title}</a><span class="del_vote"><#if map.author?exists><a href="${base}/user/viewuser?memberId=#{map.author.id}">${map.author.userName}</a><#else>匿名</#if>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<#if member?exists && memberId=member.id><#if map.article.state =0 && map.article.channelId = 0>[<a href="#" onclick="return showStartDD('pubDD_${map_index}');">发起投票</a>]</#if></#if></span></span></dd>

        <dd id="pubDD_${map_index}" style="display: none" >
        	<span class="borderbottom">
                <form action="${base}/addtochannel!add.action" method="post" onsubmit="return checkStartForm('pubchlId_${map_index}','pubrate_${map_index}','pubcost_${map_index}');">
                    <input type="hidden" name="articleId" value="#{map.article.id}" />
                    <input type="hidden" name="toPage" value="publist" />
                    <input type="hidden" id="pubcost_${map_index}" value="#{map.article.rate}" />
                     <#if channelList?exists>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        请选择频道：<select name="chlId" id="pubchlId_${map_index}">
                                    <option value="-1">请选择频道</option>
                            <#list channelList as channel>
                               <option value="${channel.id}">${channel.name}</option>
                             </#list>
                         </select>
                    </#if>
                    请指定投票天数：<input type="text" name="rate" id="pubrate_${map_index}" value="#{map.article.rate!""}" />
                    <input type="submit" value="确定" />
                </form>
			</span>
        </dd>

	</#list>
<#else>
<dd><span class="borderbottom">目前还没有发布传闻</span></dd>
</#if>
</dl>
</div>

<table width="980" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="24" align="right" valign="top">${pagination}</td>
  </tr>
</table>
</div>
<!--primaryContent end-->

<!--sideContent start-->
<!--sideContent end-->

<!--footer start-->
<#include "/ftl/footer.ftl">
<!--footer end-->

</div>
<!--wrapper end-->

<script language="javascript">
    
    
    var ddObj;
	function showStartDD(dd){
        <#if member?exists>
            var chlDiv = $(dd);
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

    function checkStartForm(ch,r,c){
        var chlid = $F(ch);
        if(chlid < 0){
            alert("请选择频道！");
            return false;
        }

        var num = /^[0-9]*[1-9]\d*$/;
        var rate = $F(r);
        if(!rate.trim().match(num)){
            alert("请正确输入天数！！！");
            $('rate_'+index).focus();
            return false;
        }

        var articleCost = $F(c);//收藏文章所需票数
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
</script>
</body>
</html>
