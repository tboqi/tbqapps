<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>上传广告</title>
</head>


<table width="95%" align="center" cellpadding="0"  cellspacing="0">
  <form id="loadfile" action="${base}/cc/adupload.action" method="post" enctype="multipart/form-data" onsubmit="return checkCoverForm();">
    <tr>
      <td width="100%" height="30"><strong>上传广告</strong></td>
    </tr>
    <tr>
      <td width="100%" height="30">
	  位置<select size="1" name="position" class="button">
		  <option value="article">文章页面</option>
		  <option value="channel">频道页面</option>
		</select>
        <br />
	  链接：<input type="text" name="url" />
        <br />
        <input id="imgFile" type="file" name="imgFile" />
        <input id="submit" type="submit" value="上传" name="B2432" />
        <br />
        广告图片大小应限制在50k内</td>
    </tr>
  </form>

<script language="javascript">
    function checkCoverForm(){
        var path = $F('imgfile');
        if(isNull(doc)){
            alert("路径不能为空！");
            return false;
        }
    }
</script>

</table>

</html>