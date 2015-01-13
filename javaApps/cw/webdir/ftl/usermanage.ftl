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
<title>${viewMember.userName} - 传闻网 - 传闻由我</title>
<link href="${base}/style/layout.css" rel="stylesheet" type="text/css" />
<link href="${base}/style/basic.css" rel="stylesheet" type="text/css" />
<link href="${base}/style/header.css" rel="stylesheet" type="text/css" />
<!--<link href="${base}/style/manage.css" rel="stylesheet" type="text/css" />-->
<link href="${base}/style/usermanage.css" rel="stylesheet" type="text/css" />
<link href="${base}/style/footer.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/js/prototype.js"></script>
</head>

<body id="towColLayout4" class="channel">
<!--wrapper start-->
<div id="wrapper">
<#include "/ftl/header.ftl">
<!-- ad pic start -->
<div id="pic_ad_manage"><img src="${base}/images/pic_manage.jpg" width="980" height="100" /></div>
<!-- ad pic end -->
<!--new-->
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
<!-- left start -->

<#include "/ftl/usermanage_left.ftl">

<!-- left end-->
<!--primaryContent start-->
<div id="right" class="my_home">
	<#include "/ftl/self_introduce.ftl">
<div class="list_chuan">
<h4><span>我收录的传闻</span><em>>><a href="${base}/user/mycollectionarticles.action" title="查看更多">more</a></em></h4>
<ul>
<#if collectArticleList?exists && collectArticleList.size() &gt; 0>
    <#list collectArticleList as article>
        <#if article?exists>
        <li><span class="borderbottom"><a href="${base}/r/#{article.id}" title="${article.title}" alt="${article.title}" >${article.title}</a>&nbsp;${article.createDate?date}<span class="purple"><#if member?exists && memberId=member.id><#if article.state =0 && article.channelId = 0>[<a href="#" onclick="return showStartDD('startDD_${article_index}');">发起投票</a>]</#if>[<a href="${base}/user/removeCollection.action?articleId=#{article.id}">删除</a>]</#if></span></span></li>
        <#--<li id="startDD_${article_index}" style="display: none" >
        	<span class="borderbottom">
                <form action="${base}/addtochannel!add.action" method="post" onsubmit="return checkStartForm('chlId2_${article_index}','rate_${article_index}','cost_${article_index}');">
                    <input type="hidden" name="articleId" value="#{article.id}" />
                    <input type="hidden" name="toPage" value="usermanage" />
                    <input type="hidden" id="cost_${article_index}" value="#{article.rate}" />
                     <#if channelList?exists>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        请选择频道：<select name="chlId" id="chlId2_${article_index}">
                                    <option value="-1">请选择频道</option>
                            <#list channelList as channel>
                               <option value="${channel.id}">${channel.name}</option>
                             </#list>
                         </select>
                    </#if>
                    请指定投票天数：<input type="text" name="rate" id="rate_${article_index}" value="#{article.rate!""}" />
                    <input type="submit" value="确定" />
                </form>
			</span>
        </li> -->
        </#if>
    </#list>
