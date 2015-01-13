<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>传闻网会员登录</title>
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
#user_login{
	text-align:left;
	margin:50px auto;
	width:400px;
	height:200px;
	border:5px solid #FF00FF;
	background-color:#FFFBFD;
	}
h1{
	position:relative;
	font-size:13px;
	color:#CC3300;
	margin-top:6px;
	margin-left:5px;
	}
h1 img{
	float:right;
	margin-top:-14px;
	margin-right:5px;
	}
input{
	width:168px;
	height:18px;
	border:1px solid #FF0000;
	}
input.image{
	width:auto;
	height:auto;
	border:none;
	}
form{
	margin-top:12px;
	margin-left:14px;
	}
form p{
	padding-bottom:5px;
	}
.indent{
	text-indent:72px;
	}
a:hover{
	text-decoration:none;
	}
.style1 {color: #FF6600}
</style>
</head>

<body>
<div id="user_login">
<h1>帮您找回密码!<img onclick="javascript:window.close();" src="${base}/images/btn_close.gif" /></h1>
<form action="${base}/findpassword.action" id="form_login" method="post">
<p>${fieldErrors['getpwd_email_error']?default("")}<br/>
${fieldErrors['getpwd_member_null']?default("")}<br/>
  <label>您的Email：
  <input type="text" name="email" id="textfield" />
  <input type="hidden" name="submitFlag" value="true"/>
  </label>
  <label for="select"></label>
</p>
<p class="indent"><input class="image" type="image" name="imageField" id="imageField" src="${base}/images/btn_find_password.gif" />
</p>
<p class="style1"> 由于新浪或者其他网站有拒绝本站邮件的可能，如果没有收到邮件可直接发送邮件至mail.rumour@gmail.com</p>
<p>&nbsp;</p>
<p><strong>忘记密码服务</strong></p>
<p> 说明：您按照提示填写表单，然后通过您的邮箱获取您的登录密码，密码将发送到您的邮箱中，请查收</p>
</form>
</div>
</body>
</html>
