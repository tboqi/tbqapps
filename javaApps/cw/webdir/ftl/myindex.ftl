<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="verify-v1" content="8DSi9yfuQfjTqBjuySDoLVMCAas1YKoceLOBkVyxARc=" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta content="all" name="robots" />
<meta name="Copyright" content="www.chuanwen.com.cn" />
<meta name="description" content="娱乐明星,IT传闻,股市传闻,内幕揭秘,探索发现,网友自助发布传闻的web2.0网站,欢迎知情人报料." />
<meta content="传闻,爆料,奇闻" name="keywords" />
<link rel="icon" href="${base}/images/favicon.ico" type="image/x-icon" />
<link rel="shortcut icon" href="/images/favicon.ico" type="image/x-icon" />
<title>传闻网 - 国内资讯深度挖掘第一平台</title>
<link href="/style/layout.css" rel="stylesheet" type="text/css" />
<link href="/style/basic.css" rel="stylesheet" type="text/css" />
<link href="/style/header.css" rel="stylesheet" type="text/css" />
<link href="/style/footer.css" rel="stylesheet" type="text/css" />
<link href="/style/index.css" rel="stylesheet" type="text/css" />
<script src="${base}/Scripts/AC_RunActiveContent.js" type="text/javascript"></script>
</head>
<body>
<script language="javascript">
function reportError(msg,url,line) {
	return true;
}
window.onerror = reportError;
</script>
<!--wrapper start-->
<div id="wrapper">
  <!--header start-->
<#include "/ftl/newheader.ftl">
  <!--header end-->
  
  <div id="adword">
    <div class="adword_left" >频道：
    <#if channelList?exists>
        <#list channelList as channel>
            <#if channel?exists>
                <span class="red"><a target="_blank" href="${base}/c/#{channel.id}">${channel.name}</a></span>
            </#if>
        </#list>
    <#else>
        <li>目前没有相关频道</li>
    </#if></div>
    <div class="adword_right">标签：
    <#if hotLabelList?exists>
        <#list hotLabelList as label>
            <#if label?exists>
                <span><a target="_blank" href="${base}/search/search?qs=${stack.findValue("@com.cc.cw.util.URLCoderUtil@encode('${label.content}','UTF-8')")}&search=all&pn=1">${label.content}</a></span>
            </#if>
        </#list>
    <#else>
        <li>目前没有相关标签</li>
    </#if></div>
  </div>
  <div class="clr"></div>
  <div id="right">
    <!-- flash广告 开始 -->
    <div id="ad_flash">
    <!--<script type="text/javascript">
    AC_FL_RunContent( 'codebase','http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,28,0','width','540','height','120','src','swf/focus','quality','high','pluginspage','http://www.adobe.com/shockwave/download/download.cgi?P1_Prod_Version=ShockwaveFlash','movie','swf/focus' ); //end AC code
    </script><noscript><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,28,0" width="540" height="120">
      <param name="movie" value="${base}/swf/focus.swf" />
      <param name="quality" value="high" />
      <embed src="${base}/swf/focus.swf" quality="high" pluginspage="http://www.adobe.com/shockwave/download/download.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="540" height="120"></embed>
    </object>
    </noscript>-->
    <#if indexPic?exists>
    <#if (indexPic.link?length < 1)>
    <img src="${base}/indexpic/${indexPic.newName}" width="540" height="120" border="0" />
    <#else>
    <a href="${indexPic.link}" target="_blank"><img src="${base}/indexpic/${indexPic.newName}" width="540" height="120" border="0" /></a>
    </#if>
    </#if>
    </div>
    <!-- flash广告 结束 -->
    <div id="suggest">
      <dl>
      <dt><span>推荐传闻</span><!--<em><a href="#">>>more</a></em>--></dt>
      <#if hottestList?exists>
      <#list hottestList as article>
		<#if article?exists>
            <#--<li><a href="${base}/r/#{article.id}" title="${article.title}"><#if article.title?length &gt; 19>${article.title?substring(0,19)}<#else>${article.title}</#if></a></li>-->
	  		<dd><a target="_blank" href="${base}/r/#{article.id}" title="${article.title}"><#if article.title?length &gt; 19>${article.title?substring(0,19)}<#else>${article.title}</#if></a></dd>   
	  	</#if>
	  </#list>
    <#else>
    目前没有相关文章
    <div class="clr"></div>
    </#if>
    </dl>
    <!-- 广播 begin -->
      <div id="radio">
	  <div id="rad">
      <h3><img src="/images/gbt.gif" /></h3>
      <div style="overflow:hidden; height:230px; width:240px; margin:0 auto; font-size:12px; line-height:150%;" id="marqueebox0" class="title">
      <#--<#include "/ftl/broadcast_tmp.ftl">
      <div id="broadcast">正在加载...</div>-->
      正在加载...
      </div>
      </div>
      <div class="clr"></div></div> 
   <!-- 广播 end -->
   </div>
  <!-- pic show 开始 -->
  <ul id="picshow">
  <#if hottestPicList?exists>
	<#list hottestPicList as picMap>
		<#if picMap?exists>
			<#if picMap_index &lt; 5>
                <li>
                            <a target="_blank" href="${base}/user/viewuser?memberId=#{picMap.memberId}" title="${picMap.memberName}">
                                <img src="http://www.chuanwen.com.cn${picMap.imgSrc}" alt="${picMap.memberName}" title="${picMap.memberName}" height="${picMap.iHeight}" width="${picMap.iWidth}"/>
                            </a>
                        </li>
                        <#else>
                        <li class="no_rightpadding"><a target="_blank" href="${base}/user/viewuser?memberId=#{picMap.memberId}" title="${picMap.memberName}">
                                <img src="http://www.chuanwen.com.cn${picMap.imgSrc}" alt="${picMap.memberName}" title="${picMap.memberName}" height="${picMap.iHeight}" width="${picMap.iWidth}"/>
                            </a></li>
                        </#if>
                    </#if>
                </#list>
            </#if>
    <div class="clr"></div>
  </ul>
  <div id="tf">
    <dl id="flase">
      <dt><span>判断为假的传闻</span><em><a href="${base}/againstlist" alt="点击查看更多" title="点击查看更多">>>more</a></em></dt>
      <#if againstList?exists>
            <#list againstList as article>
                <#if article?exists>
                    <dd><a target="_blank" href="${base}/r/#{article.id}" title="${article.title}">${article.title}</a></dd>
                </#if>
            </#list>
        <#else>
        <dd>目前没有反对的文章</dd>
        </#if>
    </dl>
    <dl id="true">
      <dt><span>判断为真的传闻</span><em><a href="${base}/supportlist">>>more</a></em></dt>
      <#if suggestList?exists>
            <#list suggestList as article>
                <#if article?exists>
                    <dd><a target="_blank" href="${base}/r/#{article.id}" title="${article.title}">${article.title}</a></dd>
                </#if>
            </#list>
        <#else>
        <dd>目前没有支持的文章</dd>
        </#if>
    </dl>
    <div class="clr"></div>
  </div>
