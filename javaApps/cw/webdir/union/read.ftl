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
</head>
<body>
<div id="nav" style="margin-bottom:5px;"><#if uu?exists >${uu.header?if_exists}</#if></div>
<div id="head"></div>
<div class="back"><a href="/u/">回到首页</a></div>
<div id="read">
  <div id="cap">${article.title}</div>
  <div id="tag">标签：<#if allLabels?exists><#list allLabels as label><a href="/u/search?qs=${stack.findValue("@com.cc.cw.util.URLCoderUtil@encode('${label}','UTF-8')")}&search=label&pn=1" title="${label}" alt="${label}" class="link_color1">${label}</a>&nbsp;&nbsp;<#if label_index=2><#break></#if></#list></#if></div>
  <div id="content"><p>${article.content}</p></div>
  <div id="if" class="red"><a href="http://www.chuanwen.com.cn/">如果您想对传闻进行投票判断真假，请登陆传闻网！</a></div>
  <dl id="about" class="back">
    <dt>相关传闻</dt>
    <#if sameArticleList?exists && sameArticleList.size() &gt; 0>
		<#list sameArticleList as art>
    <#if article.id != art.id>
    <dd><a href="/u/${art.id?string('#')}">${art.title}</a></dd>
    </#if>
		</#list>
		</#if>
  </dl>
  <div id="ad_pw"><a href="#"><img src="/union/images/2.jpg" height="80" width="240" border="0" /></a>
    <ul>
      <li><a href="http://www.chuanwen.com.cn/r/2972" target="_blank">超色毛巾美女脱衣</a></li>
	    <li><a href="http://www.chuanwen.com.cn/r/2650" target="_blank">网络美女网络美女</a></li>
	    <li><a href="http://www.chuanwen.com.cn/r/1376" target="_blank">刘亦菲的春闺秘史</a></li>
	    <li><a href="http://www.chuanwen.com.cn/r/1551" target="_blank">李丽珍的3P荒淫史</a></li>
    </ul>
    <div class="clr"></div>
  </div>
  <!--<div class="chat_cap">相关评论</div>
  <dl id="chat">
    <dt><a href="#">苍蝇屎猪人</a>&nbsp;&nbsp;Says:<span>2007-08-16  19:22</span></dt>
    <dd class="dd1"></dd>
    <dd class="dd2">
      <h1>??????????????????????</h1>
      搞得和皇帝老子结婚似的</dd>
  </dl>
  <dl id="chat">
    <dt><a href="#">苍蝇屎猪人</a>&nbsp;&nbsp;Says:<span>2007-08-16  19:22</span></dt>
    <dd class="dd1"></dd>
    <dd class="dd2">
      <h1>??????????????????????</h1>
      搞得和皇帝老子结婚似的搞得和皇帝老子结婚似的搞得和皇帝老子结婚似的搞得和皇帝老子结婚似的搞得和皇帝老子结婚似的搞得和皇帝老子结婚似的搞得和皇帝老子结婚似的搞得和皇帝老子结婚似的搞得和皇帝老子结婚似的搞得和皇帝老子结婚似的搞得和皇帝老子结婚似的搞得和皇帝老子结婚似的搞得和皇帝老子结婚似的搞得和皇帝老子结婚似的搞得和皇帝老子结婚似的搞得和皇帝老子结婚似的搞得和皇帝老子结婚似的搞得和皇帝老子结婚似的搞得和皇帝老子结婚似的搞得和皇帝老子结婚似的搞得和皇帝老子结婚似的搞得和皇帝老子结婚似的搞得和皇帝老子结婚似的搞得和皇帝老子结婚似的</dd>
  </dl>
  <div class="chat_cap">发表评论</div>
  <form>
    <dl id="Response">
      <dt>标题:
        <input name="textfield" type="text" class="input1" onFocus="this.className='input1-bor'"  onBlur="this.className='input1'" />
      </dt>
      <dd><img src="images/3.jpg" /></dd>
      <dd>
        <label>
        <input type="submit" name="Submit" value="提交评论" />
        </label>
      </dd>
    </dl>
  </form>
</div>-->
<div class="back"><a href="/u/">回到首页</a></div>
<div id="foot"><#if uu?exists >${uu.footer?if_exists}</#if></div>
</body>
</html>
