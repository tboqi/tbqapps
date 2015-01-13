<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript" src="${base}/js/login.js"></script>

<title>查看短信息</title>
<style type="text/css">
*{
	margin:0;
	padding:0;
	}
body{
	font-size:12px;
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
#user_login .dd1{
	height:25px;
	line-height:25px;
	}
#user_login dd{
	line-height:150%;
	}
#user_login .dd3{
	text-align:center;
	margin:10px 0 0 0;
	padding:0;
	}
#user_login .dd3 img{
	margin:0 30px;
	border:0;
	}

</style>
</head>

<body>
<dl id="user_login">
<dt>查看系统广播</dt>
<dd class="dd1">标题：${broadcast.articleTitle}</dd>
<dd>${broadcast.content}</dd>
</dl>
</body>
</html>
