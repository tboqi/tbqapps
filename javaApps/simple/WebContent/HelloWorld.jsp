<%@ taglib prefix="s" uri="/struts-tags"%>

<html>
<head>
<link href="<s:url value="/css/tutorial.css"/>" rel="stylesheet"
	type="text/css" />
<title>Hello World!</title>
</head>
<body>
<h2><s:property value="message" /></h2>

<h3>Languages</h3>
<ul>
	<li><s:url id="url" action="HelloWorld">
		<s:param name="request_locale">en</s:param>
	</s:url> <s:a href="%{url}">English</s:a></li>
	<li><s:url id="url" action="HelloWorld">
		<s:param name="request_locale">es</s:param>
	</s:url> <s:a href="%{url}">Espanol</s:a></li>
</ul>
</body>
</html>

