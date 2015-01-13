<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta content="all" name="robots" />
<meta name="Copyright" content="www.chuanwen.com.cn" />
<meta name="description" content="${descript?if_exists}" />
<#assign keyword="">
<#if allLabels?exists><#list allLabels as label><#assign keyword=keyword+label+','> <#if label_index=2><#break></#if></#list></#if>
<#assign keyword1="">
<#if allLabels?exists><#list allLabels as label><#assign keyword1=keyword1+label+','></#list></#if>
<#if keyword1!="">
<meta name="keywords" content="${keyword1?substring(0,keyword1?length-1)}"/>
</#if>
<link rel="icon" href="${base}/images/favicon.ico" type="image/x-icon" />
<link rel="shortcut icon" href="${base}/images/favicon.ico" type="image/x-icon" /> 
<#if article?exists>
<title>${article.title}-第#{articlePage.currentPage+1}页-传闻网</title>
<#else>
<title>传闻网 - 传闻由我</title>
</#if>
<link rel="stylesheet" href="${base}/style/layout.css" type="text/css" media="all"  />
<link rel="stylesheet" href="${base}/style/basic.css" type="text/css" media="all"  />
<link href="${base}/style/header.css" rel="stylesheet" type="text/css" />
<link href="${base}/style/chapter_detail.css" rel="stylesheet" type="text/css" />
<link href="${base}/style/footer.css" rel="stylesheet" type="text/css" />
<link href="${base}/SpryAssets/SpryTabbedPanels.css" rel="stylesheet" type="text/css" />
<script src="${base}/SpryAssets/SpryTabbedPanels.js" type="text/javascript"></script>
<script src="${base}/js/show_hide.js" type="text/javascript"></script>
<script type="text/javascript" src="${base}/FCKeditor/fckeditor.js"></script>
<script type="text/javascript" src="${base}/js/prototype.js"></script>
<script type="text/javascript" src="${base}/js/validObj.js"></script>
 <script   type="text/javascript">   
  function menu_display(t_id){//显示隐藏程序   
  var t_id = document.getElementById(t_id);//表格ID   
    
   t_id.style.display=""; 
  }   
  
  function csan(obj,sta){
obj = document.getElementById(obj)
eval("obj.style.display=\""+sta+"\"");
}
  </script> 
</head>

<body id="towColLayout3" class="channel">
<!--wrapper start-->
<div id="wrapper">

<#include "/ftl/header.ftl">
<!-- ad words start -->
<!-- ad words end -->

<!--primaryContent start-->
<div id="primaryContent">
<div id="chapter_detail_right">
<dl>
<#if clewList?exists && clewList.size() &gt; 0>
	<dt>本文章线索<div id="cha" style="position:absolute; right:-10px; top:-10px; z-index:20;"><a href="javascript:"><img src="/images/cha.gif" border="0" title="插入线索" onclick="if(needLogin()){window.open('${base}/remark!forwardAdd.action?articleId=#{article.id}');}"/></a></div></dt>
	<#list clewList as clew>
        <dd>·<a href="${base}/showRemark!showClew.action?remarkId=#{clew.id}">${clew.title}</a></dd>
    </#list>
<#else>
	<dt>本文章线索<div id="cha" style="position:absolute; right:-10px; top:-10px; z-index:20;"><a href="javascript:"><img src="/images/cha.gif" border="0" title="插入线索" onclick="if(needLogin()){window.open('${base}/remark!forwardAdd.action?articleId=#{article.id}');}"/></a></div></dt>
	<dd><font color="#999999">·本文章暂无线索</font></dd>
</#if>
<#if 1=2 && clewList?exists && clewList.size() &gt; 6><dd class="more_right"><a class="link_black" href="#">More...</a>&nbsp;&nbsp;</dd></#if>
</dl>

<dl>
<dt>昨日回顾</dt>
<#if yestodayArticleList?exists && yestodayArticleList.size() &gt; 0>
	<#list yestodayArticleList as art>
        <dd>·<a href="${base}/r/#{art.id}">${art.title}</a></dd>
    </#list>
