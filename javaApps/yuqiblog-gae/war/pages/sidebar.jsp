<%@ include file="/commons/taglibs.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<div id="sidebar1">
  <h3>管理</h3>
  	<ul>
  		<c:if test="${loggedUser == null}">
  			<li><a href="login.htm">登录</a></li>
  		</c:if>
  		<c:if test="${loggedUser != null}">
  			<li><a href="articleForm.htm">发布文章</a></li>
  			<li><a href="categoryForm.htm">添加分类</a></li>
  			<li><a href="logout.htm">退出</a></li>
  		</c:if>
  	</ul>
<h3>Sidebar1 内容</h3>
<c:forEach items="${users}" var="user">
<p><c:out value="${user.username}"/> </p>
</c:forEach>
    <p>Donec eu mi sed turpis feugiat feugiat. Integer turpis arcu, pellentesque  eget, cursus et, fermentum ut, sapien. Fusce metus mi, eleifend  sollicitudin, molestie id, varius et, nibh. Donec nec libero.</p>
  <!-- end #sidebar1 --></div>