<%@ include file="/commons/taglibs.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>消息</title>
</head>

<body>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><c:out value="${message.message}" /></td>
  </tr>
  <tr>
    <td><a href="<c:out value="${message.redirectUrl}" />"><c:out value="${message.redirestString}" /></a></td>
  </tr>
</table>
</body>
</html>