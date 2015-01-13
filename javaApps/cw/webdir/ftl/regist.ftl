<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script type="text/javascript" src="${base}/js/prototype.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>传闻网用户注册</title>
<style type="text/css">
*{
	margin:0;
	padding:0;
	}
body{
	font-family:"宋体";
	font-size:12px;
	margin:0 auto;
	text-align:center;
	}
#register{
	margin:0 auto;
	margin-top:50px;
	width:598px;
	height:278px;
	border:1px solid #D31A1C;
	text-align:left;
	}
h1{

	font-size:13px;
	font-weight:bold;
	color:#fff;
	width:598px;
	height:19px;
	line-height:19px;
	text-indent:5px;
	background:url(/images/bg_cap_register.gif) repeat-x;
	}
#register_content{
	float:left;
	width:512px;
	padding:33px 43px 28px 43px;
	}
#register_left{
	float:left;
	width:269px;
	}
#register_right{
	float:right;
	width:212px;
	height:120px;
	}
#register_right a{
	display:block;
	width:212px;
	height:120px;
	background:url(/images/logo_big.gif) no-repeat;
	}
.input_text{
	width:178px;
	height:18px;
	border:1px solid #D31B1D;
	background-color:#FDF5F5;
	}
p{
	height:32px;
	}
.indent{
	text-indent:60px;
	}
</style>
</head>

<body>
<div id="register">
<h1>传闻网用户注册</h1>
<div id="register_content">

<div id="register_left">
<form action="${base}/regist.action" method="post" id="registForm">
<#if fieldErrors['regist_error']?exists>
<dd><em>${fieldErrors['regist_error']}</em></dd>
</#if>
<#if fieldErrors['regist_error_sendEmail']?exists>
<dd><em>${fieldErrors['regist_error_sendEmail']}</em></dd>
</#if>
<p><label>邮&nbsp;&nbsp;&nbsp;&nbsp;箱：<input class="input_text" type="text" name="email" id="r_email" /></label></p>
<dd><em>${fieldErrors['regist_email']?default("")}</em></dd>
<p><label>昵&nbsp;&nbsp;&nbsp;&nbsp;称：<input class="input_text" type="text" name="userName" id="r_username" /></label></p>
<dd><em>${fieldErrors['regist_username']?default("")}</em></dd>
<p><label>密&nbsp;&nbsp;&nbsp;&nbsp;码：<input class="input_text" type="password" name="password" id="r_password" /></label></p>
<dd><em>${fieldErrors['regist_password']?default("")}</em></dd>
<p><label>重输密码：<input class="input_text" type="password" name="password_cnf" id="password_cnf" /></label></p>
<#if hostIdFlag?exists && hostIdFlag == 'yes'><p><label>绑定帐号：<input type="checkbox" name="hostIdFlag" />是否将这个帐户绑定到这台机器<input type="hidden" name="hostId" value="${hostId}"/></p></#if>
<p><label>提&nbsp;&nbsp;&nbsp;&nbsp;示：<input type="checkbox" id="accept" /></label>
  我已阅读并接受“<a href="service.html" target="_blank"> 服务条款</a> ”</p>
  <#if introId?exists>
  	<input type="hidden" name="introId" value="#{introId}"/>
  </#if>
<p class="indent">
  <input type="image" name="imageField" id="imageField" src="images/btn_submit.gif" onclick="return checkAccept();"/> 
  <input type="image" name="imageField2" id="imageField2" src="images/btn_reset.gif" onclick="return resetform();"/>
</p>
<input type="hidden" name="registFlag" value="true"/>
</form>
</div>

<div id="register_right">
<a href="http://www.chuanwen.com.cn" title="传闻网"></a>
</div>

</div>

</div>
</body>
<script>
var form = $("registForm");
var box = $("accept");
	function checkAccept(){
		
		
		if(box.checked == true){
			return true;
		}else{
			alert("请先阅读服务条款");
			return false;
		}
	}

	function resetform(){
		
		form.reset();
		return false;
	}
</script>
</html>
