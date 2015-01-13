<%@ include file="/commons/taglibs.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/commons/meta.jsp" %>
</head>
<body>
<form:form method="post" commandName="category">
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<th colspan="3">添加分类</th>
		</tr>
		<tr>
			<th>分类名</th>
			<td><input type="text" name="name" id="name" value="${command.name}" /></td>
			<td width="20%"><form:errors path="name" cssClass="error" />
			</td>
		</tr>
		<tr>
			<th>显示顺序</th>
			<td><input type="text" name="viewOrder" id="viewOrder" value="${command.viewOrder}" /></td>
			<td width="20%"><form:errors path="viewOrder" cssClass="error" />
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