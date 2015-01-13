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
<title>短信息 - 传闻网</title>
<link href="${base}/style/layout.css" rel="stylesheet" type="text/css" />
<link href="${base}/style/basic.css" rel="stylesheet" type="text/css" />
<link href="${base}/style/header.css" rel="stylesheet" type="text/css" />
<link href="${base}/style/usermanage.css" rel="stylesheet" type="text/css" />
<link href="${base}/style/footer.css" rel="stylesheet" type="text/css" />
<!--<script src="${base}/SpryAssets/SpryTabbedPanels.js" type="text/javascript"></script>
<link href="${base}/SpryAssets/SpryTabbedPanels.css" rel="stylesheet" type="text/css" />-->
<script type="text/javascript" src="${base}/js/prototype.js"></script>
<script type="text/javascript" src="${base}/js/validObj.js"></script>
<script type="text/javascript" src="${base}/js/login.js"></script>
</head>

<body id="oneColLayout2" class="channel">
<!--wrapper start-->
<div id="wrapper">
<#include "/ftl/header.ftl">
</div>
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
  <!--<div id="message"><a href="#"><img src="/images/manage_but_02.gif" alt="发送短信" /></a></div>-->
   <div class="list_chuan">
    <h4><span>未读短消息</span></h4>
     <form action="${base}/shortmsgunread!delete.action" method="post" onsubmit="return toDel()">
       <table cellspacing="0" width="100%">
         <tr>
           <th scope="col">选择</th>
           <th scope="col">标题</th>
           <th scope="col">类型</th>
           <th scope="col">发信人</th>
           <th scope="col">发信日期</th>
           <th scope="col">操作</th>
         </tr>
            <#if unReadMessageList?exists && unReadMessageList.size() &gt; 0>
                <#list unReadMessageList as map>
                    <#if map?exists>
                    <tr>
                      <td class="bottom10"><input type="checkbox" name="mId" id="unReadMsgId" value="${map.msgId}" /></td>
                      <td class="bottom25"><a class="link_freind01" href="#" onclick="return viewMsg('${map.msgId}');">${map.msgTitle}</a></td>
                      <td class="bottom10"><font color="#000000"><#if map.msgType?number=0>用户消息<#else>系统消息</#if></font></td>
                      <td class="bottom20"><a href="${base}/user/viewuser?memberId=${map.senderId}" class="link_color1" title="查看作者信息" alt="查看作者信息">${map.senderName}</a></td>
                      <td class="bottom25">${map.sendTime!""}</td>
                      <td class="bottom10">[<a href="${base}/shortmsgunread!delete.action?mId=${map.msgId}" onclick="return toDel();">删除</a>]&nbsp;&nbsp;[ <a href="#" onclick="return sendMsg('${map.senderId}','${map.msgId}');">回复</a>]</td>
                    </tr>
                    </#if>
                </#list>
            <#else>
                <tr>
                  <td height="24" align="center" colspan="6"><font color="red">无未读短消息！</font></td>
                </tr>
            </#if>
            <tr>
               <td align="center"><input type="checkbox" name="checkbox7" id="unReadMsgId" onclick="if(this.checked==true) { checkAll('unReadMsgId'); } else { clearAll('unReadMsgId'); }" /></td>
               <td colspan="2" valign="middle">全选&nbsp;&nbsp;&nbsp;&nbsp;<input name="imageField2" type="image" id="imageField2" src="images/btn_del.gif" align="middle" /></td>
               <td colspan="3">${unReadPagnation!""}&nbsp;&nbsp;&nbsp;&nbsp;</td>
            </tr>
          </table>
        </form>
      </div>
      
      <div class="list_chuan">
      <h4><span>已读短消息</span></h4>
      <form>
        <table cellspacing="0" width="100%">
          <tr>
            <th scope="col">选择</th>
            <th scope="col">标题</th>
            <th scope="col">类型</th>
            <th scope="col">发信人</th>
            <th scope="col">发信日期</th>
            <th scope="col">操作</th>
          </tr>
          <#if readedMessageList?exists && readedMessageList.size() &gt; 0>
             <#list readedMessageList as map>
              <#if map?exists>
          <tr>
            <td class="bottom10"><input type="checkbox"  name="mId" id="readMsgId" value="${map.msgId}" /></td>
            <td class="bottom25"><a class="link_freind01" href="#" onclick="return viewMsg('${map.msgId}');">${map.msgTitle}</a></td>
            <td class="bottom10"><font color="#000000"><#if map.msgType?number=0>用户消息<#else>系统消息</#if></font></td>
            <td class="bottom20">${map.senderName}</td>
            <td class="bottom25">${map.sendTime!""}</td>
            <td class="bottom10"><a class="link_freind02" href="${base}/shortmsgread!delete.action?mId=${map.msgId}" onclick="return toDel();">[删除]</a> <a href="#" onclick="return sendMsg('${map.senderId}','${map.msgId}');">[回复]</a></td>
          </tr>
             </#if>
            </#list>
          <#else>
                <tr>
                  <td height="24" align="center" colspan="6"><font color="red">无已读短消息！</font></td>
                </tr>
          </#if>
           <tr>
              <td align="center"><input type="checkbox" name="checkbox7" id="readMsgId" onclick="if(this.checked==true) { checkAll('readMsgId'); } else { clearAll('readMsgId'); }" /></td>
              <td colspan="2" valign="middle">全选&nbsp;&nbsp;&nbsp;&nbsp;
              <input name="imageField2" type="image" id="imageField2" src="/images/btn_del.gif" align="middle" /></td>
              <td colspan="3">${readPagnation!""}&nbsp;&nbsp;&nbsp;&nbsp;</td>
            </tr>
          </table>
        </form>
    </div>
