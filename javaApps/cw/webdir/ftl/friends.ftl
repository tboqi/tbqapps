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
<title>我的好友 - 传闻网</title>
<link href="${base}/style/layout.css" rel="stylesheet" type="text/css" />
<link href="${base}/style/basic.css" rel="stylesheet" type="text/css" />
<link href="${base}/style/header.css" rel="stylesheet" type="text/css" />
<link href="${base}/style/usermanage.css" rel="stylesheet" type="text/css" />
<link href="${base}/style/footer.css" rel="stylesheet" type="text/css" />
</head>

<body id="oneColLayout2" class="channel">
<!--wrapper start-->
<div id="wrapper">

<!--header start-->
<#include "/ftl/header.ftl">
<!--header end-->
</div>

<!-- ad words start -->
<!-- ad words end -->

<!--primaryContent start-->

<div id="primaryContent">
<!-- ad pic start -->
<div id="pic_ad_manage"><img src="${base}/images/pic_manage.jpg" width="980" height="100" /></div>
<!-- ad pic end -->
<div id="cap">
  <#include "/ftl/usermanagemenu.ftl">
  <#include "/ftl/broadcast.ftl">
</div>

<!-- left start -->
<#include "/ftl/usermanage_left.ftl">
<!-- left end-->
<div id="right">
<div class="myf">
<div class="list_chuan">
  <h4><span>我的好友</span></h4>
</div>
<div class="head1">
	 <#if myFriends?exists && myFriends.size() &gt; 0>
    <#list myFriends as map>
  	<div class="head2"><a href="${base}/user/viewuser?memberId=#{map.member.id}">
  	  <#if map.member.coverPath != "">
      	<img src="${map.member.coverPath}" width="75" height="80" />
      <#else>
      	<img src="${base}/images/icon_user.gif" width="75" height="80"/>
      </#if>
      </a>
      <span><a href="${base}/user/viewuser?memberId=#{map.member.id}">${map.member.userName}</a></span><em><a href="#" onclick="return sendMsg('#{map.member.id}');">发短信</a>/<b class="lan"><a href="${base}/user/removefriend.action?friendId=#{map.friend.id}">黑名单</a></b></em></div>
		<#if (map_index+1) % 8 == 0>
		</div>
		<div class="clr"></div>
		<div class="head1">
		</#if>
	</#list>
	<#else>
		您目前暂无好友
	</#if>
</div>
<div class="clr"></div>
</div>
<div class="myf">
  <div class="list_chuan">
    <h4><span>待验证的好友</span></h4>
  </div>
  <div class="head1">
    <#if myValidateFriends?exists && myValidateFriends.size() &gt; 0>
    <#list myValidateFriends as map>
        <div class="head2"><a href="${base}/user/viewuser?memberId=#{map.member.id}">
        <#if map.member.coverPath != "">
      	<img src="${map.member.coverPath}" width="75" height="80" />
      	<#else>
      	<img src="${base}/images/icon_user.gif" width="75" height="80"/>
        </#if>
        </a><span><a href="${base}/user/viewuser?memberId=#{map.member.id}">${map.member.userName}</a></span><em><a href="${base}/user/confirmfriend.action?friendId=#{map.friend.id}">通过</a>/<b class="lan"><a href="${base}/user/removefriend.action?friendId=#{map.friend.id}">拒绝</a></b></em></div>
    		<#if (map_index+1) % 8 == 0>
			</div>
			<div class="clr"></div>
			<div class="head1">
			</#if>
    </#list>
    <#else>
    	没有待验证的好友
  	</#if>
  	</div>
<div class="clr"></div>
</div>
<div class="myf">
<div class="list_chuan">
   <h4><span>黑名单</span></h4>
</div>
<div class="head1">
    <#if myBlackList?exists && myBlackList.size() &gt; 0>
    <#list myBlackList as map>
    <div class="head2"><a href="${base}/user/viewuser?memberId=#{map.member.id}">
      <#if map.member.coverPath != "">
      	<img src="${map.member.coverPath}" width="75" height="80" />
      	<#else>
      	<img src="${base}/images/icon_user.gif" width="75" height="80"/>
      </#if>
     </a><span><a href="${base}/user/viewuser?memberId=#{map.member.id}">${map.member.userName}</a></span><em><a href="${base}/user/confirmfriend.action?friendId=#{map.friend.id}">撤销加黑</a></em></div>
		    <#if (map_index+1) % 8 == 0>
			</div>
			<div class="clr"></div>
			<div class="head1">
			</#if>
	</#list>
	<#else>
		黑名单里没有好友
	</#if>
