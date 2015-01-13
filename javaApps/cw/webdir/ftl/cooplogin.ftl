<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link href="/style/tg.css" rel="stylesheet" type="text/css" />
<title>传闻网推广合作管理平台</title>
</head>
<body>
<div id="logo"><img src="/images/logotg.jpg" /></div>
<div id="sign"><form action="${base}/coop.action" method="post">
  <table width="100%" cellpadding="0" cellspacing="0">
    <tr>
      <td width="100" height="30">&nbsp;</td>
      <td colspan="2" align="right">管理帐户：
        <input class="in01" name="name" type="text" /></td>
      <td width="120">&nbsp;</td>
    </tr>
    <tr>
      <td height="30">&nbsp;</td>
      <td colspan="2" align="right">密&nbsp;&nbsp;&nbsp;&nbsp;码：
        <input class="in01" name="password" type="password" /></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td height="30">&nbsp;</td>
      <td width="215" align="right">
        <input type="submit" value="确认登陆" />      </td>
      <td align="right"><input type="reset" value="重新填写" /></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td align="right"><a href="http://www.chuanwen.com.cn/" target="_blank">进入传闻网>></a></td>
    </tr>
  </table>
</form>
</div>
<script language="javascript">
    <#if msg?exists>
        alert('${msg}');
    </#if>
</script>
</body>
</html>
