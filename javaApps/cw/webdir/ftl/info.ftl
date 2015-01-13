<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<#--<meta http-equiv="refresh" content="10;${'url='+request.requestURL?substring(0, request.requestURL?index_of('regist'))+'index.html'}"><#-- ${request.requestURL?substring(0, request.requestURL?index_of('regist'))+'index.html'} -->
<title>提示</title>
<link href="${base}/style/layout.css" rel="stylesheet" type="text/css" />
<link href="${base}/style/basic.css" rel="stylesheet" type="text/css" />
<link href="${base}/style/header.css" rel="stylesheet" type="text/css" />
<link href="${base}/style/newchapter_list.css" rel="stylesheet" type="text/css" />
<link href="${base}/style/footer.css" rel="stylesheet" type="text/css" />
</head>

<#--<#include "/ftl/header.ftl"/>-->
<body><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><center>
 <font size=5px><p>${msg}<br/>
      您的推广链接为 <font color=red>http://www.chuanwen.com.cn/regist.html?introId=<#if introId?exists>#{introId}<#else>0</#if> </font><br/>您可以通过推广链接推荐朋友注册传闻网，每推荐一人将获得2票奖励<br/>这个地址我们也将发送到您的传闻网短信息中，以便您的再次查看。
      <br />
      如您对此存在任何疑问，请联系：<a href=mailto:"mail.rumour@gmail.com">mail.rumour@gmail.com</a>，谢谢！ <br />
      <br />
    </p>
    <p>请点击<a href="${base}/home.action"><font color=red> 返回首页 </font></a>,浏览精彩传闻<div style="clear:both"></div></p>
    <p/></font></center>
</body>
<#--<#include "/ftl/footer.ftl"/>-->
</html>
<#--<script>
function myStart(){
	numberGo=window.setInterval("setNum()",1000);
}
function setNum(){
	var time = document.getElementById('refreshTime');
	time.innerHTML = time.innerHTML - 1;
}
myStart();
</script>-->