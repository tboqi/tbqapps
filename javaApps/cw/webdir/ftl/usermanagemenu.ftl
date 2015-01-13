<div id="h11">
<#assign requestURI="${request.requestURI}">
<a href="/">网站首页</a>&nbsp;|&nbsp;
<#if requestURI!='/user/usermanage.action'><a href="/user/usermanage">我的首页</a><#else><font color="#000">我的首页</font></#if>&nbsp;|&nbsp;
<#if requestURI!='/user/mychannels.action'><a href="/user/mychannels">我的频道 </a><#else><font color="#000">我的频道</font></#if>&nbsp;|&nbsp;
<#if requestURI!='/user/myfriends.action'><a href="/user/myfriends"> 好友 </a><#else><font color="#000">好友</font></#if>&nbsp;|&nbsp;
<#if requestURI!='/forienmsg.action'><a href="/forienmsg"> 留言 </a><#else><font color="#000">留言</font></#if>&nbsp;|&nbsp;
<#if requestURI!='/shortmsgunread.action'><a href="/shortmsgunread">短信息 </a><#else><font color="#000">短信息</font></#if>&nbsp;|&nbsp;
<#if requestURI!='/user/usermanage!viewMyInfo.action'><a href="/user/usermanage!viewMyInfo.action"> 个人资料</a><#else><font color="#000">个人资料</font></#if>&nbsp;&nbsp;
</div>
