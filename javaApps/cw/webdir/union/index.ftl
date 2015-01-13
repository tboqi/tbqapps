<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta content="all" name="robots" />
<meta name="Copyright" content="www.chuanwen.com.cn" />
<meta name="description" content="<#if uu?exists >${uu.description?if_exists}</#if>" />
<meta content="<#if uu?exists >${uu.keyword?if_exists}</#if>" name="keywords" />
<link rel="icon" href="${base}/images/favicon.ico" type="image/x-icon" />
<link rel="shortcut icon" href="${base}/images/favicon.ico" type="image/x-icon" /> 
<title><#if uu?exists >${uu.websiteName?if_exists}</#if></title>
<link href="/union/style.css" rel="stylesheet" type="text/css" />
<link href="/union/v.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
<!--
function loginSubmit() {
	var form = document.getElementById("loginForm");
	if(form.email.value == "") {
		alert("帐号不能为空");
		return false;
	} else if(form.password.value == "")  {
		alert("密码不能为空");
		return false;
	} else {
		form.submit();
	}
}
//-->
</script>
</head>
 <body>
<div id="nav" style="margin-bottom:5px;"><#if uu?exists >${uu.header?if_exists}</#if></div>
<div id="head"></div>
<div class="main_right">
   <form action="/u/search?pn=1" method="post">
    <div id="search">
      <input name="qs" type="text" class="input1" onFocus="this.className='input1-bor'" 
      onBlur="this.className='input1'" />
			<input type="hidden" name="search" id="search" value="article"/>
      <input type="image" src="/union/images/but_search.gif" 
      height="22" width="44" title="点击进行搜索" border="0" /></div>
  </form>
   <div id="ad">
    <script src="js/yu.js" type="text/javascript"></script>
    <script src="js/tb.js" type="text/javascript"></script>
    <div id="MainPromotionBanner">
       <div id="SlidePlayer">
        <ul class="Slides">
           <li><a target="_blank" href="http://www.chuanwen.com.cn/r/2629" target="_blank"><img src="/union/images/index1.gif"></a></li>
           <li><a target="_blank" href="http://www.chuanwen.com.cn.cn/"><img src="/union/images/02.jpg"></a></li>
           <li><a target="_blank" href="http://www.chuanwen.com.cn.cn/"><img src="/union/images/03.jpg"></a></li>
           <li><a target="_blank" href="http://www.chuanwen.com.cn.cn/"><img src="/union/images/04.jpg"></a></li>
           <li><a target="_blank" href="http://www.chuanwen.com.cn.cn/"><img src="/union/images/05.jpg"></a></li>
         </ul>
      </div>
       <script type="text/javascript">
			TB.widget.SimpleSlide.decoration('SlidePlayer', {eventType:'mouse', effect:'scroll'});
</script>
     </div>
  </div>
  <#if member?exists>
    <div id="login" class="list">
       <ul>
        <li>欢迎您！<span class="red">${member.userName}</span>&nbsp;<a href="/union/login!logout.action">退出</a></li>
        <li>您的票数目前是：<span class="number">${member.privilege}</span></li>
      </ul>
       <div class="clr"></div></div>
	<#else>
   <form name="loginForm" id="loginForm" action="/union/login.action" method="post">
    <div id="login" class="list">
       <ul>
        <li> 用户名：
           <input type="text" name="email" class="input2" onFocus="this.className='input2-bor'"  onBlur="this.className='input2'"  />
         </li>
        <li>密&nbsp;&nbsp;&nbsp;码：<input name="loginFlag" value="true" type="hidden">
           <input type="password" name="password" class="input2" onFocus="this.className='input2-bor'"  onBlur="this.className='input2'" />
         </li>
      </ul>
       <img src="/union/images/but_login.gif " border="0" height="54" width="54" onclick="javascript:loginSubmit();" />
       <div class="clr"></div>
       <a href="/union/regist.action">注册会员</a><!--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="red"><a href="#">忘记密码？</a>--></span></div>
  </form>
  </#if>
   <div class="tags" id="tags">
   <#if hotLabelList?exists>
	  <#list hotLabelList as label>
	  <#if label?exists>
   <a target="_blank" class="tags${label_index%5 + 1}" href="/u/search?qs=${stack.findValue("@com.cc.cw.util.URLCoderUtil@encode('${label.content}','UTF-8')")}&search=all&pn=1">${label.content}</a>&nbsp; 
   </#if>
	  </#list>
	  </#if></div>
 </div>
<div class="main_left">
   <div class="main_new">
    <h1><span>最新传闻</span><em><a href="/union/newArticles.action">>>more&nbsp;&nbsp;</a></em></h1>
    <div class="clr"></div>
    <div id="main_top"> <a href="/u/${theLastArticleWithPic.id?string('#')}"><img class="img_top" src="${theLastArticleWithPic.imgSrc}" alt="${theLastArticleWithPic.title}" title="${theLastArticleWithPic.title}" height="160" width="130" border="0" /></a>
       <#list last2Article as article>
       <dl>
        <dt><a href="/u/${article.id?string('#')}">${article.title}</a></dt>
        <dd>${article.content}</dd>
      </dl>
       </#list>
     </div>
    <div class="clr"></div>
    <ul class="title">
    <#list last10Article as article1>
       <li><a href="/u/${article1.id?string('#')}">${article1.title}</a></li>
    </#list>
     </ul>
  </div>
 </div>
