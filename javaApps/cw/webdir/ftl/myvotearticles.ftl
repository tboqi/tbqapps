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
<title>我发起投票的文章 - 传闻网</title>
<link href="${base}/style/layout.css" rel="stylesheet" type="text/css" />
<link href="${base}/style/basic.css" rel="stylesheet" type="text/css" />
<link href="${base}/style/header.css" rel="stylesheet" type="text/css" />
<link href="${base}/style/manage.css" rel="stylesheet" type="text/css" />
<link href="${base}/style/usermanage.css" rel="stylesheet" type="text/css" />
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

<!--manage nav start-->
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
<!--manage nav end-->

<div id="my_channel_list">

<dl>
<dt>我发起的投票</dt>
<#if myVoteArticles?exists && myVoteArticles.size() &gt; 0>
	<#list myVoteArticles as map>
		<dd>
        <span class="borderbottom">
            <a href="${base}/r/#{map.article.id}">${map.article.title}</a>
            <span class="del_vote"><#if map.author?exists><a href="${base}/user/viewuser?memberId=#{map.author.id}">${map.author.userName}</a><#else>匿名</#if>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<#if currentDate.time &gt; map.article.endDate.time><#if map.article.state=1 || map.article.state=3><font color="red">已结束投票</font><#elseif  map.article.state=2><font color="red">正在进行二次投票！</font><#else>[<a href="#" onclick="return endVote(true,'${map_index}');">真</a>] [<a href="#" onclick="return endVote(null,'${map_index}');" >假</a>]</#if><#else><font color="red">未到结束日期</font></#if>
            </span>
            <form id="endForm_${map_index}">
                <input type="hidden" name="articleId" value="#{map.article.id}" />
                <input type="hidden" name="Support" id="Support_${map_index}" />
            </form>
        </span></dd>
	</#list>
<#else>
<dd><span class="borderbottom">目前没有发起投票</span></dd>
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
    <#if voteMsg?exists>
        alert('${voteMsg}');
    <#else>
    </#if>

    function endVote(boo,index){
        if(boo){
            $('Support_'+index).value="Support";
        }else{
            $('Support_'+index).value="UnSupport";
        }
        
        var f = $('endForm_'+index);
        f.action="${base}/vote/endvote.action";
        f.method="post";
        if(confirm("您确定已此结果结束投票吗？"))
            f.submit();
        else
            return false;
    }
</script>
</body>
</html>
