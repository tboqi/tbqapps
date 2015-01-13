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
<title>我的留言 - 传闻网</title>
<link href="${base}/style/layout.css" rel="stylesheet" type="text/css" />
<link href="${base}/style/basic.css" rel="stylesheet" type="text/css" />
<link href="${base}/style/header.css" rel="stylesheet" type="text/css" />
<link href="${base}/style/usermanage.css" rel="stylesheet" type="text/css" />
<link href="${base}/style/footer.css" rel="stylesheet" type="text/css" />
</head>

<body id="oneColLayout2" class="channel">
<!--wrapper start-->
<div id="wrapper">
<#include "/ftl/header.ftl">
<!-- ad words start -->
<!-- ad words end -->

<!--primaryContent start-->

<div id="primaryContent">
<!-- ad pic start -->
<div id="pic_ad_manage"><img src="images/pic_manage.jpg" width="980" height="100" /></div>
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
  <div class="list_chuan">
   <h4><span>我收到的留言</span></h4>
     <form action="${base}/forienmsg!delete.action" method="post" onsubmit="return toDel()">
       <ul id="words">
      <#if messageList?exists && messageList.size() &gt; 0>
      <#list messageList as map>
       <#if map?exists>
         <li><em>
            <input name="mId" type="checkbox" value="${map.msgId}" />
            </em><span class="borderbottom1"><img src="images/icon_tips.gif" width="10" height="11" />&nbsp;<#if map.senderId?number=-1>${map.senderName}<#else><a class="link_freind01" href="${base}/user/viewuser?memberId=${map.senderId}">${map.senderName}</a></#if>&nbsp;&nbsp;&nbsp;&nbsp;<font color="#666666">${map.sendTime}</font>
            <p>${map.msgContent}</p>
            <span class="purple">[<a href="${base}/forienmsg!delete.action?mId=${map.msgId}" onclick="return toDel();">删除</a>]</span></span></li>
       </#if>
      </#list>
      <li><input name="" type="checkbox" value="" />
       全选&nbsp;&nbsp;&nbsp;&nbsp;<input name="imageField2" type="image" id="imageField2" src="/images/btn_del.gif" align="middle" /></li>
     <#else>
    	 <br/>&nbsp;&nbsp;&nbsp;&nbsp;您暂时还未收到留言。
     </#if>
     </ul>
    </form>
   </div>
   <div class="clr"></div>
    <div id="fenye" >${pagnation}</div>
</div>
      
<#--
<div id="my_channel_list">
<h1>留言</h1>
<div class="myfreind">
  <table width="978" border="0" align="center" cellpadding="0" cellspacing="0" id="my_freind">
  <form action="${base}/forienmsg!delete.action" method="post" onsubmit="return toDel()">
    <#if messageList?exists && messageList.size() &gt; 0>
        <#list messageList as map>
            <#if map?exists>
                <tr>
                  <td width="51" rowspan="2" align="center"><input name="mId" type="checkbox" value="${map.msgId}" /></td>
                  <td class="no_border" height="24"><img src="images/icon_tips.gif" width="10" height="11" />&nbsp;<#if map.senderId?number=-1>${map.senderName}<#else><a class="link_freind01" href="${base}/user/viewuser?memberId=${map.senderId}">${map.senderName}</a></#if>&nbsp;&nbsp;${map.sendTime}</td>
                  <td rowspan="2"><a href="${base}/forienmsg!delete.action?mId=${map.msgId}" onclick="return toDel();">删除</a></td>
                </tr>
                <tr>
                  <td height="24">${map.msgContent}</td>
                  </tr>
             </#if>
        </#list>
    
        <tr>
          <td align="center" class="no_border"><input name="" type="checkbox" value="" /></td>
          <td height="36" colspan="9" valign="middle" class="no_border">
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td width="3%" class="no_border">全选</td>
                  <td width="1%" class="no_border">&nbsp;</td>
                  <td width="7%" class="no_border"><input name="imageField2" type="image" id="imageField2" src="images/btn_del.gif" align="middle" /></td>
                  <td width="89%" align="right" class="no_border">${pagnation}&nbsp;&nbsp;&nbsp;&nbsp;</td>
                </tr>
            </table>
          </td>
        </tr>
    <#else>
    </#if>
  </form>
  </table>
</div>
</div>
</div>
-->
<!--primaryContent end-->

<!--sideContent start-->
<!--sideContent end-->
<#include "/ftl/footer.ftl">
</div>
<!--wrapper end-->
<script language="javascript">
    <#if msg?exists>
        alert('${msg}');
    <#else>
    </#if>

    function toDel(){
        return confirm("留言删除后将不能恢复！您确定删除此留言吗？");
    }
</script>

</body>
</html>
