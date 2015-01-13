<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript" src="${base}/js/prototype.js"></script>
<title>发送广播</title>
<style type="text/css">
*{
	margin:0;
	padding:0;
	}
body{
	font-size:12px;
	}
label{
	float:left;
	width:100px;
	text-align:right;
	}
#user_login{
	width:550px;
	height:300px;
	border:2px solid #A94AA6;
	margin:0;
	padding:10px 30px 20px 30px;
	}
h1{
	font-size:13px;
	font-weight:bold;
	color:#A94AA6;
	height:25px;
	line-height:25px;
	}
h1 em{
	float:right;
	margin-top:-25px;
	margin-right:5px;
	font-style:normal;
	}
h1 em a{
	color:#A94AA6;
	text-decoration:none;
	}
#user_login .dd1{
	height:30px;
	line-height:30px;
	}
#user_login .dd2{
	text-align:center;
	}
#user_login .dd2 input{
	margin:10px 30px;
	}
.inp2{
	height:16px;
	width:315px;
	}
textarea{
	width:320px;
	height:100px;
	}
#tab {
	width:500px;
	position:relative;
	height: 230px;
}
html > body #tab {
	width:500px;
	margin: 0 auto;
}
#tab div {
position:absolute;
top:26px;
left:0;
width:490px;
height:200px;
border:solid #eee;
border-width:0 1px 1px;
}
#tab div {
display:none;
}
#tab .block {
display:block;
border-top:#eee solid 1px;
}
#tab h3 {
float:left;
width:114px;
height:26px;
line-height:26px;
margin:0 -1px 0 0;
font-size:13px;
cursor:pointer;
font-weight:800;
text-align:center;
color:#00007F;
background-color:#eeeeee;
}
#tab .up {
	border-left:#EEEEEE solid 1px;
	border-right:#EEEEEE solid 1px;
	border-top:#EEEEEE solid 1px;
	background-color:#FFFFFF;
}
#tab ul {
margin:15px 0 0;
list-style:none;
padding:0;
}
</style>
</head>
<body>
<#if msg?exists && msg !=''>
<script type="text/javascript">
alert('${msg}');
window.opener="xxx";  //如果有含此语句则不提示是否关闭
window.close(); 	
</script>
</#if>
<#if message?exists && message !=''>
<script type="text/javascript">
alert('${message}');	
</script>
</#if>
<div id="user_login">
   <h1>发送广播<em><a href="#" onclick="javascript:window.close();">×</a></em></h1>
   <div id="tab">
    <h3 class="up" onclick="go_to(1);">拉票</h3>
    <form action="/user/broadcast.action" method="post" onsubmit="checkform('1');">
    <div class="block">
       <ul>
        <li class="dd1">
           <label>文章标题：</label>
           <input id="articleTitle1" type="text" name="articleTitle" class="inp2" value="${articleTitle?if_exists}"/>
         </li>
        <li class="dd1">
           <label>链接地址：</label>
           <input id="articlehref1" name="articlehref" type="text" class="inp2" value="${articlehref?if_exists}" />
         </li>
        <li class="dd1">
           <label> 真/假：</label>
           <select name="broadcast.flag">
            <option value="0" <#if broadcast?exists && broadcast.flag == 0>checked</#if>>真</option>
            <option value="1" <#if broadcast?exists && broadcast.flag == 1>checked</#if>>假</option>
          </select>
         </li>
        <li>
           <label>内容：</label>
           <textarea name="broadcast.content" ><#if broadcast?exists>${broadcast.content?if_exists}</#if></textarea>
         </li>
         <input type="hidden" name="broadcast.sort" value="0" />
         <input type="hidden" name="actionFlag" value="addbroadcast" />
        <li class="dd2">
           <input type="image" name="imageField" id="imageField" src="/images/manage_but_sen.gif" />
           <input type="image" name="imageField2" id="imageField2" src="/images/manage_but_rep.gif" />
         </li>
      </ul>
     </div>
     </form>
    <h3 onclick="go_to(2);">募捐</h3>
    <form action="/user/broadcast.action" method="post" onsubmit="checkform('2');">
    <div>
       <ul>
        <li class="dd1">
           <label>文章标题：</label>
           <input id="articleTitle2" type="text" name="articleTitle" class="inp2" value="${articleTitle?if_exists}"/>
         </li>
        <li class="dd1">
           <label>链接地址：</label>
           <input id="articlehref2" name="articlehref" type="text" class="inp2" value="${articlehref?if_exists}" />
        </li>
        <li>
           <label>内容：</label>
           <textarea name="broadcast.content" ><#if broadcast?exists>${broadcast.content?if_exists}</#if></textarea>
         </li>
        <input type="hidden" name="broadcast.sort" value="1" />
        <input type="hidden" name="broadcast.flag" value="-1" />
        <input type="hidden" name="actionFlag" value="addbroadcast" />
        <li class="dd2">
           <input type="image" name="imageField" id="imageField" src="/images/manage_but_sen.gif" />
           <input type="image" name="imageField2" id="imageField2" src="/images/manage_but_rep.gif" />
        </li>
      </ul>
     </div>
     </form>
  </div>
 </div>
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
 //-->
 function checkform(obj){
 	var title = $F('articleTitle'+obj);
 	var href = $F('articlehref'+obj);
	if(title==''){
		alert('文章标题必须填写');
		return false;
	}
	if(href==''){
		alert('文章地址必须填写');
		return false;
	}
	return true;
 }
 </script>
 