<%@ include file="/commons/taglibs.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.fckeditor.net" prefix="FCK" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/commons/meta.jsp" %>
<script type="text/javascript">
			function FCKeditor_OnComplete(editorInstance) {
				window.status = editorInstance.Description;
			}
		</script>
</head>
<body>
<form:form method="post" commandName="article">
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<th colspan="3">文章发布</th>
		</tr>
		<tr>
			<th>标题</th>
			<td><input type="text" name="title" id="title" value="${command.title}" /></td>
			<td width="20%"><form:errors path="title" cssClass="error" />
			</td>
		</tr>
		<tr>
			<th>内容</th>
			<td><FCK:editor instanceName="content">
				<jsp:attribute name="value">${command.content.value}</jsp:attribute>
			</FCK:editor></td>
			<td width="20%"><form:errors path="content" cssClass="error" />
			</td>
		</tr>
		<tr>
			<th>分类</th>
			<td><select name="categoryId" id="categoryId">
				<option value="0">未分类</option>
				<c:forEach items="${categories}" var="category">
				<option value="<c:out value="${category.id}" />"><c:out value="${category.name}" /></option>
				</c:forEach>
			</select></td>
			<td width="20%"><form:errors path="categoryId" cssClass="error" />
			</td>
		</tr>
		<tr>
			<td colspan="3"><input type="submit" name="button" id="button" value="提交" /></td>
		</tr>
	</table>
	
</form:form>
<a href="<c:url value="/"/>">Home</a>
</body>
</html>