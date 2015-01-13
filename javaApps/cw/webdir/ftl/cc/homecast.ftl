<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页公告</title>
</head>


<table width="95%" align="center" cellpadding="0"  cellspacing="0">
  <form id="loadfile" action="${base}/cc/homecast.action" method="post">
    <tr>
      <td width="100%" height="30"><strong>首页公告</strong></td>
    </tr>
    <tr>
      <td width="100%" height="30">
	  内容：<textarea name="strCast" cols="45" rows="5" onpropertychange="if(value.length>100) value=value.substr(0,100)" >${strCast}</textarea>
	  <input type="hidden" name="action" value="set" />
    </tr>
  </form>

</table>

</html>
