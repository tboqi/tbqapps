<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.fckeditor.net" prefix="FCK" %>
<%--
 * FCKeditor - The text editor for Internet - http://www.fckeditor.net
 * Copyright (C) 2004-2010 Frederico Caldeira Knabben
 *
 * == BEGIN LICENSE ==
 *
 * Licensed under the terms of any of the following licenses at your
 * choice:
 *
 *  - GNU General Public License Version 2 or later (the "GPL")
 *    http://www.gnu.org/licenses/gpl.html
 *
 *  - GNU Lesser General Public License Version 2.1 or later (the "LGPL")
 *    http://www.gnu.org/licenses/lgpl.html
 *
 *  - Mozilla Public License Version 1.1 or later (the "MPL")
 *    http://www.mozilla.org/MPL/MPL-1.1.html
 *
 * == END LICENSE ==
 * @version: $Id: sample08.jsp 4785 2009-12-21 20:10:28Z mosipov $
--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>FCKeditor - JSP Sample</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="robots" content="noindex, nofollow" />
		<link href="../sample.css" rel="stylesheet" type="text/css" />
		<link rel="shortcut icon" href="../fckeditor.gif"
				type="image/x-icon" />
		<script type="text/javascript">
			function FCKeditor_OnComplete(editorInstance) {
				window.status = editorInstance.Description;
			}
		</script>
	</head>
	<body>
		<h1>FCKeditor - JSP - Sample 8</h1>
		This sample displays multiple editor instances with the same input name.<br />
		Press 'Submit' to see the <i>magic</i>.
		<hr />
		<form action="sampleposteddata2.jsp" method="post" target="_blank">
			<FCK:editor instanceName="EditorDefault" inputName="EditorContent">
				<jsp:attribute name="value">This is some <strong>sample text
					</strong> with <code>instanceName = "EditorDefault"</code> and
					<code>inputName = "EditorContent"</code>.
				</jsp:attribute>
			</FCK:editor>
			<FCK:editor instanceName="EditorDefault2" inputName="EditorContent">
				<jsp:attribute name="value">This is some <strong>sample text
					</strong> with <code>instanceName = "EditorDefault2"</code> and
					<code>inputName = "EditorContent"</code>.
				</jsp:attribute>
			</FCK:editor>
			<FCK:editor instanceName="EditorDefault3" inputName="EditorContent">
				<jsp:attribute name="value">This is some <strong>sample text
					</strong> with <code>instanceName = "EditorDefault3"</code> and
					<code>inputName = "EditorContent"</code>.
				</jsp:attribute>
			</FCK:editor>
			
			<br />
			<input type="submit" value="Submit" />
		</form>
	</body>
</html>