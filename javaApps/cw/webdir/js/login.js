function login_validate(){
	return true;
}

function login_reset(){
	$("loginForm").reset();
}

function login_submit(){
	if(login_validate)
		$("loginForm").submit();
}


function regist_validate(){
	return true;
}

function regist_reset(){
	$("registForm").reset();
}

function regist_submit(){
	if(regist_validate)
		$("registForm").submit();
}

function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}

function reportError(msg,url,line) {
	//var str = "You have found an error as below: \n\n";
	//str += "Err: " + msg + " on line: " + line;
	//alert(str);
	return true;
}

function timestamp(date){
    //var timestamp = Date.parse(new Date());
    var timestamp = Date.parse(new Date(date));
    return timestamp;
}
function getLeftMinute(now,before){
   		var left = (before+6*60*60*1000)-now;
   		//alert("now"+now);
   		//alert("before"+before);
   		//alert("left:"+left);
   		if(left>0){
   			var l = left/1000/60;
   			var ll = Math.ceil(l);
   			//alert("ll:"+ll);
   			return ll;
   		}else{
   			return 0;
   		}
}
function refreshTime(){
    var left = document.getElementById('reTime').innerHTML;
    if(left>1){
    	$('reTime').innerHTML=left-1;
    	var per = Math.ceil((120-left) / 1.2) ;
		var bbb = document.getElementById('boxbar');
		bbb.innerHTML = "<b style='background-color:#BFDB09; width:" + per + "%; display:block; height:10px;'></b>"
    	
    }else if(left==1){
    	var p_num = document.getElementById('p_num').innerHTML;
    	if(p_num == 3){
    		var bbb = document.getElementById('boxbar');
			bbb.innerHTML = "<b style='background-color:#BFDB09; width:100%; display:block; height:10px;'></b>"
    		$('leftTime').innerHTML="<font color='red'>您现在可以为该机器领3票啦!</font>";
    	}else if(p_num < 3){
    		p_num++;
    		var bbb = document.getElementById('boxbar');
			bbb.innerHTML = "<b style='background-color:#BFDB09; width:0%; display:block; height:10px;'></b>"
			var str = "还有<span id='reTime' class='number'>"+120+"</span>分钟，您就可以领<span id='p_num' class='number'>"+p_num+"</span>票了！";
			if(p_num == 2){
				str = str + "您现在可以领一票!";
			}
			if(p_num == 3){
				str = str + "您现在可以领两票!";
			}
			$("leftTime").innerHTML = str;
    	}
    	/*var bbb = document.getElementById('boxbar');
		bbb.innerHTML = "<b style='background-color:#BFDB09; width:100%; display:block; height:10px;'></b>"
    	$('leftTime').innerHTML="<font color='red'>您现在可以为该机器领票啦!</font>";*/
    }
}

window.onerror = reportError;