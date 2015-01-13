<%@ include file="/commons/taglibs.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/commons/meta.jsp"%>
</head>

<body class="twoColFixRtHdr">
<div id="container">
	<%@ include file="/pages/header.jsp"%>
	<%@ include file="/pages/sidebar.jsp"%>
	<div id="mainContent">
		<c:forEach items="${articleList}" var="article">
		<h1><a href="/articleView.htm?id=<c:out value="${article.id}" />"><c:out value="${article.title}" /></a></h1>
		<p><c:out value="${article.content.value}" escapeXml="false" /></p>
		<c:if test="${loggedUser != null}">
		<div>
			<a href="/articleForm.htm?id=<c:out value="${article.id}" />">编辑</a>
			<a href="/articleDelete.htm?id=<c:out value="${article.id}" />">删除</a>
		</div>
		</c:if>
		</c:forEach>
	</div>
	<%@ include file="/pages/footer.jsp"%>
</div>
</body>
</html>
