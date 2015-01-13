<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.cc.cw.pic.*, com.cc.cw.pic.module.*, org.apache.commons.lang.math.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" /><head>
<meta http-equiv="Content-Style-Type" content="text/css">
<link href="/pic/style.css" rel="stylesheet" type="text/css" />
<title>传闻网－－图片库</title>
</head>
<body>
<jsp:include page="/pic/header.jsp" />
<table align="center" cellpadding="0" cellspacing="0" width="776">
  <tbody>
  	<tr>
      <td align="right" height="25">
        <table border="0" cellpadding="0" cellspacing="0">
          <tbody>
            <tr>
              <td><span class="hongzi">
              <%
              String huaceId = request.getParameter("id");
              int start = NumberUtils.toInt(request.getParameter("start"));
              PicImpl impl = new PicImpl(huaceId, start);
              out.print(impl.getPageList());
              %></span>
              </td>
            </tr>
          </tbody>
        </table></td>
    </tr>
    <tr>
      <td align="center" height="371" valign="top"><table cellpadding="0" cellspacing="0" width="100%">
        <tbody>
        <%
        
        List<Picture> list = impl.getList();
        Picture pic;
        for(int i=0; i<list.size(); i++) {
        	pic = list.get(i);
        %>
          <tr>
            <td colspan="3"></td>
          </tr>
          <tr style="background-color: rgb(246, 246, 246);" onmouseover="this.style.backgroundColor='#E9F2CE'" onmouseout='this.style.backgroundColor=&quot;#F6F6F6&quot;' bgcolor="#f6f6f6">
            <td align="left" bgcolor="#f6f6f6"><a href="/pic/picView/<%= huaceId %>/<%= start + i %>"><img src="/pic/imageServlet/2/<%= pic.getPicId() %>.jpg" border="0" class="images01" /></a></td>
            <td align="center" valign="top" width="81%"><table width="100%" cellpadding="0" cellspacing="0" class="jianju">
              <tbody>
                <tr>
                  <td height="20" align="left">图片名称：<%= pic.getPicName() %></td>
                </tr>
                <tr>
                  <td height="16" align="left" valign="top" style="padding-top: 10px; padding-bottom: 10px; padding-right: 40px; line-height: 20px;">图片简介：<a href="/pic/picView/<%= huaceId %>/<%= start + i %>" class="link"><%= pic.getPicInfo() %></a></td>
                </tr>
              </tbody>
            </table></td>
          </tr>
          <tr>
            <td colspan="3" bgcolor="#cfcfcf" height="1"></td>
          </tr>
          <%
          }
          %>
        </tbody>
      </table></td>
    </tr>
  </tbody>
</table>
<jsp:include page="/pic/footer.jsp" />
</body></html>