<#else>
<dd>&nbsp;&nbsp;&nbsp;<font color="red">没有收录文章！</font></dd>
</#if>
</ul>
</div>
<div class="list_chuan">
<h4><span>我发布的传闻</span><em>>><a title="点击查看更多" href="${base}/user/mypublisharticles.action">more</a></em></h4>
<ul>
<#if articleList?exists && articleList.size() &gt; 0>
    <#list articleList as article>
        <#if article?exists>
        <li><span class="borderbottom"><a href="${base}/r/#{article.id}" title="${article.title}" alt="${article.title}" >${article.title}</a>&nbsp;${article.createDate?date}<span class="purple"><#if member?exists && memberId=member.id><#if article.state =0 && article.channelId = 0>[<a href="#" onclick="return showStartDD('pubDD_${article_index}');">发起投票</a>]</#if></#if></span></span></li>
        
        <#--<li id="pubDD_${article_index}" style="display: none" >
        	<span class="borderbottom">
                <form action="${base}/addtochannel!add.action" method="post" onsubmit="return checkStartForm('pubchlId_${article_index}','pubrate_${article_index}','pubcost_${article_index}');">
                    <input type="hidden" name="articleId" value="#{article.id}" />
                    <input type="hidden" name="toPage" value="usermanage" />
                    <input type="hidden" id="pubcost_${article_index}" value="#{article.rate}" />
                     <#if channelList?exists>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        请选择频道：<select name="chlId" id="pubchlId_${article_index}">
                                    <option value="-1">请选择频道</option>
                            <#list channelList as channel>
                               <option value="${channel.id}">${channel.name}</option>
                             </#list>
                         </select>
                    </#if>
                    请指定投票天数：<input type="text" name="rate" id="pubrate_${article_index}" value="#{article.rate!""}" />
                    <input type="submit" value="确定" />
                </form>
			</span>
        </li>-->
        
        </#if>
    </#list>
<#else>
<dd>　　　　<font color="red">没有发布文章！</font></dd>
</#if>
</ul>
</div>

<#--
<div class="list_chuan">
<h4><span>我发起的投票</span><em>>><a title="点击查看更多" href="${base}/user/myvotearticles.action">more</a></em></h4>
<ul>
<#if voteArticleList?exists && voteArticleList.size() &gt; 0>
    <#list voteArticleList as article>
        <#if article?exists>
        <li><span class="borderbottom"><a href="${base}/r/#{article.id}" title="${article.title}" alt="${article.title}">${article.title}</a>&nbsp;${article.createDate?date}<#if currentDate.time &gt; article.endDate.time><#if article.state=1 || article.state=3><span class="del_vote"><font color="red">已结束投票</font></span><#elseif  article.state=2><span class="del_vote"><font color="red">正在进行二次投票！</font></span><#else><span class="del_vote"><#if member?exists && memberId=member.id>[<a href="#" onclick="return endVote(true,'${article_index}');">真</a>] [<a href="#" onclick="return endVote(null,'${article_index}');" >假</a>]</span><#else><span class="del_vote"><font color="red">未到结束日期</font></span></#if></#if></#if></span></li>
        <form id="endForm_${article_index}">
            <input type="hidden" name="articleId" value="#{article.id}" />
            <input type="hidden" name="Support" id="Support_${article_index}" />
        </form>
        </#if>
    </#list>
<#else>
<dd>&nbsp;&nbsp;&nbsp;<font color="red">没有发起投票的文章！</font></dd>
</#if>
</ul>
</div>
-->
</div>
<!--primaryContent end-->


<#--<div id="sideContent">

<#if viewMember?exists>
    <div id="userinfo">
    <p><#if viewMember.coverPath != ""><img src="${viewMember.coverPath!""}" width="110" height="130" /><#else><img src="${base}/images/icon_user.gif" width="110" height="130" /></#if></p>
    <p>昵称：${viewMember.userName}</p>
    <p>票数：#{viewMember.privilege}</p>
    </div>
</#if>



</div>-->
<#include "/ftl/footer.ftl">

</div>
<!--wrapper end-->
<script language="javascript">
    <#if voteMsg?exists>
        alert('${voteMsg}');
    <#else>
    </#if>
    function canStartVote(value){
        if(value > 0){
            alert("此文章已经在其他频道发起投票！");
            return false;
        }
    }

    function endVote(boo,index){
        if(boo){
            $('Support_'+index).value="Support";
        }else{
            $('Support_'+index).value="UnSupport";
        }
        
        var f = $('endForm_'+index);
        f.action="${base}/vote/vote!endVote.action";
        f.method="post";
        if(confirm("您确定已此结果结束投票吗？"))
            f.submit();
        else
            return false;
    }
    
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
    <#if msg?exists>
        alert('${msg}');
    <#else>
    </#if>
   
</script>

</body>
</html>