</#if>
</dl>

<dl>
<dt>本周最热</dt>
<#if weekList?exists && weekList.size() &gt; 0>
	<#list weekList as art>
        <dd>·<a href="${base}/r/#{art.id}">${art.title}</a></dd>
    </#list>
</#if>
</dl>

<!--广告列表-->
<#if adsList?exists && adsList.size() &gt; 0>
<#list adsList as map>
<div style="text-align:center; margin:10px 0; padding:0;">
<a href="${map.url}" target="_blank"><img src="${map.pic}" height="50" width="240" border="0" style="border:1px solid #CCCCCC"/></a>
</div>
</#list>
</#if>

</div>

</div>
<!--primaryContent end-->


<div id="sideContent">

<h2 class="h2">${article.title}</h2>
<div id="info">上传者：<a href="${base}/user/viewuser?memberId=#{article.memberId}" class="link_color1" title="查看作者信息" alt="查看作者信息">${articleAuthor}</a>&nbsp;&nbsp;发表日期：${article.createDate?string("yyyy-MM-dd")}  截至时间：<#if article.endDate??>${article.endDate?string("yyyy-MM-dd")}<#else>未指定</#if><#--  <span class="link_color2">票数：#{article.rate!""}</span>  -->标签：<span id="tagSpan"><#if allLabels?exists><#list allLabels as label><a href="${base}/search/search.action?qs=${stack.findValue("@com.cc.cw.util.URLCoderUtil@encode('${label}','UTF-8')")}&search=all&pn=1" title="${label}" alt="${label}" class="link_color1">${label}&nbsp;&nbsp;</a><#if label_index=2><#break></#if></#list></#if><#if 1=2 && allLabels?exists && allLabels.size() &gt; 3><a class="link_color3" href="#">More...</a></#if></span>&nbsp;&nbsp;<a class="link_color3" href="javascript:" onclick="return showAddLabelSpan();">添加标签</a>
			<span id="label" style="display: none"><input type="text" id="labelContent"/>
                <input type="button" value="save" onclick="return addLabel();">
            </span></div>

<div id="info">
<#if article.state=1>
一次投票结果为<#if article.voteResultType==1><font color='green'>真<#else><font color='red'>假</#if></font>　　
<#if article.firstResult?exists && article.firstResult!="">
<font color='green'>${article.firstResult?substring(0,article.firstResult?index_of(':'))}</font>:<font color='red'>${article.firstResult?substring(article.firstResult?index_of(':')+1)}</font>　　
</#if>
<a class="link_red" href="#" onclick="return subForm();">您想发起二次投票，纠正错误结果么？</a>
<#elseif article.state=2>
    <font color="red">二次投票火热进行中！</font>　　
    <#if article.firstResult?exists && article.firstResult!="">
    <#assign f_true="${article.firstResult?substring(0,article.firstResult?index_of(':'))}">
	<#assign f_false="${article.firstResult?substring(article.firstResult?index_of(':')+1)}">
    一次投票结果为<#if f_true?number < f_false?number><font color='red'>假<#else><font color='green'>真</#if></font>　　
    <font color='green'>${f_true}</font>:<font color='red'>${f_false}</font>　　
    </#if>
<#elseif article.state=3>
二次投票结果为<#if article.voteResultType==1><font color='green'>真<#else><font color='red'>假</#if></font>
<#if article.firstResult?exists && article.firstResult!="">
<#assign f_true="${article.firstResult?substring(0,article.firstResult?index_of(':'))}">
<#assign f_false="${article.firstResult?substring(article.firstResult?index_of(':')+1)}">
<br/>一次投票结果为<#if f_true?number < f_false?number><font color='red'>假<#else><font color='green'>真</#if></font>　　
    <font color='green'>${f_true}</font>:<font color='red'>${f_false}</font>　
</#if>
</#if>
</div>

<div id="vote">


