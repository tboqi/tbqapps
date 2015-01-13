<td>#{articleMap.id}</td>
<td>${articleMap.title}</td>
<td>${articleMap.status}</td>
<td>
<#if articleMap.status="推荐">
<a href="javascript:tuijian(0, #{articleMap.id})">不推荐</a>&nbsp;</td>
<#else>
<a href="javascript:tuijian(1, #{articleMap.id})">推荐</a>&nbsp;</td>
</#if>