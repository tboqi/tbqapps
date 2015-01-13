<#if member?exists>
    <#if memberId = member.id>
<div id="message"><a href="/shortmsgunread"><span>您有　<b>${unReadMsg?if_exists}</b>　条短消息未读</span></a><a href="/user/broadcast" target = "_blank" title="我要广播"><img src="/images/manage_but_01.jpg" alt="我要广播" /></a></div>
    </#if>
</#if>
    <div id="myself"><span>个人介绍：</span>
      <p><#if viewMember.descript?exists && viewMember.descript!=''>${viewMember.descript?if_exists}<#else><#if member?exists && memberId = member.id>您还没有填写您的个人介绍，请点击　<a href="/user/usermanage!viewMyInfo.action">个人资料</a>　进行更新<#else><font color='red'>该用户无个人介绍，在此仅代表${viewMember.userName}欢迎您的到来</font></#if></#if></p>
    </div>