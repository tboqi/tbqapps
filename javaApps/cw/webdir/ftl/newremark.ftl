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
<title>提供线索 - 传闻网</title>
<link href="${base}/style/layout.css" rel="stylesheet" type="text/css" />
<link href="${base}/style/basic.css" rel="stylesheet" type="text/css" />
<link href="${base}/style/header.css" rel="stylesheet" type="text/css" />
<link href="${base}/style/manage.css" rel="stylesheet" type="text/css" />
<link href="${base}/style/footer.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/FCKeditor/fckeditor.js"></script>
<script type="text/javascript" src="${base}/js/prototype.js"></script>
</head>

<body id="oneColLayout" class="channel">
<#if errorMsg?exists && errorMsg == "succeed">
<script>
	alert('谢谢您提供的宝贵线索');
	window.opener.location.reload();
	window.close();
</script>
</#if>
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
<h1>提供线索</h1>
<div id="content1">
  <form action="${base}/remark!addRemark.action" method="post" onsubmit="return remarkSubmitCheck(2);" >
  <@ww.token name="na"/>
        <input type="hidden" name="articleId" value="${articleId?string('#')}" />
	    <input type="hidden" name="memberId" value="<#if member?exists>#{member.id}<#else>0</#if>" />
        <input type="hidden" name="type" value="1" />   
<#--  <#if !(channelList?exists) || channelList.size() = 0>
  	<P>
  		<label for="textfield">提示：目前您还没有创建频道，因此您发表文章的收藏权限默认为允许任何人收藏，如果不希望别人收藏，请先创建自己的频道。</label>
  	</p>
  </#if>-->
    <P>
  		<label for="textfield">欢迎您提供线索，帮助网友们查找事实真相！</label>
  		<#if article?exists>
  		<label for="textfield">您将为 <b>${article.title}</b> 提供宝贵的线索</label>
  	    </#if>
  	</p>
    <p><label for="textfield">标  题：</label>
    <input type="text" name="title" id="title" value="${title!""}" onblur="remarkSubmitCheck(2);" size="114"/><font color="red">${errorMsg?if_exists}</font><span id="titleError2"><font color="red"></font></span>
    </p>
    <p><label for="textarea">内 容：</label></p>   
      <textarea id="content" name="content" cols="45" rows="5">${content!""}</textarea>
	    <script type="text/javascript">
	        var oFCKeditor = new FCKeditor('content') ;
	        oFCKeditor.BasePath = "${base}/FCKeditor/" ;
	        oFCKeditor.Width = 860;
	        oFCKeditor.Height = 260;
	        oFCKeditor.ToolbarSet = "Basic" ;
	        oFCKeditor.ReplaceTextarea();
	    </script> 
    <p>
    <label for="imageField"></label><input type="image" name="imageField123" id="imageField123" src="${base}/images/btn_publish.gif" />
      <#--<label for="imageField"></label><input type="image" src="${base}/images/btn_submit.gif" />--><#--<a href="#"><img name="submit" id="submit" src="${base}/images/btn_publish.gif" onclick="if(remarkSubmitCheck(2)){document.addremarkform.submit();}"/></a>-->
      <#--<label for="imageField2"></label><input type="image" name="imageField2" id="imageField2" src="${base}/images/btn_cancel.gif" />-->
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
    function remarkSubmitCheck(value){
        needLogin();

        var error = $('titleError'+value);
		var title = $F('title'+value);
        if(title==null || title==''){
            error.style.visibility="visible";
            error.style.color="red";
            error.innerHTML="请输入标题！";
			return false;
        }else{
            error.style.visibility="hidden";
            return true;
        }
		
	}
</script>
</html>