<div id="true">
<!--<a onclick="toggle('vote_true');return false;" href="#" title="请点击投票"></a>
<dl onmouseout="toggle('vote_true');return false;" id="vote_true">-->
<A title=请点击投票 href="javascript:voteForArticle(#{article.id},'Support');"></A>
</div>
<div id="votes_true">#{article.supportCount}</div>

<div id="false">
<!--<a onclick="toggle('vote_false');return false;" href="#" title="请点击投票"></a>
<dl id="vote_false" onmouseout="toggle('vote_false');return false;">-->
<A title=请点击投票 href="javascript:voteForArticle(#{article.id},'UnSupport');"></A>


</div>
<div id="votes_false">#{article.unSupportCount}</div>

</div>

<div class="<#if article.state=1 || article.state=3><#if article.voteResultType=1>true<#else>false</#if></#if>" id="chapter_detail_content">
  <p>${articlePage.currentContent}</p>
</div>
<br/>
<#if articlePage.totalPage gt 1>
<center>
	<#if articlePage.currentPage lte 0>上一页<#else>
	<a href="/r/#{articleId}/#{articlePage.prevPage}"><font color="blue">上一页</font></a></#if>
	<#if articlePage.currentPage gte articlePage.totalPage-1>下一页<#else>
	<a href="/r/#{articleId}/#{articlePage.nextPage}"><font color="blue">下一页</font></a></#if>
</center>
</#if>
<br/>
<div style="font-size:13px; font-weight:500; color:#0000FF; margin:10px 0;">声明：该内容由网友自行上传，并不代表传闻网赞同文章中的观点，传闻网杜绝一切反动、色情以及其他不良信息。</div>
<br/>
<div id="control_chapter" valign="middle">
<#if fromUrl?exists && fromUrl?length gt 0>
<a href="${fromUrl}" target="_blank"><font color="blue">查看原文</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
</#if>
<#if article.channelId = 0><a href="#" onclick="return showStartDiv();"><img src="${base}/images/btn_fqtp.gif" /></a></#if> 
<a href="#" onclick="return showChannelDiv();" ><img src="${base}/images/btn_slwz.gif" /></a>
<#if Session['member']?exists && article.memberId == Session['member'].id>
&nbsp;<a href="#"><img src="/images/sendbroadcast.gif" title="发送广播" onclick="document.broadcastform.submit();"/></a>
<form name="broadcastform" method="post" action="/user/broadcast.action" target=_blank>
	<input type="hidden" name="articleTitle" value="${article.title}"/>
	<input type="hidden" name="articlehref" value="http://www.chuanwen.com.cn/r/#{article.id}"/>
</form>
</#if>
<#--<#if article.state=1><a class="link_red" href="#" onclick="return subForm();">您想发起二次投票，纠正错误结果么？</a>
<#elseif article.state=2>
    <font color="red">二次投票火热进行中！</font>
<#elseif article.state=3>
</#if>-->
<dd><span id="chlDiv1" style="display: none" >
    <form action="${base}/addtochannel!reference.action" method="post" onsubmit="return checkCollForm();">
        <input type="hidden" name="articleId" value="#{article.id}" />
        <input type="hidden" name="toPage" value="rumour" />
         <#if channelList?exists && channelList.size() &gt; 0>
            请选择频道：<select name="chlId" id="chlId">
                        <option value="-1">请选择频道</option>
                <#list channelList as channel>
                   <option value="${channel.id}">${channel.name}</option>
                 </#list>
             </select>
        	<input type="submit" value="确定" />
         <#else>
         	<font color="red">对不起！您没有任何可供收录的频道！请<a href="${base}/channelapply/channelapply.action" title="创建频道" onclick="return needLogin();">点此</a>创建频道</font>
         </#if>
    </form>