</div>
<div id="left">
  <div id="new">
    <h2><span>最新传闻</span><em><a target="_blank" href="${base}/newslist" alt="点击查看更多" title="点击查看更多">>>全部传闻</a></em></h2>
    <#assign size = newListMap.size()>
    <#if size &lt; 1>目前没有最新文章<#else><#assign article = newListMap.get(0)>
        <dl>
          <dt class="tit1"><a target="_blank" href="${base}/r/#{article.id}" alt="${article.title}" title="${article.title}">${article.title}</a></dt>
          <dd><a target="_blank" target="_blank" href="${base}/r/#{article.id}"><img src="${article.imgSrc}" alt="${article.title}" width="130" height="88" title="${article.title}" /></a>
            <p>${article.content}</p>
          </dd>
        </dl>
    </#if>
    <#if size &lt; 2>目前没有最新文章<#else><#assign article = newListMap.get(1)>
    <dl>
      <dt class="tit2"><a target="_blank" href="${base}/r/#{article.id}" alt="${article.title}" title="${article.title}">${article.title}</a></dt>
      <dd><a target="_blank" href="${base}/r/#{article.id}"><img src="${article.imgSrc}" alt="${article.title}" width="130" height="87" title="${article.title}" /></a>
        <p>${article.content}</p>
      </dd>
    </dl>
    </#if>
    <#if size &lt; 3>目前没有最新文章<#else><#assign article = newListMap.get(2)>
    <dl>
      <dt class="tit3"><a target="_blank" href="${base}/r/#{article.id}" alt="${article.title}" title="${article.title}">${article.title}</a></dt>
      <dd><a target="_blank" href="${base}/r/#{article.id}"><img src="${article.imgSrc}" alt="${article.title}" width="130" height="88" title="${article.title}" /></a>
        <p>${article.content}</p>
      </dd>
    </dl>
    </#if>
    <#if size &lt; 4>目前没有最新文章<#else><#assign article = newListMap.get(3)>
    <dl>
      <dt class="tit4"><a target="_blank" href="${base}/r/#{article.id}" alt="${article.title}" title="${article.title}">${article.title}</a></dt>
      <dd><a target="_blank" href="${base}/r/#{article.id}"><img src="${article.imgSrc}" alt="${article.title}" width="130" height="87" title="${article.title}" /></a>
        <p>${article.content}</p>
      </dd>
    </dl>
    </#if>
    <h5><a target="_blank" href="${base}/newslist">更多最新文章</a></h5>
  </div>
  <dl id="ing">
    <dt>投票进行时</dt>
    <#if voteListMap?exists>
        <#list voteListMap as voteMap>
        	<#if voteMap.userId == '1000000'>
        	<dd><span class="name">游客</span>&nbsp;投&nbsp;“<#if voteMap.voteType=='支持票'>真<#else>假</#if>”给 <a target="_blank" href="${base}/r/${voteMap.articleId}" title="${voteMap.title}" alt="${voteMap.title}">${voteMap.title}</a></dd>
        	<#else>
            <dd><span class="name"><a target="_blank" target="_blank" href="${base}/user/viewuser?memberId=${voteMap.userId}" title="查看作者信息" alt="查看作者信息">${voteMap.userName}</a></span>&nbsp;投&nbsp;“<#if voteMap.voteType=='支持票'>真<#else>假</#if>”给 <a target="_blank" href="${base}/r/${voteMap.articleId}" title="${voteMap.title}" alt="${voteMap.title}">${voteMap.title}</a></dd>
        	</#if>
        </#list>
    <#else>
        <dd><font color="red">无投票记录！！！</font></dd>
    </#if>
  </dl>
  <div class="clr"></div>
