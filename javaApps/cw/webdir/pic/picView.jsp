<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.cc.cw.pic.*, com.cc.cw.pic.module.*, org.apache.commons.lang.math.*" %>
<%
String hid = request.getParameter("hid");
int p = NumberUtils.toInt(request.getParameter("p"));
PicViewImpl impl = new PicViewImpl(hid, p);
Picture pic = impl.getPic();
if(pic == null) {
	out.println("图片没有找到！");
	return;
}
String ls = impl.getPicList();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" /><head>
<meta http-equiv="Content-Style-Type" content="text/css">
<meta name="keywords" content="<%= pic.getPicName() %>"/>
<meta name="description" content="<%= pic.getPicInfo() %>" />
<link href="/pic/style.css" rel="stylesheet" type="text/css" />
<title>传闻网－－图片库</title>
</head>
<body>
<jsp:include page="/pic/header.jsp" />
<table style="" align="center" cellpadding="0" cellspacing="0" width="776">
  <tbody>
  <tr>
    <td style="padding: 4px;" align="center"><table cellpadding="0" cellspacing="0" width="494">
      <tbody><tr>
        <td align="center" height="30">  
<table width="85%"  border="0" cellpadding="0" cellspacing="0">
<tr>
<td width="31%" align="left" class="lanzi"><a href="/pic/imageServlet/4/<%= pic.getPicId() %>.jpg" target="_blank" class="lanzi">察看高清晰大图</a></td>
<td width="69%" align="right">
<span class="hongzi"><%= ls %></span></td>
</tr>
</table></td>
      </tr>
<tr>
        <td align="center" height="101" valign="top">        
        	<table cellpadding="0" cellspacing="0" width="100%">
          <tbody><tr>
            <td style="padding-top: 4px; padding-bottom: 4px;" align="center" background="/pic/images/pho_bg.gif" valign="top" width="494">             
            
            <a href="/pic/picView/<%= hid %>/<%
            if(impl.isHasNext())
            	out.print(p + 1); 
            else 
            	out.print(0);%>">
            <img src="/pic/imageServlet/3/<%= pic.getPicId() %>.jpg" border="0"/> </a> 
            
              </td>
          </tr>
          <tr>
            <td><img src="/pic/images/album_photo3.gif" height="12" width="492"></td>
          </tr>
          <tr>
            <td align="center" height="20"><font color="#505050"><%= pic.getPicName() %></font></td>
          </tr>
          <tr>
            <td align="center" height="30"><font color="#505050">配图故事：<%= pic.getPicInfo() %></font></td>
          </tr>
        </tbody></table></td>
      </tr>
    </tbody></table></td>
  </tr>
</tbody></table><jsp:include page="/pic/footer.jsp" />
</body></html>