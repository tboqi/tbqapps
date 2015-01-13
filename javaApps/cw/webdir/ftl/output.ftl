
<table width="${width}" heigth="${height}" style="border:1px solid #ded8ce;">
<tr>
<td height="20" colspan="3" bgcolor="#EBF3FB" class="title01"><span class="title01">&nbsp;&nbsp;&nbsp;每日精彩传闻</span></td>
</tr>
<#if newList?exists && newList.size() &gt; 0>
  <#if mode == 1>
  <tr>
	<td width="25%" valign="top" height="100" style="padding:5px; margin:0px; overflow:hidden;">
  	<#if articleImgMapList?exists && articleImgMapList.size() &gt; 0>
	<#list articleImgMapList as articleImgMap>
	<#if articleImgMap_index &gt;= picSize><#break></#if>
	<a href="${base}/wip/${site}/${articleImgMap.articleId}" class="link" target="_blank">
	<img src="${articleImgMap.imgSrc}" width="120" height="90" border="0">
	</a>
	<br/>
	</#list>
	</#if>
	</td>
	<td><table>
  	<#if newList?exists && newList.size() &gt; 0>
	<#list newList as article>
	<tr>
	<td width="13" style="font-size:12px">·</td>
	<td style="font-size:12px"><a href="${base}/wip/${site}/#{article.id}" class="link" title="${article.title}" target="_blank">${article.title}</a></td>
	</tr>
	</#list>
	</#if>
	</table></td>
  </tr>
  </#if>
  <#if mode == 2>
  <tr>
	<td width="50%" valign="top" height="${height}" style="padding:5px; margin:0px; overflow:hidden;">
	<table>
  	<#if newList?exists && newList.size() &gt; 0>
	<#list newList as article>
	<#if article_index &gt; newList.size()/2-1><#break></#if>
	<tr>
	<td width="13" style="font-size:12px">·</td>
	<td style="font-size:12px"><a href="${base}/wip/${site}/#{article.id}" class="link" title="${article.title}" target="_blank">${article.title}</a></td>
	</tr>
	</#list>
	</#if>
	</table></td>
	<td width="50%" valign="top" height="${height}" style="padding:5px; margin:0px; overflow:hidden;">
	<table>
  	<#if newList?exists && newList.size() &gt; 0>
	<#list newList as article>
	<#if article_index &gt; newList.size()/2-1>
	<tr>
	<td width="13" style="font-size:12px">·</td>
	<td style="font-size:12px"><a href="${base}/wip/${site}/#{article.id}" class="link" title="${article.title}" target="_blank">${article.title}</a></td>
	</tr>
	</#if>
	</#list>
	</#if>
	</table></td>
  </tr>
  </#if>
  <#if mode == 3>
  <tr>
	<td width="100%" valign="top" height="${height}" style="padding:5px; margin:0px; overflow:hidden;">
	<table>
  	<#if newList?exists && newList.size() &gt; 0>
	<#list newList as article>
	<tr>
	<td width="13" style="font-size:12px">·</td>
	<td style="font-size:12px"><a href="${base}/wip/${site}/#{article.id}" class="link" title="${article.title}" target="_blank">${article.title}</a></td>
	</tr>
	</#list>
	</#if>
	</table></td>
  </tr>
  </#if>
</#if>
</table>