</span>
<span id="chlDiv2" style="display: none" >
    <form action="${base}/addtochannel!add.action" method="post" onsubmit="return checkStartForm();">
        <input type="hidden" name="articleId" value="#{article.id}" />
        <input type="hidden" name="toPage" value="rumour" />
         <#if channelList?exists && channelList.size() &gt; 0>
            请选择频道：<select name="chlId" id="chlId2">
                        <option value="-1">请选择频道</option>
                <#list channelList as channel>
                   <option value="${channel.id}">${channel.name}</option>
                 </#list>
             </select>
	         请指定投票天数：<input type="text" name="rate" id="rate" value="#{article.rate!""}" />
	        <input type="submit" value="确定" />
         <#else>
         	<font color="red">对不起！您没有任何可供收录的频道！请<a href="${base}/channelapply/channelapply.action" title="创建频道" onclick="return needLogin();">点此</a>创建频道</font>
         </#if>
    </form>
</span>
<span id="chlDiv3" style="display: none" >
    <form action="" method="post" id="secForm" >
        <input type="hidden" name="articleId" value="#{article.id}" />
        <input type="hidden" name="channelId" value="#{article.channelId}" />
        <input type="hidden" name="secDate" id="rate3" value="#{article.firstVoteCycle*2}" />
        <input type="submit" value="确定" />
    </form>
</span></dd></div>
<div id="xgcw">
<h3 style="font-size:14px;text-align:left;margin-left:-30px;" >相关传闻</h3><br/>
<ul style="font-size:14px">
<#if sameArticleList?exists && sameArticleList.size() &gt; 0>
    <#list sameArticleList as art>
        <#if article.id != art.id><li><a href="${base}/r/#{art.id}"><font color="blue">·${art.title}</font></a></li></#if>
    </#list>
<#else>
</#if>
</ul>
</div>
<a name="newClew"></a>
<div id="xgpl">
<h4>相关评论</h4>
<table id="pl" width="100%" border="0" cellpadding="0" cellspacing="0">
   <#if allRemark?exists>
        <#list allRemark as map>
          <tr>
            <td height="24" align="center" valign="middle"><img src="${base}/images/icon_xgpl.gif" width="22" height="17" /></td>
            <td><a class="link_bold" href="${base}/user/viewuser?memberId=${map.memberId}" title="查看作者信息" alt="查看作者信息" >${map.memberName}</a>&nbsp;
            <span class="link_color2">${map.title!""}</span>&nbsp;
            <span class="data">${map.createDate}</span></td>
          </tr>
          <tr>
            <td width="3%" height="24" align="center" valign="middle" class="border_db">&nbsp;</td>
            <td class="border_db">${map.content!""}</td>
          </tr>
        </#list>
    </#if>
</table>
<div id="pagenum">${pagnation}</div>
</div>

<div id="insert">

<div id="long_in">
<#if member?exists>
<#else>
    <span><form action="${base}/login.action" method="post">
    <input type="hidden" name="loginFlag" value="true" />
    <label>用户名：<input type="text" class="input001" name="email" id="l_email" />
    </label>
    <label>密码：<input type="password" class="input001" name="password" id="l_password" />
    </label>
    <input type="submit" value="登录" />
    <#if request.getQueryString()?exists>
		<#assign queryString = "?"+request.getQueryString()>
	<#else>
		<#assign queryString = "">
	</#if>	
	<input type="hidden" value="${request.getRequestURL() + queryString}" name="inputUrl"/>
    </form></span>