<#--
<div id="my_channel_list">
<div id="TabbedPanels1" class="TabbedPanels">
  <ul class="TabbedPanelsTabGroup">
    <li class="TabbedPanelsTab" tabindex="0">未读短消息</li>
    <li class="TabbedPanelsTab" tabindex="0">已读短消息</li>
  </ul>
  <div class="TabbedPanelsContentGroup">
    <div class="TabbedPanelsContent">
        <form action="${base}/shortmsgunread!delete.action" method="post" onsubmit="return toDel()">
          <table width="978" border="0" align="center" cellpadding="0" cellspacing="0" id="my_freind2">
            <tr>
              <th class="thbg" scope="col">选择</th>
              <th class="thbg" scope="col">标题</th>
              <th class="thbg" scope="col">类型</th>
              <th class="thbg" scope="col">发信人</th>
              <th class="thbg" scope="col">发信日期</th>
              <th class="thbg" scope="col">操作</th>
            </tr>
            <#if unReadMessageList?exists && unReadMessageList.size() &gt; 0>
                <#list unReadMessageList as map>
                    <#if map?exists>
                    <tr>
                      <td height="24" align="center"><input type="checkbox" name="mId" id="unReadMsgId" value="${map.msgId}" /></td>
                      <td align="center"><a class="link_freind01" href="#" onclick="return viewMsg('${map.msgId}');">${map.msgTitle}</a></td>
                      <td align="center"><#if map.msgType?number=0>用户消息<#else>系统消息</#if></td>
                      <td align="center"><a href="${base}/user/viewuser?memberId=${map.senderId}" class="link_color1" title="查看作者信息" alt="查看作者信息">${map.senderName}</a></td>
                      <td align="center">${map.sendTime!""}</td>
                      <td align="center"><a class="link_freind02" href="${base}/shortmsgunread!delete.action?mId=${map.msgId}" onclick="return toDel();">删除</a> <a class="link_freind02" href="#" onclick="return sendMsg('${map.senderId}','${map.msgId}');">回复</a></td>
                    </tr>

                    </#if>
                </#list>
            <#else>
                <tr>
                  <td height="24" align="center" colspan="6"><font color="red">无未读短消息！</font></td>
                </tr>
            </#if>
            <tr>
              <td class="no_border" height="24" align="center"><input type="checkbox" name="checkbox7" id="unReadMsgId" onclick="if(this.checked==true) { checkAll('unReadMsgId'); } else { clearAll('unReadMsgId'); }" /></td>
              <td colspan="5" align="center" class="no_border"><table width="100%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td width="3%" class="no_border">全选</td>
                    <td width="1%" class="no_border">&nbsp;</td>
                    <td width="7%" class="no_border"><input name="imageField2" type="image" id="imageField2" src="images/btn_del.gif" align="middle" /></td>
                    <td width="89%" align="right" class="no_border">${unReadPagnation!""}&nbsp;&nbsp;&nbsp;&nbsp;</td>
                  </tr>
              </table></td>
            </tr>
          </table>
        </form>
    </div>
    <div class="TabbedPanelsContent">
        <form action="${base}/shortmsgread!delete.action" method="post" onsubmit="return toDel()">
          <table width="978" border="0" align="center" cellpadding="0" cellspacing="0" id="my_freind2">
            <tr>
              <th class="thbg" scope="col">选择</th>
              <th class="thbg" scope="col">标题</th>
              <th class="thbg" scope="col">类型</th>
              <th class="thbg" scope="col">发信人</th>
              <th class="thbg" scope="col">发信日期</th>
              <th class="thbg" scope="col">操作</th>
            </tr>
            <#if readedMessageList?exists && readedMessageList.size() &gt; 0>
                <#list readedMessageList as map>
                    <#if map?exists>
                    <tr>
                      <td height="24" align="center"><input type="checkbox"  name="mId" id="readMsgId" value="${map.msgId}" /></td>
                      <td align="center"><a class="link_freind01" href="#">${map.msgTitle}</a></td>
                      <td align="center"><#if map.msgType?number=0>用户消息<#else>系统消息</#if></td>
                      <td align="center">${map.senderName}</td>
                      <td align="center">${map.sendTime!""}</td>
                      <td align="center"><a class="link_freind02" href="${base}/shortmsgread!delete.action?mId=${map.msgId}" onclick="return toDel();">删除</a> <a class="link_freind02" href="#">回复</a></td>
                    </tr>
                    </#if>
                </#list>
            <#else>
                <tr>
                  <td height="24" align="center" colspan="6"><font color="red">无已读短消息！</font></td>
                </tr>
            </#if>
            <tr>
              <td class="no_border" height="24" align="center"><input type="checkbox" name="checkbox7" id="readMsgId" onclick="if(this.checked==true) { checkAll('readMsgId'); } else { clearAll('readMsgId'); }" /></td>
              <td colspan="5" align="center" class="no_border"><table width="100%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td width="3%" class="no_border">全选</td>
                    <td width="1%" class="no_border">&nbsp;</td>
                    <td width="7%" class="no_border"><input name="imageField2" type="image" id="imageField2" src="images/btn_del.gif" align="middle" /></td>
                    <td width="89%" align="right" class="no_border">${readPagnation!""}&nbsp;&nbsp;&nbsp;&nbsp;</td>
                  </tr>
              </table></td>
            </tr>
          </table>
        </form>
    </div>
  </div>
