  <div id="left">
    <div id="userinfo">
      <ul>
        <li class="shadowcontainer">
          <div class="innerdiv"><#if viewMember?exists && viewMember.coverPath?exists && viewMember.coverPath != ""><img src="${viewMember.coverPath!""}" width="155" height="175" /><#else><img src="${base}/images/icon_user.gif" width="155" height="175" /></#if></div>
        </li>
        <li>昵称：${viewMember.userName}</li>
        <li>票数：#{viewMember.privilege}</li>
        <li></li>
        <#if member?exists>
   		 <#if memberId != member.id>
        <li><img src="/images/manage_icon_01.jpg" /><a href="#addFriend" onclick="showCommentSpan();"><font color="#666666" >加为好友</font></a><img src="/images/manage_icon_03.jpg" /><a href="#" onclick="return sendMsg('#{viewMember.id}');"><font color="#666666">发送短信</font></a></li>
        <li><img src="/images/manage_icon_02.jpg" /><a href="#sendMessage" onclick="showMessageDiv();"><font color="#666666" >给我留言</font></a><img src="/images/manage_icon_04.jpg" /><a href="#sendPrivilege" onclick="showPrivilegeSpan();"><font color="#666666">募捐票箱</font></a></li>
     	 </#if>
		</#if>
		<div id="messageDiv" style="display: none">
    	<h2>给我留言</h2>
    	<form id="form1" name="form1" method="post" action="${base}/user/friend!sendMessage.action" onsubmit="return submitCheck();">
    	  <@ww.token name="fr"/>
     	  <input type="hidden" name="friendId" value="#{viewMember.id}" />
    	  <textarea class="textarea01" name="content" id="msgContent" rows="3">${msgContent!""}</textarea>
          <input class="input_image01" type="image" src="${base}/images/btn_submit.gif" alt="提交留言" title="提交留言" />
   		 </form>
         </div>
		<span id="commentSpan" style="display: none">
		<form action="${base}/user/friend!addThisFriend.action" method="post">
        <@ww.token name="fr"/>
        <input type="hidden" name="friendId" value="#{viewMember.id}" />
        <input type="hidden" name="memberId" value="#{viewMember.id}" />
        
        <#if member?exists>
        	<#if isMyFriend?exists>
        		<#if isMyFriend = "1">
        		<font color=red>您好！该用户已经是您的好友！您可以到<a href="${base}/addfriend!myFriend.action" title="进入管理页面" alt="进入管理页面" >"管理"</a>页面给他/她发短消息！</font>
        		<#elseif isMyFriend = "-1">
        		<font color=red>您好！该用户已被您放入黑名单！您可以到<a href="${base}/addfriend!myFriend.action?state=-1" title="进入管理页面" alt="进入管理页面" >"管理"</a>页面给将他/她恢复为好友！</font>
        		<#elseif isMyFriend = "0">
        		<font color=red>您好！该用户已向您发送好友请求！您可以到<a href="${base}/addfriend!myFriend.action?state=0" title="进入管理页面" alt="进入管理页面" >"管理"</a>页面给将他/她加为好友！</font>
        		</#if>
       		<#else>
	            <br>请输入验证请求：<input type="text" id="comment" name="comment" />
	            <br><input type="submit" value="确定" />
            </#if>
        <#else>
            <br><font color=red>对不起！您需要登录后才能添加好友！</font>
        </#if>
    	</form>
    	</span>
	<span id="privilegeSpan" style="display: none">
		<form action="${base}/user/friend!privilege.action" method="post">
		<@ww.token name="pr"/>
		<input type="hidden" name="friendId" value="#{viewMember.id}" />
		<input type="hidden" name="memberId" value="#{viewMember.id}" />
		<#if member?exists>
		    <br>您目前所剩的票数为：${member.privilege!""}&nbsp;
		    <br>请输入要赠送的票数：<input type="text" id="privilege" name="privilege"/>
		    <br><input type="submit" value="确定" />
		<#else>
		<br><font color=red>对不起！您需要登录后才能赠送票数！</font>
		</#if>
		</form>
	</span>
      </ul>
    </div>

    <div class="pic_bar">
      <div class="fri">
        <h1><span>最近登陆</span><em>>><a href="#" title="查看更多">more</a>&nbsp;</em></h1>
        <div class="pic1">
          <div class="pic2"> <#if friendList?size gt 0><a href="/user/viewuser?memberId=${friendList[0].id?string('#')}"><img <#if friendList[0].coverPath?exists && friendList[0].coverPath!=''>src="${friendList[0].coverPath}"<#else>src="${base}/images/icon_user.gif"</#if> width="75" height="80" /></a><span><a href="/user/viewuser?memberId=${friendList[0].id?string('#')}">${friendList[0].userName?if_exists}</a></span><#else>目前暂无好友</#if></div>
          <div class="pic3"> <#if friendList?size gt 1><a href="/user/viewuser?memberId=${friendList[1].id?string('#')}"><img <#if friendList[1].coverPath?exists && friendList[1].coverPath!=''>src="${friendList[1].coverPath}"<#else>src="${base}/images/icon_user.gif"</#if> width="75" height="80" /></a><span><a href="/user/viewuser?memberId=${friendList[1].id?string('#')}">${friendList[1].userName?if_exists}</a></span></#if></div>
          <div class="clr"></div>
        </div>
        <div class="pic1">
          <div class="pic2"> <#if friendList?size gt 2><a href="/user/viewuser?memberId=${friendList[2].id?string('#')}"><img <#if friendList[2].coverPath?exists && friendList[2].coverPath!=''>src="${friendList[2].coverPath}"<#else>src="${base}/images/icon_user.gif"</#if> width="75" height="80" /></a><span><a href="/user/viewuser?memberId=${friendList[2].id?string('#')}">${friendList[2].userName?if_exists}</a></span></#if></div>
          <div class="pic3"> <#if friendList?size gt 3><a href="/user/viewuser?memberId=${friendList[3].id?string('#')}"><img <#if friendList[3].coverPath?exists && friendList[3].coverPath!=''>src="${friendList[3].coverPath}"<#else>src="${base}/images/icon_user.gif"</#if> width="75" height="80" /></a><span><a href="/user/viewuser?memberId=${friendList[3].id?string('#')}">${friendList[3].userName?if_exists}</a></span></#if></div>
          <div class="clr"></div>
        </div>
      </div>
    </div>
    <div class="pic_bar">
      <div class="fri">
        <h1><span>最新加入</span><em>>><a href="#" title="查看更多">more</a>&nbsp;</em></h1>
        <div class="pic1">
          <div class="pic2"> <#if newfriendList?size gt 0><a href="/user/viewuser?memberId=${newfriendList[0].id?string('#')}"><img <#if newfriendList[0].coverPath?exists && newfriendList[0].coverPath!=''>src="${newfriendList[0].coverPath}"<#else>src="${base}/images/icon_user.gif"</#if> width="75" height="80" /></a><span><a href="/user/viewuser?memberId=${newfriendList[0].id?string('#')}">${newfriendList[0].userName?if_exists}</a></span><#else>目前暂无好友</#if></div>
          <div class="pic3"> <#if newfriendList?size gt 1><a href="/user/viewuser?memberId=${newfriendList[1].id?string('#')}"><img <#if newfriendList[1].coverPath?exists && newfriendList[1].coverPath!=''>src="${newfriendList[1].coverPath}"<#else>src="${base}/images/icon_user.gif"</#if> width="75" height="80" /></a><span><a href="/user/viewuser?memberId=${newfriendList[1].id?string('#')}">${newfriendList[1].userName?if_exists}</a></span></#if></div>
          <div class="clr"></div>
        </div>
        <div class="pic1">
          <div class="pic2"> <#if newfriendList?size gt 2><a href="/user/viewuser?memberId=${newfriendList[2].id?string('#')}"><img <#if newfriendList[2].coverPath?exists && newfriendList[2].coverPath!=''>src="${newfriendList[2].coverPath}"<#else>src="${base}/images/icon_user.gif"</#if> width="75" height="80" /></a><span><a href="/user/viewuser?memberId=${newfriendList[2].id?string('#')}">${newfriendList[2].userName?if_exists}</a></span></#if></div>
          <div class="pic3"> <#if newfriendList?size gt 3><a href="/user/viewuser?memberId=${newfriendList[3].id?string('#')}"><img <#if newfriendList[3].coverPath?exists && newfriendList[3].coverPath!=''>src="${newfriendList[3].coverPath}"<#else>src="${base}/images/icon_user.gif"</#if> width="75" height="80" /></a><span><a href="/user/viewuser?memberId=${newfriendList[3].id?string('#')}">${newfriendList[3].userName?if_exists}</a></span></#if></div>
          <div class="clr"></div>
        </div>
      </div>
    </div>
    <#--<div class="pic_bar">
      <div class="fri">
        <h1><span>最近来访</span><em>>><a href="#" title="查看更多">more</a>&nbsp;</em></h1>
        <div class="pic1">
          <div class="pic2"> <a href="#"><img src="images/manage_head_02.jpg"></a><span><a href="#">陆军上校</a></span></div>
          <div class="pic3"> <a href="#"><img src="images/manage_head_03.jpg" width="75" height="80"></a><span><a href="#">陆军上校</a></span> </div>
          <div class="clr"></div>
        </div>
        <div class="pic1">
          <div class="pic2"> <a href="#"><img src="images/manage_head_04.jpg" width="75" height="80"></a><span><a href="#">陆军上校</a></span></div>
          <div class="pic3"> <a href="#"><img src="images/manage_head_05.jpg" width="75" height="80"></a><span><a href="#">陆军上校</a></span> </div>
          <div class="clr"></div>
        </div>
      </div>
    </div>-->
  </div>