</#if>
</div>
  <div id="TabbedPanels1" class="TabbedPanels">
    <ul class="TabbedPanelsTabGroup">
      <li class="TabbedPanelsTab" tabindex="0">发表评论</li>
      <!--<li class="TabbedPanelsTab" tabindex="1">插入线索</li>-->
    </ul>
    <div class="TabbedPanelsContentGroup">
      <div class="TabbedPanelsContent">
      <form action="${base}/remark!addRemark.action" method="post" onsubmit="return remarkSubmitCheck(1);">
        <input class="input002" type="text" name="title" id="title1" value="${title!""}" onblur="remarkSubmitCheck(1);" /><span id="titleError1"><font color="red"></font></span>
        <input type="hidden" name="articleId" value="#{article.id}" />
        <input type="hidden" name="memberId" value="<#if member?exists>#{member.id}<#else>0</#if>" />
        <input type="hidden" name="type" value="0" />
        <textarea id="content1" name="content" style="WIDTH: 100%; HEIGHT: 400px">${content!""}</textarea>
	    <script type="text/javascript">
	        var oFCKeditor = new FCKeditor('content1') ;
	        oFCKeditor.BasePath = "${base}/FCKeditor/" ;
	        oFCKeditor.Width = 680;
	        oFCKeditor.Height = 200;
	        oFCKeditor.ToolbarSet = "Basic" ;
	        oFCKeditor.ReplaceTextarea();
	    </script>
        <input type="image" src="${base}/images/btn_submit.gif" />
      </form>
      </div>
      <#--
      <div class="TabbedPanelsContent">
      <form action="${base}/remark!addRemark.action" method="post" onsubmit="return remarkSubmitCheck(2);">
        <input class="input002" type="text" name="title" id="title2" value="${title!""}" onblur="remarkSubmitCheck(2);" /><span id="titleError2"><font color="red"></font></span>
        <input type="hidden" name="articleId" value="#{article.id}" />
	    <input type="hidden" name="memberId" value="<#if member?exists>#{member.id}<#else>0</#if>" />
        <input type="hidden" name="type" value="1" />
        <textarea id="content2" name="content" style="WIDTH: 100%; HEIGHT: 400px">${content!""}</textarea>
	    <script type="text/javascript">
	        var oFCKeditor = new FCKeditor('content2') ;
	        oFCKeditor.BasePath = "${base}/FCKeditor/" ;
	        oFCKeditor.Width = 680;
	        oFCKeditor.Height = 200;
	        oFCKeditor.ToolbarSet = "Basic" ;
	        oFCKeditor.ReplaceTextarea();
	    </script>
        <input type="image" src="${base}/images/btn_submit.gif" />
      </form>
      </div>
      -->
    </div>
  </div>  
 </div>
</div>
</div>
<script type="text/javascript">
<!--
var TabbedPanels1 = new Spry.Widget.TabbedPanels("TabbedPanels1");
//-->
</script>

</div>

<!--wrapper end-->

