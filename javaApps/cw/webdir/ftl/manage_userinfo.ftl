<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta content="all" name="robots" />
<meta name="Copyright" content="www.chuanwen.com.cn" />
<meta name="description" content="娱乐明星,IT科技,财经股市,内幕揭秘,探索发现,网友自助发布传闻的web2.0网站,欢迎知情人报料." />
<meta content="娱乐,明星,传闻,爆料,奇闻" name="keywords" />
<link rel="icon" href="${base}/images/favicon.ico" type="image/x-icon" />
<link rel="shortcut icon" href="${base}/images/favicon.ico" type="image/x-icon" /> 
<title>个人资料 - 传闻网</title>
<link href="${base}/style/layout.css" rel="stylesheet" type="text/css" />
<link href="${base}/style/basic.css" rel="stylesheet" type="text/css" />
<link href="${base}/style/header.css" rel="stylesheet" type="text/css" />
<link href="${base}/style/usermanage.css" rel="stylesheet" type="text/css" />
<link href="${base}/style/footer.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/js/prototype.js"></script>
<script type="text/javascript" src="${base}/js/validObj.js"></script>
</head>

<body id="oneColLayout2" class="channel">
<!--wrapper start-->
<div id="wrapper">
    <#include "/ftl/header.ftl">
    </div>
    <div id="primaryContent">
        <div id="pic_ad_manage"><img src="${base}/images/pic_manage.jpg" width="980" height="100" />
        </div>
<div id="cap">
  <#include "/ftl/usermanagemenu.ftl">
  <#include "/ftl/broadcast.ftl">
</div>
<!-- left start -->

<#include "/ftl/usermanage_left.ftl">

<!-- left end-->
<div id="right">
    <div class="list_chuan">
      <h4><span>个人资料</span></h4>
    </div>
      <ul id="info">
      <form action="${base}/user/usermanage!updateCover.action" method="post" enctype="multipart/form-data" onsubmit="return checkCoverForm();" >
        <li class="li1"><#if member.coverPath?exists><#if member.coverPath != ""><img class="head" src="${member.coverPath}" /><#else><img class="head" src="${base}/images/icon_user.gif" /></#if></#if></li>
        <li>
          <label>上传头像：</label>
          <input type="file" name="doc" id="doc" />
          <input type="image" src="${base}/images/btn_upload.gif" />
        </li>
        <li>（图像大小最好为155象素×175象素，文件长度小于 50kB）</li>
     </form>
     <form action="${base}/user/usermanage!updateName.action" method="post" onsubmit="return checkNameForm(1);">
        <li>
          <label>昵&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;称： </label>
          <input type="text" id="userName" name="userName" value="${member.userName}" onblur="checkNameForm(1);" /><span id="error1"><font color="red"></font></span>
          （给自己取一个好听易记的名字吧！） </li>
        <li>
          <label>性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</label>
          <input type="radio" name="gender" value="2" <#if member.gender==2>checked</#if>/>
          男
          <input type="radio" name="gender" value="1" <#if member.gender==1>checked</#if>/>
          女
          <input type="radio" name="gender" value="0" <#if member.gender==0>checked</#if>/>
          保密</li>
        <li>
          <label>个人介绍： </label>
          <textarea name="descript">${member.descript?if_exists}</textarea>
        </li>
        <li style="color:#FF0000; text-indent:300px;">注：以上内容都要填写</li>
        <li style="text-align:center; margin:5px 0 0 0;">
          <input type="submit" name="Submit" value="提交信息" />
          <input type="reset" name="Submit2" value="重填信息" />
        </li><li style="height:20px; border-bottom:#FE9EDD dashed 1px; "></li>
        </form>
        <form action="${base}/user/usermanage!updatePwd.action" method="post" onsubmit="return checkPwdForm();">
        <li style=" font-weight:bold; height:40px; line-height:40px;">更改密码</li>
        <li>
          <label>&nbsp;&nbsp;&nbsp;&nbsp;旧密码： </label>
          <input class="hw" name="oldPassword_cnf" id="oldPassword_cnf" type="password" />
        </li>
        <li>
          <label>&nbsp;&nbsp;&nbsp;&nbsp;新密码： </label>
          <input class="hw" type="password" name="new_password" id="new_password" maxlength="15""/>
        </li>
        <li>
          <label>确认密码： </label>
          <input class="hw" type="password" name="password_cnf" id="password_cnf" maxlength="15"" />
        </li>
        <li style=" text-align:center; margin:5px 0 0 0 ;">
          <input type="submit" name="Submit3" value="确认更改" />
        </li>
        </form>
      </ul>
    </form>
  </div>

