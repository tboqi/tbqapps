function validStringLen(value,minLength,maxLength)
{
	var sString = new String(value);
	//最短要求
	if (minLength > 0) 
		if (sString.length < minLength) 
			return false;
	//最长要求
	if (maxLength > 0) 
		if (sString.length > maxLength) 
			return false;
	return true;
	
}

function validString(value)
{
	var sString = new String(value);
	if(sString.length < 0 || sString == "" || sString == null)
		return false;

	return true;
	
}
function isNull(value)
{
	var sString = new String(value);
	if(sString.length < 0 || sString == "" || sString == null)
		return true;

	return false;
	
}
function validTwoPwd(password,password_cnf)
{
	if(password != password_cnf)
		return false;
	return true;
	
}

function validEmail(Email)
{
	if (document.layers||document.getElementById||document.all)
	{
		var filter=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
		if (filter.test(Email))
			return true;
		else
			return false;
	}
	else
		return true;

	
}