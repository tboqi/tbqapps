

function validRegForm()
{

	if (!frmReg) return true;

	if(frmReg.username.value=="")
	{
		alert("“用户名”没有填写");
		return false;
	}
	if (!validString(frmReg.username.value,4,15,"0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ",""))
	{
		alert("“用户名”有误");
		return false;
	}
	
	
	if (!validString(frmReg.password.value,6,15,"",""))
	{
		alert("“密码”有误");
		return false;
	}

	if (frmReg.password.value!=frmReg.password_cnf.value)
	{
		alert("“确认密码”有误");
		return false;
	}

	document.getElementById("idSubmit").disabled = true;
	document.getElementById("idSubmit2").disabled = true;
	return true;
}

function ShowMemo(tx){
  //CheckUserSex();
  document.getElementById(tx+"_p1").style.display = "block";
  document.getElementById(tx+"_p2").style.display = "none";
  document.getElementById(tx+"_p3").style.display = "none";
}


function CheckUserName()
{
	var tx = "username";
	document.getElementById(tx+"_p1").style.display = "none";
	document.getElementById(tx+"_p2").style.display = "block";
	document.getElementById(tx+"_p3").style.display = "none";
	
	if (!validString(document.frmReg.username.value))
	{
		document.getElementById(tx+"_p2").innerHTML = '对不起！用户名不能为空！';
		return;
	}
	else
	{
		document.getElementById(tx+"_p2").style.display = "none";
		document.getElementById(tx+"_p3").style.display = "block";
	}
}

// 获得字符串的长度(一个全角字符当作2个字符)
function GetStrLength(s)
{
	var sum=0;
	for(var i=0;i<s.length;i++)
		if ((s.charCodeAt(i)>=0) && (s.charCodeAt(i)<=255))
			sum=sum+1;
		else
			sum=sum+2;
	return sum;
}

function CheckPassWord(name,password,password_cnf)
{
	var tx = name;
	//alert(password.value+", "+password_cnf.value);
	document.getElementById(tx+"_p1").style.display = "none";
	document.getElementById(tx+"_p2").style.display = "block";
	document.getElementById(tx+"_p3").style.display = "none";
	//alert(password.value);
	if (!validTwoPwd(password.value,password_cnf.value))
	{
		document.getElementById(tx+"_p2").innerHTML = '密码输入不一致!';
	}
	else if(!validStringLen(password.value,6,15))
	{
		document.getElementById(tx+"_p2").innerHTML = '密码必须为6-15位半角字符!';
	}
	else
	{
		document.getElementById(tx+"_p2").style.display = "none";
		document.getElementById(tx+"_p3").style.display = "block";
	}
}

