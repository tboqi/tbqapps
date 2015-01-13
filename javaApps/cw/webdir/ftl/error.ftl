<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link href="${base}/style/layout.css" rel="stylesheet" type="text/css" />
<link href="${base}/style/basic.css" rel="stylesheet" type="text/css" />
<link href="${base}/style/header.css" rel="stylesheet" type="text/css" />
<link href="${base}/style/newchapter_list.css" rel="stylesheet" type="text/css" />
<link href="${base}/style/footer.css" rel="stylesheet" type="text/css" />
	<title>传闻</title>
</head>
<#include "/ftl/header.ftl"/>
<body>
<center>
<p>
			<#assign notAffirm = "false">
			<#if actionErrors?exists>
			<#list actionErrors as msg>
              			<#if msg = "email">
              				<#assign notAffirm = "true">
              			</#if>
			</#list>
				<#list actionErrors as msg>
				<#if notAffirm = "true">
              			<#if msg != "email"><br/>
              				${msg}<br/>
							<form action="${base}/email.action" method="post">
              					<input type="hidden" value="${email}" name="email">
              					<input type="hidden" value="${userName}" name="userName">
              					<input type="hidden" value="${uuid}" name="uuid">
              					如果没有收到邮件，请点击 <input type="submit" value="发送">
              				</form>
              			</#if>
				<#else>
					${msg}<br/>
				</#if>

              		</#list>
              <#else>
              		非常抱歉，在我们的服务器上，无法找到您要访问的网页。请您确认输入的网址是否正确。
              </#if>
              	
           
            <form action="javascript:history.back()">
              <td height="58" align="center">&nbsp;                
              <input type="submit" value="返  回" /></td>
            </form>
	    </p></center>
</body>
<#include "/ftl/footer.ftl"/>
</html>
