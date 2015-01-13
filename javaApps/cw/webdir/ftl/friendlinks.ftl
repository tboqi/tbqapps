<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta content="all" name="robots" />
<meta name="Copyright" content="www.chuanwen.com.cn,自由版权,任意转载" />
<meta name="description" content="娱乐明星,IT科技,财经股市,内幕揭秘,探索发现,网友自助发布传闻的web2.0网站,欢迎知情人报料." />
<meta content="娱乐,明星,传闻,爆料,奇闻" name="keywords" />
<link rel="icon" href="${base}/images/favicon.ico" type="image/x-icon" />
<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" /> 
<title>友情链接-传闻网</title>
<link href="${base}/style/layout.css" rel="stylesheet" type="text/css" />
<link href="${base}/style/basic.css" rel="stylesheet" type="text/css" />
<link href="${base}/style/header.css" rel="stylesheet" type="text/css" />
<link href="${base}/style/manage.css" rel="stylesheet" type="text/css" />
<link href="${base}/style/footer.css" rel="stylesheet" type="text/css" />
</head>

<body id="oneColLayout2" class="channel">
<!--wrapper start-->
<div id="wrapper">

<!--header start-->
<#include "/ftl/header.ftl">
<!-- head end -->

</div>
<!--header end-->

<script type='text/javascript'>
function Copy(id){
var text = document.getElementById(id);
try{
clipboardData.setData('text',text.value);
}catch(e){
}
}
</script>
<!-- ad words start -->
<!-- ad words end -->

<!--primaryContent start-->

<div id="primaryContent">
<div id="freindlinks">
<h1>友情链接</h1>
<div id="content" style="font-size:13px;">
  <table>
    <tr>
      <td valign="top"><table cellspacing="5">
        <tr>
          <td><b>交换友情链接要求：</b></td>
        </tr>
        <tr>
          <td>1.同类或相关网站</td>
        </tr>
        <tr>
          <td>2.图片链接尺寸：88×31</td>
        </tr>
        <tr>
          <td height="15">&nbsp;</td>
        </tr>
        <tr>
          <td><b>① 文字链接：</b></td>
        </tr>
        <tr>
          <td>&nbsp;&nbsp;&nbsp;&nbsp;<a href="http://www.chuanwen.com.cn" title="传闻网">传闻网</a></td>
        </tr>
        <tr>
          <td>
            <label>
              <input id="input2" name="textfield2" type="text" onclick="this.select();javascript:Copy(this.id);" value="&lt;a href=&quot;http://www.chuanwen.com.cn&quot; target=&quot;_blank&quot; title=&quot;传闻网&quot;&gt;传闻网&lt;/a&gt;" />
              </label>          </td>
        </tr>
        <tr>
          <td height="15">&nbsp;</td>
        </tr>
        <tr>
          <td><b>② 图片链接：</b></td>
        </tr>
        <tr>
          <td>&nbsp;&nbsp;&nbsp;&nbsp;<a href="http://www.chuanwen.com.cn" title="传闻网"  target="_blank"><IMG src="/images/logo_cw.gif" alt="传闻网" width="81" height="31" border="0"></a> </td>
        </tr>
        <tr>
          <td>
            <label>
              <input id="input3" name="textfield3" type="text" onclick="this.select();javascript:Copy(this.id);" value="&lt;a href=&quot;http://www.chuanwen.com.cn&quot; target=&quot;_blank&quot; title=&quot;传闻网&quot;&gt;&lt;IMG src=&quot;http://www.chuanwen.com.cn/images/logo_cw.gif&quot; border=&quot;0&quot; alt=&quot;传闻网&quot;&gt;&lt;/a&gt;" />
              </label></td>
        </tr>
        <tr>
          <td height="15">&nbsp;</td>
        </tr>
        <tr>
          <td><b>联系我们：</b></td>
        </tr>
        <tr>
          <td>QQ：804278156</td>
        </tr>
      </table></td>
      <td width="20">&nbsp;</td>
      <td valign="top">
      <#if textList?exists>
      <table cellspacing="6">
        <tr>
        <#list textList as textLink>
          <td><a href="${textLink.url}"<#if textLink.color=1> style="Color:#FF0000"</#if> target="_blank">${textLink.name}</a></td>
        <#if (textLink_index+1)%3=0></tr><tr></#if>
        </#list></tr>
      </table>
      </#if>
      </td>
      <td width="20">&nbsp;</td>
      <td valign="top">
      <#if picList?exists>
      <table align="left" cellspacing="10">
      	<tr>
      	<#list picList as picLink>
          <td><a href="${picLink.url}" target="_blank"><img src="${picLink.logoUrl}" width="88" height="31" border="0" alt="${picLink.name}" title="${picLink.name}"></a></td>
        <#if (picLink_index+1)%3=0></tr><tr></#if>
        </#list></tr>
      </table>
      </#if>
      </td>
    </tr>
  </table>
  </div>

</div>
</div>

<#include "/ftl/footer.ftl">
<!--footer end-->

</div>
<!--wrapper end-->


</body>
</html>
