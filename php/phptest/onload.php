<!--  
 * ====================================================================
 *
 *                Send.php 由网银在线技术支持提供
 *
 *  本页面接收来自上页所有订单信息,并提交支付订单到网线在线支付平台....
 *
 * 
 * ====================================================================
-->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>在线支付接口PHP版</title>
</head>
<body onLoad="javascript:document.E_FORM.submit()">
<form method="post" name="E_FORM" id="E_FORM" action="http://www.sina.com.cn">
  <input type="hidden" name="v_mid"       value="20000400">
  <input type="hidden" name="v_oid"       value="20080711-20000400-073321">
  <input type="hidden" name="v_amount"    value="10">
  <input type="hidden" name="v_moneytype" value="CNY">
  <input type="hidden" name="v_url"       value="http://www.farm-china.com/chinabank/Receive.php">
  <input type="hidden" name="v_md5info"   value="F55BFBDBB9379EB8D6DFED8E2348FB49">
  <input type="hidden" name="remark1"     value="">
  <input type="hidden" name="remark2"     value=""><input type="submit">
</form>

</body>
</html>
