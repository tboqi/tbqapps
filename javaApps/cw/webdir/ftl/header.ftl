<script type="text/javascript" src="${base}/js/prototype.js"></script>
<script type="text/javascript" src="${base}/js/login.js"></script>
<div id="head">

	<div id="form_login1">
		<#include "/ftl/head_top.ftl">
	</div>

      <div id="h_nav">
	<ul class="h_nav">
      <li id="current"><a href="${base}/" title="首页" id="home"><span>首页</span></a></li>
      <li><a href="${base}/channellist.html" title="频道"><span>频道</span></a></li>
      <li><a href="${base}/tags.html" title="标签"><span>标签</span></a></li>
      <#if member?exists>
      <li><a href="${base}/logout" title="登出"><span>登出</span></a></li>
      </#if>
    </ul>
    <div id="h_nav_r"><div id="h_nav_r_l" class="h_nav_r"  ><a target="_blank" href="${base}/rumour/newrumour" title="发表文章" onclick="return needLogin();">发布传闻</a>
    <a target="_blank" href="${base}/channelapply/channelapply" title="创建频道" onclick="return needLogin();">创建频道</a></div>
    <div id="h_nav_r_r" class="zihei">
    <form id="formsearch" name="formearch" action="${base}/search/search?pn=1" method="post">
        <input name="search" type="radio" value="article" <#if search?exists><#if  search="article">checked="checked"</#if><#if  search="all">checked="checked"</#if><#else>checked</#if> /><label>文章</label>
        <input name="search" type="radio" value="channel" <#if search?exists &&search="channel">checked="checked"<#else></#if> /><label>频道</label>
        <input name="search" type="radio" value="remark" <#if search?exists &&search="remark">checked="checked"<#else></#if> /><label>评论</label>
        <input class="textbox2" type="text" name="qs" id="" value="${qs!""}" />
        &nbsp;&nbsp;
        <input type="image" name="Submit2" value="提交" src="/images/head_but4.jpg" style="margin-bottom:-6px;" />
    </form>
    </div>
    </div>
  </div>
  <!-- nav end -->
</div>
<script type="text/javascript">
    function needLogin(){
        <#if member?exists>
	    return true;
        <#else>
            alert("对不起！请您登录后执行此操作！");
            return false; 
        </#if>
    }

function privilegecallback(obj){
getHeader();
alert(obj.responseText);
}

    //送票
    function givePrivilege(num){
    	if(!needLogin()){
   			return false;
   		}
	    var url="/privilege!givePrivilege.action";
		var pars="nVotes=1";
		var myAjax=new Ajax.Updater(
		{},
		url,
		{
		method:'post',
		parameters:pars,
		onSuccess:privilegecallback
		});
    }
    //吸票
    function absorbPrivilege(){
   		if(!needLogin()){
   			return false;
   		}
    	var url="/privilege!absorbPrivilege.action";
		var myAjax=new Ajax.Updater(
		{},
		url,
		{
		method:'post',
		onSuccess:privilegecallback
		});
    }
    //领票
    function drawPrivilege(){
    	var ldiv = $('reTime');
    	if(ldiv == null){
    	    var url="/privilege!drawPrivilege.action";
			var myAjax=new Ajax.Updater(
			{},
			url,
			{
			method:'post',
			onSuccess:privilegecallback
			});
    	}
    	var left1 = ldiv.innerHTML;
    	if(left1>1){
    		alert("领票时间未到，请稍后再试");
    		return false;
    	}
    }
    //绑定机器
    function bindHost(){
    	<#if Session?exists && Session['member']?exists>
        var url="/privilege!bindHost.action";
		var myAjax=new Ajax.Updater(
		{},
		url,
		{
		method:'post',
		onSuccess:privilegecallback
		});
		<#else>
		alert('您还未登录，请登录后再尝试');
    	</#if>

    }
    //解除绑定
    function unbindHost(){
    	//alert('in un');
        var url="/privilege!unBindHost.action";
        var pars="password=123";
		var myAjax=new Ajax.Updater(
		{},
		url,
		{
		method:'post',
		parameters:pars,
		onSuccess:privilegecallback
		});
    }
    //刷新header
   	function getHeader(){
        var url="/privilege!getHeaderTOP.action";
		var myAjax=new Ajax.Updater(
		'form_login1',
		url,
		{
		method:'post',
		evalScripts:true
		});
    }
   // setInterval("refreshTime()",60*1000);
</script>