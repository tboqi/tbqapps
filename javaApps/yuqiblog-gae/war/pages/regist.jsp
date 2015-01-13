<%@ include file="/commons/taglibs.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/commons/meta.jsp" %>
</head>
<body>
<form:form method="post" commandName="regist">
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<th colspan="3">用户注册</th>
		</tr>
		<tr>
			<th>用户名</th>
			<td><input type="text" name="username" id="username" value="${command.username}" /></td>
			<td width="60%"><form:errors path="username" cssClass="error" />
			</td>
		</tr>
		<tr>
			<th>密码</th>
			<td><input type="password" name="password" id="password" /></td>
			<td width="60%"><form:errors path="password" cssClass="error" />
			</td>
		</tr>
		<tr>
			<th>密码确认</th>
			<td><input type="password" name="password2" id="password2" /></td>
			<td width="60%"><form:errors path="password2" cssClass="error" />
			</td>
		</tr>
		<tr>
			<th>Email</th>
			<td><input type="text" name="email" id="email" value="${command.email}" /></td>
			<td width="60%"><form:errors path="email" cssClass="error" /></td>
		</tr>
		<tr>
			<th colspan="3"><input type="submit" name="button" id="button"
				value="提交" /></th>
		</tr>
	</table>
</form:form>
<a href="<c:url value="/"/>">Home</a>
</body>
</html>