<div class="clr"></div>
<div id="banner"><img src="/union/images/banner.jpg" height="100" width="800" /></div>
<div class="main_right">
   <div id="tab">
    <h3 class="up" onclick="go_to(1);">判断为真传闻</h3>
    <div class="block">
       <ul class="list">
       	<#if suggestList?exists>
	  		<#list suggestList as article3>
	  		<#if article3?exists>
        <li><a href="/u/${article3.id?string('#')}">${article3.title}</a></li>
        </#if>
	  		</#list>
	  		</#if>
      </ul>
     </div>
    <h3 onclick="go_to(2);">判断为假传闻</h3>
    <div>
       <ul class="list">
       	<#if againstList?exists>
	  		<#list againstList as article>
	  		<#if article?exists>
        <li><a href="/u/${article.id?string('#')}">${article.title}</a></li>
        </#if>
	  		</#list>
	  		</#if>
      </ul>
     </div>
  </div>
   <div id="banner_ad"><img src="/union/images/2.jpg" /></div>
   <div id="week">
    <h3>本周看点</h3>
    <ul class="list">
       	<#if weekList?exists && weekList.size() &gt; 0>
	  		<#list weekList as article>
	  		<#if article?exists>
        <li><a href="/u/${article.id?string('#')}">${article.title}</a></li>
        </#if>
	  		</#list>
	  		</#if>
      </ul>
  </div>
 </div>
<div class="main_left">
   <div class="main_new">
    <h1><span>推荐传闻</span><em><!--<a href="/union/tuijianArticles.action">>>more&nbsp;&nbsp;</a>--></em></h1>
    <div class="clr"></div>
    <ul class="title">
    <#if hottestList?exists>
	  <#list hottestList as article2>
       <li><a href="/u/${article2.id?string('#')}">${article2.title}</a></li>
		</#list>
	  </#if>
     </ul>
  </div>
   <div id="ad_pic">
    <div id="pic"><a href="http://www.chuanwen.com.cn/r/2811" target="_blank"><img src="/union/images/index2.gif" width="100" height="100" border="0" /></a><a href="http://www.chuanwen.com.cn/r/2809" target="_blank"><img src="/union/images/index3.gif" width="100" height="100" border="0" /></a><a href="http://www.chuanwen.com.cn/r/2890" target="_blank"><img src="/union/images/index4.gif" width="100" height="100" border="0" /></a><a href="http://www.chuanwen.com.cn/r/2615" target="_blank"><img src="/union/images/index5.gif" width="100" height="100" border="0" /></a>
       <div class="clr"></div>
     </div>
    <div id="ad_word">
       <ul class="l">
        <li><a href="http://www.chuanwen.com.cn/r/2972" target="_blank">超色毛巾美女脱衣</a></li>
        <li><a href="http://www.chuanwen.com.cn/r/2650" target="_blank">网络美女网络美女</a></li>
        <li><a href="http://www.chuanwen.com.cn/r/1376" target="_blank">刘亦菲的春闺秘史</a></li>
        <li><a href="http://www.chuanwen.com.cn/r/1551" target="_blank">李丽珍的3P荒淫史</a></li>
        <li><a href="http://www.chuanwen.com.cn/r/1630" target="_blank">劲舞AU的裸聊实录</a></li>
      </ul>
       <ul class="r">
        <li><a href="http://www.chuanwen.com.cn/r/2586" target="_blank">女星写真拍摄内幕</a></li>
        <li><a href="http://www.chuanwen.com.cn/r/2998" target="_blank">陈瑀涵火辣婚纱照</a></li>
        <li><a href="http://www.chuanwen.com.cn/r/2997" target="_blank">三级艳星婚姻秘史</a></li>
        <li><a href="http://www.chuanwen.com.cn/r/2668" target="_blank">李宇春MM变大原因</a></li>
        <li><a href="http://www.chuanwen.com.cn/r/2808" target="_blank">我们身边的食人族</a></li>
      </ul>
       <div class="clr"></div>
     </div>
  </div>
 </div>
<div class="clr"></div>
<div id="foot"><#if uu?exists >${uu.footer?if_exists}</#if></div>
</body>
 </html>
<script type="text/javascript">
 <!--
 var h=document.getElementById("tab").getElementsByTagName("h3");
 var d=document.getElementById("tab").getElementsByTagName("div");
 function go_to(ao){
  for(var i=0;i<h.length;i++){
   if(ao-1==i){
   h[i].className+=" up";
   d[i].className+=" block";
   }
   else {
   h[i].className=" ";
   d[i].className=" ";
   }
  }
 }
 var h1=document.getElementById("tab1").getElementsByTagName("h3");
 var d1=document.getElementById("tab1").getElementsByTagName("div");
 function go_to1(ao){
  for(var i=0;i<h.length;i++){
   if(ao-1==i){
   h1[i].className+=" up";
   d1[i].className+=" block";
   }
   else {
   h1[i].className=" ";
   d1[i].className=" ";
   }
  }
 }
 //-->
 </script>
 