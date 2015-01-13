<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>编辑短消息</title>
<style type="text/css">
*{
	margin:0;
	padding:0;
	}
body{
	font-size:12px;
	}
label{
	float:left;
	width:65px;
	text-align:right;
	}
#user_login{
	width:410px;
	border:2px solid #A94AA6;
	margin:0;
	padding:10px 30px;
	}
#user_login dt{
	font-size:13px;
	font-weight:bold;
	color:#A94AA6;
	height:25px;
	line-height:25px;
	}
#user_login dt em{
	float:right;
	margin-top:-25px;
	margin-right:5px;
	font-style:normal;
	}
#user_login dt em a{
	color:#A94AA6;
	text-decoration:none;
	}
#user_login .dd1{
	height:25px;
	line-height:25px;
	}
.inp1{
	height:15px;
	width:150px;
	}
.inp2{
	height:15px;
	width:315px;
	}
#user_login dd{
	line-height:150%;
	}
#user_login .dd3{
	text-align:center;
	margin:10px 0 0 0;
	padding:0;
	clear:both;
	}
#user_login .dd3 input{
	margin:0 30px;
	border:0;
	}
.l{
	float:left;
	width:65px;
	display:block;
	text-align:right;
	}
.r{
	float:left;
	display:block;
	}
.r textarea{
	width:320px;
	height:100px;
	}
</style>
<script type="text/javascript" src="${base}/js/prototype.js"></script>
<script type="text/javascript" src="${base}/js/validObj.js"></script>
</head>

<body>   
<form action="${base}/shortmsg!replyMessage.action" method="post" id="sendmsg" name="sendmsg" onsubmit="return checkForm()" >
<dl id="user_login">
<dt>发送短消息<em onclick="javascript:window.close();"><a href="#">×</a></em></dt>
<dd class="dd1"><label>接受人：</label>
<input type="text" class="inp1" name="fName" id="fName" value="<#if friend?exists>${friend.userName}</#if>" readonly="readonly" />
<input type="hidden" name="fId" value="<#if friend?exists>#{friend.id}</#if>" />
</dd>
<dd class="dd1"><label>标题：</label><input type="text" name="title" id="title" class="inp2" /></dd>
<dd><span class="l">内容：</span><span class="r">
  <textarea name="content" id="content" cols="30" rows="6"></textarea></span>
</dd>
<dd class="dd3"><input  class="image" type="image" name="imageField" id="imageField" src="/images/manage_but_sen.gif" /> 
  <input type="image" name="imageField2" id="imageField2" onclick="return clearF();" src="/images/manage_but_rep.gif" /></dd>
</dl>
</form>
<#--<div id="user_login">
<h1>发送短消息<img onclick="javascript:window.close();" src="/images/btn_close.gif" /></h1>
<form action="${base}/shortmsg!replyMessage.action" method="post" id="sendMsg" onsubmit="return checkForm()" >
<p>
  <label>接&nbsp;收&nbsp;人：
  <input type="text" name="fName" id="fName" value="<#if friend?exists>${friend.userName}</#if>" readonly="readonly" /></label>
  <input type="hidden" name="fId" value="<#if friend?exists>#{friend.id}</#if>" />
  <label for="select"></label>
  
</p>
<p>
  <label>标&nbsp;&nbsp;&nbsp;&nbsp;题：
  <input type="text" name="title" id="title" /></label></p>
<p>
  <label for="textarea">留言内容：</label>
  <textarea name="content" id="content" cols="30" rows="6"></textarea>
</p>
<p class="indent"><input class="image" type="image" src="/images/btn_send_info.gif" />
 <input class="image" type="image" src="/images/btn_reset_info.gif" onclick="return clearF();" />
 </p>

</form>
</div>-->
<script type="text/javascript">
    <#if msg?exists>
        alert('${msg}');
        this.window.close();
    <#else>
    </#if>

    function setValue(){
        var title = $('fName');
        title.value = $('fId').options[$('fId').selectedIndex].text;
    }
    //setValue();

    function clearF(){
        var f = $('sendMsg');
        f.reset();
        return false;
    }
    
    function checkForm(){
    	if(isNull($F('title').trim())){
    		alert("标题不能为空！");
    		$('title').focus();
    		return false;
    	}
    }
</script>
</body>
</html>
