<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>商品管理</title>
	<%@ include file="/common/meta.jsp" %>
	<%@ include file="/common/jqueryvalidate.jsp" %>
	<script type="text/javascript">
		$(document).ready(function() {
			//聚焦第一个输入框
			$("#name").focus();
			//为inputForm注册validate函数
			$("#inputForm").validate();
		});
	</script>
</head>

<body>
<%@ include file="/common/header.jsp" %>
<div id="content">
	<h1><s:if test="id == null">创建</s:if><s:else>修改</s:else>商品</h1>
	<form id="inputForm" action="item!save.action" method="post" enctype ="multipart/form-data">
		<input type="hidden" name="id" value="${id}"/>
		<table class="noborder">
			<tr>
				<td>商品名:</td>
				<td><input type="text" id="name" name="name" size="40" value="${name}" class="required"/></td>
			</tr>
			<tr>
				<td>商品分类:</td>
				<td>
					<select id="category" name="category.id">
						<s:iterator value="categories">
						<option value="${id}">${name}</option>
						</s:iterator>
					</select>
				</td>
			</tr>
			<tr>
				<td>卖价:</td>
				<td><input type="text" id="price" name="price" size="40" value="${price}" class="required"/></td>
			</tr>
			<tr>
				<td>图片:</td>
				<td><input type="file" id="pic" name="pic" size="40" /></td>
			</tr>
			<tr>
				<td>描述:</td>
				<td>
					<textarea id="description" name="description" rows="4" cols="50">${description}</textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<security:authorize ifAnyGranted="A_MODIFY_ITEM">
						<input class="button" type="submit" value="提交"/>&nbsp;
					</security:authorize>
					<input class="button" type="button" value="返回" onclick="history.back()"/>
				</td>
			</tr>
		</table>
	</form>
</div>
<%@ include file="/common/footer.jsp" %>
</body>
</html>