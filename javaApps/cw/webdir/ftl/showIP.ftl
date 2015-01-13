<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link href="/style/tg.css" rel="stylesheet" type="text/css" />
<title>传闻网推广合作管理平台</title>
</head>
<body>
<div id="head"><img src="/images/logo_cw.gif" width="81" height="31" /><span><img src="/images/logotg.jpg" height="31" /></span></div>
<div id="con">
<div id="content">
  
	<table width="100%" id="search">
  <tr>
    <td width="0">今日独立IP总数：#{todayIP}个
     <form action="${base}/coop!showDetailIP.action" method="post">
     	<input type="hidden" name="showType" value="0" />
     	<input type="submit" value="详细查询" />
     </form>
     </td>
    <td width="0" align="right">周独立IP总数：#{weekIP}个
      <form action="${base}/coop!showDetailIP.action" method="post">
     	<input type="hidden" name="showType" value="1" />
     	<input type="submit" value="详细查询" />
     </form></td>
  </tr>
  <tr>
    <td>昨日独立IP总数：#{yestodayIP}个
      <form action="${base}/coop!showDetailIP.action" method="post">
     	<input type="hidden" name="showType" value="3" />
     	<input type="submit" value="详细查询" />
     </form></td>
    <td align="right">月独立IP总数：#{monthIP}个
      <form action="${base}/coop!showDetailIP.action" method="post">
     	<input type="hidden" name="showType" value="2" />
     	<input type="submit" value="详细查询" />
     </form></td>
  </tr>
</table><h1>选择合作用户
<form action="${base}/coop!showDetailIP.action" method="post">
        <#if sites?exists>
            <select name="site">
                <#list sites as site>
                    <option value="${site}">${site}</option>
                </#list>
            </select>
        <#else>
            <font color="red">暂无可选用户！</font>
        </#if>
  <select name="showType">
    <option value="0" <#if showType=0>selected</#if>>今日独立IP数</option>
    <option value="3" <#if showType=3>selected</#if>>昨日独立IP数</option>
    <option value="1" <#if showType=1>selected</#if>>周独立IP数</option>
    <option value="2" <#if showType=2>selected</#if>>月独立IP数</option>
  </select>
  <input type="submit" value="详细查询" />
</h1>
  </form>
  <#if ipMap?exists>
	<table width="800" border="0" cellpadding="0" cellspacing="1" bordercolor="#AACCEE" bgcolor="#AACCEE">
    <@ww.iterator value="ipMap">   
      <tr bgcolor="#E9F4FF">
	    <td width="600">[<@ww.property value="key"/>] -- <@ww.property value="value"/></td>
	  </tr>
	  <tr>
	    <td width="600" bgcolor="#FFFFFF">&nbsp;</td>
	  </tr>
    </@ww.iterator>
	  
	</table>
<h2>总计：#{total}个  每页显示10个  共#{totalPage}页 当前显示第#{pageId}页 <#if pageId=1><#else><a href="${base}/coop!showDetailIP.action?pageId=#{pageId - 1}&showType=${showType}&site=${site!"all"}">上一页</a></#if>│<#if pageId = totalPage || totalPage=0>下一页<#else><a href="${base}/coop!showDetailIP.action?pageId=#{pageId + 1}&showType=${showType!"all"}&site=${site!"all"}">下一页</a></#if></h2>
  </#if>

</div></div>
</body>
</html>
