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
		<table>
		<tr><th>分类名</th><th>排序</th><th>操作</th></tr>
		<c:forEach items="${categoryList}" var="category">
		<tr>
			<td><a href="/categoryView.htm?id=<c:out value="${category.id}" />"><c:out value="${category.name}" /></a></td>
			<td><c:out value="${category.viewOrder}" /></td>
			<td><a href="/categoryForm.htm?id=<c:out value="${category.id}" />">编辑</a>
			<a href="/categoryDelete.htm?id=<c:out value="${category.id}" />">删除</a></td></tr>
		</c:forEach>
		</table>
	</div>
	<%@ include file="/pages/footer.jsp"%>
</div>
</body>
</html>
