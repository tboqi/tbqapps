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
<title>发表文章 - 传闻网</title>
<link href="${base}/style/layout.css" rel="stylesheet" type="text/css" />
<link href="${base}/style/basic.css" rel="stylesheet" type="text/css" />
<link href="${base}/style/header.css" rel="stylesheet" type="text/css" />
<link href="${base}/style/manage.css" rel="stylesheet" type="text/css" />
<link href="${base}/style/footer.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/FCKeditor/fckeditor.js"></script>
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
<div id="publish">
<h1>发布文章</h1>
<div id="content1">
  <form action="${base}/rumour/addrumour!newArticle.action" method="post" name="discussform" id="discussform" onsubmit="return checkStartForm();">
  <@ww.token name="na"/>
  <input type="hidden" name="memberId" value="#{member.id!""}" />
  <input type="hidden" name="loginFlag" value="true" />
  <#if !(channelList?exists) || channelList.size() = 0>
  	<P>
  		<label for="textfield">提示：目前您还没有创建频道，因此您发表文章的收藏权限默认为允许任何人收藏，如果不希望别人收藏，请先创建自己的频道。</label>
  	</p>
  </#if>
  	<p><font color="red">${fieldErrors['articleapply_articlename']?default("")}</font></p>
    <p><label for="textfield">标  题：</label>
    <input name="title" id="title" value="${title!""}" type="text" size="114" />
    </p>
    <p><label for="textfield">原文URL：</label>
    <input name="fromUrl" id="fromUrl" value="${fromUrl!""}" type="text" size="114" />
    </p>
    <p><font color="red">${fieldErrors['articleapply_articlecontent']?default("")}</font></p>
    <p><label for="textarea">内 容：</label></p>      
      <textarea name="content" id="content" cols="45" rows="5">${content!""}</textarea>
	    <script type="text/javascript">
	        var oFCKeditor = new FCKeditor('content') ;
	        oFCKeditor.BasePath = "${base}/FCKeditor/" ;
	        oFCKeditor.Width = 860;
	        oFCKeditor.Height = 260;
	        oFCKeditor.ToolbarSet = "Basic" ;
	        oFCKeditor.ReplaceTextarea();
	    </script> 
    <!--<p>
    请分配此文章的收藏权限：
    <input type="radio" name="publishType" id="any" value="0" checked="checked" onclick="showChannelList();" />
    <label for="radio">任意收藏</label>
    <#if !(channelList?exists) || channelList.size() = 0>
    	<input type="radio" name="publishType" id="radio2" value="1" DISABLED = "false" />
    <#else>
    	<input type="radio" name="publishType" id="only" value="1" onclick="showChannelList('true');" />
    </#if>
    <label for="radio">不允许其它频道收藏</label>
    </p>
    <span id="channelList" style="display:none">
							   <#if channelList?exists && channelList.size() &gt; 0>
                                   请选择频道：<select name="channelId" id="channelId">
                                       <#list channelList as channel>
                                           <option value="${channel.id}">${channel.name}</option>
                                       </#list>
							       </select>
                                   
                               </#if>
       <br>请输入投票天数：<input type="text" class="input01" name="voteDate" id="voteDate" />&nbsp;&nbsp;天
	</span>-->
    <!--<p>
      <span id="voteInput">收藏此文章需付出的票数：<input type="text" name="rate" id="rate" value="${rate!"0"}" /></span>
    </p>-->
    <p>
    	请输入投票天数：<input type="text" class="input01" name="voteDate" id="voteDate" value="10"/>&nbsp;&nbsp;天
    </p>
    <p>
      <label for="imageField"></label><input type="image" name="imageField" id="imageField" src="${base}/images/btn_publish.gif" onclick="return confirm('你的文章将在2分钟后显示到首页。您确定发表吗?')"/>
      <label for="imageField2"></label><input type="image" name="imageField2" id="imageField2" src="${base}/images/btn_cancel.gif" />
    </p>
  </form>
  </div>

</div>
</div>
<!--primaryContent end-->

<!--sideContent start-->
<!--sideContent end-->

<!--footer start-->
<#include "/ftl/footer.ftl">
<!--footer end-->

</div>
<!--wrapper end-->


</body>
<script>
	var chnListSpan = $("channelList");
	var voteSpan = $("voteInput");
	function showChannelList(flag){
		var isShow = new Boolean(flag);
		if(isShow == true){
			chnListSpan.style.display = '';
			voteSpan.style.display = 'none';
		}else{
			chnListSpan.style.display = 'none';
			voteSpan.style.display = '';
		}
	}
	
	function checkStartForm(){

        var num = /^[0-9]*[0-9]\d*$/;
        var rate;
        if($('any').checked){
            rate = $F('rate');
            if(!rate.trim().match(num)){
                alert("请正确输入票数！！！");
                $('rate').focus();
                return false;
            }
        }
        if($('only').checked){
            rate = $F('voteDate');
            if(!rate.trim().match(num)){
                alert("请正确输入天数！！！");
                $('voteDate').focus();
                return false;
            }
        }

        
        return confirm(str);
    }
</script>
</html>
