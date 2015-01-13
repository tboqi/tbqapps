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

<body><form>
<dl id="user_login">
<dt>查看短消息</dt>
<dd class="dd1">标题：${message.title}</dd>
<dd>${message.content}</dd>
<dd class="dd3"><a href="#" title="回复信息" onclick="return sendMsg('#{message.senderId}','#{message.id}');"><img src="/images/manage_but_re.gif" width="96" height="26" /></a><a href="#" title="关闭窗口" onclick="javascript:window.close();"><img src="/images/manage_but_cl.gif" width="96" height="26" /></a></dd>
</dl></form>
</body>
</html>
<script>
    function sendMsg(fId){
        MM_openBrWindow('${base}/shortmsg!sendMsg.action?fId='+fId+'&ran='+Math.random(),'find','modal=yes,width=415,height=280');
        //window.open('${base}/shortmsg!toFrame.action?fId='+fId+'&ran='+Math.random(),window,'dialogWidth=420px;dialogHeight=300px;center=yes;status=no');
    }
</script>