</div>
<div id="freindlinks" class="clr">
友情链接： 
<#if flinkList?exists>
<#list flinkList as flink>
<a href="${flink.url}"<#if flink.color=1> style="Color:#FF0000"</#if> target="_blank">${flink.name}</a>
</#list>
</#if>
<a href="/freindlinks.html" style="color:#0000FF;">更多>></a> &nbsp;<a href="/friendlinks.action?flag=input" target="_blank">申请友情链接</a>
</div>
<!--footer start-->
<div id="footer">
<div id="sprite_line"></div>
<p><a href="${base}/about.html" target="_blank">关于我们</a> | <a href="${base}/declare.html" target="_blank">网站声明</a> | <a href="${base}/service.html" target="_blank">服务条款</a> | <a href="${base}/business.html" target="_blank">商务合作</a> | <a href="${base}/freindlinks.html" target="_blank">友情链接</a></p>
<p>&copy;版权所有：传闻网</p><p>京ICP备07501434号</p>
  <p><img src="/images/pic_email.gif" /></p>
</div>
<div style="height:0;overflow:hidden;">
  <script language="javascript" src="http://count12.51yes.com/click.aspx?id=123222001&logo=9"></script>
</div>
</div>
</div>
<!--wrapper end-->
</body>
</html>
<script type="text/javascript">
var t;
var r;
function startmarquee(lh,speed,delay,index){
var p=false;
var o=document.getElementById("marqueebox"+index);
o.innerHTML += o.innerHTML;
o.onmouseover=function(){p=true;}
o.onmouseout=function(){p=false;}
o.scrollTop = 0;
function start(){
t=setInterval(scrolling,speed);
//alert("set:"+t);
if(!p) o.scrollTop += 2;
}
function scrolling(){
if(o.scrollTop%lh!=0){
	
	o.scrollTop += 2;
	if(o.scrollTop>=o.scrollHeight/2) o.scrollTop = 0;
}else{
	//alert("clear:"+t);
	clearInterval(t);
	clearTimeout(r);
	r = setTimeout(start,delay);
}
}
r = setTimeout(start,delay);
}

function getBroadHTML(){
//alert("clear:");
clearInterval(t);
clearTimeout(r);
var url="/user/broadcast.action";
var pars="actionFlag=currentBroadcast";
var myAjax=new Ajax.Updater(
	{},
	url,
	{
	method:'post',
	parameters:pars,
	onSuccess:mycallback
	});
}
function mycallback(obj){
document.getElementById("marqueebox0").innerHTML=obj.responseText;
startmarquee(40,80,3000,0);
}
getBroadHTML();
setInterval("getBroadHTML()",60*1000);
//startmarquee(120,20,2000,0)
</script>