</div>
<div class="clr"></div>
</div>   
</div>
<!-- right end -->
<#--
<div id="my_channel_list">
<p>我的好友（${friendCount.fCount}） 待验证的好友（${friendCount.vCount}）  黑名单（${friendCount.bCount}）</p>
<h1>我的好友</h1>
<div class="myfreind">
  <table width="978" border="0" align="center" cellpadding="0" cellspacing="0" class="my_freind">
    <tr>
      <th width="120" scope="col">头像</th>
      <th width="132" scope="col">昵称</th>
      <th width="130" scope="col">交流</th>
      <th width="256" scope="col">Email</th>
      <th width="236" scope="col">申请日期</th>
      <th width="104" scope="col">操作</th>
    </tr>
    
    <#if myFriends?exists && myFriends.size() &gt; 0>
    <#list myFriends as map>
    <tr>
      <td class="no_border" height="85" align="center">
      <#if map.member.coverPath != "">
      	<img src="${map.member.coverPath}" width="45" height="55" />
      <#else>
      	<img src="${base}/images/icon_user.gif" width="45" height="55"/>
      </#if>
      </td>
      <td class="no_border" align="center"><a class="link_freind01" href="${base}/user/viewuser?memberId=#{map.member.id}">${map.member.userName}</a></td>
      <td class="no_border" align="center"><a href="#" class="link_freind02" onclick="return sendMsg('#{map.member.id}');" >发短信息</a><br />
        <#if 1=2><a href="#" class="link_freind02">留    言</a></#if></td>
      <td class="no_border" align="center">${map.member.email}</td>
      <td class="no_border" align="center">${map.createDate}</td>
      <td class="no_border" align="center"><a class="link_freind02" href="${base}/user/removefriend.action?friendId=#{map.friend.id}">加入黑名单</a><br />
        <#if 1=2><a class="link_freind02" href="#">删除好友</a></#if></td>
    </tr>
    </#list>
    <#else>
    <tr><td>目前没有好友</td></tr>
    </#if>
  </table>
</div>
<table width="980" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="24" align="right" valign="top">${myFriendsPagination}</td>
  </tr>
</table>


<h1>待验证的好友</h1>
<div class="myfreind">
  <table width="978" border="0" align="center" cellpadding="0" cellspacing="0" class="my_freind">
    <tr>
      <th width="120" scope="col">头像</th>
      <th width="132" scope="col">昵称</th>
      <th width="387" scope="col">Email</th>
      <th width="235" scope="col">申请日期</th>
      <th width="104" scope="col">操作</th>
    </tr>
    
    <#if myValidateFriends?exists && myValidateFriends.size() &gt; 0>
    <#list myValidateFriends as map>
    <tr>
      <td height="85" align="center">
      <#if map.member.coverPath != "">
      	<img src="${map.member.coverPath}" width="45" height="55" />
      	<#else>
      	<img src="${base}/images/icon_user.gif" width="45" height="55"/>
      </#if>
      </td>
      <td align="center"><a class="link_freind01" href="${base}/user/viewuser?memberId=#{map.member.id}">${map.member.userName}</a></td>
      <td align="center">${map.member.email}</td>
      <td align="center">${map.createDate}</td>
      <td align="center"><a class="link_freind02" href="${base}/user/confirmfriend.action?friendId=#{map.friend.id}">通过</a><br />
        <a class="link_freind02" href="${base}/user/removefriend.action?friendId=#{map.friend.id}">拒绝</a></td>
    </tr>
    </#list>
    <#else>
    <tr><td>没有待验证的好友</td></tr>
    </#if>
    
  </table>
</div>




<table width="980" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="24" align="right" valign="top">${myValidateFriendsPagination}</td>
  </tr>
</table>
<h1>黑名单</h1>
<div class="myfreind">
  <table width="978" border="0" align="center" cellpadding="0" cellspacing="0" class="my_freind">
    <tr>
      <th width="120" scope="col">序号</th>
      <th width="132" scope="col">昵称</th>
      <th width="387" scope="col">Email</th>
      <th width="235" scope="col">加黑日期</th>
      <th width="104" scope="col">操作</th>
    </tr>
    
    <#if myBlackList?exists && myBlackList.size() &gt; 0>
    <#list myBlackList as map>
    <tr>
      <td height="24" align="center">${map_index + 1}</td>
      <td align="center"><a class="link_freind01" href="${base}/user/viewuser?memberId=#{map.member.id}">${map.member.userName}</a></td>
      <td align="center">${map.member.email}</td>
      <td align="center">${map.createDate}</td>
      <td align="center"><a class="link_freind02" href="${base}/user/confirmfriend.action?friendId=#{map.friend.id}">撤销加黑</a></td>
    </tr>
    </#list>
    <#else>
    <tr><td>黑名单里没有好友</td></tr>
   	</#if>
  </table>
</div>
<table width="980" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="24" align="right" valign="top">${myBlackListPagination}</td>
  </tr>
</table>
</div>
</div>
-->
<!--primaryContent end-->

<!--sideContent start-->
<!--sideContent end-->

<!--footer start-->
<#include "/ftl/footer.ftl">
<!--footer end-->

</div>
<!--wrapper end-->

<script language="javascript">
    <#if msg?exists>
        alert('${msg}');
        ${session.removeAttribute("errorMsg")}
    <#else>
    </#if>

    function sendMsg(fId){
        MM_openBrWindow('${base}/shortmsg!sendMsg.action?fId='+fId+'&ran='+Math.random(),'find','modal=yes,width=415,height=280');
    }
</script>
</body>
</html>