<#--        <div id="my_channel_list">
            <h1>个人资料</h1>
            <table width="92%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td><h2>个人信息</h2></td>
              </tr>
              <tr>
                <td style="border-bottom:1px dashed #FF9DDF;">
                    <table width="92%" border="0" align="center" cellpadding="0" cellspacing="0">
                        <form action="${base}/user/usermanage!updateName.action" method="post" onsubmit="return checkNameForm(1);">
                            <tr>
                                <td width="13%" height="32" align="right">注册Email：</td>
                                <td width="19%">${member.email}</td>
                                <td width="68%"><#if 1=2><input type="image" name="imageField" id="imageField" src="${base}/images/btn_changeemail.gif" /></#if></td>
                            </tr>
                            <tr>
                                <td height="32" align="right">昵称：</td>
                                <td><input type="text" id="userName" name="userName" value="${member.userName}" onblur="checkNameForm(1);" /><span id="error1"><font color="red"></font></span></td>
                                <td><input type="image" name="imageField2" id="imageField2" src="${base}/images/btn_modifynick.gif" /></td>
                            </tr>
                            <tr>
                                <td colspan="3">&nbsp;</td>
                            </tr>
                        </form>
                    </table>
                </td>
              </tr>
              <tr>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td><strong>上传头像</strong></td>
              </tr>
              <tr>
                <td style="border-bottom:1px dashed #FF9DDF;"><table width="92%" border="0" align="center" cellpadding="0" cellspacing="0">
                  <form action="${base}/user/usermanage!updateCover.action" method="post" enctype="multipart/form-data" onsubmit="return checkCoverForm();" >
                    <tr>
                      <td width="11%" height="32" align="right" valign="top">头像：</td>
                      <td colspan="2"><#if member.coverPath?exists><#if member.coverPath != ""><img src="${member.coverPath}" width="110" height="130" /><#else><img src="${base}/images/icon_user.gif" width="110" height="130" /></#if></#if></td>
                      </tr>
                    <tr>
                      <td height="32" align="right">&nbsp;</td>
                      <td width="27%"><input type="file" name="doc" id="doc" /></td>
                      <td width="62%"><input type="image" src="${base}/images/btn_upload.gif" /></td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                      <td colspan="2">（图像大小最好为100象素×120象素，文件长度小于 50kB）</td>
                      </tr>
                    <tr>
                      <td colspan="3">&nbsp;</td>
                    </tr>
                  </form>
                </table></td>
              </tr>
              <tr>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td><strong>修改密码</strong></td>
              </tr>
              <tr>
                <td><table width="92%" border="0" align="center" cellpadding="0" cellspacing="0">
                  <form action="${base}/user/usermanage!updatePwd.action" method="post" onsubmit="return checkPwdForm();">
                    <tr>
                      <td width="13%" height="32" align="right">旧密码：</td>
                      <td width="19%">
                        <input name="oldPassword_cnf" id="oldPassword_cnf" type="password" /></td>
                      </td>
                      <td width="68%">&nbsp;</td>
                    </tr>
                    <tr>
                      <td height="32" align="right">新密码：</td>
                      <td><input type="password" name="new_password" id="new_password" maxlength="15""/></td></td>
                      <td>&nbsp;</td>
                    </tr>
                    <tr>
                      <td height="24" align="right">确认密码：</td>
                      <td><input type="password" name="password_cnf" id="password_cnf" maxlength="15"" /></td></td>
                      <td>&nbsp;</td>
                    </tr>
                    <tr>
                      <td height="24">&nbsp;</td>
                      <td><input type="image" name="imageField3" id="imageField3" src="${base}/images/btn_suremodify.gif" /></td>
                      <td>&nbsp;</td>
                    </tr>
                  </form>
                </table></td>
              </tr>
              <tr>
                <td>&nbsp;</td>
              </tr>
            </table>
        </div>
    </div>-->
    <#include "/ftl/footer.ftl">

</div>
<!--wrapper end-->

<script language="javascript">
    <#if msg?exists>
        alert('${msg}');
    <#else>
    </#if>

    function checkNameForm(value){
        var error = $('error'+value);
        var name = $F('userName');
        if(isNull(name)){
            error.style.visibility="visible";
            error.style.color="red";
            error.innerHTML="请输入昵称！";
			return false;
        }else{
            error.style.visibility="hidden";
        }
    }

    function checkCoverForm(){
        var path = $F('doc');
        if(isNull(doc)){
            alert("路径不能为空！");
            return false;
        }
    }

    function checkPwdForm(){
        //var error = $('error'+value);
        var oldPwd =  ${member.password};//旧密码
        var oldPwd_cnf =  $F('oldPassword_cnf');//旧密码确认
        var newPwd = $F('new_password');//新密码
        var newPwd_cnf = $F('password_cnf');//确认密码

        if(oldPwd != oldPwd_cnf){
            alert("密码错误！与旧密码不符！");
			return false;
		}
        if(isNull(newPwd.trim())){
            alert("新密码不能为空！");
			return false;
		}
        if(newPwd_cnf != newPwd){
            alert("新密码两次输入不符！");
			return false;
		}
        
    }
</script>
</body>
</html>
