<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>上传广告列表</title>
</head>


<table width="95%" align="center" cellpadding="0"  cellspacing="0">
    <tr>
      <td width="100%" height="30"><strong>上传广告列表</strong></td>
    </tr>
	<tr>
		<td>${position}</td>
	</tr>
	<#if wList?exists && wList.size() &gt; 0>
	<#list wList as map>
    <tr>
		<td>${map.url},${map.pic}</td>
    </tr>
	</#list>
	</#if>
</table>

</html>