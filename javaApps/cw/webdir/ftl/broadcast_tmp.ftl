<#if broadcastList?exists>
<#list broadcastList as list>
<#if list.sort==0>
<span class="name"><a href="/user/viewuser?memberId=#{list.memberId}">${list.memberName}</a></span>呼吁大家为“<a href="/r/#{list.articleId}">${list.articleTitle}</a>”投<font color='red'><#if list.flag==0>真<#else>假</#if></b></font>票啦！<br />
<#elseif list.sort==1>
<span class="name"><a href="/user/viewuser?memberId=#{list.memberId}">${list.memberName}</a></span>为 “<a href="/r/#{list.articleId}">${list.articleTitle}</a>” 发起<font color='red'>募捐！</font><br />
<#elseif list.sort==2>
<span class="name"><a href="/user/viewuser?memberId=#{list.memberId}">${list.memberName}</a></span>为 “<a href="/r/#{list.articleId}">${list.articleTitle}</a>” 发起了<font color='red'>投票！</font><br />
<#elseif list.sort==3>
<span class="name"><a href="/user/viewuser?memberId=#{list.memberId}">${list.memberName}</a></span>为 “<a href="/r/#{list.articleId}">${list.articleTitle}</a>” 发起了<font color='red'>二次投票！</font><br />
<#else>
<span class="name"><font color="red">${list.memberName}</font></span>：“<a href="#" onclick="javascript:window.open('/cc/viewbc.action?id=#{list.id}&flag=view', 'name', 'height=120,width=474,top=120,left=200,toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no');">${list.articleTitle}</a>”<br />
</#if>
</#list>
</#if>