<script language="javascript">
    <#if errorMsg?exists>
        alert('${errorMsg}');
        ${session.removeAttribute("errorMsg")}
    <#else>
    </#if>

    <#if voteMsg?exists>
        alert('${voteMsg}');
    <#else>
    </#if>

    function showStartDiv(){
        <#if member?exists>
            $('chlDiv1').style.display='none';
            var chlDiv = $('chlDiv2');
            chlDiv.style.display='block';
			return false;
        <#else>
            alert("对不起！请您登录后执行此操作！");
            return false; 
        </#if>
    }

    function showChannelDiv(){
        <#if member?exists>
            $('chlDiv2').style.display='none';
            var chlDiv = $('chlDiv1');
            chlDiv.style.display='block';
			return false;
        <#else>
            alert("对不起！请您登录后执行此操作！");
            return false; 
        </#if>
    }

    
    function remarkSubmitCheck(value){
        needLogin();

        var error = $('titleError'+value);
		var title = $F('title'+value);
        if(isNull(title)){
            error.style.visibility="visible";
            error.style.color="red";
            error.innerHTML="请输入标题！";
			return false;
        }else{
            error.style.visibility="hidden";
            return true;
        }
		
	}


    //首先设置错误提示信息为隐藏
	//var note = $('errorMsg');
	//var note2 = $('errorMsg2');
	//if(note != null || note2 != null){
	//   note.style.visibility="hidden";
	//    note2.style.visibility="hidden";
    //}
    
    //判断此文章是否复合投票条件
    function canVote(){
     var x = "<span style='float:right; margin-top:-16px;' onClick=\"csan('vote_true','none')\">×</span>"
     var y = "<span style='float:right; margin-top:-16px;' onClick=\"csan('vote_false','none')\">×</span>"
        <#if member?exists>
            <#if member.id = article.memberId>
            $('vote_true').innerHTML="对不起！不能给自己的文章投票！" + x;
            $('vote_false').innerHTML="对不起！不能给自己的文章投票！" + y;
                return false; 
            </#if>
        <#else>
            //alert("对不起！请您登录后执行此操作！");
            
            return false; 
        </#if>
        <#if article.state=1 || article.state=3>
            $('vote_true').innerHTML="对不起！此文章已经结束投票！" + x;
            $('vote_false').innerHTML="对不起！此文章已经结束投票！" + y;
            return false; 
        <#elseif article.channelId = 0>
            $('vote_true').innerHTML="对不起！此文章未开始投票！" + x ;
            $('vote_false').innerHTML="对不起！此文章未开始投票！" + y;
            return false; 
        </#if>
    }
    canVote();

    function checkOnSubmit(msg,txt){
         
		var name = $F(txt);
		return isValidNum(msg,name);
		
	}

    function isValidNum(msg,name){
		var num = /^[0-9]*[1-9]\d*$/;
		var tmp = $(msg);
		if(name.match(num)){
			tmp.style.visibility="hidden";
			return true;
		}
		else{
			tmp.style.visibility="visible";
            tmp.style.color="red";
			return false;
		}
	}

    function checkCollForm(){
        var chlid = $F('chlId');
        if(chlid < 0){
            alert("请选择频道！");
            return false;
        }
    }

    function checkStartForm(){
        var chlid = $F('chlId2');
        if(chlid < 0){
            alert("请选择频道！");
            return false;
        }

        var num = /^[0-9]*[1-9]\d*$/;
        var rate = $F('rate');
        if(!rate.trim().match(num)){
            alert("请正确输入天数！！！");
            $('rate').focus();
            return false;
        }

        var cost = rate - #{article.rate};
        var str;
        if(cost < 1)
            str = '收藏该文章将花费您“${article.rate}”票！\r\n是否继续？';
        else
            str = '文章的收藏价格为“${article.rate}”票！您指定的投票日期较长，这将额外花费您'+cost+'票！\r\n是否继续？';
        
        return confirm(str);
    }

    function subForm(){
        <#if member?exists>
            var f = $('secForm');
            f.action="${base}/vote/vote!secondVote.action";
            f.method="post";
            if(confirm('二次投票将花费您“#{article.firstVoteCycle*5}”票！\r\n投票周期为“#{article.firstVoteCycle*2}”天！\r\n是否继续？')){
                f.submit();
            }else{
                return false;
            }

        <#else>
            alert("对不起！请您登录后执行此操作！");
            return false; 
        </#if>
        
    }



	function showAddLabelSpan(){
		if(needLogin())
			document.getElementById("label").style.display = '';
	}

	function addLabel(){
		tag =$F("labelContent");

		if(tag == null || tag==""){
			return ;
		}
		var url = "${base}/AddLabelProcessor.ajax";
		var pars = "labelContent="+tag+"&articleId=#{article.id}";
		
		var ajax = new Ajax.Request(
		url,
		{
			method: 'post',
			parameters: pars,
			onComplete: addLabelResponse,
			onFailure: addLabelError
		});
	}

	function addLabelResponse(XHR){
		
		var xml = XHR.responseXML;
		var statusValue = xml.getElementsByTagName("status")[0].firstChild.nodeValue;
		var labelList = xml.getElementsByTagName("label");
		var arr = new Array();
		for(var k=0;k<labelList.length;k++){
			arr[k] = labelList[k].firstChild.nodeValue;
		}
		
		if("OK"==statusValue){
			$("label").style.display = 'none';
			alert("添加成功");
			$("labelContent").value="";
			var tagSpan = document.getElementById("tagSpan");
			var tagSpanArr = new Array();
			var isSameTag = new Boolean();
			for(var i = 0 ; i < tagSpan.childNodes.length;i++){
				tagSpanArr[i] = tagSpan.childNodes[i].firstChild.nodeValue;
				
				if(tagSpanArr[i].trim() == tag.trim()){
					isSameTag = true;
				}
			}
			
			
			if(isSameTag == true){
				return;
			}else{
				var a = document.createElement("a");
			
				a.href = "${base}/search/search.action?qs="+encodeURI(arr[i])+"&search=all&pn=1";
				a.title = tag;
				var temp = tag+"  ";
				a.appendChild(document.createTextNode(temp));

				tagSpan.insertBefore(a,tagSpan.firstChild);
				if(tagSpan.childNodes.length > 3){
					tagSpan.removeChild(tagSpan.childNodes[tagSpan.childNodes.length - 1]);
				}
				
				createMoreSpan(arr);
			}
			
		}

	}

	function createMoreSpan(arr){
		var moreSpan = document.getElementById("more");
		
		if(moreSpan.childNodes.length == 0 && arr.length > 3){//页面上没有more，需要js创建more span
			var html = "";
			for(var i = 0 ; i < arr.length; i++){
				html = html + "<li><a href='${base}/search/search.action?qs="+encodeURI(arr[i])+"&search=all&pn=1' title='"+arr[i]+"' >"+arr[i]+"</a></li>";
			}
			
			moreSpan.innerHTML = "<div id=more_list>|<a href=# onclick=toggle('morecontent');return false;>more...</a><div class=morecontent_control id=morecontent><div id=cap_morecontent><h3>更多标签</h3><img onclick=toggle('morecontent'); src=${base}/images/close.gif /></div><ul id=morelist>"+html+"</ul></div>";
		}else{//页面上已经有more，需要更新more里面的数据
			if(moreSpan.childNodes.length > 0){
				var html = "";
			for(var i = 0 ; i < arr.length; i++){
				html = html + "<li><a href='${base}/search/search.action?qs="+encodeURI(arr[i])+"&search=all&pn=1' title='"+arr[i]+"' >"+arr[i]+"</a></li>";
			}
			moreSpan.innerHTML = "<div id=more_list>|<a href=# onclick=toggle('morecontent');return false;>more...</a><div class=morecontent_control id=morecontent><div id=cap_morecontent><h3>更多标签</h3><img onclick=toggle('morecontent'); src=${base}/images/close.gif /></div><ul id=morelist>"+html+"</ul></div>";
			}
			
		}
	}


	function addLabelError(){
		alert("error");
	}
	
	    //投票
	function voteForArticle(id,type){
	
	    <#if article.state=1 || article.state=3>
            alert("对不起！此文章已经结束投票！");
            return; 
        <#elseif article.channelId = 0>
            alert("对不起！此文章未开始投票！" );
            return; 
        <#else>
			<#if Session['member']?exists>
				<#if Session['member'].privilege gt 0>
			    var url="/vote/vote!voteForArticle.action";
				var pars="articleId="+id+"&voteCategory="+type;
				var myAjax=new Ajax.Updater(
				{},
				url,
				{
				method:'post',
				parameters:pars,
				onSuccess:votecallback
				});
				<#else>
				alert('票数不足');
				</#if>
			<#elseif Session['bindflag']=='no'>
				<#if Session['sessionVal'].privilege gt 0>
				var url="/vote/vote!voteForArticle.action";
				var pars="articleId="+id+"&voteCategory="+type;
				var myAjax=new Ajax.Updater(
				{},
				url,
				{
				method:'post',
				parameters:pars,
				onSuccess:votecallback
				});
				<#else>
				alert('票数不足');
				</#if>
			<#else>
				alert('该机器已经绑定，请登录后再尝试投票!');
			</#if>
		</#if>
	}
	
	function votecallback(obj){
		var msg = obj.responseText;
		if(msg == '1'){
			msg = '投票成功，感谢您投的支持票';
			var num = $('votes_true').innerHTML;
			$('votes_true').innerHTML = parseInt(num) + 1;
		}
		if(msg == '2'){
			msg = '投票成功，感谢您投的反对票';
			var num = $('votes_false').innerHTML;
			$('votes_false').innerHTML = parseInt(num) + 1;
		}
		getHeader();
		alert(msg);
	}
</script>

<#include "/ftl/footer.ftl">
</body>
</html>
