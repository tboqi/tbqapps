<%@ page language="java" pageEncoding="UTF-8" %>
<%@ page import="org.springside.modules.security.springsecurity.SpringSecurityUtils" %>
<div id="filter">你好, <%=SpringSecurityUtils.getCurrentUserName()%>.</div>