<script language="javascript">
    <#--<#if msg?exists>
	    alert('${msg}');
	    ${session.removeAttribute("msg")}
	<#else>
	</#if>
	-->
    function submitCheck(){
        var value = $F('msgContent');
	var mExist;
	<#if member?exists>
		mExist = true;
	<#else>
		mExist = false;
	</#if>
        if(value == "" || value.trim() == ""){
            alert("请输入留言内容！");
            $('msgContent').focus();
            return false;
        }else if(mExist == false){
		alert("请先登录再执行此操作");
		return false;
	}
        return true;
    }
	
	function showMessageDiv(){
		$('messageDiv').style.display = '';
	    $('commentSpan').style.display = 'none';
		$('privilegeSpan').style.display = 'none';
	}
	function showCommentSpan(){
		//$('title').innerHTML = "请输入验证请求：";
		$('commentSpan').style.display = '';
		$('privilegeSpan').style.display = 'none';
		$('messageDiv').style.display = 'none';
		//return false;
	}
	function showPrivilegeSpan(){
		//$('title').innerHTML = "请输入要赠送的票数：";
		$('privilegeSpan').style.display = '';
        $('commentSpan').style.display = 'none';
        $('messageDiv').style.display = 'none';
	}

	function sendMsg(friendId){
        <#if member?exists>
        <#else>
            alert("对不起！请先登录再进行操作！");
            return false;
        </#if>
        MM_openBrWindow('${base}/shortmsg!sendMsg.action?fId='+friendId+'&ran='+Math.random(),'find','modal=yes,width=415,height=280');
        //window.open('${base}/shortmsg!toFrame.action?fId='+friendId+'&ran='+Math.random(),window,'dialogWidth=420px;dialogHeight=300px;center=yes;status=no');
    }
</script>
  