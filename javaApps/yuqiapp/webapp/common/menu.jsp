<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<div id="menu">
	<ul>
		<li><a href="${ctx}/security/user.action">帐号列表</a></li>
		<li><a href="${ctx}/security/role.action">角色列表</a></li>
		<li><a href="${ctx}/security/category.action">商品分类列表</a></li>
		<li><a href="${ctx}/security/item.action">商品列表</a></li>
		<li><a href="${ctx}/j_spring_security_logout">退出登录</a></li>
	</ul>
</div>
