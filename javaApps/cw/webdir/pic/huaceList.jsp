<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.cc.cw.pic.*, com.cc.cw.pic.module.*, org.apache.commons.lang.math.*,java.net.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" /><head>
<meta http-equiv="Content-Style-Type" content="text/css">
<meta name="keywords" content="<%= request.getParameter("query") %>"/>
<link href="/pic/style.css" rel="stylesheet" type="text/css" />
<title>传闻网－－图片库－<%= request.getParameter("query") %></title>
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
              String query = request.getParameter("query");
			  String gbk_query = URLEncoder.encode(query,"GBK");
              int start = NumberUtils.toInt(request.getParameter("start"));
              HuaceImpl impl = new HuaceImpl(gbk_query, start);
              String pagelist = impl.getPageList();
              out.print(pagelist);
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
        List<Huace> list = impl.getHuaceList();
        for(int i=0; i<list.size(); i++){
        	Huace hc = list.get(i);
        %>
          <tr>
            <td colspan="3" bgcolor="#cfcfcf" height="1"></td>
          </tr>
          <tr style="background-color: rgb(246, 246, 246);" onmouseover="this.style.backgroundColor='#E9F2CE'" onmouseout='this.style.backgroundColor=&quot;#F6F6F6&quot;' bgcolor="#f6f6f6">
            <td align="left" bgcolor="#f6f6f6"><a href="/pic/picList/<%= hc.getHuaceId() %>/0"><img src="/pic/imageServlet/1/<%= hc.getHuaceId() %>.jpg" border="0" class="images01" /></a></td>
            <td align="center" valign="top" width="81%"><table width="100%" cellpadding="0" cellspacing="0" class="jianju">
              <tbody>
                <tr>
                  <td height="20" align="left" class="lanzi01"><a href="/pic/picList/<%= hc.getHuaceId() %>/0" class="lanzi01"><%= hc.getHuaceName() %></a> </td>
                </tr>
                <tr>
                  <td height="16" align="left" valign="top" style="padding-top: 10px; padding-bottom: 10px; padding-right: 40px; line-height: 20px;"><a href="/pic/picList/<%= hc.getHuaceId() %>/0" class="link">简介：<%= hc.getHuaceInfo() %></a></td>
                </tr>
              </tbody>
            </table></td>
          </tr>
        <%
        }
        %>
          <tr>
            <td colspan="2" align="right">
              <table bgcolor="white" border="0" cellpadding="0" cellspacing="0">
                <tbody>
                  <tr>
                    <td><span class="hongzi"><%= pagelist %></td>
                  </tr>
                </tbody>
              </table></td>
            </tr>
        </tbody>
      </table></td>
    </tr>
  </tbody>
</table>
<jsp:include page="/pic/footer.jsp" />
</body></html>