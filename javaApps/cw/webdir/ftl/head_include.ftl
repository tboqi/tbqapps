
<#include "/ftl/head_top.ftl">
  <div id="line">
    <div class="img"><img src="/images/head_logo.jpg" height="115" width="443" /></div>
    <ul>
      <li>该机器目前票数是：<span class="number">${Session['sessionVal'].privilege}</span>票，<#if Session['bindflag']?exists && Session['bindflag']=='yes'>该机器以为用户：<a href="${base}/user/viewuser?memberId=#{Session['sessionVal'].id}" target="_blank"><font color='red'>${Session['sessionVal'].userName}</font></a>绑定&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" onclick="unbindHost();"><font color='red'>解除绑定</font></a><#else>该机器还未绑定,您可以进行绑定&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" onclick="bindHost();"><font color='red'>绑定机器</font></a></#if></li>
      <li class="li2"><span id="leftTime"></span></li>
      <li style="height:10px; line-height:10px;">
        <div id="boxbar"></div>
      </li>
      <li style="position:absolute; top:110px;"><span style="display:none; position:absolute; top:110px;" id='loading'><img src='/images/loading2.gif' width='80' height='30' border='0' /></span> <a href="javascript:drawPrivilege();"><img src="/images/head_but1.jpg" width="80" height="30" border="0" /></a> <a href="javascript:absorbPrivilege();"><img src="/images/head_but2.jpg" width="80" height="30" border="0" /></a> <a href="javascript:givePrivilege(1);"><img src="/images/head_but3.jpg" width="80" height="30" border="0" /></a> </li>
    </ul>
    <div class="clr"></div>
  </div>
  <!-- line end -->
  <script type="text/javascript">
   	var now = parseInt(#{currentTime});
   	<#if Session['bindflag']?exists && Session['bindflag']=='yes' && Session['sessionVal'].lastLoginTime?exists>
   	var before = timestamp("${Session['sessionVal'].lastLoginTime?string('yyyy/MM/dd HH:mm:ss')}");
   	<#else>
	   	<#if Session['sessionVal']?exists && Session['sessionVal'].lastVisitTime?exists>
	   	var before = ${Session['sessionVal'].lastVisitTime};
	   	<#else>before = now;
	   	</#if>
   	</#if>
   	var left = getLeftMinute(now,before);
   	var bbb = document.getElementById('boxbar');
   	if(left == 0){
   		$("leftTime").innerHTML = "<font color='red'>您现在可以为该机器领3票啦!</font>";
   		bbb.innerHTML = "<b style='background-color:#BFDB09; width:100%; display:block; height:10px;'></b>"
   	}
   		var p_num;
		var left_time;
	if(left > 0){
		if(left>240){
			p_num = 1;
			left_time = left - 240;
		}else if(left>120 && left<=240){
			p_num = 2;
			left_time = left - 120;
		}else{
			p_num = 3;
			left_time = left;
		}
		var str = "还有<span id='reTime' class='number'>"+left_time+"</span>分钟，您就可以领<span id='p_num' class='number'>"+p_num+"</span>票了。";
		if(p_num == 2){
			str = str + "您现在可以领一票!";
		}
		if(p_num == 3){
			str = str + "您现在可以领两票!";
		}
		$("leftTime").innerHTML = str;
		var per = Math.ceil((120-left_time) / 1.2) ;
		bbb.innerHTML = "<b style='background-color:#BFDB09; width:" + per + "%; display:block; height:10px;'></b>";
	}
	</script>