</div>
<p>&nbsp;</p>
</div>
</div>
-->
<!--primaryContent end-->

<!--sideContent start-->
<!--sideContent end-->
</div>
<#include "/ftl/footer.ftl">


<!--wrapper end-->


<script type="text/javascript">

//var TabbedPanels1 = new Spry.Widget.TabbedPanels("TabbedPanels1");

    <#if msg?exists>
        alert('${msg}');
    <#else>
    </#if>

    function toDel(){
        return confirm("消息删除后将不能恢复！您确定删除此消息吗？");
    }

    function sendMsg(fId){
        MM_openBrWindow('${base}/shortmsg!sendMsg.action?fId='+fId+'&ran='+Math.random(),'find','modal=yes,width=415,height=280');
        //window.open('${base}/shortmsg!toFrame.action?fId='+fId+'&ran='+Math.random(),window,'dialogWidth=420px;dialogHeight=300px;center=yes;status=no');
    }

	function viewMsg(msgId){
		MM_openBrWindow('${base}/shortmsg!viewMessage.action?msgId='+msgId+'&ran='+Math.random(),'find','modal=yes,width=474,height=280');
	}

    function checkAll(name)//全选
	{
		var el = document.getElementsByTagName('input');
		var len = el.length;
		for(var i=0; i<len; i++)
		{
			if((el[i].type=="checkbox") && (el[i].id==name))
			{
				el[i].checked = true;
			}
		}
	}
    
	function clearAll(name)//全不选
	{
		var el = document.getElementsByTagName('input');
		var len = el.length;
		for(var i=0; i<len; i++)
		{
			if((el[i].type=="checkbox") && (el[i].id==name))
			{
				el[i].checked = false;
			}
		}
	}
</script>
</body>
</html>
