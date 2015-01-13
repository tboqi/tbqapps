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
<#include "/ftl/broadcast.ftl">
</div>
<!-- left start -->
<#include "/ftl/usermanage_left.ftl">
<!-- left end-->

<!--primaryContent start-->
<div id="right" class="my_home">
	<#include "/ftl/self_introduce.ftl">
<div class="list_chuan">
<h4><span>我收录的传闻</span><em>>><a href="${base}/user/mycollectionarticles.action?memberId=#{viewMember.id}" title="查看更多">more</a></em></h4>
<ul>
<#if collectArticleList?exists && collectArticleList.size() &gt; 0>
    <#list collectArticleList as article>
        <#if article?exists>
        <li><span class="borderbottom"><a href="${base}/r/#{article.id}" title="${article.title}" alt="${article.title}" >${article.title}</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${article.createDate?date}<span class="del_vote"></span></span></li>
        </#if>
    </#list>
<#else>
<dd>&nbsp;&nbsp;&nbsp;<font color="red">没有收录文章！</font></dd>
</#if>
</ul>
</div>
<div class="list_chuan">
<h4><span>我发布的传闻</span><em>>><a title="点击查看更多" href="${base}/user/mypublisharticles.action?memberId=#{viewMember.id}">more</a></em></h4>
<ul>
<#if articleList?exists && articleList.size() &gt; 0>
    <#list articleList as article>
        <#if article?exists>
        <li><span class="borderbottom"><a href="${base}/r/#{article.id}" title="${article.title}" alt="${article.title}" >${article.title}</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${article.createDate?date}<span class="del_vote"></span></span></li>
        </#if>
    </#list>
    <#--<#list articleList as article>
        <#if article?exists>
        <li><span class="borderbottom"><a href="${base}/r/#{article.id}" title="${article.title}" alt="${article.title}" >${article.title}</a>&nbsp;${article.createDate?date}<span class="del_vote"></span></span></li>
        </#if>
    </#list>-->
<#else>
<dd>&nbsp;&nbsp;&nbsp;<font color="red">没有发布文章！</font></dd>
</#if>
</ul>
</div>

<#--<div class="list_chuan">
<h4><span>我发起的投票</span><em>>><a title="点击查看更多" href="${base}/user/myvotearticles.action?memberId=#{viewMember.id}">more</a></em></h4>
<ul>
<#if voteArticleList?exists && voteArticleList.size() &gt; 0>
    <#list voteArticleList as article>
        <#if article?exists>
        <li><span class="borderbottom"><a href="${base}/r/#{article.id}" title="${article.title}" alt="${article.title}">${article.title}</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${article.createDate?date}</span></span></li>
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

<#include "/ftl/footer.ftl">
<!--primaryContent end-->

<#--
<div id="sideContent">
<#if viewMember?exists>
    <div id="userinfo">
    <p><#if viewMember.coverPath != ""><img src="${viewMember.coverPath!""}" width="110" height="130" /><#else><img src="${base}/images/icon_user.gif" width="110" height="130" /></#if></p>
    <p>昵称：${viewMember.userName}</p>
    <p>票数：#{viewMember.privilege}</p>
    </div>

    <div id="guestbook">
    <h2>给我留言</h2>
    <form id="form1" name="form1" method="post" action="${base}/user/friend!sendMessage.action" onsubmit="return submitCheck();">
      <@ww.token name="fr"/>
      <input type="hidden" name="friendId" value="#{viewMember.id}" />
      <textarea class="textarea01" name="content" id="msgContent" cols="45" rows="5">${msgContent!""}</textarea>
      <input class="input_image01" type="image" src="${base}/images/btn_submit.gif" alt="提交留言" title="提交留言" />
    </form>
    </div>

    <ul id="freind_link">
   

	
    <li><a href="#addFriend" onclick="showCommentSpan();">加为好友</a></li>
    <li><a href="#" onclick="return sendMsg('#{viewMember.id}');">发短信息</a></li>
    <li><a href="#sendPrivilege" onclick="showPrivilegeSpan();">募捐票箱</a></li>

    <a name="addFriend"></a>
	<form action="${base}/user/friend!addThisFriend.action" method="post">
        <@ww.token name="fr"/>
        <input type="hidden" name="friendId" value="#{viewMember.id}" />
        <input type="hidden" name="memberId" value="#{viewMember.id}" />
        <span id="commentSpan" style="display: none">
        <#if member?exists>
        	<#if isMyFriend?exists>
        		<#if isMyFriend = "1">
        		<font color=red>您好！该用户已经是您的好友！您可以到<a href="${base}/addfriend!myFriend.action" title="进入管理页面" alt="进入管理页面" >"管理"</a>页面给他/她发短消息！</font>
        		<#elseif isMyFriend = "-1">
        		<font color=red>您好！该用户已被您放入黑名单！您可以到<a href="${base}/addfriend!myFriend.action?state=-1" title="进入管理页面" alt="进入管理页面" >"管理"</a>页面给将他/她恢复为好友！</font>
        		<#elseif isMyFriend = "0">
        		<font color=red>您好！该用户已向您发送好友请求！您可以到<a href="${base}/addfriend!myFriend.action?state=0" title="进入管理页面" alt="进入管理页面" >"管理"</a>页面给将他/她加为好友！</font>
        		</#if>
       		<#else>
	            <br>请输入验证请求：<input type="text" id="comment" name="comment" />
	            <br><input type="submit" value="确定" />
            </#if>
        <#else>
            <br><font color=red>对不起！您需要登录后才能添加好友！</font>
        </#if>
        </span>
    </form>
    <a name="sendPrivilege"></a>
	<span id="privilegeSpan" style="display: none">
		<form action="${base}/user/friend!privilege.action" method="post">
		<@ww.token name="pr"/>
		<input type="hidden" name="friendId" value="#{viewMember.id}" />
		<input type="hidden" name="memberId" value="#{viewMember.id}" />
		<#if member?exists>
		    <br>您目前所剩的票数为：${member.privilege!""}&nbsp;
		    <br>请输入要赠送的票数：<input type="text" id="privilege" name="privilege"/>
		    <br><input type="submit" value="确定" />
		<#else>
		<br><font color=red>对不起！您需要登录后才能赠送票数！</font>
		</#if>
		</form>
	</span>

    </ul>
</#if>

</div>
-->


</div>
<script>
    <#if msg?exists>
        alert('${msg}');
    <#else>
    </#if>
</script>
<!--wrapper end-->
</body>
</html>
